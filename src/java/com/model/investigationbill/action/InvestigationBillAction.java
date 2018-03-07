/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.investigationbill.action;

import com.model.investigationbill.service.InvestigationBillService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sultan
 */
public class InvestigationBillAction {

    HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public InvestigationBillAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

          if (action.equalsIgnoreCase("add")) {
            
            url = addInvestigationBill();
        }

          if (action.equalsIgnoreCase("showTodaysInvestigationBills")) {
           
            url = showTodaysInvestigationBills();
        }
        if(action.equalsIgnoreCase("showInvestigationBillById")){
            url=showInvestigationBillById();

        }

        if(action.equalsIgnoreCase("showInvestigationBillsByDate")){
           
            url=showInvestigationBillsByDate();
        }


        if(action.equalsIgnoreCase("showBetweendateInvestigationBill")){
            url=showBetweendateInvestigationBill();
        }

        if(action.equalsIgnoreCase("showInvestigationThisMonthBill")){
            url=showInvestigationThisMonthBill();
        }

        if(action.equalsIgnoreCase("printInvestigationCharge")){
            url=printInvestigationCharge();
        }
          if(action.equalsIgnoreCase("addInvestigationPage")){
            url=addInvestigationPage();
        }


           return url;
    }


    private String addInvestigationBill() {

          if (new InvestigationBillService(request, response).addInvestigationBill()) {
            return "Controller?process=InvestigationBillProcess&action=showTodaysInvestigationBills";
        } else {
            return "notSaved.jsp";
        }
    }


    private String showTodaysInvestigationBills() {
        
        new InvestigationBillService(request, response).showTodaysInvestigationBills();
        return "viewInvestigationBill.jsp";

    }

    private String showInvestigationBillById() {
        new InvestigationBillService(request, response).showInvestigationBillById();
        return "investigationbillDetail.jsp";
    }
     private String showInvestigationBillsByDate() {
         
        new InvestigationBillService(request, response).showInvestigationBillsByDate();
        return "viewInvestigationBill.jsp";
    }

     private String showBetweendateInvestigationBill() {
        
        new InvestigationBillService(request, response).showBetweendateInvestigationBill();
        return "viewInvestigationBill.jsp";
    }

    private String showInvestigationThisMonthBill() {
        
        new InvestigationBillService(request, response).showInvestigationThisMonthBill();
        return "viewInvestigationBill.jsp";
       // return "viewBill_kamal.jsp";
    }


    private String printInvestigationCharge() {
        new InvestigationBillService(request, response).showInvestigationBillById();
        return "printInvestigationDetail.jsp";
    }

    private String addInvestigationPage() {
        new InvestigationBillService(request, response).viewAllInvestigation();

        return "addinvestigationBill.jsp";
    }

}
