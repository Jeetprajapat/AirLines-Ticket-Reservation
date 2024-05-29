<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
	<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Reservation Form</title>
  <link rel="stylesheet" type="text/css" href="A_Rgistration.css" />
  <style>
	  .radio_button{
		  display: flex;
		  flex-direction: row;
		  gap: 5px;
		  right: 430px;
		  text-align: center;
		  size: 50px;
		  margin-top: 180px;
	  }
	  #reserv{
	  top: 5px;
	  text-align: center;
	  font-family: 'Georgia', serif;
      font-size: 30px;
      font-weight: bold;
      font-style: italic;
      line-height: 1.8;
      letter-spacing: 1px;
	  }
	  #cla{
		  height: 45px;
		  width: 300px;
		  size: 80px;
		   border-radius: 5px; 
		  display: flex;
		  right: 90px;
		  margin-top: 15px;
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
  <div class="container"  style="background-color: rgba(255,255,255,0.4);">
   
    <div class="title" id="reserv">Reservation Form</div>
    <hr>
    <div class="content">
     
      <form action="ticketreservation.jsp" method="Post">
        <div class="user-details">
          
          <div class="radio_button" style="position: absolute; top: 50%;">
           Roundtrip:<input type="radio" name="trip" value="Roundtrip">
            One Way:<input type="radio" name="trip" value="Oneway">
            Multy City:<input type="radio" name="trip" value="Multycity">
          </div>
          
     <div class="input-box">
            <span class="details">Consumer Name </span>
            <input type="text" name="cname" placeholder="Consumer Name " required>
          </div>
          
          <div class="input-box">
            <span class="details">Passport No</span>
            <input type="text" name="passport" placeholder="Passport Number" maxlength="8" required>
          </div>
          
          <div class="input-box">
            <span class="details">Mobile No. </span>
            <input type="text" name="mobile" placeholder="Mobile Number" maxlength="10" required>
          </div>
          
          <div class="input-box">
            <span class="details">Aadhaar No.</span>
            <input type="text" name="aadhaar" placeholder="Aadhaar Number"  maxlength="16" required>
          </div>
          
          <div class="input-box">
            <span class="details">Flying From</span>
            <input type="text" name="from" placeholder="City or Airport" required>
          </div>
          
          <div class="input-box">
            <span class="details">Flying To</span>
            <input type="text" name="to" placeholder="City or Airport" required>
          </div>
          
           <div class="input-box">
            <span class="details">Departing</span>
            <input type="date" name="departing" placeholder="mm/dd/yyyy" required>
          </div>
          
          <div class="input-box">
            <span class="details">Returning</span>
            <input type="date" name="returning" placeholder="mm/dd/yyyy" required>
          </div>
        
          <div class="input-box">
            <span class="details">Adults</span>
            <input type="number" name="adults" placeholder="Adults Number" value="0" required>
          </div>
         
          <div class="input-box">
            <span class="details">Children</span>
            <input type="number" name="children" placeholder="5 -  10 YEARS" value="0" required>
          </div>
          
          <div  class="input-box">
            <span class="details">Flight Code </span>
            <select id="cla" name="flight_code">
			<option value="" selected disabled>Select Flight Code</option>
			<option value="F001">F001</option>
			<option value="F002">F002</option>
			<option value="F003">F003</option>
			<option value="F004">F004</option>
			<option value="F005">F005</option>
			<option value="F006">F006</option>
			<option value="F007">F007</option>
			
			<option value="AF001">AF001</option>
			<option value="AF002">AF002</option>
			<option value="AF003">AF003</option>
			<option value="AF004">AF004</option>
			<option value="AF005">AF005</option>
			<option value="AF006">AF006</option>
			<option value="AF007">AF007</option>
            </select>
          </div>
        </div>
        
        <div class="button-container">
          <div class="button">
            <input type="submit" value="Submit">
             <input type="reset" value="Cancle">
          </div>
        </div>
      </form>
    </div>
  </div>
  <%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String cname = request.getParameter("cname");
        String passport = request.getParameter("passport");
        String mobile = request.getParameter("mobile");
        String aadhaar = request.getParameter("aadhaar");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departing = request.getParameter("departing");
        String returning = request.getParameter("returning");
        int adults = Integer.parseInt(request.getParameter("adults"));
        int children = Integer.parseInt(request.getParameter("children"));
        String flight_code = request.getParameter("flight_code");
        String trip = request.getParameter("trip");

       //
	    request.setAttribute("cname", cname);
	    request.setAttribute("passport", passport);
	    request.setAttribute("mobile", mobile);
	    request.setAttribute("aadhaar", aadhaar);
	    request.setAttribute("from", from);
	    request.setAttribute("to", to);
	    request.setAttribute("departing", departing);
	    request.setAttribute("returning", returning);
	    request.setAttribute("adults", adults);
	    request.setAttribute("children", children);
	    request.setAttribute("flight_code", flight_code);
	    request.setAttribute("trip", trip);

       //
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        String jdbcURL = "jdbc:mysql://localhost:3306/airline";
        String jdbcUsername = "root";
        String jdbcPassword = "1996";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);


            String sql = "INSERT INTO ticket_reservation (consumer_name, passport_no, mobile_no, adhar_no, flying_from, flying_to, departing, returning, adults, childern, flight_code, trip ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cname);
            pstmt.setString(2, passport); 
            pstmt.setString(3, mobile);
            pstmt.setString(4, aadhaar);
            pstmt.setString(5, from);
            pstmt.setString(6, to);
            pstmt.setString(7, departing);  
            pstmt.setString(8, returning);
            pstmt.setInt(9, adults);
            pstmt.setInt(10, children);
            pstmt.setString(11, flight_code);
            pstmt.setString(12, trip);

            int row = pstmt.executeUpdate();
            if (row > 0) {
                out.println("<script>window.alert('Reservation Successfully!');</script");
                RequestDispatcher dispatcher = request.getRequestDispatcher("print_ticket.jsp");
                dispatcher.forward(request, response);
            } else {
                out.println("<script>window.alert('Reservation failed. Please try again  123!');</script>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<script>window.alert('Reservation failed. Please try again!');</script>");
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