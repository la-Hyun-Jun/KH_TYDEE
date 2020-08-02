const width = Number(window.innerWidth)/2,
height = 600,
maxRadius = (Math.min(width, height) / 2) - 5;

const formatNumber = d3.format(",d");

const x = d3.scaleLinear()
.range([0, 2 * Math.PI])
.clamp(true);

const y = d3.scaleSqrt().range([maxRadius * .1, maxRadius]);

const partition = d3.partition();

const arc = d3
.arc()
.startAngle(d => x(d.x0))
.endAngle(d => x(d.x1))
.innerRadius(d => Math.max(0, y(d.y0)))
.outerRadius(d => Math.max(0, y(d.y1)));

const middleArcLine = d => {
	const halfPi = Math.PI / 2;
	const angles = [x(d.x0) - halfPi, x(d.x1) - halfPi];
	const r = Math.max(0, (y(d.y0) + y(d.y1)) / 2);

	const middleAngle = (angles[1] + angles[0]) / 2;
	const invertDirection = middleAngle > 0 && middleAngle < Math.PI; // On lower quadrants write text ccw
	if (invertDirection) {
		angles.reverse();
	}

	const path = d3.path();
	path.arc(0, 0, r, angles[0], angles[1], invertDirection);
	return path.toString();
};

const textFits = d => {
	const CHAR_SPACE = 6;

	const deltaAngle = x(d.x1) - x(d.x0);
	const r = Math.max(0, (y(d.y0) + y(d.y1)) / 2);
	const perimeter = r * deltaAngle;

	return d.data.name.length * CHAR_SPACE < perimeter;
};

const svg = d3
.select("#mytydee")
.append("svg")
.style("width", width+"px")
.style("height", height+"px")
.attr("viewBox", `${-width / 2} ${-height / 2} ${width} ${height}`)
.on("click", () => focusOn()); // Reset zoom on canvas click

//.attr("viewBox", `0 0 ${width} ${height}`)

let data = mytydeejson;
const root = d3.hierarchy(data)
.sum(d => d.value)
.sort((a, b) => b.value - a.value);
const color = d3.scaleOrdinal()
.range(d3.quantize(d3.interpolateViridis, root.children.length + 1));
//const color = d3.scaleOrdinal().range(d3.quantize(d3.interpolateTurbo, root.children.length + 1));
//const color = d3.scaleOrdinal(d3.schemeSet3);

const slice = svg.selectAll("g.slice").data(partition(root).descendants());

slice.exit().remove();

const newSlice = slice.enter()
.append("g")
.attr("class", "slice")
.on("click", d => {
	d3.event.stopPropagation();
	focusOn(d);
})
.on("mouseover", d => {
	d3.select("[name=tiny_no]").attr("value", d.data.tiny_no);
	d3.select("[name=tiny_type]").attr("value", d.data.tiny_type);

	d3.select("[name=type]").attr("value", (d.data.tiny_type == 'D')?"TYDEE":((d.data.tiny_type == 'N')?"TINY":"USER"));
	d3.select("[name=name]").attr("value", d.data.name);
	d3.select("[name=location]").attr("value", `${d.ancestors().map(d => d.data.name).reverse().join("/")}`);
	d3.select("[name=content]").text(d.data.tiny_content);
	d3.select("[name=regdate]").attr("value", d.data.regdate);
});

newSlice
.append("path")
.attr("class", "main-arc")
.style("fill", d => color((d.depth > 1 ? d.parent : d).data.name))
.attr("fill-opacity", d => (d.children ? 0.8 : 0.6))
.attr("d", arc);

newSlice
.append("path")
.attr("class", "hidden-arc")
.attr("id", (_, i) => `hiddenArc${i}`)
.attr("d", middleArcLine);

const text = newSlice
.append("text")
.attr("display", d => (textFits(d) ? null : "none"));

//Add white contour
text
.append("textPath")
.attr("startOffset", "50%")
.attr("xlink:href", (_, i) => `#hiddenArc${i}`)
.attr("font-family","Font Awesome 5 Free")
.attr("font-weight",900)
.text(d => d.data.name)
.style("fill", "none")
.style("stroke", "#fff")
.style("stroke-width", 3)
.style("stroke-linejoin", "round");

text
.append("textPath")
.attr("startOffset", "50%")
.attr("xlink:href", (_, i) => `#hiddenArc${i}`)
.text(d=> d.data.name);


function focusOn(d = {x0: 0,
		x1: 1,
		y0: 0,
		y1: 1,}) {
	// Reset to top-level if no data point specified
	const transition = svg
	.transition()
	.duration(750)
	.tween("scale", () => {
		const xd = d3.interpolate(x.domain(), [d.x0, d.x1]),
		yd = d3.interpolate(y.domain(), [d.y0, 1]);
		return (t) => {
			x.domain(xd(t));
			y.domain(yd(t));
		};
	});

	transition.selectAll("path.main-arc").attrTween("d", d => () => arc(d));

	transition
	.selectAll("path.hidden-arc")
	.attrTween("d", d => () => middleArcLine(d));

	transition
	.selectAll("text")
	.attrTween("display", d => () => (textFits(d) ? null : "none"));

	moveStackToFront(d);

	function moveStackToFront(elD) {
		svg
		.selectAll(".slice")
		.filter(d => d === elD)
		.each(function (d) {
			this.parentNode.appendChild(this);
			if (d.parent) {
				moveStackToFront(d.parent);
			}
		});
	}
}

let edit = document.getElementById("editarea");
let del = document.getElementById("deletearea");
let add = document.getElementById("addarea");

document.addEventListener("DOMContentLoaded", () => {
	let tiny_no;
	let name = document.getElementsByClassName("tiny__content")[0];
	let content = document.getElementsByClassName("tiny__content")[2];
	edit.addEventListener("click", () => {
		if (edit.innerHTML.indexOf("fa-edit") != -1){
			edit.innerHTML = "<i class='fas fa-undo-alt'></i>";
			del.innerHTML = "<i class='fas fa-check'></i>";
			name.removeAttribute("readonly");
			content.removeAttribute("readonly");
			name.focus();
			newSlice.on("mouseover", null);
		} else {
			edit.innerHTML = "<i class='fas fa-edit'></i>";
			del.innerHTML = "<i class='far fa-trash-alt'></i>";
			name.setAttribute("readonly", "readonly");
			content.setAttribute("readonly", "readonly");
			newSlice.on("mouseover", d => {
				d3.select("[name=tiny_no]").attr("value", d.data.tiny_no);
				d3.select("[name=tiny_type]").attr("value", d.data.tiny_type);
				d3.select("[name=type]").attr("value", (d.data.tiny_type == 'D')?"TYDEE":((d.data.tiny_type == 'N')?"TINY":"USER"));
				d3.select("[name=name]").attr("value", d.data.name);
				d3.select("[name=location]").attr("value", `${d.ancestors().map(d => d.data.name).reverse().join("/")}`);
				d3.select("[name=content]").text(d.data.tiny_content);
				d3.select("[name=regdate]").attr("value", d.data.regdate);
				name.value = d.data.name;
				content.value = (d.data.tiny_content == undefined)?null:d.data.tiny_content;
			});
		}
	}, false);
	del.addEventListener("click",() =>{
		tiny_no = document.getElementsByName("tiny_no")[0].value;
		let tiny_type = document.getElementsByName("tiny_type")[0].value;
		let confirmtype = (tiny_type == 'D')?'TYDEE':((tiny_type == 'N')?"TINY":"USER");
		let form = document.getElementById("tiny-form");
		let input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "command");
		if (del.innerHTML.indexOf("fa-trash-alt") != -1){
			let check = confirm("삭제할 "+ confirmtype + " 이름 : "+name.value+"\n삭제하시겠습니까?");
			if (check) {
				input.setAttribute("value", "delete");
				form.append(input);
				form.submit();
			}
		} else {
			input.setAttribute("value", "update");
			form.append(input);
			form.submit();
		}
	});
	add.addEventListener("click", () => {
		let dimsection = document.createElement("section");
		dimsection.setAttribute("class", "dim__layer");


		let dimbg = document.createElement("div");
		dimbg.setAttribute("class", "dim__background");
		dimsection.appendChild(dimbg);


		let addlayer = document.createElement("article");
		addlayer.setAttribute("class", "pop__layer");

		let closebutton = document.createElement("div");
		closebutton.setAttribute("class", "pop__buttons");
		let span1 = document.createElement("span");
		span1.setAttribute("id", "closearea");
		let iclose = document.createElement("i");
		iclose.setAttribute("class", "fas fa-times");
		span1.appendChild(iclose);

		closebutton.appendChild(span1);
		addlayer.appendChild(closebutton);


		let menu = document.createElement("div");
		menu.setAttribute("class", "pop__menu");
		let p0 = document.createElement("p");
		let label0 = document.createElement("label");
		label0.setAttribute("for", "tiny_type");
		label0.textContent = "TYPE";
		p0.appendChild(label0);
		let p1 = document.createElement("p");
		let label1 = document.createElement("label");
		label1.setAttribute("for", "tiny_title");
		label1.textContent = "NAME";
		p1.appendChild(label1);
		let p2 = document.createElement("p");
		let label2 = document.createElement("label");
		label2.setAttribute("for", "tiny_content");
		label2.textContent = "CONTENT";
		p2.appendChild(label2);
		let p3 = document.createElement("p");
		let label3 = document.createElement("label");
		label3.setAttribute("for", "tiny_image");
		label3.textContent = "IMAGE";
		p3.appendChild(label3);
		let p4 = document.createElement("p");
		let label4 = document.createElement("label");
		label4.setAttribute("for", "tiny_depth")
		label4.textContent = "UPPER TYDEE";
		p4.appendChild(label4);

		menu.appendChild(p0);
		menu.appendChild(p1);
		menu.appendChild(p2);
		menu.appendChild(p3);
		menu.appendChild(p4);
		addlayer.appendChild(menu);


		let contents = document.createElement("div");
		contents.setAttribute("class", "pop__contents");

		let form = document.createElement("form");
		form.setAttribute("action", "mytydee.do");
		form.setAttribute("method", "post");
		form.setAttribute("id", "insert-form");
		let command = document.createElement("input");
		command.setAttribute("type", "hidden");
		command.setAttribute("name", "command");
		command.setAttribute("value", "insert");
		form.appendChild(command);

		let typediv = document.createElement("div");
		typediv.setAttribute("class","pop__content_box")

		let typeD = document.createElement("input");
		typeD.setAttribute("class", "pop__content");
		typeD.setAttribute("type", "radio");
		typeD.setAttribute("name", "tiny_type");
		typeD.setAttribute("value", "D");
		typeD.setAttribute("id", "typeD");
		let labelD = document.createElement("label");
		labelD.setAttribute("for", "typeD");
		labelD.textContent = "TYDEE";

		let typeN = document.createElement("input");
		typeN.setAttribute("class", "pop__content");
		typeN.setAttribute("type", "radio");
		typeN.setAttribute("name", "tiny_type");
		typeN.setAttribute("value", "N");
		typeN.setAttribute("id", "typeN");
		typeN.setAttribute("checked", "checked");
		typeN.required = true;
		let labelN = document.createElement("label");
		labelN.setAttribute("for", "typeN");
		labelN.textContent = "TINY";

		typediv.appendChild(typeD);
		typediv.appendChild(labelD);
		typediv.appendChild(typeN);
		typediv.appendChild(labelN);
		contents.appendChild(typediv);
		let titlediv = document.createElement("div");
		titlediv.setAttribute("class","pop__content_box")

		let title = document.createElement("input");
		title.setAttribute("class", "pop__content");
		title.setAttribute("type", "text");
		title.setAttribute("name", "tiny_title");
		title.required = true;
		titlediv.appendChild(title);
		
		let contentdiv = document.createElement("div");
		contentdiv.setAttribute("class","pop__content_box")
		
		let content = document.createElement("textarea");
		content.setAttribute("class", "pop__content");
		content.setAttribute("type", "text");
		content.setAttribute("name", "tiny_content");
		content.setAttribute("style", "resize:none;")
		contentdiv.appendChild(content);
		
		let imagediv = document.createElement("div");
		imagediv.setAttribute("class","pop__content_box")
		
		let image = document.createElement("input");
		image.setAttribute("class", "pop__content");
		image.setAttribute("type", "file");
		image.setAttribute("name", "tiny_image");
		imagediv.appendChild(image);
		
		let depthdiv = document.createElement("div");
		depthdiv.setAttribute("class","pop__content_box")
		
		let tiny_depth = document.createElement("select");
		tiny_depth.setAttribute("class", "pop__content");
		tiny_depth.setAttribute("name","tiny_depth");
		tiny_depth.required = true;
    
		options.forEach((data) => {
			let option = document.createElement("option");
			option.setAttribute("value", data.tiny_no);
			option.textContent = data.tiny_title;
			tiny_depth.appendChild(option);
		});
		depthdiv.appendChild(tiny_depth);
		
		contents.appendChild(titlediv);
		contents.appendChild(contentdiv);
		contents.appendChild(imagediv);
		contents.appendChild(depthdiv);
    
		form.appendChild(contents);
		addlayer.appendChild(form);

		let insertbutton = document.createElement("div");
		insertbutton.setAttribute("class", "pop__buttons");
		let span2 = document.createElement("span");
		span2.setAttribute("id", "insertarea");
		let icheck = document.createElement("i");
		icheck.setAttribute("class", "fas fa-check");
		span2.appendChild(icheck);
		insertbutton.appendChild(span2);
		addlayer.appendChild(insertbutton);
		dimsection.appendChild(addlayer);
		document.body.appendChild(dimsection);
		let exit = document.getElementById("closearea");
		exit.addEventListener("click", () => {
			document.getElementsByClassName("dim__layer")[0].remove();
		});
		let send = document.getElementById("insertarea");
		send.addEventListener("click", () => {
			let titlefield = document.getElementsByName("tiny_title")[0];
			if (titlefield.value == '') {
				alert("이름을 입력해주세요");
				titlefield.focus();
				return false;
			} else {
				let insert = document.getElementById("insert-form");
				insert.submit();
			}
		});
	});
});