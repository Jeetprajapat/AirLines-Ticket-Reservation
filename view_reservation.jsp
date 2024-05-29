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
    <h1 id="tit">Reservation List</h1>
    <div class="table1">
    <table border="1">
        <tr>
        	<th>ID</th>
            <th>Consumer Name</th>
            <th>Passport Number</th>
            <th>Mobile Number</th>
            <th>Aadhaar Number</th>
            <th>Flying From</th>
            <th>Flying To</th>
            <th>Departing</th>
            <th>Returning</th>
            <th>Adults</th>
            <th>Children</th>
            <th>Flight Code</th>
            <th>Trip</th>
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
                String sql = "SELECT id, consumer_name, passport_no, mobile_no, adhar_no, flying_from, flying_to, departing, returning, adults, childern, flight_code, trip  FROM ticket_reservation";
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
        %>
        <tr>
        	<td><%= rs.getString("id") %></td>
            <td><%= rs.getString("consumer_name") %></td>
            <td><%= rs.getString("passport_no") %></td>
            <td><%= rs.getString("mobile_no") %></td>
            <td><%= rs.getString("adhar_no") %></td>
            <td><%= rs.getString("flying_from") %></td>
            <td><%= rs.getString("flying_to") %></td>
            <td><%= rs.getString("departing") %></td>
            <td><%= rs.getString("returning") %></td>
            <td><%= rs.getString("adults") %></td>
            <td><%= rs.getString("childern") %></td>
            <td><%= rs.getString("flight_code") %></td>
            <td><%= rs.getString("trip") %></td>
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
