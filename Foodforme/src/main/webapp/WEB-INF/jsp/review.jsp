<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Delivery Feedback</title>
    <style>
        /*  GLOBAL/BODY STYLES (similar to home.jsp and other pages) --- */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6;
            color: #333;
            padding-top: 60px; /* Adjust this value based on your actual header height */
        }

        /* --- HEADER STYLES (Copied from a common header, e.g., home.jsp or previous admin.jsp) --- */
        .main-header {
            background-color: #f4f7f6;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-sizing: border-box;
        }

        .main-header .logo {
            font-size: 1.8em;
            font-weight: bold;
            color: #ff6600; /* Swiggy orange */
            text-decoration: none;
        }

        .main-header nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 20px;
        }

        .main-header nav ul li a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
            font-size: 1em;
            padding: 5px 10px;
            transition: color 0.3s ease;
        }

        .main-header nav ul li a:hover {
            color: #ff6600;
        }

        .main-header .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .main-header .user-info a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .main-header .user-info a:hover {
            color: #ff6600;
        }

        /* --- FEEDBACK FORM SPECIFIC STYLES --- */
        .feedback-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
            margin: 50px auto 20px auto;
            box-sizing: border-box;
            text-align: center;
        }

        h2 {
            color: #2c5f78;
            margin-bottom: 25px;
            font-size: 1.8em;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            align-items: flex-start;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            text-align: left;
            margin-bottom: 5px; /* Adjusted margin-bottom for better spacing with labels */
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: calc(100% - 22px); /* Account for padding and border */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-sizing: border-box;
            resize: vertical; /* Allow vertical resizing of textarea */
        }

        textarea { /* Specific styles for textarea */
            min-height: 100px; /* Minimum height for review text area */
            max-height: 300px; /* Maximum height to prevent excessive resizing */
            line-height: 1.5; /* Improve readability of text */
        }

        input[type="submit"] {
            background-color: #ff8c00;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            margin-top: 20px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #e67e00;
        }

        /* --- STAR RATING CSS --- */
        .rating {
            display: flex;
            flex-direction: row-reverse; /* Display stars right-to-left for easier selection */
            justify-content: flex-start; /* Align stars to the left */
            width: 100%; /* Take full width of parent */
            padding-top: 5px; /* Space above stars */
            padding-bottom: 10px; /* Space below stars */
        }

        .rating input {
            display: none; /* Hide the radio buttons */
        }

        .rating label {
            cursor: pointer;
            width: 30px; /* Size of each star */
            height: 30px;
            background-image: url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23ccc"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>'); /* Grey star for unselected */
            background-repeat: no-repeat;
            background-position: center;
            background-size: 100%;
            transition: background-image 0.2s ease;
            margin: 0 2px; /* Small gap between stars */
            display: inline-block; /* Ensure label respects width/height */
        }

        /* Filled star color (orange) */
        .rating input:checked ~ label,
        .rating label:hover,
        .rating label:hover ~ label {
            background-image: url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23ffc107"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>'); /* Filled star */
        }

        /* No hover effect on checked stars that are to the right of the hovered star */
        .rating input:checked + label:hover,
        .rating input:checked ~ input:checked + label:hover,
        .rating label:hover ~ input:checked ~ label {
            background-image: url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23ffc107"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>'); /* Keep filled star */
        }


        /* Responsive adjustments */
        @media (max-width: 600px) {
            .main-header {
                flex-direction: column;
                padding: 10px;
            }
            .main-header nav ul {
                margin-top: 10px;
                gap: 10px;
            }
            .main-header .user-info {
                margin-top: 10px;
            }
            .feedback-container {
                padding: 20px;
                margin: 30px auto 20px auto;
            }
            .rating label {
                width: 25px; /* Smaller stars on small screens */
                height: 25px;
            }
        }
    </style>
</head>
<body>
    <header class="main-header">
        <a href="/" class="logo">FoodForMe</a>
        <nav>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/cart">Cart</a></li>
                <li><a href="/orders">My Orders</a></li>
                <li><a href="/help">Help</a></li>
                <c:if test="${userRole == 'ADMIN'}">
                    <li><a href="/admin">Admin</a></li>
                </c:if>
            </ul>
        </nav>
        <div class="user-info">
            <c:if test="${not empty username}">
                <span>Welcome, ${username}!</span>
                <a href="/logout">Logout</a>
            </c:if>
            <c:if test="${empty username}">
                <a href="/login">Login</a>
                <a href="/register">Register</a>
            </c:if>
        </div>
    </header>

    <div class="feedback-container">
        <h2>Delivery Feedback</h2>
        <form action="submitReview" method="post">
            <input type="hidden" name="orderId" value="${orderId}" />
            <input type="hidden" name="username" value="${username}" />

            <div>
                <label>Food Rating (1-5):</label>
                <div class="rating">
                    <input type="radio" id="star5" name="starRating" value="5" /><label for="star5" title="5 stars"></label>
                    <input type="radio" id="star4" name="starRating" value="4" /><label for="star4" title="4 stars"></label>
                    <input type="radio" id="star3" name="starRating" value="3" /><label for="star3" title="3 stars"></label>
                    <input type="radio" id="star2" name="starRating" value="2" /><label for="star2" title="2 stars"></label>
                    <input type="radio" id="star1" name="starRating" value="1" checked /><label for="star1" title="1 star"></label> </div>
            </div>

            <div>
                <label for="reviewText">Review:</label>
                <textarea id="reviewText" name="reviewText" rows="4"></textarea>
            </div>

            <div>
                <label>Delivery Rating (1-5):</label>
                <div class="rating">
                    <input type="radio" id="deliveryStar5" name="deliveryRating" value="5" /><label for="deliveryStar5" title="5 stars"></label>
                    <input type="radio" id="deliveryStar4" name="deliveryRating" value="4" /><label for="deliveryStar4" title="4 stars"></label>
                    <input type="radio" id="deliveryStar3" name="deliveryRating" value="3" /><label for="deliveryStar3" title="3 stars"></label>
                    <input type="radio" id="deliveryStar2" name="deliveryRating" value="2" /><label for="deliveryStar2" title="2 stars"></label>
                    <input type="radio" id="deliveryStar1" name="deliveryRating" value="1" checked /><label for="deliveryStar1" title="1 star"></label> </div>
            </div>

            <div>
                <label for="deliverySatisfaction">Was the delivery satisfactory?</label>
                <select id="deliverySatisfaction" name="deliverySatisfaction">
                    <option value="YES">YES</option>
                    <option value="NO">NO</option>
                </select>
            </div>

            <div>
                <label for="tipAmount">Tip Amount (₹):</label>
                <input type="number" id="tipAmount" name="tipAmount" step="0.01" min="0">
            </div>

            <input type="submit" value="Submit Review" />
        </form>
    </div>
</body>
</html>