package lk.jiat.draftx.endpoint;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import lk.jiat.draftx.util.BidBroadcaster;

@ServerEndpoint("/bidupdates")
public class BidWebSocketEndpoint {

    @OnOpen
    public void onOpen(Session session) {
        BidBroadcaster.addSession(session);
    }

    @OnClose
    public void onClose(Session session) {
        BidBroadcaster.removeSession(session);
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        BidBroadcaster.removeSession(session);
        throwable.printStackTrace();
    }
}
