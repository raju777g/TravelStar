// Form validation
function validateForm(formId) {
    const form = document.getElementById(formId);
    const inputs = form.querySelectorAll('input[required], select[required], textarea[required]');
    let isValid = true;
    
    inputs.forEach(input => {
        if (!input.value.trim()) {
            input.style.borderColor = '#dc3545';
            isValid = false;
        } else {
            input.style.borderColor = '#ddd';
        }
    });
    
    return isValid;
}

// Date validation for booking
function validateBookingDates() {
    const startDate = document.getElementById('startDate');
    const endDate = document.getElementById('endDate');
    const today = new Date().toISOString().split('T')[0];
    
    if (startDate.value < today) {
        alert('Start date cannot be in the past');
        return false;
    }
    
    if (endDate.value <= startDate.value) {
        alert('End date must be after start date');
        return false;
    }
    
    return true;
}

// Calculate total amount for booking
function calculateTotal() {
    const startDate = document.getElementById('startDate');
    const endDate = document.getElementById('endDate');
    const pricePerDay = parseFloat(document.getElementById('pricePerDay').value);
    const totalElement = document.getElementById('totalAmount');
    
    if (startDate.value && endDate.value) {
        const start = new Date(startDate.value);
        const end = new Date(endDate.value);
        const days = Math.ceil((end - start) / (1000 * 60 * 60 * 24));
        
        if (days > 0) {
            const total = days * pricePerDay;
            totalElement.textContent = `₹${total.toFixed(2)}`;
        }
    }
}

// Search functionality
function searchDestinations() {
    const searchInput = document.getElementById('searchInput');
    const searchTerm = searchInput.value.trim();
    
    if (searchTerm) {
        window.location.href = `destinations?search=${encodeURIComponent(searchTerm)}`;
    } else {
        window.location.href = 'destinations';
    }
}

// Auto-hide alerts
document.addEventListener('DOMContentLoaded', function() {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        setTimeout(() => {
            alert.style.opacity = '0';
            setTimeout(() => {
                alert.remove();
            }, 300);
        }, 5000);
    });
    
    // Set minimum date for booking forms
    const dateInputs = document.querySelectorAll('input[type="date"]');
    const today = new Date().toISOString().split('T')[0];
    dateInputs.forEach(input => {
        input.min = today;
    });
});

// Confirm booking cancellation
function confirmCancel(bookingId) {
    if (confirm('Are you sure you want to cancel this booking?')) {
        window.location.href = `admin-booking?action=cancel&id=${bookingId}`;
    }
}

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
    });
});