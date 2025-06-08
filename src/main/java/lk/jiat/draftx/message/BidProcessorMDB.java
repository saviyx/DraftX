package lk.jiat.draftx.message;

import jakarta.ejb.ActivationConfigProperty;
import jakarta.ejb.MessageDriven;
import jakarta.jms.JMSException;
import jakarta.jms.Message;
import jakarta.jms.MessageListener;
import jakarta.jms.ObjectMessage;
import lk.jiat.draftx.util.BidBroadcaster;

@MessageDriven(
        activationConfig = {
                @ActivationConfigProperty(
                        propertyName = "destinationLookup",
                        propertyValue = "BidQueue"),
                @ActivationConfigProperty(
                        propertyName = "destinationType",
                        propertyValue = "jakarta.jms.Queue")
        })
public class BidProcessorMDB implements MessageListener {

    @Override
    public void onMessage(Message message) {
        try {
            if (message instanceof ObjectMessage) {
                ObjectMessage objMessage = (ObjectMessage) message;
                BidMessage bidMessage = (BidMessage) objMessage.getObject();

                // Broadcast to all connected WebSocket clients
                BidBroadcaster.broadcast(bidMessage);
            }
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }
}
