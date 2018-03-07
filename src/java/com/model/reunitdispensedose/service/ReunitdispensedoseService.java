/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.reunitdispensedose.service;

import com.model.medicine.dao.MedicineDAO;
import com.model.medicine.dto.Medicine;
import com.model.redispense.dto.Redispense;
import com.model.reunitdispensedose.dao.ReunitdispensedoseDao;
import com.model.reunitdispensedose.dto.Reunitdispensedose;
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
 * @author Admin
 */
public class ReunitdispensedoseService {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;


    public ReunitdispensedoseService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();

    }

    public Reunitdispensedose add(Redispense redispense) {
        Date today=new Date();
        Reunitdispensedose reunitdispensedose = new Reunitdispensedose();
        Medicine medicine = new Medicine();
        Medicine rpm = new Medicine();
       // Rarelyprescribedmedicine rpm= new Rarelyprescribedmedicine();
        Long quantity = 0l;
        BigDecimal amount = BigDecimal.ZERO;
        String[] medicineIDS = request.getParameterValues("medicineIDS");
        String[] medicineQuantities = request.getParameterValues("medicineQuantities");
        String[] medicineAmounts = request.getParameterValues("medicineAmounts");

//        List<Rarelyprescribedmedicine> listrpm = new RarelyprescribedmedicineDao().loadallForeinkey();
//        System.out.println("oh my god again:-"+listrpm.size());
//        System.out.println("id are:-");
//        Iterator<Rarelyprescribedmedicine> rpmid = listrpm.iterator();
//        long id=0;
//        while(rpmid.hasNext())
//
//        {
//            Rarelyprescribedmedicine rpmlistid=rpmid.next();
//            for (int i = 0; i < medicineIDS.length; i++)
//            {
//                if(DataUtil.parseLong(medicineIDS[i])==rpmlistid.getMedicine().getId())
//                {
//                   // RarelyprescribedmedicineService.
//                    System.out.println("fine here:-");
//                }
//                else
//                {
//                    System.out.println("not fine:-");
//                }
//
//            }
//
//            System.out.println("id are:-"+rpmlistid.getMedicine().getId());
//
//        }

        for (int i = 0; i < medicineIDS.length; i++)
        {
           System.out.println("kamal getting boring:-");
            List<Stock> medicineStocks = new StockDAO().getAvailableStockforReturn(DataUtil.parseLong(medicineIDS[i]));
            Iterator<Stock> stockIterator = medicineStocks.iterator();
            Stock medicineStock = new Stock();

               System.out.println("hhhhhhhhhhhhhhh:-");
                medicineStock=stockIterator.next();
               // System.out.println("expiring date is for medicine:-"+medicineStock.getExpirydate());

            rpm.setId(DataUtil.parseLong(medicineIDS[i]));
            rpm.setExpirydatemedicine(medicineStock.getExpirydate());
            rpm.setLastaccessdate(today);
            rpm = new MedicineDAO().updateLastAccessDate(rpm);
           // System.out.println("medicine areee kamal is :-"+DataUtil.parseLong(medicineIDS[i]));
        }
        for (int i = 0; i < medicineIDS.length; i++) {
            medicine.setId(DataUtil.parseLong(medicineIDS[i]));
            quantity = DataUtil.parseLong(medicineQuantities[i]);
            List<Stock> medicineStocks = new StockDAO().getAvailableStockforReturn(DataUtil.parseLong(medicineIDS[i]));
            Iterator<Stock> stockIterator = medicineStocks.iterator();
            Stock medicineStock = new Stock();
            long tempQuantity=quantity;
            while (tempQuantity > 0) {
                medicineStock=stockIterator.next();
               // System.out.println("medicine name "+ medicineStock.getMedicine().getName());
               // System.out.println("medicine available stock "+ medicineStock.getAvailablestock());
               // System.out.println("expiring date is:-"+medicineStock.getExpirydate());
                if (medicineStock.getAvailablestock() < tempQuantity) {
                    tempQuantity = tempQuantity + medicineStock.getAvailablestock();
                    medicineStock.setAvailablestock(0);


                } else {
                    medicineStock.setAvailablestock(medicineStock.getAvailablestock()+tempQuantity);
                    tempQuantity = 0l;
                }
               // System.out.println("medicine available stock later"+ medicineStock.getAvailablestock());
                new StockDAO().update(medicineStock);
            }


            amount = BigDecimal.valueOf(DataUtil.parseDouble(medicineAmounts[i]));
           // System.out.println("medicineId :" + medicine.getId());
            //System.out.println("quantity :" + quantity);
            //System.out.println("amount :" + amount);
            reunitdispensedose.setRedispense(redispense);
            reunitdispensedose.setAmount(amount);
            reunitdispensedose.setMedicine(medicine);
            reunitdispensedose.setQuantity(quantity);
            reunitdispensedose = new ReunitdispensedoseDao().create(reunitdispensedose);

        }

        return reunitdispensedose;
        
    }

}
