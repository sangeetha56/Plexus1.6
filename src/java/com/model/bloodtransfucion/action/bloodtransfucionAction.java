/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.bloodtransfucion.action;


import com.model.bloodtransfucion.service.bloodtransfucionService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADIL KHAN B A
 */
public class bloodtransfucionAction {
    HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public bloodtransfucionAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {
        if (action.equalsIgnoreCase("add")) {

            url = add();
        }
        else if (action.equalsIgnoreCase("viewAll")) {

            url = viewAll();
              }
         else if (action.equalsIgnoreCase("viewDetails")) {
            url = viewDetails();
        }
          else if (action.equalsIgnoreCase("deleteUser")) {
            url = deleteuser();
        }
       
          return url;
    }

    private String add() {
        if (new bloodtransfucionService(request, response).add()) {

              return "savedBloodtransfucion.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }

    }

    private String viewAll() {
        
System.out.println("view details 1:-");
        if (new bloodtransfucionService(request, response).viewDetails()) {
           System.out.println("view details completes");
            // return "patientDetails_1_NOT_REQUIRED.jsp";
            return "viewAllBloodtransfucion.jsp";

        } else {
            return "";
        }
     
    }

    private String viewDetails() {
     if (new bloodtransfucionService(request, response).viewDetailsOfUser()) {
            return "viewDetailsBloodtransfucion.jsp";

        } else {
            return "Controller?process=BloodtransfucionProcess&action=viewAll";
        }
    }

    private String deleteuser() {
         new bloodtransfucionService(request, response).deleteUser();
         return "Controller?process=BloodtransfucionProcess&action=viewAll";

    }

   
    }
    


