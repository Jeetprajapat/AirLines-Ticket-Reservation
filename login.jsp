<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Login Page </title>
  <link rel="stylesheet" type="text/css" href="A_Login.css" />
  <style>
	 h4{
		text-align: center;
		  color: darkblue; 
		   font-family: 'Georgia', serif;
      font-size: 30px;
      font-weight: bold;
      font-style: italic;
      line-height: 1.8;
      letter-spacing: 1px;
	 }
	  h1{
		  font-family: 'Georgia', serif;
		  text-align: center;
		  font-size: 30px;
	  }
	  .alert-div{
	  	position:absolute;
	  	top:3%;
	  	right:5%;
	  	color:red;
	  	font-weight: 600;
	  }
  </style>
</head>
<body>
	<h4 class="hero-text" style="position: absolute; top: 5%;">WELCOME IN INDIAN AIRLINE</h4>
  <div class="container" style="background-color: rgba(255,255,255,0.4);">
     <div class="container" style="box-shadow: none;">
            <h1 class="hero-text">LOGIN SCREEN</h1>
        </div>
    <hr>
    <div class="content">
     
      <form action="login.jsp" method="post">
        <div class="user-details">
          
          <div class="input-box">
            <span class="details">User ID</span>
            <input type="text" name="user_email" placeholder="Enter Your Email" required>
          </div>
         
          <div class="input-box">
            <span class="details">Password</span>
            <input type="text" name="user_password" placeholder="Enter Your Password" required>
          </div>
        </div>
        <div class="subcontainer">
                <label>
                  <input type="checkbox" checked="checked" name="remember"> Remember me<br><br>
                </label>
         </div>

        <div class="button-container">
          <div class="button">
            <input type="submit" value="Login">
            <input type="reset" value="Reset">
          </div>
          <p class="forgotpsd"> <a href="ForgetPassword.html">Forgot Password?</a></p><br>
            <!-- Sign up link -->
            <p class="register">Not a member?  <a href="registration.jsp">Register here!</a></p>
        </div>
      </form>
    </div>
  </div>

<table>
<%
		if ("POST".equalsIgnoreCase(request.getMethod())) {
			String user_email = request.getParameter("user_email");
		    String user_password = request.getParameter("user_password");
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
                String sql = "SELECT email, password FROM registration";
                rs = stmt.executeQuery(sql);
				int flage=0;
                while (rs.next()) {
                	if(rs.getString("email").equals(user_email)&& rs.getString("password").equals(user_password)){
                		//out.println("password is correct");
                		flage=1;
                		
                		break;
                	}
                }
    		if(flage==1){
    			response.sendRedirect("http://localhost:8080/MyJSP/Airlines/HomePage.html");	
    		}
    		else{
    			
    			out.println("<div class='alert-div'>Incorrect User Email & Password</div>");
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
			}
        %>
    </table>

</body>
</html>

      