package com.fajar;


import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.fajar.model.Student;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSession;

@WebListener
public class AppServlet  implements ServletContextListener {
	 
	 @Override
	 public void contextInitialized(ServletContextEvent servletContextEvent) {	    
		 	List<Student> data = new ArrayList();
		 	 for (int i = 1; i <= 5; i++) {
		            String std_id = "S" + i;
		            String std_name = "Name_student_" + i;
		            String department = "Dep 1";
		            Random random = new Random();
		            int marks = random.nextInt(100);
		            		            
		            data.add(new Student(std_id, std_name, department, marks));
		     }
		 	 for (int i = 6; i <= 10; i++) {
		            String std_id = "S" + i;
		            String std_name = "Name_student_" + i;
		            String department = "Dep 2";
		            Random random = new Random();
		            int marks = random.nextInt(100);
		            		            
		            data.add(new Student(std_id, std_name, department, marks));
		     }
		 	 for (int i = 11; i <= 15; i++) {
		            String std_id = "S" + i;
		            String std_name = "Name_student_" + i;
		            String department = "Dep 3";
		            Random random = new Random();
		            int marks = random.nextInt(100);
		            		            
		            data.add(new Student(std_id, std_name, department, marks));
		     }

	        
	        servletContextEvent.getServletContext().setAttribute("data", data);
	 }

	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {	    		
	}
}
