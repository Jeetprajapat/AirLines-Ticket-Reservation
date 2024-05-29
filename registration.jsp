<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <title>Registration Form</title>
  <link rel="stylesheet" type="text/css" href="A_Rgistration.css" />
 <script>
        function homepage() {
            window.location.href = "HomePage.html";
        }
    </script>
    <style >
    #tit{
    text-align: center;
	position: absolute;
    top: 60px;
    font-family: 'Georgia', serif;
	font-size: 30px;
    font-weight: bold;
    left: 630px;
    }
    </style>
</head>
<body>
<input onclick="homepage()" id="buttonHome" type="submit" value="Home" >
<div class="container"  style="background-color: rgba(255,255,255,0.4);">
   
    <div id="tit" class="title">Registration</div>
    <hr>
    <div class="content">
     
      <form action="registration.jsp" method="post">
        <div class="user-details">
          
          <div class="input-box">
            <span class="details">Nationality</span>
            <input type="text" name="nationality" placeholder="Enter Nationalty" required>
          </div>
          
          <div class="input-box">
            <span class="details">Customer Name</span>
            <input type="text" name="name" placeholder="Customar Name" required>
          </div>
          
           <div class="input-box">
            <span class="details">Father's Name</span>
            <input type="text" name="fname" placeholder="Father Name" required>
          </div>
          
          <div class="input-box">
            <span class="details">Mother's Name</span>
            <input type="text" name="mname" placeholder="Mother Name" required>
          </div>
        
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" name="email" placeholder="Email ID" required>
          </div>
         
          <div class="input-box">
            <span class="details">Address</span>
            <input type="text" name="address" placeholder="Address" required>
          </div>
          
          <div class="input-box">
            <span class="details">Contact No</span>
            <input type="text" name="contact" placeholder="Mobile No" maxlength="10" required>
          </div>
          
          <div class="input-box">
            <span class="details">Date of birth</span>
            <input type="date" name="dob" placeholder="DOB" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="password" placeholder="Enter Password" required>
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" name="cpassword" placeholder="Re-Enter Password" required>
          </div>
        </div>
        
        <div class="button-container">
          <div class="button">
            <input type="submit" value="Register">
             <input type="reset" value="Cancle">
          </div>
        </div	>
      </form>
    </div>
  </div>
  
  <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nationality = request.getParameter("nationality");
        String cname = request.getParameter("name");
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        String jdbcURL = "jdbc:mysql://localhost:3306/airline";
        String jdbcUsername = "root";
        String jdbcPassword = "1996";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "INSERT INTO registration (nationality, name, fname, mname, email, address, contact, dob, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nationality);
            pstmt.setString(2, cname);
            pstmt.setString(3, fname);
            pstmt.setString(4, mname);
            pstmt.setString(5, email);
            pstmt.setString(6, address);
            pstmt.setString(7, contact);
            pstmt.setString(8, dob);
            pstmt.setString(9, password);

            int row = pstmt.executeUpdate();
            if (row > 0) {
                out.println("<script>window.alert('Registration Successfully!');</script");
                response.sendRedirect("http://localhost:8080/MyJSP/Airlines/login.jsp");
            } else {
                out.println("<script>window.alert('Registration failed. Please try again!');</script>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<p>Registration failed. Please try again.</p>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>