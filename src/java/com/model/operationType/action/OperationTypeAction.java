/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.operationType.action;

import com.model.operationType.service.OperationTypeService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Admin
 */
public class OperationTypeAction {

     HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public OperationTypeAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {
       if (action.equalsIgnoreCase("add")) {

            url = addOperationTypeName();
        }
          else if (action.equalsIgnoreCase("add1")) {

            url = addOperationTypeName1();
        }
         else if (action.equalsIgnoreCase("delete")) {

            url = deleteOperationTypeName();
        }
         else if (action.equalsIgnoreCase("editOperationtype")) {

            url = updateOperationType();
        }

        else if (action.equalsIgnoreCase("viewAll")) {

            url = viewAll();
              }

          else if (action.equalsIgnoreCase("viewDetails"))
           {

            url = viewDetails();
           }

        else if (action.equalsIgnoreCase("deleteMultiple")) {

            url = deleteMultiple();

        }

        return url;
    }

    private String addOperationTypeName() {

        if (new   OperationTypeService(request, response).addOperationTypeName())
       {
          //  return "Controller?process=InvestigationProcess&action=viewAll";
           return "savedOperationType.jsp";
        }
       else {
            return "notSaved.jsp";
        }
    }

    private String addOperationTypeName1() {

        if (new OperationTypeService(request, response).addOperationTypeName1())
       {
            //return "manageInvestigation.jsp";
             return "OperationTab.jsp";
        }
       else {
            return "notSaved.jsp";
        }
    }

    private String deleteOperationTypeName() {

        if (new OperationTypeService(request, response).deleteOperationTypeName())
            {
          //return "Controller?process=InvestigationProcess&action=viewAll" ;
                 return "OperationTab.jsp";
            }
            else
            {
               return "notSaved.jsp";
            }
    }

    private String updateOperationType() {

          if (new OperationTypeService(request, response).updateOperationTypeName())
            {
         // return "Controller?process=InvestigationProcess&action=viewAll" ;
               return "OperationTab.jsp";
            }
            else
            {
               return "notSaved.jsp";
            }
    }

    private String viewAll() {
        new OperationTypeService(request, response).viewAllOperationType();

        return "viewAllOperationType.jsp";
    }

    private String viewDetails() {

         if (new OperationTypeService(request, response).viewDetailsOperationType()) {

            return "operationTypeDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

    private String deleteMultiple() {

         new OperationTypeService(request, response).deleteMultiple();
        return "OperationTab.jsp";
    }

}
