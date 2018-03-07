/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dispense.action;

import com.model.dispense.dto.Dispense;
import com.model.dispense.service.DispenseService;
import com.model.dispensedmedicinebill.service.DispensedmedicinebillService;
import com.model.unitdispensedose.service.UnitdispensedoseService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class DispenseAction {

    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    /**
     *
     * @param request
     * @param response
     */
    public DispenseAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    /**
     *
     * @param action
     * @return
     */
    public String execute(String action) {
        if (action.equals("add")) {
            url = add();
        }
        if (action.equals("showTodaysDispensedBills")) {
            url = showTodaysDispensedBills();
        }
        if (action.equals("previewBill")) {
            url = previewBill();
        }
        if(action.equalsIgnoreCase("printBill")){
            url=printBill();
        }
        if(action.equalsIgnoreCase("showDispensedBills")){
            url=showDispensedBills();
        }
        if(action.equalsIgnoreCase("showBetweenTodaysDispensedBills")){
            url=showBetweenTodaysDispensedBills();
        }

        if(action.equalsIgnoreCase("showDispensedBillsForThisMonth")){
            url=showDispensedBillsForThisMonth();
        }

        
        return url;

    }

    private String add() {
        String ids=request.getParameter("medicineIDS");
       
        Dispense dispense = new DispenseService(request, response).add();
        new UnitdispensedoseService(request, response).add(dispense);
        new DispenseService(request, response).preview(dispense);
        new DispensedmedicinebillService(request, response).add(dispense);
        return "previewDispenseDetail.jsp";
    }

    private String showTodaysDispensedBills()
    {
        new DispenseService(request, response).todaysBill();
        return "viewMedicineBill.jsp";
                //return "viewMedicineBill_kamal.jsp";
    }

    private String previewBill() {
        new DispenseService(request, response).preview();
        return "previewDispenseDetail.jsp";
    }


    private String printBill() {
        new DispenseService(request, response).preview();
        return "printDispenseDetail.jsp";
    }

    private String showDispensedBills() {
        new DispenseService(request, response).showBills();
        return "viewMedicineBill.jsp";
    }

    private String showBetweenTodaysDispensedBills() {
        new DispenseService(request, response).showBetweenTodaysDispensedBills();
        return "viewMedicineBill.jsp";
    }

    private String showDispensedBillsForThisMonth() {
        new DispenseService(request, response).showDispensedBillsForThisMonth();
        return "viewMedicineBill.jsp";
        //return "viewMedicineBill_kamal.jsp";
    }
}
