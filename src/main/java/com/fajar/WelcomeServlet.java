package com.fajar;

import java.io.IOException;
import java.util.List;

import com.fajar.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Welcome")
public class WelcomeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
	    String user_id  = (String) session.getAttribute("user_id");
	    String username = (String) session.getAttribute("username");

	    
	    List<Student> studentList = (List<Student>) getServletContext().getAttribute("data");

	    request.setAttribute("user_id", user_id);
	    request.setAttribute("username", username);
	    request.setAttribute("data", studentList);
	    
	    request.getRequestDispatcher("welcome.jsp").forward(request, response);
	}
	
}
