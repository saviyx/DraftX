package lk.jiat.draftx.message;

import java.io.Serializable;
import java.util.Date;

public class BidMessage implements Serializable {
    private String userEmail;
    private int playerId;
    private double amount;
    private Date timestamp;
    private String teamname;

    public BidMessage() {
        this.timestamp = new Date();
    }

    public BidMessage(String userEmail, int playerId, double amount, String teamname) {
        this();
        this.userEmail = userEmail;
        this.playerId = playerId;
        this.amount = amount;
        this.teamname = teamname;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getTeamname() {
        return teamname;
    }

    public void setTeamname(String teamname) {
        this.teamname = teamname;
    }
}
