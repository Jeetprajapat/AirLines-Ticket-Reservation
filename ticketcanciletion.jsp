<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TICKET CANCELLATION FORM</title>
  <link rel="stylesheet" type="text/css" href="A_Rgistration.css" />
  <style>
  		#buttonHome{
  		position: absolute;
    top: 0;
    left: 0;
    margin: 30px;
    color: white;
    width: 100px;  /* Set the width of the button */
    height: 30px;  /* Set the height of the button */
    font-size: 16px;
    background-color: transparent;
  		}
        table,
        td {
            border: 1px solid darkblue;
            color: blue;
        }
        th{
			color: lightgoldenrodyellow;
			background-color: aqua;
		}
        h1{
		color:darkblue;
		text-align: center;
    	font-family: 'Georgia', serif;
		font-size: 30px;
    	font-weight: bold;
		}
		#tit{
    text-align: center;
	position: absolute;
    top: 2px;
    font-family: 'Georgia', serif;
	font-size: 30px;
    font-weight: bold;
    left: 550px;
    }
    </style>
    <script>
        function homepage() {
            window.location.href = "HomePage.html";
        }
    </script>
</head>
<body>
    <input onclick="homepage()" id="buttonHome" type="submit" value="Home" >
<div class="container" style="margin-top:2%">
   
    <div id="tit" class="title"> TICKET CANCELLATION</div>
    <hr>
    <div class="content"  style="background-color: rgba(255,255,255,0.4);">
     
      <form action="ticketcanciletion.jsp" method="Post">
        <div class="user-details">
          
          <div class="input-box">
            <span class="details">Customer Name</span>
            <input type="text" name="cname" placeholder="Customar Name" required>
          </div>
          
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="email" placeholder="Email ID" required>
          </div>
        
          <div class="input-box">
            <span class="details">Contact No</span>
            <input type="text" name="contact" placeholder="Mobile No"  maxlength="10" required>
          </div>
          
          <div class="input-box">
            <span class="details">Ticket Number</span>
            <input type="number" name="ticket_no" placeholder="Ticket Number" required>
          </div>
        </div>
        
        <div class="button-container">
          <div class="button">
            <input type="submit" value="Submit">
             <input type="reset" value="Reset">
          </div>
        </div>
      </form>
    </div>
    <h1>Domestic Cancellation Fees:</h1>
  <table style="width:100%">
        <tr>
            <th>Number of days <br> for departure</th>
            <th>Cancellation Fee<br>0-3(Days)</th>
			<th>Cancellation Fee<br>4 Days and above</th>
        </tr>
        <tr>
            <td>INR</td>
            <td>3500</td>
            <td>3000</td>
        </tr>
         <tr>
            <td>SGD</td>
            <td>72</td>
            <td>62</td>
        </tr>s
         <tr>
            <td>AED</td>
            <td>190</td>
            <td>163</td>
        </tr>
         <tr>
            <td>QAR</td>
            <td>190</td>
            <td>160</td>
        </tr> <tr>
            <td>KWD</td>
            <td>15.7</td>
            <td>13.5</td>
        </tr>
        
    </table>
    <h1>International Cancellation Fees:</h1>
  <table style="width:100%">
        <tr>
            <th rowspan="3">Sector</th>
            <th rowspan="3">Currency</th>
			<th colspan="2">Cancellation Fee</th>
        </tr>
        <tr>
            <th colspan="2">Number of days left for departure</th>
        </tr>
        <tr>
            <th>0-3 Days</th>
            <th>4 Days and above</th>
        </tr>
         <tr>
			 <td>Ex- India to Colombo</td>
            <td>INR</td>
            <td>3500</td>
            <td>3000</td>
        </tr>
         <tr>
			 <td>Ex- India to Dhala</td>
            <td>INR</td>
            <td>3500</td>
            <td>3000</td>
        </tr>
         <tr>
			 <td>Ex- India to Kathmandu</td>
            <td>INR</td>
             <td>3500</td>
            <td>3000</td>
        </tr> 
        <tr>
			<td>Ex-Dhoka to India</td>
            <td>BDT</td>
            <td>4230</td>
            <td>3625</td>
        </tr>
        
    </table>
  </div>
 <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String cname = request.getParameter("cname");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String ticket_no = request.getParameter("ticket_no");
      
        Connection conn = null;
        PreparedStatement pstmt = null;
        String jdbcURL = "jdbc:mysql://localhost:3306/airline";
        String jdbcUsername = "root";
        String jdbcPassword = "1996";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "INSERT INTO ticket_cancellation (cname, email, contect_no, ticket_no) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cname);
            pstmt.setString(2, email);
            pstmt.setString(3, contact);
            pstmt.setString(4, ticket_no);

            int row = pstmt.executeUpdate();
            if (row > 0) {
                out.println("<script>window.alert('Registration Successfully!');</script");
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