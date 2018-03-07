/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inVisit.ajaxaction;

import com.model.inVisit.service.InVisitService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class InVisitAjaxAction {

    HttpServletRequest request;
    HttpServletResponse response;

    public InVisitAjaxAction(HttpServletRequest request, HttpServletResponse response) {
          this.request = request;
        this.response = response;

    }

    public void execute(String action) {
        

            if (action.equalsIgnoreCase("addAjaxVisit")) {
            new InVisitService(request, response).addAjaxVisit();
           }
            
            else   if (action.equalsIgnoreCase("updateAjaxVisit")) {
            new InVisitService(request, response).updateAjaxVisit();
           }


              else   if (action.equalsIgnoreCase("deleteAjaxVisit")) {
            new InVisitService(request, response).deleteAjaxPatientVisit();
           }


    }

}
