/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.therapy.dto;

import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author sultan
 */
@Entity
@Table(name="theraphy"
    ,schema="public"
)

public class TherapyType implements java.io.Serializable {

    private long therphyid;
    private BigDecimal theraphycharge;

    public TherapyType() {
    }

    public TherapyType(long therphyid, BigDecimal theraphycharge) {
        this.therphyid = therphyid;
        this.theraphycharge = theraphycharge;
    }

    @Id
    @Column(name = "therphyid", unique = true, nullable = false)
    public long getTherphyid() {
        return this.therphyid;
    }

    public void setTherphyid(long therphyid) {
        this.therphyid = therphyid;
    }

    @Column(name="theraphycharge", precision=20)
    public BigDecimal getTheraphycharge() {
        return this.theraphycharge;
    }

    public void setTheraphycharge(BigDecimal theraphycharge) {
        this.theraphycharge = theraphycharge;
    }






}
