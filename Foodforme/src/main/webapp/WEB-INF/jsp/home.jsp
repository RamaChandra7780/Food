<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Menu</title>
<style>
/* Existing styles for search bar and menu items... */

/* Basic styling for the search bar to make it look decent */
.search-container {
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #eee;
    border-radius: 5px;
    background-color: #f9f9f9;
    display: flex; /* Use flexbox for alignment */
    gap: 10px; /* Space between items */
    align-items: center; /* Vertically align items */
}
.search-container input[type=text] {
    flex-grow: 1; /* Allow input to take up available space */
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1em;
}
.search-container button {
    padding: 8px 15px;
    background-color: #4CAF50; /* Green */
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1em;
}
.search-container button:hover {
    background-color: #45a049;
}
.search-container a {
    text-decoration: none;
    color: #007bff;
    padding: 8px 0; /* Add some padding for better click area */
}
.search-container a:hover {
    text-decoration: underline;
}

/* Basic list styling for menu items */
ul {
    list-style: none; /* Remove bullet points */
    padding: 0;
    display: grid; /* Use grid for a responsive layout */
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); /* Responsive columns */
    gap: 20px; /* Space between grid items */
}
li {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    background-color: #fff;
}
li img {
    max-width: 100%; /* Make images responsive within their container */
    height: auto; /* Maintain aspect ratio */
    border-radius: 4px; /* Slightly rounded corners for images */
    margin-bottom: 10px;
}
li form {
    margin-top: 10px;
}
li input[type=number] {
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    width: 50px;
    text-align: center;
}
li button[type=submit] {
    padding: 5px 10px;
    background-color: #007bff; /* Blue for add to cart */
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
li button[type=submit]:hover {
    background-color: #0056b3;
}

.footer-buttons {
    margin-top: 30px;
    text-align: center;
}
.footer-buttons a, .footer-buttons button {
    display: inline-block;
    margin: 0 10px;
    padding: 10px 20px;
    background-color: #6c757d; /* Gray */
    color: white;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
    font-size: 1em;
}
.footer-buttons a:hover, .footer-buttons button:hover {
    background-color: #5a6268;
}

/* NEW STYLES FOR HEADER/NAV (Optional, but good for structure) */
.header-nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    border-bottom: 1px solid #eee;
    margin-bottom: 20px;
}
.header-nav .auth-links a {
    margin-left: 15px;
    text-decoration: none;
    color: #007bff;
}
.header-nav .auth-links a:hover {
    text-decoration: underline;
}

</style>
</head>
<body>
    <div class="header-nav">
        <div>
            <h1>Foodforme</h1>
        </div>
        <div class="auth-links">
            <c:if test="${not empty sessionScope.username}">
                <span>Welcome, ${sessionScope.username}!</span>
                <a href="/logout">Logout</a>
            </c:if>

            <c:if test="${empty sessionScope.username}">
                <a href="/login">Login</a>
                <a href="/register">Register</a>
            </c:if>
            <a href="/help" style="margin-left: 25px; padding: 8px 15px; background-color: #f0ad4e; color: white; border-radius: 4px; text-decoration: none;">Help</a>
        </div>
    </div>

	<h2>Menu Items</h2>

    <div class="search-container">
        <form action="/home" method="get">
            <input type="text" placeholder="Search menu by name..." name="search" value="${param.search}" />
            <button type="submit">Search</button>
            <c:if test="${not empty param.search}">
                <a href="/home">Clear Search</a>
            </c:if>
        </form>
    </div>


	<c:choose>
        <c:when test="${not empty menuItems}">
            <ul>
                <c:forEach var="item" items="${menuItems}">
                    <li>
                        <!-- MODIFIED: Use item.imageUrl and add onerror fallback -->
                        <img src="${empty item.imageUrl ? 'https://placehold.co/150x150/cccccc/000000?text=No+Image' : item.imageUrl}"
                             width="150" height="150" alt="${item.name}"
                             onerror="this.onerror=null;this.src='https://placehold.co/150x150/cccccc/000000?text=Error';" />
                        <br />
                        ${item.name} - ₹${item.price}

                        <form action="/cart/add/${item.id}" method="get" style="display: inline;">
                            Quantity: <input type="number" name="qty" value="1" min="1" style="width: 60px;" />
                            <button type="submit">Add to Cart</button>
                        </form>
                    </li>
                </c:forEach>
            </ul>
        </c:when>
        <c:otherwise>
            <c:if test="${not empty param.search}">
                <p>No menu items found matching your search term: "<strong><c:out value="${param.search}"/></strong>".</p>
            </c:if>
            <c:if test="${empty param.search}">
                <p>No menu items available.</p>
            </c:if>
        </c:otherwise>
    </c:choose>


    <div class="footer-buttons">
        <a href="/cart">View Cart</a>

        <form action="/orders" method="get" style="display: inline-block;">
            <button type="submit">🧾 View All Orders</button>
        </form>
    </div>

</body>
</html>