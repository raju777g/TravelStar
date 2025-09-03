<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelStar - Your Dream Destinations Await</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="background: url('images/bg.png') no-repeat center center fixed; background-size: cover;">
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <img src="images/logo.png" alt="TravelStar Logo">
                    <h1>TravelStar</h1>
                </div>
                <nav>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="destinations">Destinations</a></li>
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="register.jsp">Register</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <section class="hero">
        <div class="hero-content">
            <h2>Discover Amazing Destinations</h2>
            <p>Explore the world's most beautiful places with TravelStar</p>
            <a href="destinations" class="btn">Explore Destinations</a>
        </div>
    </section>

    <main class="container">
        <section style="margin: 3rem 0; text-align: center;">
            <h2 style="color: white;">Why Choose TravelStar?</h2>
            <div class="card-grid" style="margin-top: 2rem;">
                <div class="card">
                    <div class="card-content">
                        <h3>🌍 Amazing Destinations</h3>
                        <p>Discover handpicked destinations across India with unique experiences and breathtaking views.</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <h3>💰 Best Prices</h3>
                        <p>Get the best deals on travel packages with transparent pricing and no hidden costs.</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <h3>🎯 Easy Booking</h3>
                        <p>Simple and secure booking process with instant confirmation and flexible cancellation.</p>
                    </div>
                </div>
            </div>
        </section>

        <section style="margin: 3rem 0; text-align: center;">
            <h2 style="color: white;">Popular Destinations</h2>
            <p>Explore our most loved travel destinations</p>
            <div style="margin-top: 2rem;">
                <a href="destinations" class="btn">View All Destinations</a>
            </div>
        </section>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 TravelStar. All rights reserved. | Your journey begins here!</p>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>
</html>