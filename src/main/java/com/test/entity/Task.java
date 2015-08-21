package com.test.entity;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name = "tasks")
public class Task {

    @Id
    @GeneratedValue
    private int id;

    @Column(name = "dscr")
    private String description;

    @Column(name = "created")
    private Date creationDate;

    @Column(name = "deadline")
    private Date deadlineDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "status_id")
    private Status status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "performer_unit_id")
    private Unit performerUnit;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "performer_id")
    private User performer;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "creator_id")
    private User creator;

    @Column(name = "long_dscr")
    private String longDescription;

    public Task() {

    }

    public Task(String description, String longDescription, Unit performerUnit, Date deadlineDate, User creator, Status status) {

        this.description = description;
        this.longDescription = longDescription;
        this.performerUnit = performerUnit;
        this.deadlineDate = deadlineDate;
        this.creator = creator;
        this.status = status;

        this.creationDate = new Date();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreationDate() {
        return new SimpleDateFormat("yyyy-MM-dd").format(creationDate);
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getDeadlineDate() {
        return new SimpleDateFormat("yyyy-MM-dd").format(deadlineDate);
    }

    public void setDeadlineDate(Date deadlineDate) {
        this.deadlineDate = deadlineDate;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Unit getPerformerUnit() {
        return performerUnit;
    }

    public void setPerformerUnit(Unit performerUnit) {
        this.performerUnit = performerUnit;
    }

    public User getPerformer() {
        return performer;
    }

    public void setPerformer(User performer) {
        this.performer = performer;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }
}
