
<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: savindu umantha--%>
<%--  Date: 6/2/2025--%>
<%--  Time: 5:38 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Dashboard - DraftX</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="css/style.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- Navigation -->--%>
<%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">--%>
<%--    <div class="container">--%>
<%--        <a class="navbar-brand" href="index.jsp">--%>
<%--            <img src="img/logo.png" alt="DraftX" height="40">--%>
<%--        </a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--            <ul class="navbar-nav me-auto">--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="index.jsp">Home</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" href="dashboard.jsp">Auctions</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="my-bids.jsp">My Bids</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <ul class="navbar-nav ms-auto">--%>
<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">--%>
<%--                        <i class="bi bi-person-circle me-1"></i> User Profile--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu dropdown-menu-end">--%>
<%--                        <li><a class="dropdown-item" href="#">My Account</a></li>--%>
<%--                        <li><a class="dropdown-item" href="my-bids.jsp">Bidding History</a></li>--%>
<%--                        <li><hr class="dropdown-divider"></li>--%>
<%--                        <li><a class="dropdown-item" href="index.jsp">Logout</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<!-- Dashboard Content -->--%>
<%--<div class="container-fluid mt-4">--%>
<%--    <div class="row">--%>
<%--        <!-- Sidebar -->--%>
<%--        <div class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">--%>
<%--            <div class="position-sticky pt-3">--%>
<%--                <ul class="nav flex-column">--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link active" href="dashboard.jsp">--%>
<%--                            <i class="bi bi-house-door me-2"></i> Live IPL Player Pool--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="#">--%>
<%--                            <i class="bi bi-trophy me-2"></i> Completed Auctions--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="my-bids.jsp">--%>
<%--                            <i class="bi bi-list-check me-2"></i> My Bids--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="#">--%>
<%--                            <i class="bi bi-people me-2"></i> My Team--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="#">--%>
<%--                            <i class="bi bi-wallet2 me-2"></i> Wallet--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- Main Content -->--%>
<%--        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">--%>
<%--            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">--%>
<%--                <h1 class="h2">Live IPL Player Pool</h1>--%>
<%--                <div class="btn-toolbar mb-2 mb-md-0">--%>
<%--                    <div class="btn-group me-2">--%>
<%--                        <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>--%>
<%--                        <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>--%>
<%--                    </div>--%>
<%--                    <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">--%>
<%--                        <span data-feather="calendar"></span> Filter--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Player Cards -->--%>
<%--            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">--%>
<%--&lt;%&ndash;           <c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;               <c:when test="${not empty players}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                   <c:forEach items="${players}" var="player">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="col">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="card h-100 auction-card">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="card-header bg-primary text-white">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <h5 class="card-title mb-0">${player.name}</h5>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <!-- Fixed size image container -->&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="player-image-container">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img src="${player.imagePath}" class="card-img-top" alt="Virat Kohli">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="card-body">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p class="player-meta">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span>${player.country}</span> |&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="player-role">${player.player_type}</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p class="card-text">${player.description}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="d-flex justify-content-between align-items-center mb-2">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="badge bg-success">Live</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <small class="text-muted">Ends in 2h 45m</small>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="progress mb-3">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 75%"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="d-flex justify-content-between mb-2">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span>Base Price:</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <strong>$${player.basePrice}M</strong>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="d-flex justify-content-between mb-3">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span>Current Bid:</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <strong>$${player.currentBid != null ? player.currentBid : 0}M</strong>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="card-footer bg-transparent">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <a href="auction-details.jsp" class="btn btn-primary w-100">Join Auction</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                   </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;               </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;               <c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                   <div class="col-12">&ndash;%&gt;--%>
<%--&lt;%&ndash;                       <p class="text-center">No active player auctions found.</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                   </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;               </c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;           </c:choose>&ndash;%&gt;--%>

<%--                <!-- Player 2 -->--%>
<%--                <div class="col">--%>
<%--                    <div class="card h-100 auction-card">--%>
<%--                        <div class="card-header bg-primary text-white">--%>
<%--                            <h5 class="card-title mb-0">Dinesh Chandimal</h5>--%>
<%--                        </div>--%>
<%--                        <!-- Fixed size image container -->--%>
<%--                        <div class="player-image-container">--%>
<%--                            <img src="img/Dinesh-Chandimal.jpg" class="card-img-top" alt="Virat Kohli">--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <p class="player-meta">--%>
<%--                                <span>🇮🇳 India</span> |--%>
<%--                                <span class="player-role">Right-handed Batsman</span>--%>
<%--                            </p>--%>
<%--                            <p class="card-text">The modern batting maestro with 70+ international centuries.--%>
<%--                                Aggressive yet technically sound, Kohli dominates all formats--%>
<%--                                with his exceptional chasing ability and consistency.</p>--%>
<%--                            <div class="d-flex justify-content-between align-items-center mb-2">--%>
<%--                                <span class="badge bg-success">Live</span>--%>
<%--                                <small class="text-muted">Ends in 2h 45m</small>--%>
<%--                            </div>--%>
<%--                            <div class="progress mb-3">--%>
<%--                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 75%"></div>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between mb-2">--%>
<%--                                <span>Base Price:</span>--%>
<%--                                <strong>$1.2M</strong>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between mb-3">--%>
<%--                                <span>Current Bid:</span>--%>
<%--                                <strong>$1.25M</strong>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-footer bg-transparent">--%>
<%--                            <a href="auction-details.jsp" class="btn btn-primary w-100">Join Auction</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <!-- Player 3 -->--%>
<%--                <div class="col">--%>
<%--                    <div class="card h-100 auction-card">--%>
<%--                        <div class="card-header bg-primary text-white">--%>
<%--                            <h5 class="card-title mb-0">Matheesha Pathirana</h5>--%>
<%--                        </div>--%>
<%--                        <!-- Fixed size image container -->--%>
<%--                        <div class="player-image-container">--%>
<%--                            <img src="img/mp.jpg" class="card-img-top" alt="Virat Kohli">--%>
<%--                        </div>--%>
<%--                        <div class="card-body">--%>
<%--                            <p class="player-meta">--%>
<%--                                <span>Sri Lanka</span> |--%>
<%--                                <span class="player-role">Right Arm Fast Bowler</span>--%>
<%--                            </p>--%>
<%--                            <p class="card-text">The modern batting maestro with 70+ international centuries.--%>
<%--                                Aggressive yet technically sound, Kohli dominates all formats--%>
<%--                                with his exceptional chasing ability and consistency.</p>--%>
<%--                            <div class="d-flex justify-content-between align-items-center mb-2">--%>
<%--                                <span class="badge bg-success">Live</span>--%>
<%--                                <small class="text-muted">Ends in 2h 45m</small>--%>
<%--                            </div>--%>
<%--                            <div class="progress mb-3">--%>
<%--                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 75%"></div>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between mb-2">--%>
<%--                                <span>Base Price:</span>--%>
<%--                                <strong>$1.2M</strong>--%>
<%--                            </div>--%>
<%--                            <div class="d-flex justify-content-between mb-3">--%>
<%--                                <span>Current Bid:</span>--%>
<%--                                <strong>$1.25M</strong>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="card-footer bg-transparent">--%>
<%--                            <a href="auction-details.jsp" class="btn btn-primary w-100">Join Auction</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Upcoming Auctions -->--%>
<%--            <h2 class="h3 mt-5 mb-3">Upcoming Auctions</h2>--%>
<%--            <div class="table-responsive">--%>
<%--                <table class="table table-striped table-hover">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>Tournament</th>--%>
<%--                        <th>Start Date</th>--%>
<%--                        <th>Players</th>--%>
<%--                        <th>Base Price</th>--%>
<%--                        <th>Action</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <td>Caribbean Premier League 2024</td>--%>
<%--                        <td>Jun 15, 2024</td>--%>
<%--                        <td>90</td>--%>
<%--                        <td>$300K</td>--%>
<%--                        <td><a href="#" class="btn btn-sm btn-outline-primary">Set Reminder</a></td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>Big Bash League 2024-25</td>--%>
<%--                        <td>Dec 5, 2024</td>--%>
<%--                        <td>110</td>--%>
<%--                        <td>$400K</td>--%>
<%--                        <td><a href="#" class="btn btn-sm btn-outline-primary">Set Reminder</a></td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>SA20 2025</td>--%>
<%--                        <td>Jan 10, 2025</td>--%>
<%--                        <td>80</td>--%>
<%--                        <td>$350K</td>--%>
<%--                        <td><a href="#" class="btn btn-sm btn-outline-primary">Set Reminder</a></td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </main>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!-- Footer -->--%>
<%--<footer class="bg-dark text-white py-4 mt-5">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-4 mb-3">--%>
<%--                <h5>About DraftX</h5>--%>
<%--                <p>The ultimate platform for cricket enthusiasts to build their dream teams through competitive player auctions.</p>--%>
<%--            </div>--%>
<%--            <div class="col-md-4 mb-3">--%>
<%--                <h5>Quick Links</h5>--%>
<%--                <ul class="list-unstyled">--%>
<%--                    <li><a href="index.jsp" class="text-white">Home</a></li>--%>
<%--                    <li><a href="dashboard.jsp" class="text-white">Auctions</a></li>--%>
<%--                    <li><a href="my-bids.jsp" class="text-white">My Bids</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--            <div class="col-md-4 mb-3">--%>
<%--                <h5>Contact Us</h5>--%>
<%--                <address>--%>
<%--                    Email: <a href="mailto:info@draftx.com" class="text-white">info@draftx.com</a><br>--%>
<%--                    Phone: +1 (123) 456-7890--%>
<%--                </address>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <hr>--%>
<%--        <div class="text-center">--%>
<%--            <p class="mb-0">&copy; 2024 DraftX. All rights reserved.</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--<script src="js/script.js"></script>--%>
<%--</body>--%>
<%--</html>--%>
