<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>All Customer Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6; /* Light background */
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center; /* Center content horizontally */
            min-height: 100vh; /* Full viewport height */
        }

        .orders-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            max-width: 900px; /* Wider container for table */
            width: 90%;
            margin-top: 40px; /* Space from top */
            margin-bottom: 40px; /* Space at bottom */
            box-sizing: border-box;
        }

        h2 {
            color: #2c5f78; /* Dark blue/teal */
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
        }

        p { /* For "No orders found." */
            text-align: center;
            font-size: 1.1em;
            color: #666;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden; /* Ensures rounded corners */
            box-shadow: 0 1px 5px rgba(0,0,0,0.08);
        }

        th, td {
            border: 1px solid #e0e0e0;
            padding: 12px 15px;
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
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Back to Home link styling */
        .back-to-home-link {
            display: inline-block;
            background-color: #6c757d; /* Gray */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px; /* Space above the button */
        }

        .back-to-home-link:hover {
            background-color: #5a6268;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .orders-container {
                padding: 20px;
                margin-top: 20px;
                margin-bottom: 20px;
            }
            h2 {
                font-size: 1.8em;
            }
            th, td {
                padding: 10px;
                font-size: 0.85em;
            }
            /* Make table scrollable on small screens if it overflows */
            .table-responsive {
                overflow-x: auto;
            }
        }

        @media (max-width: 480px) {
            th, td {
                padding: 8px;
                font-size: 0.8em;
            }
        }
    </style>
</head>
<body>
    <div class="orders-container">
        <h2>All Customer Orders</h2>

        <c:if test="${empty orders}">
            <p>No orders found.</p>
        </c:if>

        <c:if test="${not empty orders}">
            <div class="table-responsive"> <%-- Added for horizontal scrolling on small screens --%>
                <table>
                    <tr>
                        <th>Order ID</th>
                        <th>Username</th>
                        <th>Items</th>
                        <th>Location</th>
                        <th>Payment Method</th>
                    </tr>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.username}</td>
                            <td>${order.itemsSummary}</td>
                            <td>${order.location}</td>
                            <td>${order.paymentMethod}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:if>

        <a href="/" class="back-to-home-link">⬅ Back to Home</a>
    </div>
</body>
</html>