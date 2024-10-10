package com.example.classjsp.data.dto;


import java.sql.Timestamp;

public class EventDto {
    private int id;
    private String title;
    private Timestamp startDate;
    private Timestamp endDate;
    private String information;
    private String userId;

    // 생성자, getter 및 setter 메서드 생략

    public EventDto(String title, Timestamp startDate, Timestamp endDate, String information, String userId) {
        this.title = title;
        this.startDate = startDate;
        this.endDate = endDate;
        this.information = information;
        this.userId = userId;
    }

    public EventDto() {
        super();
    }

    // getter 및 setter 메서드
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}

