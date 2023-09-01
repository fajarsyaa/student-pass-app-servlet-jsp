<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.fajar.model.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar Siswa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {            
            padding-left: 190px
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        th {
            background-color: blue;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>Welcome, <span onclick="showPopup()"><%= request.getAttribute("user_id") %></span></h1>
    <table>
    <tr>
        <th>Department</th>
        <th>Student ID</th>
        <th>Marks</th>
        <th>Pass %</th>
    </tr>
    <%
        List<Student> studentList = (List<Student>) request.getAttribute("data");
        Map<String, Integer> departmentTotalCount = new HashMap<>();
        Map<String, Integer> departmentPassCount = new HashMap<>();
        Map<String, Double> departmentPassPercentage = new HashMap<>();
        Map<String, String> departmentPassPercentageDisplay = new HashMap<>();

        // Inisialisasi departmentTotalCount dan departmentPassCount
        for (Student student : studentList) {
            String department = student.getDepartment();
            if (!departmentTotalCount.containsKey(department)) {
                departmentTotalCount.put(department, 0);
                departmentPassCount.put(department, 0);
            }
            int mark = student.getMark();
            departmentTotalCount.put(department, departmentTotalCount.get(department) + 1);
            if (mark >= 40) {
                departmentPassCount.put(department, departmentPassCount.get(department) + 1);
            }
        }

        // Menghitung persentase kelulusan untuk setiap departemen
        for (String department : departmentTotalCount.keySet()) {
            int totalStudentsInDepartment = departmentTotalCount.get(department);
            int passStudentsInDepartment = departmentPassCount.get(department);
            double passPercentage = (double) passStudentsInDepartment / totalStudentsInDepartment * 100;
            departmentPassPercentage.put(department, passPercentage);
            // Format persentase kelulusan sebagai String untuk ditampilkan
            String passPercentageDisplay = String.format("%.2f%%", passPercentage);
            departmentPassPercentageDisplay.put(department, passPercentageDisplay);
        }

        for (Student student : studentList) {
            String department = student.getDepartment();
            int mark = student.getMark();
            String studentName = student.getStudentName().toString();
            double passPercentage = departmentPassPercentage.get(department);
            String passPercentageDisplay = departmentPassPercentageDisplay.get(department);
    %>
            <tr>
                <%
                    // Hanya cetak nilai departemen dan persentase kelulusan untuk baris pertama dengan departemen yang sama
                    if (request.getAttribute("prevDepartment") == null || !request.getAttribute("prevDepartment").equals(department)) {
                %>
                    <td rowspan="<%= departmentTotalCount.get(department) %>"><%= department %></td>                    
                <%                        
                    }
                %>
                <td><a href="" onclick="showStudentName('<%= studentName %>')"> <%= student.getStudentID() %> </a></td>
                <td><%= mark %></td>
                <%
                    // Hanya cetak nilai departemen dan persentase kelulusan untuk baris pertama dengan departemen yang sama
                    if (request.getAttribute("prevDepartment") == null || !request.getAttribute("prevDepartment").equals(department)) {
                %>                    
                    <td rowspan="<%= departmentTotalCount.get(department) %>"><%= passPercentageDisplay %></td>
                <%
                        request.setAttribute("prevDepartment", department);
                    }
                %>
            </tr>
    <%
        }
        // Reset atribut prevDepartment setelah selesai dengan tabel
        request.removeAttribute("prevDepartment");
    %>      
</table>
 <script>        
        function showPopup() {            
        	var username = "<%= request.getAttribute("username") %>";
            alert("Username: " + username);
        }
        
        function showStudentName(username){        	
            alert("Username: " + username);
        }
    </script>
</body>
</html>
