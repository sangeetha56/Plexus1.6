package com.model.indispense.dto;
// Generated Apr 1, 2013 4:32:03 PM by Hibernate Tools 3.2.1.GA


import com.model.inPatient.dto.Inpatient;
import com.model.indispensedmedicinebill.dto.Indispensedmedicinebill;
//import com.model.all.Inpatient;
import com.model.inunitdispensedose.dto.Inunitdispensedose;
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
 * Indispense generated by hbm2java
 */
@Entity
@Table(name="indispense"
    ,schema="public"
)
@SequenceGenerator(name = "indispense_seq", sequenceName = "indispense_seq")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Indispense  implements java.io.Serializable {


     private long id;
     private Inpatient inpatient;
     private Date dispensedate;
     private Set<Inunitdispensedose> inunitdispensedoses = new HashSet<Inunitdispensedose>(0);
     private Set<Indispensedmedicinebill> indispensedmedicinebills = new HashSet<Indispensedmedicinebill>(0);

    public Indispense() {
    }

	
    public Indispense(long id, Inpatient inpatient) {
        this.id = id;
        this.inpatient = inpatient;
    }
    public Indispense(long id, Inpatient inpatient, Date dispensedate, Set<Inunitdispensedose> inunitdispensedoses, Set<Indispensedmedicinebill> indispensedmedicinebills) {
       this.id = id;
       this.inpatient = inpatient;
       this.dispensedate = dispensedate;
       this.inunitdispensedoses = inunitdispensedoses;
       this.indispensedmedicinebills = indispensedmedicinebills;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false)
      @GeneratedValue(generator = "indispense_seq")
    public long getId() {
        return this.id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="inpatientid", nullable=false)
    public Inpatient getInpatient() {
        return this.inpatient;
    }
    
    public void setInpatient(Inpatient inpatient) {
        this.inpatient = inpatient;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="dispensedate", length=29)
    public Date getDispensedate() {
        return this.dispensedate;
    }
    
    public void setDispensedate(Date dispensedate) {
        this.dispensedate = dispensedate;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="indispense")
    public Set<Inunitdispensedose> getInunitdispensedoses() {
        return this.inunitdispensedoses;
    }
    
    public void setInunitdispensedoses(Set<Inunitdispensedose> inunitdispensedoses) {
        this.inunitdispensedoses = inunitdispensedoses;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="indispense")
    public Set<Indispensedmedicinebill> getIndispensedmedicinebills() {
        return this.indispensedmedicinebills;
    }
    
    public void setIndispensedmedicinebills(Set<Indispensedmedicinebill> indispensedmedicinebills) {
        this.indispensedmedicinebills = indispensedmedicinebills;
    }




}

