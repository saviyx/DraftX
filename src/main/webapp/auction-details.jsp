<%--
  Created by IntelliJ IDEA.
  User: savindu umantha
  Date: 6/2/2025
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Auction Details - DraftX</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
      <img src="img/logo.png" alt="DraftX" height="40">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="dashboard.jsp">Auctions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="my-bids.jsp">My Bids</a>
        </li>
      </ul>
      <ul class="navbar-nav ms-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
            <i class="bi bi-person-circle me-1"></i> User Profile
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="#">My Account</a></li>
            <li><a class="dropdown-item" href="my-bids.jsp">Bidding History</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="index.jsp">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Auction Details Content -->
<div class="container mt-4">
  <div class="row">
    <!-- Main Auction Area -->
    <div class="col-lg-8">
      <div class="card mb-4">
        <div class="card-header bg-primary text-white">
          <h2 class="h4 mb-0">IPL 2024 Mega Auction - Live</h2>
        </div>
        <div class="card-body">
          <c:choose>
            <c:when test="${not empty player}">
              <div class="row">
                <div class="col-md-6">
                  <img src="${player.image_path}" class="img-fluid rounded mb-3" alt="IPL 2024">
                </div>
                <div class="col-md-6">
                  <div class="d-flex justify-content-between align-items-center mb-3">
                    <span class="badge bg-success">Live</span>
                    <span class="text-muted">Ends in 2h 15m</span>
                  </div>
                  <div class="progress mb-3">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 65%"></div>
                  </div>
                  <div class="mb-3">
                    <h4 class="mb-1">Current Player: ${player.name}</h4>
                    <p class="text-muted mb-2">${player.player_type} | ${player.country}</p>
                    <div class="d-flex justify-content-between">
                      <span>Base Price:</span>
                      <strong>$${player.basePrice}M</strong>
                    </div>
                    <div class="d-flex justify-content-between">
                      <span>Current Bid:</span>
                      <strong class="text-danger" id="current-bid">$${player.currentBid}M</strong>
                    </div>
                    <div class="d-flex justify-content-between">
                      <span>Bid By:</span>
                      <strong id="last-bidder">Royal Challengers</strong>
                    </div>
                  </div>
                </div>
              </div>
            </c:when>
            <c:otherwise>
              <div class="text-center py-5">
                <h4>No player currently available for bidding</h4>
                <p class="text-muted">Please wait for the next player to be announced.</p>
              </div>
            </c:otherwise>
          </c:choose>

          <!-- Bidding Controls -->
          <div class="bidding-panel mt-4 p-3 bg-light rounded">
            <h5 class="mb-3">Place Your Bid</h5>
            <form class="bid-form" method="POST" action="${pageContext.request.contextPath}/placebid">
              <input type="hidden" name="playerId" value="${not empty player ? player.id : ''}">
              <div class="row align-items-center">
                <div class="col-md-6 mb-3">
                  <div class="input-group">
                    <span class="input-group-text">$</span>
                    <input type="number" class="form-control bid-input" id="bidAmount" name="bidAmount"
                           value="${not empty player.currentBid ? (player.currentBid * 1000000 + 25000) : 1900000}"
                           min="${not empty player.currentBid ? (player.currentBid * 1000000 + 25000) : 1850000}"
                           step="25000">
                    <button class="btn btn-outline-secondary" type="button" id="quickBid">+25K</button>
                  </div>
                  <div class="form-text">Minimum next bid: $<span id="min-bid">${not empty player.currentBid ? (player.currentBid + 0.025) : 1.85}</span>M</div>
                </div>
                <div class="col-md-6 mb-3">
                  <button type="submit" class="btn btn-success w-100 btn-bid" id="placeBid">Place Bid</button>
                </div>
              </div>
            </form>
            <div class="alert alert-warning mt-2">
              <strong>Note:</strong> You currently have $2.5M remaining in your auction budget.
            </div>
          </div>
        </div>
      </div>

      <!-- Bid History -->
      <div class="card mb-4">
        <div class="card-header">
          <h3 class="h5 mb-0">Bid History</h3>
        </div>
        <div class="card-body p-0">
          <div class="table-responsive" style="max-height: 300px; overflow-y: auto;">
            <table class="table table-striped mb-0" id="bid-history">
              <thead class="table-dark sticky-top">
              <tr>
                <th>Time</th>
                <th>Bidder</th>
                <th>Amount</th>
              </tr>
              </thead>
              <tbody>
              <!-- Bid history will be populated here by WebSocket -->
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Player Statistics -->
      <div class="card mb-4">
        <div class="card-header">
          <h3 class="h5 mb-0">Player Statistics</h3>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead class="table-light">
              <tr>
                <th>Format</th>
                <th>Matches</th>
                <th>Runs</th>
                <th>Avg</th>
                <th>SR</th>
                <th>100s/50s</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>Test</td>
                <td>111</td>
                <td>8,676</td>
                <td>49.29</td>
                <td>55.23</td>
                <td>29/29</td>
              </tr>
              <tr>
                <td>ODI</td>
                <td>275</td>
                <td>12,898</td>
                <td>57.32</td>
                <td>93.62</td>
                <td>46/65</td>
              </tr>
              <tr>
                <td>T20I</td>
                <td>115</td>
                <td>4,008</td>
                <td>52.73</td>
                <td>137.96</td>
                <td>1/37</td>
              </tr>
              <tr>
                <td>IPL</td>
                <td>237</td>
                <td>7,263</td>
                <td>37.24</td>
                <td>130.02</td>
                <td>7/50</td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Sidebar -->
    <div class="col-lg-4">
      <!-- Auction Info -->
      <div class="card mb-4">
        <div class="card-header">
          <h3 class="h5 mb-0">Auction Information</h3>
        </div>
        <div class="card-body">
          <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Total Players
              <span class="badge bg-primary rounded-pill">150</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Players Sold
              <span class="badge bg-success rounded-pill">98</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Players Unsold
              <span class="badge bg-secondary rounded-pill">10</span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center">
              Teams Participating
              <span class="badge bg-info rounded-pill">10</span>
            </li>
          </ul>
        </div>
      </div>

      <!-- Recent Bids -->
      <div class="card mb-4">
        <div class="card-header">
          <h3 class="h5 mb-0">Recent Bids</h3>
        </div>
        <div class="card-body p-0">
          <div class="list-group list-group-flush">
            <div class="list-group-item">
              <div class="d-flex justify-content-between">
                <span>Jasprit Bumrah</span>
                <strong>$1.6M</strong>
              </div>
              <small class="text-muted">Mumbai Indians - 5 min ago</small>
            </div>
            <div class="list-group-item">
              <div class="d-flex justify-content-between">
                <span>Rashid Khan</span>
                <strong>$1.4M</strong>
              </div>
              <small class="text-muted">Gujarat Titans - 12 min ago</small>
            </div>
            <div class="list-group-item">
              <div class="d-flex justify-content-between">
                <span>Jos Buttler</span>
                <strong>$1.2M</strong>
              </div>
              <small class="text-muted">Rajasthan Royals - 20 min ago</small>
            </div>
            <div class="list-group-item">
              <div class="d-flex justify-content-between">
                <span>Glenn Maxwell</span>
                <strong>$1.1M</strong>
              </div>
              <small class="text-muted">Royal Challengers - 28 min ago</small>
            </div>
            <div class="list-group-item">
              <div class="d-flex justify-content-between">
                <span>Kagiso Rabada</span>
                <strong>$1.0M</strong>
              </div>
              <small class="text-muted">Punjab Kings - 35 min ago</small>
            </div>
          </div>
        </div>
      </div>

      <!-- My Team Status -->
      <div class="card">
        <div class="card-header">
          <h3 class="h5 mb-0">My Team Status</h3>
        </div>
        <div class="card-body">
          <div class="mb-3">
            <div class="d-flex justify-content-between mb-1">
              <span>Budget Remaining:</span>
              <strong>$2.5M</strong>
            </div>
            <div class="progress" style="height: 10px;">
              <div class="progress-bar bg-success" role="progressbar" style="width: 62%"></div>
            </div>
            <small class="text-muted">$4M initial budget</small>
          </div>
          <div class="mb-3">
            <div class="d-flex justify-content-between mb-1">
              <span>Players Acquired:</span>
              <strong>5/8</strong>
            </div>
            <div class="progress" style="height: 10px;">
              <div class="progress-bar bg-info" role="progressbar" style="width: 62%"></div>
            </div>
          </div>
          <div class="mt-4">
            <h6 class="mb-2">Players Bought:</h6>
            <ul class="list-group list-group-flush">
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Rohit Sharma
                <span class="badge bg-primary rounded-pill">$1.2M</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Hardik Pandya
                <span class="badge bg-primary rounded-pill">$900K</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Jofra Archer
                <span class="badge bg-primary rounded-pill">$800K</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                KL Rahul
                <span class="badge bg-primary rounded-pill">$1.1M</span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center">
                Yuzvendra Chahal
                <span class="badge bg-primary rounded-pill">$700K</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white py-4 mt-5">
  <div class="container">
    <div class="row">
      <div class="col-md-4 mb-3">
        <h5>About DraftX</h5>
        <p>The ultimate platform for cricket enthusiasts to build their dream teams through competitive player auctions.</p>
      </div>
      <div class="col-md-4 mb-3">
        <h5>Quick Links</h5>
        <ul class="list-unstyled">
          <li><a href="index.jsp" class="text-white">Home</a></li>
          <li><a href="dashboard.jsp" class="text-white">Auctions</a></li>
          <li><a href="my-bids.jsp" class="text-white">My Bids</a></li>
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
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // DOM elements
    const bidAmountInput = document.getElementById('bidAmount');
    const quickBidBtn = document.getElementById('quickBid');
    const placeBidBtn = document.getElementById('placeBid');
    const currentBidDisplay = document.getElementById('current-bid');
    const lastBidderDisplay = document.getElementById('last-bidder');
    const minBidDisplay = document.getElementById('min-bid');

    // WebSocket connection setup
    let socket;

    function connectWebSocket() {
      try {
        const protocol = window.location.protocol === 'https:' ? 'wss://' : 'ws://';
        const host = window.location.host;
        const contextPath = '${pageContext.request.contextPath}' || '';
        const endpoint = '/bidupdates';

        const wsUrl = protocol + host + contextPath + endpoint;
        console.log('Attempting to connect to:', wsUrl);

        socket = new WebSocket(wsUrl);

        socket.onopen = function() {
          console.log('WebSocket connection established');
          showBidNotification('Connected to live bidding updates', true);
        };

        socket.onmessage = function(event) {
          const bidMessage = JSON.parse(event.data);
          console.log('Received bid update:', bidMessage);
          updateBidDisplay(bidMessage);
          showBidNotification(`New bid: $${bidMessage.amount}M by ${bidMessage.teamname}`, true);
        };

        socket.onclose = function(e) {
          console.log('Socket closed. Reconnect attempt in 5s', e.reason);
          showBidNotification('Disconnected from live updates. Reconnecting...', false);
          setTimeout(connectWebSocket, 5000);
        };

        socket.onerror = function(error) {
          console.error('WebSocket Error:', error);
          showBidNotification('Connection error. Please refresh the page.', false);
        };
      } catch (e) {
        console.error('WebSocket Connection Error:', e);
      }
    }

    function updateBidDisplay(bidMessage) {
      // Update current bid display
      if (currentBidDisplay) {
        currentBidDisplay.textContent = '$' + bidMessage.amount + 'M';
      }

      // Update last bidder
      if (lastBidderDisplay) {
        lastBidderDisplay.textContent = bidMessage.teamname;
      }

      // Update minimum bid
      const newMinBid = (bidMessage.amount + 0.025).toFixed(2);
      if (minBidDisplay) {
        minBidDisplay.textContent = newMinBid;
      }

      // Update input field minimum and value
      if (bidAmountInput) {
        const newMinBidAmount = Math.floor((bidMessage.amount + 0.025) * 1000000);
        bidAmountInput.min = newMinBidAmount;
        bidAmountInput.value = newMinBidAmount;
        updateBidButton();
      }

      // Add to bid history table
      const bidHistoryTable = document.getElementById('bid-history');
      if (bidHistoryTable) {
        const tbody = bidHistoryTable.getElementsByTagName('tbody')[0];
        const newRow = tbody.insertRow(0);

        const timeCell = newRow.insertCell(0);
        const bidderCell = newRow.insertCell(1);
        const amountCell = newRow.insertCell(2);

        const now = new Date();
        timeCell.textContent = now.toLocaleTimeString();
        bidderCell.textContent = bidMessage.teamname;
        amountCell.textContent = '$' + bidMessage.amount + 'M';

        // Highlight effect
        newRow.classList.add('table-success');
        setTimeout(() => newRow.classList.remove('table-success'), 3000);

        // Keep only last 20 bids
        while (tbody.rows.length > 20) {
          tbody.deleteRow(tbody.rows.length - 1);
        }
      }
    }

    function showBidNotification(message, isSuccess) {
      let notificationContainer = document.getElementById('notification-container');
      if (!notificationContainer) {
        notificationContainer = document.createElement('div');
        notificationContainer.id = 'notification-container';
        notificationContainer.className = 'position-fixed top-0 end-0 p-3';
        notificationContainer.style.zIndex = '1100';
        document.body.appendChild(notificationContainer);
      }

      const notification = document.createElement('div');
      notification.className = `alert ${isSuccess ? 'alert-success' : 'alert-danger'} alert-dismissible fade show`;
      notification.innerHTML = `
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            `;

      notificationContainer.appendChild(notification);

      setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => notification.remove(), 150);
      }, 5000);
    }

    // Bidding functionality
    if (quickBidBtn && bidAmountInput) {
      quickBidBtn.addEventListener('click', function() {
        const currentBid = parseFloat(bidAmountInput.value);
        bidAmountInput.value = currentBid + 25000;
        updateBidButton();
      });
    }

    function updateBidButton() {
      if (placeBidBtn && bidAmountInput) {
        const bidValue = parseFloat(bidAmountInput.value);
        placeBidBtn.textContent = 'Place Bid ($' + (bidValue / 1000000).toFixed(2) + 'M)';
      }
    }

    // Update button text on input change
    if (bidAmountInput) {
      bidAmountInput.addEventListener('input', updateBidButton);
      updateBidButton(); // Initialize
    }

    // Form submission
    document.querySelectorAll('.bid-form').forEach(form => {
      form.addEventListener('submit', async function(e) {
        e.preventDefault();

        const submitBtn = this.querySelector('button[type="submit"]');
        const bidInput = this.querySelector('input[name="bidAmount"]');
        const playerIdInput = this.querySelector('input[name="playerId"]');
        const amount = parseFloat(bidInput.value);
        const playerId = parseInt(playerIdInput.value);

        // Validation
        if (isNaN(playerId) || playerId <= 0) {
          showBidNotification('Invalid player selected', false);
          return;
        }
        if (isNaN(amount) || amount <= 0) {
          showBidNotification('Please enter a valid bid amount (> 0)', false);
          return;
        }

        const minBid = parseFloat(bidInput.min);
        if (amount < minBid) {
          showBidNotification(`Bid must be at least $${(minBid / 1000000).toFixed(2)}M`, false);
          return;
        }

        submitBtn.disabled = true;
        submitBtn.textContent = 'Processing...';

        try {
          const formData = new URLSearchParams();
          formData.append('playerId', playerId);
          formData.append('bidAmount', amount);

          const response = await fetch(this.action, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: formData
          });

          if (!response.ok) {
            const errorText = await response.text();
            let errorMessage = 'Bid failed';

            try {
              const errorObj = JSON.parse(errorText);
              errorMessage = errorObj.error || errorMessage;
            } catch (e) {
              errorMessage = errorText || errorMessage;
            }

            throw new Error(errorMessage);
          }

          const result = await response.json();
          showBidNotification('Bid placed successfully!', true);

        } catch (error) {
          console.error('Bid Error:', error);
          showBidNotification(error.message, false);
        } finally {
          submitBtn.disabled = false;
          updateBidButton();
        }
      });
    });

    // Countdown timer functionality
    document.querySelectorAll('.countdown').forEach(function(element) {
      const endTime = new Date(element.getAttribute('data-end')).getTime();

      function updateCountdown() {
        const now = new Date().getTime();
        const distance = endTime - now;

        if (distance < 0) {
          element.innerHTML = "Auction ended";
          document.querySelectorAll('.bid-input, .btn-bid').forEach(el => {
            el.disabled = true;
          });
          return;
        }

        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

        element.innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s";
      }

      updateCountdown();
      setInterval(updateCountdown, 1000);
    });

    // Initialize WebSocket connection
    connectWebSocket();
  });
</script>
</body>
</html>