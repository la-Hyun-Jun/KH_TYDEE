package com.toast.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toast.dao.ToastDao;
import com.toast.dto.ToastDto;

@WebServlet("/toast.do")
public class ToastController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ToastController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String command = request.getParameter("command");
		ToastDao dao = new ToastDao();
		if (command.equals("write")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			ToastDto dto = new ToastDto(0, title, content, null);
			int res = dao.insert(dto);
			if (res > 0) {
				request.setAttribute("list", dao.selectList());
				RequestDispatcher dispatch = request.getRequestDispatcher("toast_editor_list.jsp");
				dispatch.forward(request, response);
			} else {
				request.setAttribute("list", dao.selectList());
				RequestDispatcher dispatch = request.getRequestDispatcher("toast_editor_list.jsp");
				dispatch.forward(request, response);
			}
		} else if (command.equals("list")) {
			request.setAttribute("list", dao.selectList());
			RequestDispatcher dispatch = request.getRequestDispatcher("toast_editor_list.jsp");
			dispatch.forward(request, response);
		} else if (command.equals("detail")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			ToastDto dto = dao.selectOne(seq);
			request.setAttribute("dto", dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("toast_editor_detail.jsp");
			dispatch.forward(request, response);
		}
	}

}
