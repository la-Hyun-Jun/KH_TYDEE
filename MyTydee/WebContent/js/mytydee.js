let edit = document.getElementById("editarea");
let del = document.getElementById("deletearea");
let name = document.getElementsByClassName("tiny__content")[0];
let content = document.getElementsByClassName("tiny__content")[2];
let tiny_no = document.getElementsByName("tiny_no")[0].value;

document.addEventListener("DOMContentLoaded", () => {
    edit.addEventListener("click", () => {
    	let namevalue="", contentvalue="";
    	if (edit.innerHTML.indexOf("fa-edit") != -1){
    		namevalue = name.value;
    		contentvalue = content.value;
    		edit.innerHTML = "<i class='fas fa-undo-alt'></i>";
    		name.removeAttribute("readonly");
    		content.removeAttribute("readonly");
    		name.focus();
    	} else {
    		edit.innerHTML = "<i class='fas fa-edit'></i>";
    		name.readOnly = true;
    		name.value = namevalue;
    		content.readOnly = true;
    		content.value = contentvalue;
    	}
    }, false);
    del.addEventListener("click",() =>{
    	let check = confirm("삭제하시겠습니까?");
    	if (check) {
    		location.href="mytydee.do?command=delete&tiny_no="+tiny_no;
    	}
    });
});