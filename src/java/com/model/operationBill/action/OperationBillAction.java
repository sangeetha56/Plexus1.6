/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.operationBill.action;

import com.model.operationBill.service.OperationBillService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class OperationBillAction {
 HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;
    public OperationBillAction(HttpServletRequest request, HttpServletResponse response) {
          this.request = request;
        this.response = response;
    }

    public String execute(String action) {
             if (action.equalsIgnoreCase("add")) {

            url = addOperationBill();
        }

          if (action.equalsIgnoreCase("showTodaysOperationBills")) {

            url = showTodaysOperationBills();
        }
        if(action.equalsIgnoreCase("showOperationBillById")){
            url=showOperationBillById();

        }

        if(action.equalsIgnoreCase("showOperationBillsByDate")){

            url=showOperationBillsByDate();
        }


        if(action.equalsIgnoreCase("showBetweendateOperationBill")){
            url=showBetweendateOperationBill();
        }

        if(action.equalsIgnoreCase("showOperationThisMonthBill")){
            url=showOperationThisMonthBill();
        }

        if(action.equalsIgnoreCase("printOperationCharge")){
            url=printOperationCharge();
        }
          if(action.equalsIgnoreCase("addOperationPage")){
            url=addOperationPage();
        }
                     if(action.equalsIgnoreCase("showOperationBillByIdToAddMore")){
            url=showOperationBillByIdToAddMore();
        }

                     if(action.equalsIgnoreCase("addOperationBillChild")){
            url=addOperationBillChild();
        }


           return url;
    }

    private String addOperationBill() {
        if (new OperationBillService(request, response).addOperationBill()) {
            return "Controller?process=OperationBillProcess&action=showTodaysOperationBills";
        } else {
            return "notSaved.jsp";
        }
    }

    private String showTodaysOperationBills() {
         new OperationBillService(request, response).showTodaysOperationBills();
        return "viewOperationBill.jsp";
    }

    private String showOperationBillById() {
          new OperationBillService(request, response).showOperationBillById();
        return "operationbillDetail.jsp";
    }

    private String showOperationBillsByDate() {
        new OperationBillService(request, response).showOperationBillsByDate();
        return "viewOperationBill.jsp";
    }

    private String showBetweendateOperationBill() {
        new OperationBillService(request, response).showBetweendateOperationBill();
        return "viewOperationBill.jsp";
    }

    private String showOperationThisMonthBill() {
        new OperationBillService(request, response).showOperationThisMonthBill();
        return "viewOperationBill.jsp";
       // return "viewBill_kamal.jsp";
    }

    private String printOperationCharge() {
         new OperationBillService(request, response).showOperationBillById();
        return "printOperationDetail.jsp";
    }

    private String addOperationPage() {
        new OperationBillService(request, response).viewAllOperigationType();

        return "addOperationBill.jsp";
    }

    private String showOperationBillByIdToAddMore() {
        new OperationBillService(request, response).showOperationBillById();
         new OperationBillService(request, response).viewAllOperigationType();
        return "operationbillDetailToAddMore.jsp";
    }

    private String addOperationBillChild() {
        if (new OperationBillService(request, response).addOperationBillChild()) {
            return "Controller?process=OperationBillProcess&action=showTodaysOperationBills";
        } else {
            return "notSaved.jsp";
        }
    }

}
