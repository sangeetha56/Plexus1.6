/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inVisit.action;

import com.model.inVisit.service.InVisitService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class InvisitAction {
      HttpServletRequest request;
    HttpServletResponse response;
    String url;



      public InvisitAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }


       public String execute(String action) {
        if (action.equalsIgnoreCase("deletePatientVisit")) {
            url = deletePatientVisit();
        }
        return url;
    }

    private String deletePatientVisit() {
       Long id=  new InVisitService(request, response).deletePatientVisit();
        return "Controller?process=InPatientProcess&action=viewDetails&id="+id;
    }

}
