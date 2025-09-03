<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - TravelStar</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <h1><a href="index.jsp" style="color: white; text-decoration: none;">TravelStar</a></h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="destinations">Destinations</a></li>
                        <li><a href="login.jsp">Login</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <main class="container">
        <div style="text-align: center; margin: 3rem 0;">
            <h2>Oops! Something went wrong</h2>
            <p>We're sorry, but there was an error processing your request.</p>
            <div style="margin: 2rem 0;">
                <a href="index.jsp" class="btn">Go Home</a>
                <a href="destinations" class="btn btn-secondary">Browse Destinations</a>
            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 TravelStar. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>