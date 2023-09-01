<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String exis_user_id  = (String) session.getAttribute("user_id");

if (exis_user_id != null) {
	response.sendRedirect("Welcome");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .login-container h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 5px;            
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <% 
        String error = request.getParameter("error");
        String errorDetail = request.getParameter("errorDetail");
            if (error != null && !error.isEmpty()) { %>
                <p style="color: red;"><%= error %></p>
                <p style="color: red;"><%= errorDetail %></p>
        <% } %>
        <form  action="/student-pass-app/Login" method="post">
            <div class="form-group">
                <label for="username">User ID:</label>
                <input type="text" id="user_id" name="user_id" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
        </form>        
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
    <script>
$(document).ready(function () {
    $("form").submit(function (event) {        
        event.preventDefault();

        console.log("aa");'
        // Mengambil data formulir
        var formData = {
            user_id: $("#user_id").val(),
            password: $("#password").val()
        };

        // Mengirim permintaan POST asinkron menggunakan jQuery
        $.ajax({
            type: "POST",
            url: "/student-pass-app/Login", 
            data: formData,
            success: function (response) {                
            },           
        });
    });
});
</script>
     
</body>
</html>
