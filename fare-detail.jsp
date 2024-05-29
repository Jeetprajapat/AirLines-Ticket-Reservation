<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fare Detail </title>
<link rel="stylesheet" type="text/css" href="A_Rgistration.css" />
<style>
  	#buttonHome{
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
  		table1 {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
  		body{
 
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-size: contain;
  background-repeat: round;
}
table{
background-color:white
}
        table,
        td {
            border: 1px solid lemonchiffon;
            color: black;
            text-align: center;
        }
        th{
			color: mediumslateblue;
			background-color: aqua;
			text-align: center;
		}
        h1{
			color:darkblue;
			text-align: center;
			position: absolute;
            top: 60px;
             font-family: 'Georgia', serif;
			  font-size: 30px;
     	     font-weight: bold;
		}
		 h2{
			 right: 350px;
			color:darkblue;
			text-align: center;
			position: absolute;
            top: 150px;
             font-family: 'Georgia', serif;
			  font-size: 20px;
     	     font-weight: bold;
		}
			 h3{
				 left: 280px;
			color:darkblue;
			text-align: center;
			position: absolute;
            top: 150px;
             font-family: 'Georgia', serif;
			  font-size: 20px;
     	     font-weight: bold;
		}

		select{
			color: blue;
			background-color: mediumslateblue;
		}
		#price{
		color: red;
		}
		#book{
		border-radius: 5px;
		color: white;
		background-color: darkblue;
		}
		
    </style>
    <script>
        function home() {
            window.location.href = "HomePage.html";
        }
        function reservation() {
            window.location.href = "ticketreservation.jsp";
        }
    </script>
</head>
<body>
	<input onclick="home()" id="buttonHome" type="submit" value="Home" >
<h1>Fare List:</h1>
<div class="table1"><h3>Domestic Flight Fare</h3>
  <table style="width:80%">
        <tr>
            <th>Sr. No.</th>
            <th>Flight Code</th>
            <th>Arrival</th>
			<th>Departure</th>
			<th>Destination</th>
			<th>Source</th>
			<th>Airlines</th>
			<th>Economy Price</th>
			<th>Business Price</th>
			<th>Action</th>
        </tr>
        <tr>
            <td>1.</td>
            <td>AF001</td>
            <td>01/01/2024 15:30</td>
            <td>02/01/2024 12:30</td>
            <td>Delhi</td>
            <td>Hyderabad</td>
            <td>Spark Airlines</td>
            <td id="price">₹475</td>
            <td id="price">₹475</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
         <tr>
			<td>2.</td>
			<td>AF002</td>
            <td>03/01/2024 13:10</td>
            <td>04/01/2024 11:20</td>
            <td>Delhi</td>
            <td>Aligarh</td>
            <td>Spark Airlines</td>
            <<td id="price">₹947</td>
            <td id="price">₹975</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
         <tr>
			 <td>3.</td>
			 <td>AF003</td>
            <td>24/02/2024 9:20</td>
            <td>05/03/2024 12:30</td>
            <td>Pune</td>
            <td>Gujrat</td>
            <td>Indigo Airlines</td>
            <td id="price">₹850</td>
            <td id="price">₹875</th>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
         <tr>
			<td>4.</td>
			<td>AF004</td>
            <td>02/02/2024 2:30</td>
            <td>05/02/2024 1:30</td>
            <td>Lakhanu</td>
            <td>Delhi</td>
            <td>Indigo Airlines</td>
            <td id="price">₹834</td>
            <td id="price">₹950</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr> 
        <tr>
			<td>5.</td>
			<td>AF005</td>
            <td>03/04/2024 10:00</td>
            <td>06/04/2024 11:30</td>
            <td>Mharasta</td>
            <td>Kolkata</td>
            <td>Spark Airlines</td>
            <td id="price">₹975</td>
            <td id="price">₹1075</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
        <tr>
			<td>6.</td>
			<td>AF006</td>
            <td>25/08/2024 15:30</td>
            <td>02/01/2024 11:40</td>
            <td>Tamilnadu</td>
            <td>Delhi</td>
            <td>Spark Airlines</td>
            <td id="price">₹670</td>
            <td id="price">₹750</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
        <tr>
			<td>7.</td>
			<td>AF007</td>
            <td>30/012/2024 20:25</td>
            <td>02/01/2024 24:50</td>
            <td>Gujrat</td>
            <td>Delhi</td>
            <td>Indigo Airlines</td>
            <td id="price">₹1075</td>
            <td id="price">₹1175</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
    </table></div>
    <div class="table1"><h2>International Flight Fare</h2>
  <table style="width:80%">
        <tr>
            <th>Sr No.</th>
             <th>Flight Code</th>
            <th>Arrival</th>
			<th>Departure</th>
			<th>Destination</th>
			<th>Source</th>
			<th>Airlines</th>
			<th>Economy Price</th>
			<th>Business Price</th>
			<th>Action</th>
        </tr>
        <tr>
            <td>1.</td>
             <td>F001</td>
            <td>01/01/2024 15:30</td>
            <td>02/01/2024 12:30</td>
            <td>Canada</td>
            <td>India</td>
            <td>Spark Airlines</td>
            <td id="price">₹3475</td>
            <td id="price">₹4075</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
         <tr>
			<td>2.</td>
			<td>F002</td>
            <td>03/01/2024 13:10</td>
            <td>04/01/2024 11:20</td>
            <td>USA</td>
            <td>India</td>
            <td>Spark Airlines</td>
            <td id="price">₹2475</td>
            <td id="price">₹3475</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
         <tr>
			 <td>3.</td>
			 <td>F003</td>
            <td>24/02/2024 9:20</td>
            <td>05/03/2024 12:30</td>
            <td>UK</td>
            <td>India</td>
            <td>Indigo Airlines</td>
            <td id="price">₹8750</td>
            <td id="price">₹9750</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
         <tr>
			<td>4.</td>
			<td>F004</td>
            <td>02/02/2024 2:30</td>
            <td>05/02/2024 1:30</td>
            <td>Saudi Arabia</td>
            <td>India</td>
            <td>Indigo Airlines</td>
            <td id="price">₹5475</td>
            <td id="price">₹6475</td>
           <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr> 
        <tr>
			<td>5.</td>
			<td>F005</td>
            <td>03/04/2024 10:00</td>
            <td>06/04/2024 11:30</td>
            <td>China</td>
            <td>India</td>
            <td>Spark Airlines</td>
            <td id="price">₹4075</td>
            <td id="price">₹5075</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
        <tr>
			<td>6.</td>
			<td>F006</td>
            <td>25/08/2024 15:30</td>
            <td>02/01/2024 11:40</td>
            <td>Thailand</td>
            <td>India</td>
            <td>Spark Airlines</td>
            <td id="price">₹5475</td>
            <td id="price">₹6475</td>
           <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
        <tr>
			<td>7.</td>
			<td>F007</td>
            <td>30/012/2024 20:25</td>
            <td>02/01/2024 24:50</td>
            <td>Sauth Africa</td>
            <td>India</td>
            <td>Indigo Airlines</td>
            <td id="price">₹26475</td>
            <td id="price">₹3475</td>
            <td><input onclick="reservation()" id="book" type="submit" value="BOOK NOW" ></td>
        </tr>
        
    </table>
    </div>
</body>
</html>