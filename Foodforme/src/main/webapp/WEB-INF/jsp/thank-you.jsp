<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <title>Thank You</title>
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
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full viewport height */
            text-align: center;
        }

        .thank-you-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 90%; /* Responsive width */
            margin: 20px; /* Add some margin for smaller screens */
        }

        h2 {
            color: #28a745; /* Green for success message */
            font-size: 2em;
            margin-bottom: 15px;
        }

        p {
            font-size: 1.1em;
            margin-bottom: 30px;
            color: #555;
        }

        a {
            background-color: #007bff; /* Blue for return to home button */
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: inline-block; /* Treat as a block for padding, but allow it to sit on a line */
        }

        a:hover {
            background-color: #0056b3;
        }

        /* Emoji styling for better display */
        h2 span {
            font-size: 1.2em; /* Make emoji slightly larger */
            vertical-align: middle;
            margin-left: 5px;
        }

        /* Responsive adjustments */
        @media (max-width: 480px) {
            .thank-you-container {
                padding: 25px;
            }
            h2 {
                font-size: 1.6em;
            }
            p {
                font-size: 1em;
            }
            a {
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="thank-you-container">
        <h2>Thank you for your feedback! 😊</h2>
        <p>Your response has been recorded.</p>
        <a href="/">Return to Home</a>
    </div>
</body>
</html>