package lk.jiat.draftx.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "Bids")
public class Bids {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "user_email", nullable = false)
    private String userEmail;

    @Column(name = "players_id", nullable = false)
    private int playersId;

    @Column (nullable = false)
    private double amount;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "bid_time", nullable = false)
    private Date bidTime;

    public Bids() {this.bidTime = new Date();}

    public Bids(int userId, int playerId, double amount) {
        this();
        this.userEmail = userEmail;
        this.playersId = playersId;
        this.amount = amount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public int getPlayersId() {
        return playersId;
    }

    public void setPlayersId(int playersId) {
        this.playersId = playersId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getBidTime() {
        return bidTime;
    }

    public void setBidTime(Date bidTime) {
        this.bidTime = bidTime;
    }

    // Utility methods
    @Override
    public String toString() {
        return "Bid{" +
                "id=" + id +
                ", userEmail=" + userEmail +
                ", playersId=" + playersId +
                ", amount=" + amount +
                ", bidTime=" + bidTime +
                '}';
    }
}
