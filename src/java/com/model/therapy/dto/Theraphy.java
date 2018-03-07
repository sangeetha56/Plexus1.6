package com.model.therapy.dto;
// Generated Aug 1, 2014 5:48:05 PM by Hibernate Tools 3.2.1.GA


import com.model.detailTherapyBill.dto.Detailstherapybill;
import com.model.therapybill.dto.Therapybill;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Theraphy generated by hbm2java
 */
@Entity
@Table(name="theraphy"
    ,schema="public"
)
        @SequenceGenerator(name = "theraphy_seq", sequenceName = "theraphy_seq")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Theraphy  implements java.io.Serializable {


     private long therphyid;
     private String theraphytype;
     private BigDecimal theraphycharge;
     private boolean usefull;
     private Set<Therapybill> therapybills = new HashSet<Therapybill>(0);
     private Set<Detailstherapybill> detailstherapybills = new HashSet<Detailstherapybill>(0);

    public Theraphy() {
    }

	
    public Theraphy(long therphyid, String theraphytype) {
        this.therphyid = therphyid;
        this.theraphytype = theraphytype;
    }
    public Theraphy(long therphyid, String theraphytype, BigDecimal theraphycharge, Set<Therapybill> therapybills, Set<Detailstherapybill> detailstherapybills) {
       this.therphyid = therphyid;
       this.theraphytype = theraphytype;
       this.theraphycharge = theraphycharge;
       this.therapybills = therapybills;
       this.detailstherapybills = detailstherapybills;
    }
   
     @Id 
    
    @Column(name="therphyid", unique=true, nullable=false)
     @GeneratedValue(generator = "theraphy_seq")
    public long getTherphyid() {
        return this.therphyid;
    }
    
    public void setTherphyid(long therphyid) {
        this.therphyid = therphyid;
    }
    
    @Column(name="theraphytype", nullable=false, length=1000)
    public String getTheraphytype() {
        return this.theraphytype;
    }
    
    public void setTheraphytype(String theraphytype) {
        this.theraphytype = theraphytype;
    }
    
    @Column(name="theraphycharge", precision=20)
    public BigDecimal getTheraphycharge() {
        return this.theraphycharge;
    }
    
    public void setTheraphycharge(BigDecimal theraphycharge) {
        this.theraphycharge = theraphycharge;
    }

    @Column(name="usefull", nullable=false)
    public boolean isUsefull() {
        return this.usefull;
    }

    public void setUsefull(boolean usefull) {
        this.usefull = usefull;
    }

    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="theraphy")
    public Set<Therapybill> getTherapybills() {
        return this.therapybills;
    }

    public void setTherapybills(Set<Therapybill> therapybills) {
        this.therapybills = therapybills;
    }

    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="theraphy")
    public Set<Detailstherapybill> getDetailstherapybills() {
        return this.detailstherapybills;
    }

    public void setDetailstherapybills(Set<Detailstherapybill> detailstherapybills) {
        this.detailstherapybills = detailstherapybills;
    }




}


