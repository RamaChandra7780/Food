<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - Manage Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding-bottom: 50px;
            padding-top: 70px;
        }

        .header {
            width: 100%;
            background-color: #2c5f78;
            color: white;
            padding: 15px 0;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        .header nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .header nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1em;
            padding: 5px 10px;
            transition: background-color 0.3s ease, color 0.3s ease;
            border-radius: 5px;
        }

        .header nav ul li a:hover,
        .header nav ul li a.active {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        .admin-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            max-width: 1000px;
            width: 90%;
            margin-top: 20px;
            box-sizing: border-box;
            text-align: center;
        }

        h2 {
            color: #2c5f78;
            margin-bottom: 25px;
            font-size: 2em;
            text-align: center;
            padding-top: 10px;
            margin-top: -10px;
        }

        hr {
            border: none;
            border-top: 1px solid #eee;
            margin: 40px 0;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            align-items: center;
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            background-color: #fcfcfc;
        }

        form div {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            width: 80%;
            max-width: 400px;
        }

        form label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
            text-align: left;
        }

        form input[type="text"],
        form input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-sizing: border-box;
        }

        /* Removed styling for input[type="file"] as it's no longer used */
        /* form input[type="file"] {
            width: 100%;
            padding: 8px 0;
            font-size: 0.95em;
            box-sizing: border-box;
        } */

        form input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            margin-top: 20px;
            transition: background-color 0.3s ease;
            width: 80%;
            max-width: 400px;
        }

        form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 1px 5px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        th, td {
            border: 1px solid #e0e0e0;
            padding: 12px 15px;
            text-align: left;
            vertical-align: middle;
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

        table img {
            max-width: 100px;
            height: 100px;
            border-radius: 4px;
            object-fit: cover;
        }

        table a {
            color: #007bff;
            text-decoration: none;
            margin: 0 5px;
        }

        table a:hover {
            text-decoration: underline;
        }

        table a[href*="delete"] {
            color: #dc3545;
        }

        .admin-container p {
            text-align: center;
            font-size: 1.1em;
            color: #666;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .pagination-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 20px;
            gap: 10px;
        }

        .pagination-controls a {
            background-color: #007bff;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.9em;
            transition: background-color 0.3s ease;
        }

        .pagination-controls a:hover {
            background-color: #0056b3;
        }

        .pagination-controls a.disabled {
            background-color: #cccccc;
            cursor: not-allowed;
            pointer-events: none;
        }

        .pagination-controls span {
            font-weight: bold;
            color: #555;
            font-size: 1em;
        }

        @media (max-width: 768px) {
            .header nav ul {
                flex-wrap: wrap;
                justify-content: center;
                gap: 15px;
            }
            .header nav ul li a {
                font-size: 1em;
                padding: 5px 8px;
            }

            .admin-container {
                padding: 20px;
                margin-top: 20px;
            }
            h2 {
                font-size: 1.6em;
            }
            form div {
                width: 95%;
            }
            form input[type="submit"] {
                width: 95%;
            }
            th, td {
                padding: 8px 10px;
                font-size: 0.85em;
            }
            .table-responsive {
                overflow-x: auto;
            }
            .pagination-controls {
                flex-wrap: wrap;
                justify-content: center;
                gap: 5px;
            }
            .pagination-controls a {
                padding: 6px 10px;
                font-size: 0.8em;
            }
        }

        @media (max-width: 480px) {
            th, td {
                padding: 6px;
                font-size: 0.75em;
            }
            table img {
                width: 80px;
                height: 80px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <nav>
            <ul>
                <li><a href="#add-item-section">Add/Edit Item</a></li>
                <li><a href="#existing-menu-section">Existing Menu</a></li>
                <li><a href="#customer-feedback-section">Customer Feedback</a></li>
                <li><a href="/">⬅ Back to Home</a></li>
            </ul>
        </nav>
    </div>

    <div class="admin-container">
        <h2 id="add-item-section">${item.id == null ? "Add New Menu Item" : "Edit Menu Item"}</h2>

        <form action="${item.id == null ? '/admin/add' : '/admin/update'}" method="post">
            <!-- Removed enctype="multipart/form-data" -->
            <input type="hidden" name="id" value="${item.id}" />
            
            <div>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${item.name}" required />
            </div>
            
            <div>
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" value="${item.description}" required />
            </div>
            
            <div>
                <label for="price">Price:</label>
                <input type="number" id="price" step="0.01" name="price" value="${item.price}" required />
            </div>

            <div>
                <label for="imageUrl">Image URL:</label>
                <!-- Changed input type from file to text and name to imageUrl -->
                <input type="text" id="imageUrl" name="imageUrl" value="${item.imageUrl}" placeholder="Enter full image URL (e.g., https://example.com/image.jpg)" />
            </div>

            <input type="submit" value="${item.id == null ? 'Add Item' : 'Update Item'}" />
        </form>


        <hr/>

        <h2 id="existing-menu-section">Existing Menu</h2>
        <div class="table-responsive">
            <table>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price (₹)</th>
                    <th>Actions</th>
                </tr>
                <c:if test="${empty items}">
                    <tr><td colspan="5">No menu items found.</td></tr>
                </c:if>
                <c:forEach var="item" items="${items}">
                    <tr>
                        <td>
                            <!-- Changed img src to use imageUrl and added onerror fallback -->
                            <img src="${empty item.imageUrl ? 'https://placehold.co/100x100/cccccc/000000?text=No+Image' : item.imageUrl}" 
                                 alt="${item.name}" onerror="this.onerror=null;this.src='https://placehold.co/100x100/cccccc/000000?text=Error';" />
                        </td>
                        <td>${item.name}</td>
                        <td>${item.description}</td>
                        <td>${item.price}</td>
                        <td>
                            <a href="/admin/edit/${item.id}?menuPage=${menuCurrentPage}&menuSize=10&reviewPage=${reviewCurrentPage}&reviewSize=10">Edit</a> |
                            <a href="/admin/delete/${item.id}" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div class="pagination-controls">
            <c:set var="prevMenuPage" value="${menuCurrentPage - 1}"/>
            <c:set var="nextMenuPage" value="${menuCurrentPage + 1}"/>

            <a href="/admin?menuPage=${prevMenuPage}&menuSize=10&reviewPage=${reviewCurrentPage}&reviewSize=10"
               class="${menuHasPrevious ? '' : 'disabled'}">Previous</a>
            
            <span>Page ${menuCurrentPage + 1} of ${menuTotalPages == 0 ? 1 : menuTotalPages}</span>

            <a href="/admin?menuPage=${nextMenuPage}&menuSize=10&reviewPage=${reviewCurrentPage}&reviewSize=10"
               class="${menuHasNext ? '' : 'disabled'}">Next</a>
        </div>


        <hr/>

        <h2 id="customer-feedback-section">Customer Feedback</h2>
        <c:if test="${empty reviews}">
            <p>No reviews submitted yet.</p>
        </c:if>

        <c:if test="${not empty reviews}">
            <div class="table-responsive">
                <table>
                    <tr>
                        <th>Order ID</th>
                        <th>User</th>
                        <th>Rating</th>
                        <th>Review</th>
                        <th>Delivery Rating</th>
                        <th>Satisfaction</th>
                        <th>Tip</th>
                        <th>Date</th>
                    </tr>
                    <c:forEach var="r" items="${reviews}">
                        <tr>
                            <td>${r.orderId}</td>
                            <td>${r.username}</td>
                            <td>${r.starRating}</td>
                            <td>${r.reviewText}</td>
                            <td>${r.deliveryRating}</td>
                            <td>${r.deliverySatisfaction}</td>
                            <td>₹${r.tipAmount}</td>
                            <td>${r.reviewDate}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:if>

        <c:if test="${not empty reviews || reviewTotalPages > 1}">
            <div class="pagination-controls">
                <c:set var="prevReviewPage" value="${reviewCurrentPage - 1}"/>
                <c:set var="nextReviewPage" value="${reviewCurrentPage + 1}"/>

                <a href="/admin?menuPage=${menuCurrentPage}&menuSize=10&reviewPage=${prevReviewPage}&reviewSize=10"
                   class="${reviewHasPrevious ? '' : 'disabled'}">Previous</a>
                
                <span>Page ${reviewCurrentPage + 1} of ${reviewTotalPages == 0 ? 1 : reviewTotalPages}</span>

                <a href="/admin?menuPage=${menuCurrentPage}&menuSize=10&reviewPage=${nextReviewPage}&reviewSize=10"
                   class="${reviewHasNext ? '' : 'disabled'}">Next</a>
            </div>
        </c:if>
    </div>
</body>
</html>