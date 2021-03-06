package com.model.indispensedmedicinebill.dto;
// Generated Apr 1, 2013 4:32:03 PM by Hibernate Tools 3.2.1.GA


import com.model.indispense.dto.Indispense;
import java.math.BigDecimal;
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
 * Indispensedmedicinebill generated by hbm2java
 */
@Entity
@Table(name="indispensedmedicinebill"
    ,schema="public"
)
  @SequenceGenerator(name = "indispensedmedicinebill_seq", sequenceName = "indispensedmedicinebill_seq")
@org.hibernate.annotations.Entity(dynamicUpdate = true)
public class Indispensedmedicinebill  implements java.io.Serializable {


     private long id;
     private Indispense indispense;
     private Date publisheddate;
     private BigDecimal amount;
     private BigDecimal consultationamount;
     private BigDecimal miscellanousamount;
     private BigDecimal medicineamount;
     private BigDecimal billvaluebeforediscount;
    private Long discountparcentage;
    private BigDecimal discountedvalue;
    private String doctordepartment;
    private String doctorname;

     private BigDecimal cgst;
     private BigDecimal sgst;
     private BigDecimal igst;
     private long gst;
     private BigDecimal totaltaxvalue;

    public Indispensedmedicinebill() {
    }


    public Indispensedmedicinebill(long id, Indispense indispense, Date publisheddate) {
        this.id = id;
        this.indispense = indispense;
        this.publisheddate = publisheddate;
    }
    public Indispensedmedicinebill(long id, Indispense indispense, Date publisheddate, BigDecimal amount, BigDecimal consultationamount, BigDecimal miscellanousamount, BigDecimal medicineamount, BigDecimal billvaluebeforediscount, long discountparcentage, BigDecimal discountedvalue, String doctordepartment, String doctorname, BigDecimal cgst, BigDecimal sgst, BigDecimal igst,long gst, BigDecimal totaltaxvalue) {
       this.id = id;
       this.indispense = indispense;
       this.publisheddate = publisheddate;
       this.amount = amount;
       this.consultationamount = consultationamount;
       this.miscellanousamount = miscellanousamount;
       this.medicineamount = medicineamount;
       this.billvaluebeforediscount = billvaluebeforediscount;
       this.discountparcentage = discountparcentage;
       this.discountedvalue = discountedvalue;
       this.doctordepartment = doctordepartment;
       this.doctorname = doctorname;

       this.cgst = cgst;
       this.sgst = sgst;
       this.igst = igst;
       this.gst = gst;
       this.totaltaxvalue = totaltaxvalue;
    }

     @Id

    @Column(name="id", unique=true, nullable=false)
      @GeneratedValue(generator = "indispensedmedicinebill_seq")
    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="indispenseid", nullable=false)
    public Indispense getIndispense() {
        return this.indispense;
    }

    public void setIndispense(Indispense indispense) {
        this.indispense = indispense;
    }
    @Temporal(TemporalType.TIME)
    @Column(name="publisheddate", nullable=false, length=15)
    public Date getPublisheddate() {
        return this.publisheddate;
    }

    public void setPublisheddate(Date publisheddate) {
        this.publisheddate = publisheddate;
    }

    @Column(name="amount", precision=20)
    public BigDecimal getAmount() {
        return this.amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    @Column(name="consultationamount", precision=20)
    public BigDecimal getConsultationamount() {
        return this.consultationamount;
    }

    public void setConsultationamount(BigDecimal consultationamount) {
        this.consultationamount = consultationamount;
    }

    @Column(name="miscellanousamount", precision=20)
    public BigDecimal getMiscellanousamount() {
        return this.miscellanousamount;
    }

    public void setMiscellanousamount(BigDecimal miscellanousamount) {
        this.miscellanousamount = miscellanousamount;
    }

    @Column(name="medicineamount", precision=20)
    public BigDecimal getMedicineamount() {
        return this.medicineamount;
    }

    public void setMedicineamount(BigDecimal medicineamount) {
        this.medicineamount = medicineamount;
    }

    @Column(name="billvaluebeforediscount", precision=20)
    public BigDecimal getBillvaluebeforediscount() {
        return this.billvaluebeforediscount;
    }

    public void setBillvaluebeforediscount(BigDecimal
billvaluebeforediscount) {
        this.billvaluebeforediscount = billvaluebeforediscount;
    }

    @Column(name="discountparcentage")
    public Long getDiscountparcentage() {
        return this.discountparcentage;
    }

    public void setDiscountparcentage(Long discountparcentage) {
        this.discountparcentage = discountparcentage;
    }

    @Column(name="discountedvalue", precision=20)
    public BigDecimal getDiscountedvalue() {
        return this.discountedvalue;
    }

    public void setDiscountedvalue(BigDecimal discountedvalue) {
        this.discountedvalue = discountedvalue;
    }
    @Column(name="doctordepartment", length=300)
    public String getDoctordepartment() {
        return this.doctordepartment;
    }

    public void setDoctordepartment(String doctordepartment) {
        this.doctordepartment = doctordepartment;
    }

    @Column(name="doctorname", length=300)
    public String getDoctorname() {
        return this.doctorname;
    }

    public void setDoctorname(String doctorname) {
        this.doctorname = doctorname;
    }

    @Column(name="cgst", precision=20)
    public BigDecimal getCgst() {
        return this.cgst;
    }

    public void setCgst(BigDecimal cgst) {
        this.cgst = cgst;
    }

    @Column(name="sgst", precision=20)
    public BigDecimal getSgst() {
        return this.sgst;
    }

    public void setSgst(BigDecimal sgst) {
        this.sgst = sgst;
    }

    @Column(name="igst", precision=20)
    public BigDecimal getIgst() {
        return this.igst;
    }

    public void setIgst(BigDecimal igst) {
        this.igst = igst;
    }

    @Column(name="totaltaxvalue", precision=20)
    public BigDecimal getTotaltaxvalue() {
        return this.totaltaxvalue;
    }

    public void setTotaltaxvalue(BigDecimal totaltaxvalue) {
        this.totaltaxvalue = totaltaxvalue;
    }

    @Column(name="gst")
    public long getGst() {
        return this.gst;
    }

    public void setGst(long gst) {
        this.gst = gst;
    }



}


