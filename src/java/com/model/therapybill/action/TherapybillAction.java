/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.therapybill.action;

import com.model.therapybill.service.TherapybillService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sultan
 */
public class TherapybillAction {

    HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public TherapybillAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

          if (action.equalsIgnoreCase("add")) {
           
            url = addTherapyBill();
        }

          if (action.equalsIgnoreCase("showTodaysTherapyBills")) {
            
            url = showTodaysTherapyBills();
        }
        if(action.equalsIgnoreCase("showTherapyBillById")){
            url=showTherapyBillById();

        }

        if(action.equalsIgnoreCase("showTherapyBillsByDate")){
           
            url=showTherapyBillsByDate();
        }


        if(action.equalsIgnoreCase("showBetweenDateTherapyBills")){
            url=showBetweenDateTherapyBills();
        }

        if(action.equalsIgnoreCase("showTherapyForThisMonth")){
            url=showTherapyForThisMonth();
        }

        if(action.equalsIgnoreCase("printTherapyCharge")){
            url=printTherapyCharge();
        }
          if(action.equalsIgnoreCase("addThreapyPage")){
            url=addThreapyPage();
        }


           return url;
    }


    private String addTherapyBill() {

          if (new TherapybillService(request, response).addTherapyBill()) {
            return "Controller?process=TherapyBillProcess&action=showTodaysTherapyBills";
        } else {
            return "notSaved.jsp";
        }
    }


    private String showTodaysTherapyBills() {
       
        new TherapybillService(request, response).showTodaysTherapyBills();
        return "viewTherapyBill.jsp";
        
    }

    private String showTherapyBillById() {
        new TherapybillService(request, response).showTherapyBillById();
        return "therapybillDetail.jsp";
    }
     private String showTherapyBillsByDate() {
         
        new TherapybillService(request, response).showTherapyBillsByDate();
        return "viewTherapyBill.jsp";
    }

     private String showBetweenDateTherapyBills() {
       
        new TherapybillService(request, response).showBetweenDateTherapyBills();
        return "viewTherapyBill.jsp";
    }

    private String showTherapyForThisMonth() {
       
        new TherapybillService(request, response).showTherapyForThisMonth();
        return "viewTherapyBill.jsp";
       // return "viewBill_kamal.jsp";
    }


    private String printTherapyCharge() {
        new TherapybillService(request, response).showTherapyBillById();
        return "printtherapyDetail.jsp";
    }

    private String addThreapyPage() {
        new TherapybillService(request, response).viewAllTherapy();

        return "addtherapyBill.jsp";
    }

    

}
