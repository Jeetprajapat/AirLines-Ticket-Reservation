<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancellation List</title>
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
    color: white;
    width: 100px;  
    height: 30px;  
    font-size: 16px;
    background-color: blue;
    }
    #tit{
    font-family: 'Georgia', serif;
	font-size: 30px;
    font-weight: bold;  
     text-align: center;                  
    }
    th{
    color: blue;
    background-color: gray;
    }
    table{
     text-align: center;
      width: 60%;
      display: inline-table;
    }
    .table1{
     text-align: center;
    }
    </style>
</head>
<body>
<input onclick="homepage()" id="buttonHome" type="submit" value="Home" >
    <h1 id="tit">Cancellation List</h1>
    <div class="table1">
    <table border="1">
        <tr>
        	<th>ID</th>
            <th>Customer Name</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>Ticket Number</th>
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
                String sql = "SELECT id, cname, email, contect_no, ticket_no FROM ticket_cancellation";
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
        %>
        <tr>
        	<td><%= rs.getString("id") %></td>
            <td><%= rs.getString("cname") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("contect_no") %></td>
            <td><%= rs.getString("ticket_no") %></td>
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
