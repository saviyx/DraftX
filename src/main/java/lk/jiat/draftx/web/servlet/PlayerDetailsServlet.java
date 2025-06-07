package lk.jiat.draftx.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.jiat.draftx.ejb.local.PlayerService;
import lk.jiat.draftx.entity.Player;

import java.io.IOException;

@WebServlet("/playerdetails")
public class PlayerDetailsServlet extends HttpServlet {

    @EJB
    private PlayerService playerService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws SecurityException, IOException{
        try {
            //get Player'sId from URL parameter

            String playerIdParam = request.getParameter("playerId");
            if (playerIdParam == null || playerIdParam.isEmpty()) {
                response.sendRedirect("index.jsp?error=No+player+specified");
                return;
            }

            int playerId = Integer.parseInt(playerIdParam);

            //Get Specific player
            Player player = playerService.getPlayerById(playerId);
            if (player == null) {
                response.sendRedirect("index.jsp?error=Player+not+found");
                return;
            }

            // Set attributes for JSP
            request.setAttribute("player", player);

            // Forward to the details page
            request.getRequestDispatcher("/auction-details.jsp").forward(request, response);
            System.out.println(player.getName());

        }catch (NumberFormatException e) {
            response.sendRedirect("index.jsp?error=Invalid+player+ID");
        }catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=Error+loading+player+details");

        }
    }
}
