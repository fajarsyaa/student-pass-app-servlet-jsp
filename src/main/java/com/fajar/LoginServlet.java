package com.fajar;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import com.fajar.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	HttpSession session = request.getSession();
	    String exis_user_id  = (String) session.getAttribute("user_id");
	    
	    if (exis_user_id != null) {
	    	response.sendRedirect("Welcome"); 	
		}
    	
        String user_id = request.getParameter("user_id");
        String password = request.getParameter("password");                

        List<Student> studentList = (List<Student>) getServletContext().getAttribute("data");
        String UserId = null;
        String Username = null;  
        String pass = "password";   
        for (Student student : studentList) {        	
            if (student.getStudentID().equals(user_id)) {
            	UserId = student.getStudentID().toString();
            	Username = student.getStudentName().toString();
                break;
            }
        }
                

        if (user_id.equals(UserId) && password.equals(pass)) {           	
        	session.setAttribute("user_id", UserId);
        	session.setAttribute("username", Username);
        	response.sendRedirect("Welcome");      	
        } else {
        	String errorMessageDetail = "";
        	if (user_id.equals(UserId)) {
				errorMessageDetail = "user not registered";
			} else if(password.equals(pass)) {
				errorMessageDetail = "password incorrect";
			}
        	String errorMessage = "Invalid login. Please try again.";
            response.sendRedirect("index.jsp?error=" + URLEncoder.encode(errorMessage, "UTF-8")+"&errorDetail="+URLEncoder.encode(errorMessageDetail, "UTF-8"));
        }
    }
}
