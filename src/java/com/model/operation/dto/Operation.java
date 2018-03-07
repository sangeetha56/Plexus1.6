package com.model.operation.dto;
// Generated Jul 17, 2017 1:14:16 PM by Hibernate Tools 3.2.1.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Operation generated by hbm2java
 */
@Entity
@Table(name="operation"
    ,schema="public"
)
public class Operation  implements java.io.Serializable {


     private long id;
     private long opno;
     private String name;
     private String ddate;
     private String timeopd;
     private String postopdiagnosis;
     private String nameanesthetist;
     private Short age;
     private String sex;
     private String firstassistant;
     private String secondassistant;
     private String delivery;
     private String surgery;
     private String typeofsurgery;
     private String operationnotes;
     private String postoprecovery;

    public Operation() {
    }

	
    public Operation(long id, long opno) {
        this.id = id;
        this.opno = opno;
    }
    public Operation(long id, long opno, String name, String ddate, String timeopd, String postopdiagnosis, String nameanesthetist, Short age, String sex, String firstassistant, String secondassistant, String delivery, String surgery, String typeofsurgery, String operationnotes, String postoprecovery) {
       this.id = id;
       this.opno = opno;
       this.name = name;
       this.ddate = ddate;
       this.timeopd = timeopd;
       this.postopdiagnosis = postopdiagnosis;
       this.nameanesthetist = nameanesthetist;
       this.age = age;
       this.sex = sex;
       this.firstassistant = firstassistant;
       this.secondassistant = secondassistant;
       this.delivery = delivery;
       this.surgery = surgery;
       this.typeofsurgery = typeofsurgery;
       this.operationnotes = operationnotes;
       this.postoprecovery = postoprecovery;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false)
    public long getId() {
        return this.id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    
    @Column(name="opno", nullable=false)
    public long getOpno() {
        return this.opno;
    }
    
    public void setOpno(long opno) {
        this.opno = opno;
    }
    
    @Column(name="name", length=150)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @Column(name="ddate")
    public String getDdate() {
        return this.ddate;
    }
    
    public void setDdate(String ddate) {
        this.ddate = ddate;
    }
    
    @Column(name="timeopd")
    public String getTimeopd() {
        return this.timeopd;
    }
    
    public void setTimeopd(String timeopd) {
        this.timeopd = timeopd;
    }
    
    @Column(name="postopdiagnosis")
    public String getPostopdiagnosis() {
        return this.postopdiagnosis;
    }
    
    public void setPostopdiagnosis(String postopdiagnosis) {
        this.postopdiagnosis = postopdiagnosis;
    }
    
    @Column(name="nameanesthetist", length=150)
    public String getNameanesthetist() {
        return this.nameanesthetist;
    }
    
    public void setNameanesthetist(String nameanesthetist) {
        this.nameanesthetist = nameanesthetist;
    }
    
    @Column(name="age")
    public Short getAge() {
        return this.age;
    }
    
    public void setAge(Short age) {
        this.age = age;
    }
    
    @Column(name="sex", length=10)
    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }
    
    @Column(name="firstassistant")
    public String getFirstassistant() {
        return this.firstassistant;
    }
    
    public void setFirstassistant(String firstassistant) {
        this.firstassistant = firstassistant;
    }
    
    @Column(name="secondassistant")
    public String getSecondassistant() {
        return this.secondassistant;
    }
    
    public void setSecondassistant(String secondassistant) {
        this.secondassistant = secondassistant;
    }
    
    @Column(name="delivery")
    public String getDelivery() {
        return this.delivery;
    }
    
    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }
    
    @Column(name="surgery")
    public String getSurgery() {
        return this.surgery;
    }
    
    public void setSurgery(String surgery) {
        this.surgery = surgery;
    }
    
    @Column(name="typeofsurgery")
    public String getTypeofsurgery() {
        return this.typeofsurgery;
    }
    
    public void setTypeofsurgery(String typeofsurgery) {
        this.typeofsurgery = typeofsurgery;
    }
    
    @Column(name="operationnotes")
    public String getOperationnotes() {
        return this.operationnotes;
    }
    
    public void setOperationnotes(String operationnotes) {
        this.operationnotes = operationnotes;
    }
    
    @Column(name="postoprecovery")
    public String getPostoprecovery() {
        return this.postoprecovery;
    }
    
    public void setPostoprecovery(String postoprecovery) {
        this.postoprecovery = postoprecovery;
    }




}


