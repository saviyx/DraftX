package lk.jiat.draftx.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.draftx.ejb.local.PlayerService;
import lk.jiat.draftx.entity.Player;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "LoadPlayer", urlPatterns = {"/home"})
public class LoadPlayers extends HttpServlet {

    private static final Logger logger = Logger.getLogger(LoadPlayers.class.getName());

    @EJB
    private PlayerService playerService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        logger.info("LoadPlayers servlet accessed");

        try {
            // Check if PlayerService is injected properly
            if (playerService == null) {
                logger.severe("PlayerService is null - EJB injection failed");
                request.setAttribute("error", "Service unavailable");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }

            // Get all players from database
            List<Player> players = playerService.getAllPlayers();
            logger.info("Retrieved " + (players != null ? players.size() : 0) + " players");

            // Set players as request attribute
            request.setAttribute("players", players);

            // Debug: Print each player name
            if (players != null && !players.isEmpty()) {
                players.forEach(p -> {
                    logger.info("Player: " + p.getName() + " - ID: " + p.getId() + " - Image: " + p.getImage_path());
                    System.out.println("Player: " + p.getName() + " - " + p.getAuctionEnd());
                });
            } else {
                logger.warning("No players found in database");
                request.setAttribute("error", "No players found in database");
            }

            // Forward to JSP
            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (Exception e) {
            logger.severe("Error loading players: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error loading players: " + e.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}