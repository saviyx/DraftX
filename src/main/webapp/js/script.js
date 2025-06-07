// General JavaScript for the DraftX platform

// Initialize tooltips
document.addEventListener('DOMContentLoaded', function() {
    // Enable Bootstrap tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Update current year in footer
    document.getElementById('currentYear').textContent = new Date().getFullYear();

    // Auction countdown timers
    updateCountdowns();
    setInterval(updateCountdowns, 1000);
});

// Function to update countdown timers on auction cards
function updateCountdowns() {
    const countdownElements = document.querySelectorAll('.auction-countdown');

    countdownElements.forEach(element => {
        const endTime = new Date(element.getAttribute('data-end-time')).getTime();
        const now = new Date().getTime();
        const distance = endTime - now;

        if (distance < 0) {
            element.innerHTML = 'Auction Ended';
            return;
        }

        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

        element.innerHTML = `${hours}h ${minutes}m ${seconds}s`;
    });
}

// Form validation for registration
function validateRegistrationForm() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (password !== confirmPassword) {
        alert('Passwords do not match!');
        return false;
    }

    if (password.length < 8) {
        alert('Password must be at least 8 characters long!');
        return false;
    }

    return true;
}

// Simulate live bid updates
function simulateLiveBids() {
    const bidElements = document.querySelectorAll('.current-bid');

    bidElements.forEach(element => {
        const currentBid = parseFloat(element.textContent.replace(/[^0-9.]/g, ''));
        const randomIncrement = Math.floor(Math.random() * 5000) + 1000;
        const newBid = currentBid + randomIncrement;

        element.textContent = `$${(newBid / 1000000).toFixed(2)}M`;

        // Add animation
        element.classList.add('text-success');
        setTimeout(() => {
            element.classList.remove('text-success');
        }, 1000);
    });
}

// Run live bid simulation every 5-10 seconds
setInterval(simulateLiveBids, Math.random() * 5000 + 5000);

// Auction progress simulation
function simulateAuctionProgress() {
    const progressBars = document.querySelectorAll('.progress-bar');

    progressBars.forEach(bar => {
        const currentWidth = parseFloat(bar.style.width) || 0;
        const increment = Math.random() * 5;

        if (currentWidth < 100) {
            bar.style.width = (currentWidth + increment) + '%';
        }
    });
}

// Run progress simulation every 2 seconds
setInterval(simulateAuctionProgress, 2000);

// Video Background Fallback and Controls
document.addEventListener('DOMContentLoaded', function() {
    const heroVideo = document.getElementById('heroVideo');

    // Try to play video (some browsers require this)
    if(heroVideo) {
        const playPromise = heroVideo.play();

        if (playPromise !== undefined) {
            playPromise.catch(error => {
                // Auto-play was prevented, show fallback
                document.querySelector('.video-background').style.background = 'url("img/hero-fallback.jpg") no-repeat center center';
                document.querySelector('.video-background').style.backgroundSize = 'cover';
                heroVideo.style.display = 'none';
            });
        }
    }

    // Pause video when tab is inactive
    document.addEventListener('visibilitychange', function() {
        if(heroVideo) {
            if (document.hidden) {
                heroVideo.pause();
            } else {
                heroVideo.play();
            }
        }
    });
});