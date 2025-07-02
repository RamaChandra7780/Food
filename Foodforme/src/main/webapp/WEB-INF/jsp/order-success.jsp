<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Order Success</title>

<c:if test="${not empty orderId}">
	<meta http-equiv="refresh"
		content="10;URL=/delivery-feedback?orderId=${orderId}" />
</c:if>

<style>
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
    background-color: #f4f7f6; /* Light background */
    color: #333;
    display: flex;
    flex-direction: column; /* Stack items vertically */
    justify-content: flex-start; /* Align content to the top */
    align-items: center; /* Center horizontally */
    min-height: 100vh; /* Full viewport height */
    text-align: center;
}

.order-success-container {
    background-color: #fff;
    padding: 30px 40px; /* More padding */
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    max-width: 700px; /* Increased max-width for better table display */
    width: 90%; /* Responsive width */
    margin-top: 50px; /* Space from top */
    box-sizing: border-box; /* Include padding in width */
}

h2 {
    color: #28a745; /* Green for success message */
    font-size: 2.2em;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px; /* Space between text and icon */
}

h2 .icon {
    font-size: 1.5em; /* Larger icon */
    line-height: 1; /* Align icon better */
}

h3 {
    color: #2c5f78; /* Dark blue/teal for section headings */
    margin-top: 30px;
    margin-bottom: 15px;
    font-size: 1.5em;
    text-align: center;
}

.success-message-text { /* To style the ${message} content */
    font-size: 1.2em;
    color: #4CAF50; /* Green */
    font-weight: bold;
    margin-bottom: 25px;
}

table {
    border-collapse: collapse;
    width: 100%; /* Table takes full width of its container */
    margin-top: 20px;
    background-color: #fff;
    border-radius: 8px; /* Rounded corners for table */
    overflow: hidden; /* Ensures rounded corners apply to content */
    box-shadow: 0 1px 5px rgba(0,0,0,0.08); /* Subtle shadow for table */
}

th, td {
    border: 1px solid #e0e0e0; /* Lighter border */
    padding: 12px 15px; /* More padding */
    text-align: left;
}

th {
    background-color: #f0f0f0;
    font-weight: bold;
    color: #555;
    text-transform: uppercase;
    font-size: 0.9em;
}

tr:nth-child(even) {
    background-color: #f9f9f9; /* Zebra striping */
}

tr:hover {
    background-color: #f1f1f1; /* Hover effect */
}

.total {
    font-weight: bold;
    background-color: #e6ffe6; /* Light green for total row */
    color: #28a745; /* Green text for total */
    font-size: 1.1em;
}

/* Back to Home button styling */
a {
    background-color: #007bff; /* Blue */
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s ease;
    display: inline-block; /* Make it behave like a block for styling */
    margin-top: 30px; /* Space above the button */
}

a:hover {
    background-color: #0056b3;
}

/* Responsive adjustments */
@media (max-width: 600px) {
    .order-success-container {
        padding: 20px;
        margin-top: 30px;
    }
    h2 {
        font-size: 1.8em;
    }
    h3 {
        font-size: 1.3em;
    }
    th, td {
        padding: 8px 10px;
        font-size: 0.85em;
    }
}
</style>
</head>
<body>

	<div class="order-success-container">
		<h2>Order Placed Successfully! <span class="icon">🎉</span></h2>

		<div class="success-message-text">${message}</div>

		<h3>Ordered Items:</h3>
		<table>
			<tr>
				<th>Item Name</th>
				<th>Quantity</th>
				<th>Amount (₹)</th> </tr>
			<c:forEach var="item" items="${items}">
				<tr>
					<td>${item.item.name}</td> <td>${item.quantity}</td> <td>₹${item.item.price * item.quantity}</td> </tr>
			</c:forEach>


			<tr class="total">
				<td colspan="2">Total</td>
				<td>₹${total}</td>
			</tr>
		</table>


		<a href="/">Back to Home</a>
	</div>


</body>
</html>