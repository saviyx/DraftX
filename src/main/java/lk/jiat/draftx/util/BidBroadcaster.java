package lk.jiat.draftx.util;

import com.google.gson.Gson;
import jakarta.websocket.Session;
import lk.jiat.draftx.message.BidMessage;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BidBroadcaster {

    private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
    private static final Logger logger = Logger.getLogger(BidBroadcaster.class.getName());
    private static final Gson gson = new Gson();

    public static void addSession(Session session) {
        sessions.add(session);
        logger.log(Level.INFO, "WebSocket session added: {0}", session.getId());
    }

    public static void removeSession(Session session) {
        sessions.remove(session);
        logger.log(Level.INFO, "WebSocket session removed: {0}", session.getId());
    }

    public static void broadcast(BidMessage bidMessage) {
        String jsonMessage = gson.toJson(bidMessage);

        synchronized (sessions) {
            for (Session session : sessions) {
                if (session.isOpen()) {
                    try {
                        session.getBasicRemote().sendText(jsonMessage);
                        logger.log(Level.INFO, "Message sent to session: {0}", session.getId());
                    } catch (IOException e) {
                        logger.log(Level.SEVERE, "Error sending message to session: " + session.getId(), e);
                        removeSession(session);
                    }
                } else {
                    removeSession(session);
                }
            }
        }
    }

}
