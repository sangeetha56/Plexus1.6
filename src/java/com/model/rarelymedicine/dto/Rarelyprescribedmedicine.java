package com.model.rarelymedicine.dto;
// Generated Jun 25, 2014 1:04:26 PM by Hibernate Tools 3.2.1.GA


import com.model.medicine.dto.Medicine;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Rarelyprescribedmedicine generated by hbm2java
 */
@Entity
@Table(name="rarelyprescribedmedicine"
    ,schema="public"
)
         @SequenceGenerator(name = "rarelyprescribedmedicine_seq", sequenceName = "rarelyprescribedmedicine_seq")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Rarelyprescribedmedicine  implements java.io.Serializable {


     private long rpmedid;
     private Medicine medicine;
     private Date lastaccessdate;

    public Rarelyprescribedmedicine() {
    }

	
    public Rarelyprescribedmedicine(long rpmedid, Medicine medicine) {
        this.rpmedid = rpmedid;
        this.medicine = medicine;
    }
    public Rarelyprescribedmedicine(long rpmedid, Medicine medicine, Date lastaccessdate) {
       this.rpmedid = rpmedid;
       this.medicine = medicine;
       this.lastaccessdate = lastaccessdate;
    }
   
     @Id 
    
    @Column(name="rpmedid", unique=true, nullable=false)
     @GeneratedValue(generator = "rarelyprescribedmedicine_seq")
    public long getRpmedid() {
        return this.rpmedid;
    }
    
    public void setRpmedid(long rpmedid) {
        this.rpmedid = rpmedid;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id", nullable=false)
    public Medicine getMedicine() {
        return this.medicine;
    }
    
    public void setMedicine(Medicine medicine) {
        this.medicine = medicine;
    }
    @Temporal(TemporalType.DATE)
    @Column(name="lastaccessdate", length=13)
    public Date getLastaccessdate() {
        return this.lastaccessdate;
    }
    
    public void setLastaccessdate(Date lastaccessdate) {
        this.lastaccessdate = lastaccessdate;
    }




}

