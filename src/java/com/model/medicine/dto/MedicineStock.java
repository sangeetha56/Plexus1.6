/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.medicine.dto;

import com.model.stock.dto.Stock;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;


/**
 *
 * @author Administrator
 */

public class MedicineStock implements java.io.Serializable {

    private long id;
    private String medicineName;
    private String medicineStrength;
    private String medicineNature;
    private long availableStock;
    private BigDecimal price;
    private Set<Stock> stocks= new HashSet<Stock>(0);

    /**
     * @return the availableStock
     */
    public long getAvailableStock() {
        return availableStock;
    }

    /**
     * @param availableStock the availableStock to set
     */
    public void setAvailableStock(long availableStock) {
        this.availableStock = availableStock;
    }

    /**
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * @return the medicineName
     */
    public String getMedicineName() {
        return medicineName;
    }

    /**
     * @param medicineName the medicineName to set
     */
    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    /**
     * @return the medicineStrength
     */
    public String getMedicineStrength() {
        return medicineStrength;
    }

    /**
     * @param medicineStrength the medicineStrength to set
     */
    public void setMedicineStrength(String medicineStrength) {
        this.medicineStrength = medicineStrength;
    }

    /**
     * @return the medicineNature
     */
    public String getMedicineNature() {
        return medicineNature;
    }

    /**
     * @param medicineNature the medicineNature to set
     */
    public void setMedicineNature(String medicineNature) {
        this.medicineNature = medicineNature;
    }
    /**
     *
     * @return
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     *
     * @param price
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    /**
     * @return the stocks
     */
    public Set<Stock> getStocks() {
        return stocks;
    }

    /**
     * @param stocks the stocks to set
     */
    public void setStocks(Set<Stock> stocks) {
        this.stocks = stocks;
    }
}
