package lk.jiat.draftx.ejb;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.draftx.ejb.local.PlayerService;
import lk.jiat.draftx.entity.Player;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Stateless
public class PlayerServiceBean implements PlayerService {

    @PersistenceContext(unitName = "draftxPU")
    private EntityManager em;

    private static final Logger logger = Logger.getLogger(PlayerServiceBean.class.getName());

    @Override
    public List<Player> getAllPlayers() {
        try {
            // Execute the query
            List<Player> players = em.createQuery("SELECT p FROM Player p", Player.class)
                    .getResultList();

            // Verification and logging
            if (players.isEmpty()) {
                logger.warning("No players found in the database");
            } else {
                logger.info(() -> String.format("Retrieved %d players from database", players.size()));
                logger.fine(() -> "Player list: " +
                        players.stream()
                                .map(p -> String.format("%s (ID: %d)", p.getName(), p.getId()))
                                .collect(Collectors.joining(", ")));
            }

            return players;
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error retrieving players from database", e);
            throw new RuntimeException("Failed to retrieve players", e);
        }
    }

    @Override
    public Player getPlayerById(int id) {
        return em.find(Player.class, id);
    }
}
