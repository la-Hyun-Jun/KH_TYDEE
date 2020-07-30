package com.tydee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tydee.dto.UserInfoDto;
import com.tydee.utils.JsonWriter;
import com.tydee.utils.MyTydeeConvertToJson;

@WebServlet("/MyTydeeController")
public class MyTydeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyTydeeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
		String command = request.getParameter("command");
		if (command.equals("main")) {
			String jsonobject = MyTydeeConvertToJson.convertJson(loginuser);
			request.setAttribute("mytydeejson", jsonobject);
			dispatch("mytydee.jsp",request,response);
		}
	}
	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
