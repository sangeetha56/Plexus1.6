/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.advance.action;

import com.model.advance.service.AdvanceService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AdvanceAction {
 HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;
    public AdvanceAction(HttpServletRequest request, HttpServletResponse response) {
         this.request = request;
        this.response = response;
    }

    public String execute(String action) {
       if (action.equalsIgnoreCase("add")) {

            url = addAdvanceBill();
        }

          if (action.equalsIgnoreCase("showTodaysAdvanceBills")) {

            url = showTodaysAdvanceBills();
        }
        if(action.equalsIgnoreCase("showAdvanceBillById")){
            url=showAdvanceBillById();

        }

        if(action.equalsIgnoreCase("showAdvanceBillsByDate")){

            url=showAdvanceBillsByDate();
        }


        if(action.equalsIgnoreCase("showBetweendateAdvanceBill")){
            url=showBetweendateAdvanceBill();
        }

        if(action.equalsIgnoreCase("showAdvanceThisMonthBill")){
            url=showAdvanceThisMonthBill();
        }

        if(action.equalsIgnoreCase("printAdvanceCharge")){
            url=printAdvanceCharge();
        }
          if(action.equalsIgnoreCase("addAdvancePage")){
            url=addAdvancePage();
        }
        if(action.equalsIgnoreCase("showAdvanceBillByIdToAddMore")){
            url=showAdvanceBillByIdToAddMore();
        }

        if(action.equalsIgnoreCase("addAdvanceChildBill")){
            url=addAdvanceChildBill();
        }


           return url;
    }

    private String addAdvanceBill() {
         if (new AdvanceService(request, response).addAdvanceBill()) {
            return "Controller?process=AdvanceProcess&action=showTodaysAdvanceBills";
        } else {
            return "notSaved.jsp";
        }
    }

    private String showTodaysAdvanceBills() {
         new AdvanceService(request, response).showTodaysAdvanceBills();
        return "viewAdvanceBill.jsp";

    }

    private String showAdvanceBillById() {
          new AdvanceService(request, response).showAdvanceBillById();
        return "advancebillDetail.jsp";
    }

    private String showAdvanceBillsByDate() {
        new AdvanceService(request, response).showAdvanceBillsByDate();
        return "viewAdvanceBill.jsp";
    }

    private String showBetweendateAdvanceBill() {
         new AdvanceService(request, response).showBetweendateAdvanceBill();
        return "viewAdvanceBill.jsp";
    }

    private String showAdvanceThisMonthBill() {
         new AdvanceService(request, response).showAdvanceThisMonthBill();

         return "viewAdvanceBill.jsp";
    }

    private String printAdvanceCharge() {
         new AdvanceService(request, response).showAdvanceBillById();
        return "printAdvanceDetail.jsp";
    }

    private String addAdvancePage() {
        new AdvanceService(request, response).viewAllAdvance();
   return "addAdvanceBill.jsp";

    }

    private String showAdvanceBillByIdToAddMore() {
        new AdvanceService(request, response).showAdvanceBillById();
        return "advancebillDetailToAddMore.jsp";
    }

    private String addAdvanceChildBill() {
        if (new AdvanceService(request, response).addAdvanceChildBill()) {
            return "Controller?process=AdvanceProcess&action=showTodaysAdvanceBills";
        } else {
            return "notSaved.jsp";
        }
    }

}
