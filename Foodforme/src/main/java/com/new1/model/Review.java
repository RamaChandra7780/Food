package com.new1.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "reviews") 
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int orderId;
    private String username;
    private int starRating;

    @Column(length = 1000)
    private String reviewText;

    private int deliveryRating;
    private String deliverySatisfaction;
    private double tipAmount;
    private Timestamp reviewDate;

    @PrePersist
    public void onCreate() {
        this.reviewDate = new Timestamp(System.currentTimeMillis());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getStarRating() {
        return starRating;
    }

    public void setStarRating(int starRating) {
        this.starRating = starRating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public int getDeliveryRating() {
        return deliveryRating;
    }

    public void setDeliveryRating(int deliveryRating) {
        this.deliveryRating = deliveryRating;
    }

    public String getDeliverySatisfaction() {
        return deliverySatisfaction;
    }

    public void setDeliverySatisfaction(String deliverySatisfaction) {
        this.deliverySatisfaction = deliverySatisfaction;
    }

    public double getTipAmount() {
        return tipAmount;
    }

    public void setTipAmount(double tipAmount) {
        this.tipAmount = tipAmount;
    }

    public Timestamp getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Timestamp reviewDate) {
        this.reviewDate = reviewDate;
    }

}
