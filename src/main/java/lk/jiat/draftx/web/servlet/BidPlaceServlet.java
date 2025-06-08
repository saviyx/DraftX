package lk.jiat.draftx.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.jiat.draftx.ejb.local.BidService;
import lk.jiat.draftx.entity.User;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/placebid")
public class BidPlaceServlet extends HttpServlet {
    @EJB
    private BidService bidService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            // 1. Verify session
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                out.write("{\"error\":\"Session expired. Please login again.\"}");
                return;
            }

            // 2. Parse parameters with null checks
            String playerIdParam = request.getParameter("playerId");
            String amountParam = request.getParameter("bidAmount");

            if (playerIdParam == null || playerIdParam.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"error\":\"Missing player ID\"}");
                return;
            }

            if (amountParam == null || amountParam.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"error\":\"Missing bid amount\"}");
                return;
            }

            // 3. Convert and validate values
            int playerId;
            double bidAmount;
            double amount;

            try {
                playerId = Integer.parseInt(playerIdParam);
                bidAmount = Double.parseDouble(amountParam);
                amount = bidAmount/1_000_000.0;

                if (playerId <= 0) {
                    throw new NumberFormatException("Player ID must be positive");
                }
                if (amount <= 0) {
                    throw new NumberFormatException("Bid amount must be positive");
                }
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }

            // 4. Verify player exists
            try {
                User user = (User) session.getAttribute("user");
                boolean success = bidService.placeBid(user.getEmail(), playerId, amount, user.getTeam_name());

                if (success) {
                    out.write("{\"success\":true, \"newBid\":" + amount + "}");
                } else {
                    response.setStatus(HttpServletResponse.SC_CONFLICT);
                    out.write("{\"error\":\"Bid rejected. Amount may be too low.\"}");
                }
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.write("{\"error\":\"Server error processing bid\"}");
                e.printStackTrace();
            }

        } finally {
            out.close();
        }
    }
}
