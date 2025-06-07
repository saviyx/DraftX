<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DraftX - Cricket Player Bidding Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home">
            <img src="img/logo.png" alt="DraftX" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Auctions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section text-white">
    <div class="video-background">
        <video autoplay muted loop playsinline id="heroVideo">
            <source src="videos/bg.mp4" type="video/mp4">
            <!-- Fallback image if video doesn't load -->
            <img src="img/bgi.jpg" alt="Cricket Auction Background">
        </video>
        <div class="video-overlay"></div>
    </div>
    <div class="container py-5 hero-content">
        <h1 class="display-4 fw-bold mb-4">Welcome to DraftX</h1>
        <p class="lead mb-5">The premier platform for cricket player auctions and fantasy team building</p>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
            <a href="register.jsp" class="btn btn-primary btn-lg px-4 gap-3">Get Started</a>
            <a href="dashboard.jsp" class="btn btn-outline-light btn-lg px-4">Live Auctions</a>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5">Why Choose DraftX?</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="feature-icon bg-primary bg-gradient mb-3 mx-auto">
                            <i class="bi bi-trophy fs-2 text-white"></i>
                        </div>
                        <h3 class="h4">Premium Players</h3>
                        <p class="text-muted">Access to top international and domestic cricket players for your fantasy teams.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="feature-icon bg-success bg-gradient mb-3 mx-auto">
                            <i class="bi bi-graph-up fs-2 text-white"></i>
                        </div>
                        <h3 class="h4">Real-time Bidding</h3>
                        <p class="text-muted">Engage in live auctions with real-time updates and competitive bidding.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body text-center">
                        <div class="feature-icon bg-info bg-gradient mb-3 mx-auto">
                            <i class="bi bi-shield-check fs-2 text-white"></i>
                        </div>
                        <h3 class="h4">Secure Platform</h3>
                        <p class="text-muted">Your transactions and data are protected with advanced security measures.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Upcoming Auctions -->
<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">IPL Live Auction Player Pool</h2>

        <!-- Debug info (remove in production) -->
        <c:if test="${not empty players}">
            <div class="alert alert-success">
                <strong>Debug:</strong> Found ${players.size()} players in database
            </div>
        </c:if>
        <c:if test="${empty players}">
            <div class="alert alert-warning">
                <strong>Debug:</strong> No players found. Check database connection and data.
            </div>
        </c:if>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <c:choose>
                <c:when test="${not empty players}">
                    <c:forEach items="${players}" var="player">
                        <div class="col">
                            <div class="card h-100 auction-card">
                                <div class="card-header bg-primary text-white">
                                    <h5 class="card-title mb-0">${player.name}</h5>
                                </div>
                                <!-- Fixed size image container -->
                                <div class="player-image-container">
                                    <img src="${player.image_path}" class="card-img-top" alt="${player.name}">
                                </div>
                                <div class="card-body">
                                    <p class="player-meta">
                                        <span>${player.country}</span> |
                                        <span class="player-role">${player.player_type}</span>
                                    </p>
                                    <p class="card-text">${player.description}</p>
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="badge bg-success">Live</span>
                                        <small class="text-muted">
                                            <c:choose>
                                                <c:when test="${not empty player.formattedAuctionEnd}">
                                                    Ends: ${player.formattedAuctionEnd}
                                                </c:when>
                                                <c:otherwise>
                                                    Ends in 2h 45m
                                                </c:otherwise>
                                            </c:choose>
                                        </small>
                                    </div>
                                    <div class="progress mb-3">
                                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 75%"></div>
                                    </div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <span>Base Price:</span>
                                        <strong>$<fmt:formatNumber value="${player.basePrice}" pattern="#,##0.00"/>M</strong>
                                    </div>
                                    <div class="d-flex justify-content-between mb-3">
                                        <span>Current Bid:</span>
                                        <strong>$<fmt:formatNumber value="${player.currentBid}" pattern="#,##0.00"/>M</strong>
                                    </div>
                                </div>
                                <div class="card-footer bg-transparent">
                                    <a href="playerdetails?playerId=${player.id}" class="btn btn-primary w-100">View Details</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-12">
                        <div class="alert alert-info text-center">
                            <h4>No Active Auctions</h4>
                            <p>No active player auctions found. Check back later for upcoming auctions!</p>
                            <a href="home" class="btn btn-primary">Refresh Page</a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-3">
                <h5>About DraftX</h5>
                <p>The ultimate platform for cricket enthusiasts to build their dream teams through competitive player auctions.</p>
            </div>
            <div class="col-md-4 mb-3">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="home" class="text-white">Home</a></li>
                    <li><a href="dashboard.jsp" class="text-white">Auctions</a></li>
                    <li><a href="my-bids.jsp" class="text-white">My Bids</a></li>
                    <li><a href="login.jsp" class="text-white">Login</a></li>
                    <li><a href="register.jsp" class="text-white">Register</a></li>
                </ul>
            </div>
            <div class="col-md-4 mb-3">
                <h5>Contact Us</h5>
                <address>
                    Email: <a href="mailto:info@draftx.com" class="text-white">info@draftx.com</a><br>
                    Phone: +1 (123) 456-7890
                </address>
            </div>
        </div>
        <hr>
        <div class="text-center">
            <p class="mb-0">&copy; 2024 DraftX. All rights reserved.</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>