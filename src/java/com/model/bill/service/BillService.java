/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.bill.service;

import com.model.bill.dao.BillDAO;
import com.model.bill.dto.Bill;
import com.model.therapybill.dao.TherapybillDao;
import com.model.therapybill.dto.Therapybill;
import com.util.DataUtil;
import com.util.DateUtil;
import java.math.BigDecimal;
import java.util.Calendar;
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
public class BillService {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public BillService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession=request.getSession();
    }


    /**
     *
     */
    public void todaysBill(){
        Date today = new Date();
        today = DateUtil.todaysDate();
        Date tommorow=DateUtil.tomorrowsDate(today);
        Double consultationamount =0.0;
        List<Bill> bills=new BillDAO().readListOfObjects(today, tommorow);
      
        Iterator<Bill> iterator = bills.iterator();
           
            while (iterator.hasNext()) {
                
                Bill charges = iterator.next();

                consultationamount=consultationamount+charges.getConsultationcharges().doubleValue();
               
            }
           
        httpSession.setAttribute("bills", bills);
        httpSession.setAttribute("firstdate", today);
        httpSession.setAttribute("secondtdate", today);
        httpSession.setAttribute("total", consultationamount);
    }

    /**
     *
     */
    public void showBillById() {
        long id=DataUtil.parseLong(request.getParameter("id"));
        Bill bill=new BillDAO().readUniqueObject(id);
        
        Therapybill therapybill=new TherapybillDao().readUniqueObject(id);
        httpSession.setAttribute("bill", bill);

    }

    public void showBillsByDate() {
        Date consultantDate=new Date();
        consultantDate=DateUtil.simpleDateParser(request.getParameter("consultationDate"));
        Double consultationamount =0.0;

        List<Bill> bil=new BillDAO().readListOfObjects(consultantDate);
       
        Iterator<Bill> iterator = bil.iterator();
           
            while (iterator.hasNext()) {

                Bill charges = iterator.next();

                consultationamount=consultationamount+charges.getConsultationcharges().doubleValue();
                
            }
            
        httpSession.setAttribute("bills", bil);
        httpSession.setAttribute("firstdate", consultantDate);
        httpSession.setAttribute("secondtdate", consultantDate);
        httpSession.setAttribute("total", consultationamount);
    }

    public void showConsultantBetweenDateBills() {
        Date consultantfirstDate=new Date();
        Date consultantsecondDate=new Date();
        consultantfirstDate=DateUtil.simpleDateParser(request.getParameter("firstdate"));
        consultantsecondDate=DateUtil.simpleDateParser(request.getParameter("seconddate"));
        Double consultationamount =0.0;
       
        List<Bill> bil=new BillDAO().showConsultantBetweenDateBills(consultantfirstDate,consultantsecondDate);

        
        Iterator<Bill> iterator = bil.iterator();
           
            while (iterator.hasNext()) {

                Bill charges = iterator.next();

                consultationamount=consultationamount+charges.getConsultationcharges().doubleValue();
                
            }
           
        httpSession.setAttribute("bills", bil);
        httpSession.setAttribute("firstdate", consultantfirstDate);
        httpSession.setAttribute("secondtdate", consultantsecondDate);
        httpSession.setAttribute("secondtdate", consultantsecondDate);
        httpSession.setAttribute("total", consultationamount);
    }

    public void showConsultantForThisMonth() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);
        
         int year = cal.get(Calendar.YEAR);
         int month = cal.get(Calendar.MONTH);
         int day = cal.get(Calendar.DATE);
         Date startingdate = new Date(year-1900, month, day);
         Date currentdate=new Date();
         Double consultationamount =0.0;

         
        List<Bill> bil=new BillDAO().showConsultantForThisMonth(startingdate,currentdate);
        
        Iterator<Bill> iterator = bil.iterator();
            
            while (iterator.hasNext()) {

                Bill charges = iterator.next();

                consultationamount=consultationamount+charges.getConsultationcharges().doubleValue();
                
            }
            
        httpSession.setAttribute("bills", bil);
        httpSession.setAttribute("firstdate", startingdate);
        httpSession.setAttribute("secondtdate", currentdate);
        httpSession.setAttribute("total", consultationamount);
    }

}
