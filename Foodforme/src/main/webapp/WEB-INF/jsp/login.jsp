<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6; /* Light background */
            color: #333;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            min-height: 100vh; /* Take full viewport height */
        }

        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1); /* Stronger shadow for forms */
            width: 100%;
            max-width: 400px; /* Limit form width */
            text-align: center; /* Center text within the container */
            box-sizing: border-box; /* Include padding in width calculation */
        }

        h2 {
            color: #2c5f78; /* Dark blue/teal */
            margin-bottom: 25px;
            font-size: 2em;
        }

        .error-message { /* Added class for error message */
            color: red;
            margin-bottom: 20px;
            font-weight: bold;
        }

        form {
            display: flex;
            flex-direction: column; /* Stack form elements vertically */
            gap: 15px; /* Space between form fields */
            align-items: flex-start; /* Align labels/inputs to the left */
            margin-top: 20px; /* Space between heading and form */
        }

        form label { /* Added label styling */
            font-weight: bold;
            color: #555;
            display: block; /* Make labels take full width */
            text-align: left;
            margin-bottom: -10px; /* Reduce space between label and input */
        }

        form input[type="text"],
        form input[type="password"] {
            width: calc(100% - 22px); /* Full width minus padding and border */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-sizing: border-box; /* Include padding and border in element's total width and height */
        }

        form input[type="submit"] {
            background-color: #007bff; /* Blue for Login button */
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
            background-color: #0056b3;
        }

        p { /* Styling for "New user?" paragraph */
            margin-top: 25px;
            font-size: 1em;
            color: #666;
        }

        p a { /* Styling for Register link */
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        p a:hover {
            text-decoration: underline;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .login-container {
                padding: 30px;
                margin: 20px;
            }
            h2 {
                font-size: 1.8em;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>
        <form action="/login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required /><label for="password">Password:</label>
            <input type="password" id="password" name="password" required /><input type="submit" value="Login" />
        </form>
        <p>New user? <a href="/register">Register here</a></p>
    </div>
</body>
</html>