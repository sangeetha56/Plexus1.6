/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.indispense.action;

import com.model.indispense.dto.Indispense;
import com.model.indispense.service.InDispenseService;
import com.model.indispensedmedicinebill.service.InDispensedmedicinebillService;
import com.model.inunitdispensedose.service.InUnitdispensedoseService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class InDispenseAction {

     HttpServletRequest request;
    HttpServletResponse response;
    String url;

    public InDispenseAction(HttpServletRequest request, HttpServletResponse response) {
      this.request = request;
        this.response = response;
    }

    public String execute(String action) {
 if (action.equals("add")) {
            url = add();
        }


   if (action.equals("showTodaysDispensedBills")) {
       
            url = showTodaysDispensedBills();
        }

   if(action.equalsIgnoreCase("showDispensedBills")){
     
            url=showDispensedBills();
        }


  if (action.equals("previewBill")) {
            url = previewBill();
        }

   if(action.equalsIgnoreCase("printBill")){
            url=printBill();
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
         Indispense dispense = new InDispenseService(request, response).add();
        new InUnitdispensedoseService(request, response).add(dispense);
        new InDispenseService(request, response).preview(dispense);
        new InDispensedmedicinebillService(request, response).add(dispense);
        return "previewDispenseDetailInpatient.jsp";
    }

    private String showTodaysDispensedBills() {
       
         new InDispenseService(request, response).todaysBill();
         return "viewMedicineBillInpatient.jsp";
               // return "viewMedicineBillInpatient_kamal.jsp";
    }

    private String showDispensedBills() {
       
         new InDispenseService(request, response).showBills();
        return "viewMedicineBillInpatient.jsp";
    }

    private String previewBill() {
          new InDispenseService(request, response).preview();
        return "previewDispenseDetailInpatient.jsp";
    }

    private String printBill() {
         new InDispenseService(request, response).preview();
        return "printDispenseDetailInpatient.jsp";
    }

    private String showBetweenTodaysDispensedBills() {
        
        new InDispenseService(request, response).showBetweenTodaysDispensedBills();
        return "viewMedicineBillInpatient.jsp";
    }

    private String showDispensedBillsForThisMonth() {
       
        new InDispenseService(request, response).showDispensedBillsForThisMonth();
        return "viewMedicineBillInpatient.jsp";
        
    }

}
