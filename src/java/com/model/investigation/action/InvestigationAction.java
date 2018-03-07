/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.investigation.action;

import com.model.investigation.service.InvestigationService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class InvestigationAction {
     HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public InvestigationAction(HttpServletRequest request, HttpServletResponse response)
    {
        this.request = request;
        this.response = response;
    }

    public String execute(String action)
    {
        if (action.equalsIgnoreCase("add")) {
           
            url = addInvestigationName();
        }
          else if (action.equalsIgnoreCase("add1")) {
           
            url = addInvestigationName1();
        }
         else if (action.equalsIgnoreCase("delete")) {
           
            url = deleteInvestigationName();
        }
         else if (action.equalsIgnoreCase("editInvestigation")) {
           
            url = updateInvestigation();
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


    private String addInvestigationName()
    {
       if (new InvestigationService(request, response).addInvestigationName())
       {
          //  return "Controller?process=InvestigationProcess&action=viewAll";
           return "savedInvestigation.jsp";
        }
       else {
            return "notSaved.jsp";
        }
    }

    private String addInvestigationName1() {
        if (new InvestigationService(request, response).addInvestigationName1())
       {
            //return "manageInvestigation.jsp";
             return "InvestigationTab.jsp";
        }
       else {
            return "notSaved.jsp";
        }
}

    private String deleteInvestigationName() {
         
            if (new InvestigationService(request, response).deleteInvestigationName())
            {
          //return "Controller?process=InvestigationProcess&action=viewAll" ;
                 return "InvestigationTab.jsp";
            }
            else
            {
               return "notSaved.jsp";
            }
    }

    private String updateInvestigation() {
         if (new InvestigationService(request, response).updateInvestigationName())
            {
         // return "Controller?process=InvestigationProcess&action=viewAll" ;
               return "InvestigationTab.jsp";
            }
            else
            {
               return "notSaved.jsp";
            }
    }


    private String viewAll() {
       
           new InvestigationService(request, response).viewAllInvestigationType();
      
        return "viewAllInvestigationType.jsp";
    }


    private String viewDetails() {

        if (new InvestigationService(request, response).viewDetailsInvestigationType()) {
           
            return "investigationTypeDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }


    private String deleteMultiple() {

        new InvestigationService(request, response).deleteMultiple();
        return "InvestigationTab.jsp";
    }
}
