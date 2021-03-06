package com.model.redispense.dto;
// Generated 22 Aug, 2017 12:50:30 PM by Hibernate Tools 3.2.1.GA


import com.model.patient.dto.Patient;
import com.model.redispensedmedicinebill.dto.Redispensedmedicinebill;
import com.model.reunitdispensedose.dto.Reunitdispensedose;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Redispense generated by hbm2java
 */
@Entity
@Table(name="redispense"
    ,schema="public"
)
@SequenceGenerator(name = "redispense_seq", sequenceName = "redispense_seq")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Redispense  implements java.io.Serializable {


     private long id;
     private Patient patient;
     private Date dispensedate;
     private Set<Reunitdispensedose> reunitdispensedoses = new HashSet<Reunitdispensedose>(0);
    private Set<Redispensedmedicinebill> redispensedmedicinebills = new HashSet<Redispensedmedicinebill>(0);

    public Redispense() {
    }

	
    public Redispense(long id, Patient patient) {
        this.id = id;
        this.patient = patient;
    }
    public Redispense(long id, Patient patient, Date dispensedate) {
       this.id = id;
       this.patient = patient;
       this.dispensedate = dispensedate;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false)
     @GeneratedValue(generator = "redispense_seq")
    public long getId() {
        return this.id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="patientid", nullable=false)
    public Patient getPatient() {
        return this.patient;
    }
    
    public void setPatient(Patient patient) {
        this.patient = patient;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="dispensedate", length=29)
    public Date getDispensedate() {
        return this.dispensedate;
    }
    
    public void setDispensedate(Date dispensedate) {
        this.dispensedate = dispensedate;
    }
@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "redispense")
    public Set<Reunitdispensedose> getReunitdispensedoses() {
        return this.reunitdispensedoses;
    }

    /**
     *
     * @param unitdispensedoses
     */
    public void setReunitdispensedoses(Set<Reunitdispensedose> reunitdispensedoses) {
        this.reunitdispensedoses = reunitdispensedoses;
    }

     /**
     *
     * @return
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "redispense")
    public Set<Redispensedmedicinebill> getRedispensedmedicinebills() {
        return this.redispensedmedicinebills;
    }

    /**
     *
     * @param dispensedmedicinebills
     */
    public void setRedispensedmedicinebills(Set<Redispensedmedicinebill> redispensedmedicinebills) {
        this.redispensedmedicinebills = redispensedmedicinebills;
    }



}


