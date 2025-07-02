<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            padding: 0;
            background-color: #f4f7f6;
            color: #333;
        }

        h2 {
            color: #2c5f78; 
            text-align: center;
            margin-bottom: 25px;
        }

        table {
            border-collapse: collapse;
            width: 80%; /* Adjusted width for better look */
            margin: 0 auto; /* Center the table */
            box-shadow: 0 2px 8px rgba(0,0,0,0.1); /* Subtle shadow */
            background-color: #fff;
            border-radius: 8px; /* Rounded corners for table */
            overflow: hidden; /* Ensures rounded corners apply to content */
        }

        th, td {
            padding: 12px 15px; /* More padding */
            border: 1px solid #e0e0e0; /* Lighter border */
            text-align: center;
            vertical-align: middle; /* Added for image alignment */
        }

        th {
            background-color: #f0f0f0;
            font-weight: bold;
            color: #555;
            text-transform: uppercase;
            font-size: 0.9em;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; /* Zebra striping for rows */
        }

        tr:hover {
            background-color: #f1f1f1; /* Hover effect for rows */
        }

        td {
            font-size: 0.95em;
        }

        /* New style for images in cart table */
        .cart-item-image {
            max-width: 80px; /* Smaller image size for cart */
            height: 80px;
            border-radius: 4px;
            object-fit: cover;
        }

        /* Styling for the action links/buttons below the table */
        .cart-actions {
            text-align: center;
            margin-top: 30px;
        }

        .cart-actions a,
        .cart-actions button {
            display: inline-block;
            margin: 0 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Smooth transition for hover */
        }

        .cart-actions a {
            background-color: #007bff; /* Blue for Back to Menu */
            color: white;
        }

        .cart-actions a:hover {
            background-color: #0056b3;
        }

        .cart-actions a[href="/cart/clear"] { /* Specific style for Clear Cart */
            background-color: #dc3545; /* Red for Clear Cart */
            color: white;
        }

        .cart-actions a[href="/cart/clear"]:hover {
            background-color: #c82333;
        }

        .cart-actions a[href="/order"] { /* Specific style for Order Now */
            background-color: #28a745; /* Green for Order Now */
            color: white;
        }

        .cart-actions a[href="/order"]:hover {
            background-color: #218838;
        }

        p {
            text-align: center;
            margin-top: 50px;
            font-size: 1.1em;
            color: #666;
        }
    </style>
</head>
<body>

<h2>Your Cart</h2>

<c:if test="${empty cartItems}">
    <p>Your cart is empty.</p>
</c:if>

<c:if test="${not empty cartItems}">
    <table>
        <tr>
            <th>Image</th> <!-- Added Image column header -->
            <th>Item</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Total</th>
        </tr>
        <c:forEach var="cartItem" items="${cartItems}">
            <tr>
                <td>
                    <!-- Added image display using imageUrl -->
                    <img src="${empty cartItem.item.imageUrl ? 'https://placehold.co/80x80/cccccc/000000?text=No+Image' : cartItem.item.imageUrl}"
                         alt="${cartItem.item.name}" class="cart-item-image"
                         onerror="this.onerror=null;this.src='https://placehold.co/80x80/cccccc/000000?text=Error';" />
                </td>
                <td>${cartItem.item.name}</td>
                <td>₹${cartItem.item.price}</td>
                <td>${cartItem.quantity}</td>
                <td>₹${cartItem.item.price * cartItem.quantity}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<div class="cart-actions">
    <a href="/">Back to Menu</a>
    <a href="/cart/clear">Clear Cart</a>
    <a href="/order">Order Now</a>
</div>

</body>
</html>