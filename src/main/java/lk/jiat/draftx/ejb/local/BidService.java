package lk.jiat.draftx.ejb.local;

import jakarta.jms.JMSException;

public interface BidService {
    boolean placeBid(String userEmail, int playerId, double amount, String teamname);

    void sendBidMessage(String userEmail,int playerId, double amount,String teamname) throws JMSException;
}
