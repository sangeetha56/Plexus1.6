/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inunitdispensedose.service;

import com.model.indispense.dto.Indispense;
import com.model.inunitdispensedose.dao.InUnitdispensedoseDAO;
import com.model.inunitdispensedose.dto.Inunitdispensedose;
import com.model.medicine.dao.MedicineDAO;
import com.model.medicine.dto.Medicine;
import com.model.stock.dao.StockDAO;
import com.model.stock.dto.Stock;
import com.util.DataUtil;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class InUnitdispensedoseService {

     private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public InUnitdispensedoseService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public Inunitdispensedose add(Indispense dispense) {
        Date today=new Date();
       Inunitdispensedose unitdispensedose = new Inunitdispensedose();
        Medicine medicine = new Medicine();
        Medicine rpm = new Medicine();
        Long quantity = 0l;
        BigDecimal amount = BigDecimal.ZERO;
        String[] medicineIDS = request.getParameterValues("medicineIDS");
        String[] medicineQuantities = request.getParameterValues("medicineQuantities");
        String[] medicineAmounts = request.getParameterValues("medicineAmounts");

        for (int i = 0; i < medicineIDS.length; i++)
        {
            
            List<Stock> medicineStocks = new StockDAO().getAvailableStock(DataUtil.parseLong(medicineIDS[i]));
            Iterator<Stock> stockIterator = medicineStocks.iterator();
            Stock medicineStock = new Stock();

               
                medicineStock=stockIterator.next();
               
            rpm.setId(DataUtil.parseLong(medicineIDS[i]));
            rpm.setExpirydatemedicine(medicineStock.getExpirydate());
            rpm.setLastaccessdate(today);
            rpm = new MedicineDAO().updateLastAccessDate(rpm);
           
        }

        for (int i = 0; i < medicineIDS.length; i++) {
            medicine.setId(DataUtil.parseLong(medicineIDS[i]));
            quantity = DataUtil.parseLong(medicineQuantities[i]);
            List<Stock> medicineStocks = new StockDAO().getAvailableStock(DataUtil.parseLong(medicineIDS[i]));
            Iterator<Stock> stockIterator = medicineStocks.iterator();
            Stock medicineStock = new Stock();
            long tempQuantity=quantity;
            while (tempQuantity > 0) {
                medicineStock=stockIterator.next();
                
                if (medicineStock.getAvailablestock() < tempQuantity) {
                    tempQuantity = tempQuantity - medicineStock.getAvailablestock();
                    medicineStock.setAvailablestock(0);


                } else {
                    medicineStock.setAvailablestock(medicineStock.getAvailablestock()-tempQuantity);
                    tempQuantity = 0l;
                }
               
                new StockDAO().update(medicineStock);
            }


            amount = BigDecimal.valueOf(DataUtil.parseDouble(medicineAmounts[i]));
            
            unitdispensedose.setIndispense(dispense);
            unitdispensedose.setAmount(amount);
            unitdispensedose.setMedicine(medicine);
            unitdispensedose.setQuantity(quantity);
            unitdispensedose = new InUnitdispensedoseDAO().create(unitdispensedose);

        }

        return unitdispensedose;
    }

}
