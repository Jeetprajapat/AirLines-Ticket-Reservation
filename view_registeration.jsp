<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
     <script>
        function homepage() {
            window.location.href = "HomePage.html";
        }
    </script>
    <style type="text/css">
    #buttonHome{
  		position: absolute;
    top: 0;
    right: 0;
    margin: 30px;
    color: blue;
    width: 100px;  
    height: 30px;  
    font-size: 16px;
    background-color: gray;
    }
    #tit{
    font-family: 'Georgia', serif;
	font-size: 30px;
    font-weight: bold;
   text-align: center;                   
    }
     table{
     text-align: center;
      width: 90%;
      display: inline-table;
    }
    .table1{
     text-align: center;
    }
    th{
    color: blue;
    background-color: gray;
    }
    </style>
</head>
<body>
<input onclick="homepage()" id="buttonHome" type="submit" value="Home" >
    <h1 id="tit">User List</h1>
    <div class="table1">
    <table border="1">
        <tr>
        	<th>ID</th>
            <th>Nationality</th>
            <th>Customer Name</th>
            <th>Father's Name</th>
            <th>Mother's Name</th>
            <th>Email</th>
            <th>Address</th>
            <th>Contact No</th>
            <th>Date of birth</th>
            <th>Password</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            String jdbcURL = "jdbc:mysql://localhost:3306/airline";
            String jdbcUsername = "root";
            String jdbcPassword = "1996";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                stmt = conn.createStatement();
                String sql = "SELECT id, nationality, name, fname, mname, email, address, contact, dob, password FROM registration";
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
        %>
        <tr>
        	<td><%= rs.getString("id") %></td>
            <td><%= rs.getString("nationality") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("fname") %></td>
            <td><%= rs.getString("mname") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("contact") %></td>
            <td><%= rs.getString("dob") %></td>
            <td><%= rs.getString("password") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        %>
    </table>
    </div>
</body>
</html>
