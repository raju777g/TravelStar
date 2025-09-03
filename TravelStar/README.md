# TravelStar - Travel & Tourism Management System

A comprehensive Java full-stack web application for travel and tourism management built with JSP, Servlets, JDBC, and MySQL.

## Features

### User Features
- User registration and authentication
- Browse travel destinations
- Search destinations by name/location
- View destination details with ratings
- Book travel packages
- View booking history
- Responsive web design

### Admin Features
- Admin dashboard
- Manage destinations
- View all bookings
- Manage booking status

## Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript, JSP
- **Backend**: Java Servlets, JDBC
- **Database**: MySQL 8.0.43
- **Server**: Apache Tomcat 9
- **Architecture**: MVC Pattern

## Project Structure

```
TravelStar/
├── database/
│   └── travelstar_schema.sql
├── src/main/
│   ├── java/com/travelstar/
│   │   ├── model/
│   │   │   ├── User.java
│   │   │   ├── Destination.java
│   │   │   └── Booking.java
│   │   ├── dao/
│   │   │   ├── UserDAO.java
│   │   │   ├── DestinationDAO.java
│   │   │   └── BookingDAO.java
│   │   ├── servlet/
│   │   │   ├── LoginServlet.java
│   │   │   ├── RegisterServlet.java
│   │   │   ├── DestinationServlet.java
│   │   │   └── BookingServlet.java
│   │   └── util/
│   │       └── DatabaseConnection.java
│   └── webapp/
│       ├── css/style.css
│       ├── js/script.js
│       ├── images/
│       ├── WEB-INF/web.xml
│       └── *.jsp files
```

## Setup Instructions

### Prerequisites
- JDK 8 or higher
- Apache Tomcat 9
- MySQL 8.0.43
- Eclipse IDE (or any Java IDE)

### Database Setup
1. Install MySQL 8.0.43
2. Create database using the script: `database/travelstar_schema.sql`
3. Update database credentials in `DatabaseConnection.java`

### Application Setup
1. Import project into Eclipse IDE
2. Add MySQL Connector/J to the project classpath
3. Configure Tomcat server in Eclipse
4. Deploy the application to Tomcat
5. Access the application at `http://localhost:8080/TravelStar`

### Default Login Credentials
- **Admin**: Username: `admin`, Password: `admin123`

## Database Schema

### Tables
- **users**: User account information
- **destinations**: Travel destination details
- **bookings**: Booking records with status tracking

## Key Features Implementation

### Authentication System
- Session-based user authentication
- Role-based access control (User/Admin)
- Secure password handling

### Booking System
- Date validation for travel bookings
- Automatic total calculation
- Booking status management (PENDING/CONFIRMED/CANCELLED)

### Search & Filter
- Destination search by name and location
- Real-time search functionality

### Responsive Design
- Mobile-friendly interface
- Modern CSS with flexbox and grid
- Interactive JavaScript features

## API Endpoints

- `/login` - User authentication
- `/register` - User registration
- `/destinations` - Browse destinations
- `/booking` - Booking management
- `/logout` - Session termination

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is developed for educational purposes.

## Contact

For any queries or support, please contact the development team.