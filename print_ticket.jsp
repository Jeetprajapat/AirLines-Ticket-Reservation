<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TICKET</title>
    <style>
        body {
			background-image: url("image4.jpg");
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
             height: 100vh;
  			display: flex;
  			justify-content: center;
 			 align-items: center;
 			 background-size: contain;
 			 background-repeat: round;
        }
        h2{
			color: blue;
			text-align: center;
			 font-family: 'Georgia', serif;
      font-size: 30px;
      font-weight: bold;
      font-style: italic;
      line-height: 1.8;
      letter-spacing: 1px;
		}
		p{
			color: maroon;
			 font-family: 'Georgia', serif;
      font-size: 20px;
      font-weight: bold;
      font-style: italic;
      line-height: 1.8;
      letter-spacing: 1px;
		}
		#print{
			position: absolute;
   		 	top: 0;
  		  	right: 0;
    		margin: 30px;
    		color: white;
    		width: 100px;  /* Set the width of the button */
    		height: 30px;  /* Set the height of the button */
    		font-size: 16px;
    		background-color: transparent;
		}
		#home{
			position: absolute;
   		 	top: 0;
  		  	left: 0;
    		margin: 30px;
    		color: white;
    		width: 100px;  
    		height: 30px;  
    		font-size: 16px;
    		background-color: transparent;
		}
		
        .confirmation {
            background-color: rgba(255,255, 255, 0.5);
            padding: 100px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>
    <script>
        function homepage() {
            window.location.href = "HomePage.html";
        }
    </script>
</head>
<body>

<%
Map<String, Integer> flightPrices = new HashMap<>();

// Add flight codes and prices to the map
flightPrices.put("F001", 3475); // Example flight code and price
flightPrices.put("F002", 2475);
flightPrices.put("F003", 8750); // Example flight code and price
flightPrices.put("F004", 5475);
flightPrices.put("F005", 4075); // Example flight code and price
flightPrices.put("F006", 5475);
flightPrices.put("F007", 6475); // Example flight code and price

flightPrices.put("AF001", 475); // Example flight code and price
flightPrices.put("AF002", 947);
flightPrices.put("AF003", 850); // Example flight code and price
flightPrices.put("AF004", 834);
flightPrices.put("AF005", 975); // Example flight code and price
flightPrices.put("AF006", 770);
flightPrices.put("AF007", 1075);

// Retrieve flight code from request attribute and cast it to String
String flightCode = (String) request.getAttribute("flight_code");

// Retrieve price from the flightPrices map based on flight code
Integer price = flightPrices.get(flightCode);
int adults=(int)request.getAttribute("adults");
int children=(int)request.getAttribute("children");
float total_price=(price*(adults))+((price/2)*children);
%>
	<button id="home" onclick="homepage()">Home</button>
    <div class="confirmation">
		
        <h2>BOOKING TICKET</h2>
        <p>Ticket Number: <%="IND"+ request.getAttribute("passport") %></p>
	    <p>Consumer Name: <%= request.getAttribute("cname") %></p>
	    <p>Passport No: <%= request.getAttribute("passport") %></p>
	    <p>Mobile No: <%= request.getAttribute("mobile") %></p>
	    <p>Aadhaar No: <%= request.getAttribute("aadhaar") %></p>
	    <p>Flying From: <%= request.getAttribute("from") %></p>
	    <p>Flying To: <%= request.getAttribute("to") %></p>
	    <p>Departing: <%= request.getAttribute("departing") %></p>
	    <p>Returning: <%= request.getAttribute("returning") %></p>
	    <p>Adults: <%= adults %></p>
	    <p>Children: <%= request.getAttribute("children") %></p>
	    <p>Flight Code: <%= request.getAttribute("flight_code") %></p>
	    <p>Trip: <%= request.getAttribute("trip") %></p>
	    <p>Total Amount: <%= total_price %></p>
    </div>
    <button id="print" onclick="toggleButtons()">Print Ticket</button>
    
 <script>
    function homepage() {
        window.location.href = "HomePage.html";
    }

    function toggleButtons() {
        var homeButton = document.getElementById("home");
        var printButton = document.getElementById("print");

        // Hide both buttons when printing
        homeButton.style.display = "none";
        printButton.style.display = "none";

        // Print the ticket
        window.print();

        // Show both buttons again after printing
        homeButton.style.display = "inline-block";
        printButton.style.display = "inline-block";
    }
</script>
</body>
</html>