<%--
  Created by IntelliJ IDEA.
  User: savindu umantha
  Date: 6/2/2025
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Bids - DraftX</title>
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
          <a class="nav-link active" href="my-bids.jsp">My Bids</a>
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

<!-- My Bids Content -->
<div class="container mt-4">
  <div class="row">
    <div class="col-12">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h1>My Bidding History</h1>
        <div class="btn-group">
          <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
            Filter
          </button>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="#">All Bids</a></li>
            <li><a class="dropdown-item" href="#">Successful Bids</a></li>
            <li><a class="dropdown-item" href="#">Unsuccessful Bids</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">IPL 2024</a></li>
            <li><a class="dropdown-item" href="#">PSL 2024</a></li>
          </ul>
        </div>
      </div>

      <!-- Bids Table -->
      <div class="card">
        <div class="card-body p-0">
          <div class="table-responsive">
            <table class="table table-hover mb-0">
              <thead class="table-light">
              <tr>
                <th>Player</th>
                <th>Tournament</th>
                <th>Bid Amount</th>
                <th>Status</th>
                <th>Date</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="https://via.placeholder.com/40x40?text=VK" alt="Virat Kohli" class="rounded-circle me-2" width="40" height="40">
                    <div>
                      <h6 class="mb-0">Virat Kohli</h6>
                      <small class="text-muted">Batsman | India</small>
                    </div>
                  </div>
                </td>
                <td>IPL 2024</td>
                <td>$1.9M</td>
                <td><span class="badge bg-success">Won</span></td>
                <td>May 15, 2024</td>
                <td>
                  <button class="btn btn-sm btn-outline-primary">View</button>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="https://via.placeholder.com/40x40?text=RS" alt="Rohit Sharma" class="rounded-circle me-2" width="40" height="40">
                    <div>
                      <h6 class="mb-0">Rohit Sharma</h6>
                      <small class="text-muted">Batsman | India</small>
                    </div>
                  </div>
                </td>
                <td>IPL 2024</td>
                <td>$1.2M</td>
                <td><span class="badge bg-success">Won</span></td>
                <td>May 14, 2024</td>
                <td>
                  <button class="btn btn-sm btn-outline-primary">View</button>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="https://via.placeholder.com/40x40?text=HP" alt="Hardik Pandya" class="rounded-circle me-2" width="40" height="40">
                    <div>
                      <h6 class="mb-0">Hardik Pandya</h6>
                      <small class="text-muted">All-rounder | India</small>
                    </div>
                  </div>
                </td>
                <td>IPL 2024</td>
                <td>$900K</td>
                <td><span class="badge bg-success">Won</span></td>
                <td>May 14, 2024</td>
                <td>
                  <button class="btn btn-sm btn-outline-primary">View</button>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="https://via.placeholder.com/40x40?text=JA" alt="Jofra Archer" class="rounded-circle me-2" width="40" height="40">
                    <div>
                      <h6 class="mb-0">Jofra Archer</h6>
                      <small class="text-muted">Bowler | England</small>
                    </div>
                  </div>
                </td>
                <td>IPL 2024</td>
                <td>$800K</td>
                <td><span class="badge bg-success">Won</span></td>
                <td>May 13, 2024</td>
                <td>
                  <button class="btn btn-sm btn-outline-primary">View</button>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="https://via.placeholder.com/40x40?text=KL" alt="KL Rahul" class="rounded-circle me-2" width="40" height="40">
                    <div>
                      <h6 class="mb-0">KL Rahul</h6>
                      <small class="text-muted">Batsman | India</small>
                    </div>
                  </div>
                </td>
                <td>IPL 2024</td>
                <td>$1.1M</td>
                <td><span class="badge bg-success">Won</span></td>
                <td>May 13, 2024</td>
                <td>
                  <button class="btn btn-sm btn-outline-primary">View</button>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="https://via.placeholder.com/40x40?text=JB" alt="Jasprit Bumrah" class="rounded-circle me-2" width="40" height="40">
                    <div>
                      <h6 class="mb-0">Jasprit Bumrah</h6>
                      <small class="text-muted">Bowler | India</small>
                    </div>
                  </div>
                </td>
                <td>IPL 2024</td>
                <td>$1.5M</td>
                <td><span class="badge bg-danger">Lost</span></td>
                <td>May 12, 2024</td>
                <td>
                  <button class="btn btn-sm btn-outline-primary">View</button>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="d-flex align-items-center">
                    <img src="https://via.placeholder.com/40x40?text=YC" alt="Yuzvendra Chahal" class="rounded-circle me-2" width="40" height="40">
                    <div>
                      <h6 class="mb-0">Yuzvendra Chahal</h6>
                      <small class="text-muted">Bowler | India</small>
                    </div>
                  </div>
                </td>
                <td>IPL 2024</td>
                <td>$700K</td>
                <td><span class="badge bg-success">Won</span></td>
                <td>May 12, 2024</td>
                <td>
                  <button class="btn btn-sm btn-outline-primary">View</button>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- Pagination -->
      <nav aria-label="Page navigation" class="mt-4">
        <ul class="pagination justify-content-center">
          <li class="page-item disabled">
            <a class="page-link" href="#" tabindex="-1">Previous</a>
          </li>
          <li class="page-item active"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#">Next</a>
          </li>
        </ul>
      </nav>
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
</body>
</html>
