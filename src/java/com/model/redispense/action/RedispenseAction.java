/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.redispense.action;

import com.model.redispense.dto.Redispense;
import com.model.redispense.service.RedispenseService;
import com.model.redispensedmedicinebill.service.RedispensedmedicinebillService;
import com.model.reunitdispensedose.service.ReunitdispensedoseService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class RedispenseAction {

    HttpServletRequest request;
    HttpServletResponse response;
    String url;


    public RedispenseAction(HttpServletRequest request, HttpServletResponse response) {
         this.request = request;
        this.response = response;
    }

    public String execute(String action) {

         if (action.equals("add")) {
            url = add();
        }
        if (action.equals("showTodaysRedispensedBills")) {
            url = showTodaysRedispensedBills();
        }
        if (action.equals("previewBill")) {
            url = previewBill();
        }
        if(action.equalsIgnoreCase("printBill")){
            url=printBill();
        }
        if(action.equalsIgnoreCase("showRedispensedBills")){
            url=showRedispensedBills();
        }
        if(action.equalsIgnoreCase("showBetweenTodaysRedispensedBills")){
            url=showBetweenTodaysRedispensedBills();
        }

        if(action.equalsIgnoreCase("showRedispensedBillsForThisMonth")){
            url=showRedispensedBillsForThisMonth();
        }


        return url;
    }

    private String add() {
        String ids=request.getParameter("medicineIDS");
        System.out.println("step1....");
        Redispense redispense = new RedispenseService(request, response).add();
         System.out.println("step2....");
        new ReunitdispensedoseService(request, response).add(redispense);
        new RedispenseService(request, response).preview(redispense);
        new RedispensedmedicinebillService(request, response).add(redispense);
        return "previewRedispenseDetail.jsp";
    }

    private String showTodaysRedispensedBills() {
         new RedispenseService(request, response).todaysBill();
        return "viewReturnMedicineBill.jsp";
    }

    private String previewBill() {
        new RedispenseService(request, response).preview();
        return "previewRedispenseDetail.jsp";
    }

    private String printBill() {
        new RedispenseService(request, response).preview();
        return "printRedispenseDetail.jsp";
    }

    private String showRedispensedBills() {
        new RedispenseService(request, response).showBills();
        return "viewReturnMedicineBill.jsp";
    }

    private String showBetweenTodaysRedispensedBills() {
        new RedispenseService(request, response).showBetweenTodaysRedispensedBills();
        return "viewReturnMedicineBill.jsp";
    }

    private String showRedispensedBillsForThisMonth() {
        new RedispenseService(request, response).showRedispensedBillsForThisMonth();
        return "viewReturnMedicineBill.jsp";
        //return "viewMedicineBill_kamal.jsp";
    }

}
