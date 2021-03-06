package com.model.inunitdispensedose.dto;
// Generated Apr 1, 2013 4:32:03 PM by Hibernate Tools 3.2.1.GA


//import com.model.all.Medicine;
import com.model.indispense.dto.Indispense;
import com.model.medicine.dto.Medicine;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Inunitdispensedose generated by hbm2java
 */
@Entity
@Table(name="inunitdispensedose"
    ,schema="public"
)
    @SequenceGenerator(name = "inunitdispensedose_seq", sequenceName = "inunitdispensedose_seq")
@org.hibernate.annotations.Entity(dynamicUpdate=true)

public class Inunitdispensedose  implements java.io.Serializable {


     private long id;
     private Medicine medicine;
     private Indispense indispense;
     private Long quantity;
     private BigDecimal amount;

    public Inunitdispensedose() {
    }

	
    public Inunitdispensedose(long id, Medicine medicine, Indispense indispense) {
        this.id = id;
        this.medicine = medicine;
        this.indispense = indispense;
    }
    public Inunitdispensedose(long id, Medicine medicine, Indispense indispense, Long quantity, BigDecimal amount) {
       this.id = id;
       this.medicine = medicine;
       this.indispense = indispense;
       this.quantity = quantity;
       this.amount = amount;
    }
   
     @Id 
    
    @Column(name="id", unique=true, nullable=false)
      @GeneratedValue(generator = "inunitdispensedose_seq")
    public long getId() {
        return this.id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="medicineid", nullable=false)
    public Medicine getMedicine() {
        return this.medicine;
    }
    
    public void setMedicine(Medicine medicine) {
        this.medicine = medicine;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="indispenseid", nullable=false)
    public Indispense getIndispense() {
        return this.indispense;
    }
    
    public void setIndispense(Indispense indispense) {
        this.indispense = indispense;
    }
    
    @Column(name="quantity")
    public Long getQuantity() {
        return this.quantity;
    }
    
    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }
    
    @Column(name="amount", precision=20)
    public BigDecimal getAmount() {
        return this.amount;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }




}


