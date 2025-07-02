<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Help & Support</title>
<style>
    body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        margin: 0;
        padding: 0;
        background-color: #f4f7f6; /* Light background */
        color: #333;
    }
    .header-bar {
        background-color: #ff8c00; /* Swiggy orange color */
        color: white;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .header-bar a {
        color: white;
        text-decoration: none;
        margin-left: 20px;
    }
    .header-bar a:hover {
        text-decoration: underline;
    }
    .header-bar .logo {
        font-size: 1.5em;
        font-weight: bold;
    }

    .hero-section {
        background-color: #2c5f78; /* Dark blue/teal */
        color: white;
        padding: 40px 30px;
        text-align: center;
    }
    .hero-section h1 {
        margin-bottom: 10px;
        font-size: 2.5em;
    }
    .hero-section p {
        font-size: 1.1em;
        opacity: 0.9;
    }

    .help-content {
        display: flex;
        max-width: 1200px;
        margin: 30px auto;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        overflow: hidden; /* Ensures borders are contained */
    }
    .sidebar {
        flex: 0 0 250px; /* Fixed width sidebar */
        background-color: #f0f0f0;
        padding: 20px;
        border-right: 1px solid #ddd;
    }
    .sidebar ul {
        list-style: none;
        padding: 0;
    }
    .sidebar li {
        margin-bottom: 10px;
    }
    .sidebar a {
        text-decoration: none;
        color: #333;
        padding: 8px 10px;
        display: block;
        border-radius: 4px;
    }
    .sidebar a.active, .sidebar a:hover {
        background-color: #ddd;
        font-weight: bold;
    }

    .main-faq-content {
        flex-grow: 1; /* Takes remaining space */
        padding: 30px;
    }
    .faq-category h2 {
        color: #2c5f78;
        margin-top: 0;
        margin-bottom: 20px;
        font-size: 1.8em;
    }
    .faq-item {
        margin-bottom: 20px;
        border-bottom: 1px solid #eee;
        padding-bottom: 15px;
    }
    .faq-question {
        font-weight: bold;
        color: #333;
        cursor: pointer;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 5px 0;
    }
    .faq-question:hover {
        color: #007bff;
    }
    .faq-answer {
        margin-top: 10px;
        color: #555;
        display: none; /* Hidden by default */
        padding-left: 20px;
        border-left: 2px solid #ff8c00;
        margin-left: 5px;
    }
    .faq-item.open .faq-answer {
        display: block; /* Show when open */
    }
    .faq-toggle-icon {
        font-size: 1.2em;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .help-content {
            flex-direction: column;
        }
        .sidebar {
            width: 100%;
            border-right: none;
            border-bottom: 1px solid #ddd;
        }
    }
</style>
</head>
<body>
    <div class="header-bar">
        <div class="logo">Foodforme Help</div>
        <div>
            <a href="/home">Home</a>
            <c:if test="${not empty sessionScope.username}">
                <a href="/logout">Logout</a>
            </c:if>
            <c:if test="${empty sessionScope.username}">
                <a href="/login">Login</a>
            </c:if>
        </div>
    </div>

    <div class="hero-section">
        <h1>Help & Support</h1>
        <p>Let's take a step ahead and help you better.</p>
    </div>

    <div class="help-content">
        <div class="sidebar">
            <ul>
                <li><a href="#" class="active">Partner Onboarding</a></li>
            </ul>
        </div>
        <div class="main-faq-content">
            <div class="faq-category">
                <h2>Partner Onboarding</h2>
                <div class="faq-item">
                    <div class="faq-question">
                        I want to partner my restaurant with Foodforme
                        <span class="faq-toggle-icon">&#9660;</span> <%-- Down arrow --%>
                    </div>
                    <div class="faq-answer">
                        To partner your restaurant with Foodforme, please visit our partner portal and fill out the registration form. Our team will review your application and get in touch with you.
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        What are the mandatory documents needed to list my restaurant on Foodforme?
                        <span class="faq-toggle-icon">&#9660;</span>
                    </div>
                    <div class="faq-answer">
                        Typically, you will need documents like your FSSAI license, GSTIN, PAN Card, bank account details, and a signed partnership agreement. Specific requirements may vary.
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        I want to opt-out from Google reserve
                        <span class="faq-toggle-icon">&#9650;</span> <%-- Up arrow --%>
                    </div>
                    <div class="faq-answer">
                        Please send an email to <a href="mailto:support@foodforme.com">support@foodforme.com</a> with your restaurant details and your request to opt-out from Google reserve.
                    </div>
                </div>
                 <div class="faq-item">
                    <div class="faq-question">
                        After I submit all documents, how long will it take for my restaurant to go live on Foodforme?
                        <span class="faq-toggle-icon">&#9660;</span>
                    </div>
                    <div class="faq-answer">
                        After all mandatory documents have been received and verified, it typically takes up to 7-10 working days for the onboarding process to be completed and to make your restaurant live on the platform.
                    </div>
                </div>
                </div>
            </div>
    </div>

    <script>
        // JavaScript for accordion-like FAQ
        document.addEventListener('DOMContentLoaded', function() {
            const faqQuestions = document.querySelectorAll('.faq-question');

            faqQuestions.forEach(question => {
                question.addEventListener('click', function() {
                    const faqItem = this.closest('.faq-item');
                    faqItem.classList.toggle('open'); // Toggle 'open' class

                    const toggleIcon = this.querySelector('.faq-toggle-icon');
                    if (faqItem.classList.contains('open')) {
                        toggleIcon.innerHTML = '&#9650;'; // Change to up arrow
                    } else {
                        toggleIcon.innerHTML = '&#9660;'; // Change to down arrow
                    }
                });
            });
        });
    </script>
</body>
</html>