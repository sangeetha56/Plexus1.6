/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.medicine.dto;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
/**
 *
 * @author Administrator
 */
@Entity
@Table(name = "medicine", schema = "public")
public class AvailableMedicine implements java.io.Serializable {

    private long id;
    private String name;
    private String strength;
    private String nature;
    private BigDecimal price;
    private Long availableTotalStock;
    private String batchno;
    private BigDecimal vat;
    private BigDecimal cgst;
    private BigDecimal igst;
    private BigDecimal sgst;
    private BigDecimal gst;
    private Date expirydate;
    private Boolean usable;

    /**
     *
     */
    public AvailableMedicine() {
    }

    /**
     *
     * @return
     */
    @Id
    @Column(name = "id", unique = true, nullable = false)
    public long getId() {
        return this.id;
    }

    /**
     *
     * @param id
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     *
     * @return
     */
    @Column(name = "name", nullable = false, length = 50)
    public String getName() {
        return this.name;
    }

    /**
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return
     */
    @Column(name = "strength", nullable = false, length = 50)
    public String getStrength() {
        return this.strength;
    }

    /**
     *
     * @param strength
     */
    public void setStrength(String strength) {
        this.strength = strength;
    }

    /**
     *
     * @return
     */
    @Column(name = "nature", nullable = false)
    public String getNature() {
        return this.nature;
    }

    /**
     *
     * @param nature
     */
    public void setNature(String nature) {
        this.nature = nature;
    }

    /**
     *
     * @return
     */
    @Column(name = "price", nullable = false, precision = 20)
    public BigDecimal getPrice() {
        return this.price;
    }

    /**
     *
     * @param price
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    /**
     *
     * @return
     */
    @Column(name = "total", nullable = false)
    public Long getAvailableTotalStock() {
        return availableTotalStock;
    }

    /**
     *
     * @param availableTotalStock
     */
    public void setAvailableTotalStock(Long availableTotalStock) {
        this.availableTotalStock = availableTotalStock;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "expirydate", length = 29)
    public Date getExpirydate() {
        return this.expirydate;
    }

    /**
     *
     * @param expirydate
     */
    public void setExpirydate(Date expirydate) {
        this.expirydate = expirydate;
    }

    @Column(name="batchno", nullable=false, length=20)
    public String getBatchno() {
        return this.batchno;
    }

    public void setBatchno(String batchno) {
        this.batchno = batchno;
    }

//    @Column(name="vat")
//    public Long getVat() {
//        return this.vat;
//    }
//
//    public void setVat(Long vat) {
//        this.vat = vat;
//    }

    @Column(name="vat", precision=20)
    public BigDecimal getVat() {
        return this.vat;
    }

    public void setVat(BigDecimal vat) {
        this.vat = vat;
    }

    @Column(name="cgst", precision=20)
    public BigDecimal getCgst() {
        return this.cgst;
    }

    public void setCgst(BigDecimal cgst) {
        this.cgst = cgst;
    }

    @Column(name="igst", precision=20)
    public BigDecimal getIgst() {
        return this.igst;
    }

    public void setIgst(BigDecimal igst) {
        this.igst = igst;
    }

    @Column(name="sgst", precision=20)
    public BigDecimal getSgst() {
        return this.sgst;
    }

    public void setSgst(BigDecimal sgst) {
        this.sgst = sgst;
    }

    @Column(name="usable")
    public Boolean getUsable() {
        return usable;
    }

    public void setUsable(Boolean usable) {
        this.usable = usable;
    }


@Column(name="gst", precision=20)
    public BigDecimal getGst() {
        return this.gst;
    }

    public void setGst(BigDecimal gst) {
        this.gst = gst;
    }



}



