/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.lab.action;

import com.model.lab.service.LabService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class LabAction {

     HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

       public LabAction(HttpServletRequest request, HttpServletResponse response) {
         this.request = request;
        this.response = response;

        Driver
    }
   

     public String execute(String action) {
       if (action.equalsIgnoreCase("add")) {

            url = add();
        }
        if (action.equals("previewBill")) {
            url = previewBill();
        }
        if(action.equalsIgnoreCase("printBill")){
            url=printBill();
        }
       else if (action.equalsIgnoreCase("viewAll")) {

            url = viewAll();
              }
          return url;
    }

    private String add() {
         if (new LabService(request, response).add()) {

              return "previewLab.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }

    }
     private String previewBill() {
        new LabService(request, response).preview();
        return "printLab.jsp";
    }


    private String printBill() {
        new LabService(request, response).preview();
        return "printLab.jsp";
    }

    private String viewAll() {
         new LabService(request, response).viewAll();

        return "viewAllLab.jsp";
    }
}

