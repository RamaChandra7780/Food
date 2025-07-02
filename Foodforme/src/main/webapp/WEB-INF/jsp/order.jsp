<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Place Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            padding: 0;
            background-color: #f4f7f6; /* Light background */
            color: #333;
            display: flex; /* Use flexbox to center content */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            min-height: 90vh; /* Take full viewport height */
        }

        .order-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1); /* Stronger shadow for forms */
            width: 100%;
            max-width: 400px; /* Limit form width */
            text-align: center; /* Center text within the container */
        }

        h2 {
            color: #2c5f78; /* Dark blue/teal */
            margin-bottom: 25px;
            font-size: 1.8em;
        }

        form {
            display: flex;
            flex-direction: column; /* Stack form elements vertically */
            gap: 15px; /* Space between form fields */
            align-items: flex-start; /* Align labels/inputs to the left */
        }

        form label { /* If you decide to add <label> tags later */
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        form input[type="text"],
        form select {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
            margin: 0; /* Remove default margins */
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-sizing: border-box; /* Include padding and border in element's total width and height */
        }

        form input[type="submit"] {
            background-color: #28a745; /* Green for submit */
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            margin-top: 20px; /* Space above button */
            width: 100%; /* Make button full width */
            transition: background-color 0.3s ease;
        }

        form input[type="submit"]:hover {
            background-color: #218838;
        }

        /* Responsive adjustments for smaller screens */
        @media (max-width: 600px) {
            .order-container {
                margin: 15px;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="order-container">
        <h2>Enter Order Details</h2>
        <form action="/order" method="post">
            <label for="location">Location:</label>
            <input type="text" id="location" name="location" required /><br/>

            <label for="paymentMethod">Payment Method:</label>
            <select id="paymentMethod" name="paymentMethod" required>
                <option value="Paytm">Paytm</option>
                <option value="Google Pay">Google Pay</option>
                <option value="PhonePe">PhonePe</option>
            </select><br/>

            <input type="submit" value="Submit Order" />
        </form>
    </div>
</body>
</html>