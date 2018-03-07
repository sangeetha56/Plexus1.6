/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.bill.action;

import com.model.bill.service.BillService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class BillAction {

    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    /**
     *
     * @param request
     * @param response
     */
    public BillAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    /**
     *
     * @param action
     * @return
     */
    public String execute(String action) {
        if (action.equalsIgnoreCase("showTodaysBills")) {
           
            url = showTodaysBills();
        }
        if(action.equalsIgnoreCase("showBillById")){
            url=showBillById();

        }

        if(action.equalsIgnoreCase("showBillsByDate")){
           
            url=showBillsByDate();
        }


        if(action.equalsIgnoreCase("showBetweenDateBills")){
            url=showConsultantBetweenDateBills();
        }

        if(action.equalsIgnoreCase("showConsultantForThisMonth")){
            url=showConsultantForThisMonth();
        }

        if(action.equalsIgnoreCase("printConsultationCharge")){
            url=printConsultationCharge();
        }
        
        return url;
    }

    private String showTodaysBills() {
       
        new BillService(request, response).todaysBill();
        return "viewBill.jsp";
        //return "viewBill_kamal.jsp";
    }

    private String showBillById() {
        new BillService(request, response).showBillById();
        return "billDetail.jsp";
    }
     private String showBillsByDate() {
         
        new BillService(request, response).showBillsByDate();
        return "viewBill.jsp";
    }

     private String showConsultantBetweenDateBills() {
         
        new BillService(request, response).showConsultantBetweenDateBills();
        return "viewBill.jsp";
    }

    private String showConsultantForThisMonth() {
        
        new BillService(request, response).showConsultantForThisMonth();
        return "viewBill.jsp";
       // return "viewBill_kamal.jsp";
    }


    private String printConsultationCharge() {
        new BillService(request, response).showBillById();
        return "printbillDetail.jsp";
    }

}
