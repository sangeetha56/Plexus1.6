/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.biochemistry.action;

import com.model.biochemistry.service.BiochemistryService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class BiochemistryAction {
     HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public BiochemistryAction(HttpServletRequest request, HttpServletResponse response) {
         this.request = request;
        this.response = response;
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
         if (new BiochemistryService(request, response).add()) {

              return "previewBiochemistry.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }

    }
     private String previewBill() {
        new BiochemistryService(request, response).preview();
        return "printBiochemistry.jsp";
    }


    private String printBill() {
        new BiochemistryService(request, response).preview();
        return "printBiochemistry.jsp";
    }

    private String viewAll() {
         new BiochemistryService(request, response).viewAll();

        return "viewAllBiochemistry.jsp";
    }
}
