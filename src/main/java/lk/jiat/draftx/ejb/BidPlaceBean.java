package lk.jiat.draftx.ejb;

import jakarta.annotation.Resource;
import jakarta.ejb.Stateless;
import jakarta.jms.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lk.jiat.draftx.ejb.local.BidService;
import lk.jiat.draftx.entity.Bids;
import lk.jiat.draftx.entity.Player;
import lk.jiat.draftx.message.BidMessage;

import java.util.Date;

@Stateless
public class BidPlaceBean implements BidService {
    @PersistenceContext
    private EntityManager em;

    @Resource(lookup = "jms/BidConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/BidQueue")
    private Queue bidQueue;

    @Override
    public boolean placeBid(String userEmail, int playerId, double amount, String teamname) {
        try {
            // Check if player exists
            Player player = em.find(Player.class, playerId);
            if (player == null) return false;

            // Create and persist bid
            Bids bid = new Bids();
            bid.setUserEmail(userEmail);
            bid.setPlayersId(playerId);
            bid.setAmount(amount);
            bid.setBidTime(new Date());
            em.persist(bid);

            // Send message to JMS queue
            sendBidMessage(userEmail, playerId, amount, teamname);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void sendBidMessage(String userEmail, int playerId, double amount, String teamname) throws JMSException {
        try (Connection connection = connectionFactory.createConnection();
             Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE)) {

            MessageProducer producer = session.createProducer(bidQueue);
            ObjectMessage message = session.createObjectMessage(
                    new BidMessage(userEmail, playerId, amount, teamname)
            );
            producer.send(message);
        }
    }
}
