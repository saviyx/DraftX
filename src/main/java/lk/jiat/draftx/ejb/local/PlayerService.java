package lk.jiat.draftx.ejb.local;

import lk.jiat.draftx.entity.Player;

import java.util.List;

public interface PlayerService {
    List<Player> getAllPlayers();
    Player getPlayerById(int id);
}
