/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.visit.ajaxaction;

import com.model.visit.service.VisitService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mayur
 */
public class VisitAjaxAction {

    HttpServletRequest request;
    HttpServletResponse response;

    /**
     *
     * @param request
     * @param response
     */
    public VisitAjaxAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    /**
     *
     * @param action
     */
    public void execute(String action) {
        if (action.equalsIgnoreCase("addAjaxVisit")) {
           // System.out.println("doctor name is:-"+request.getParameter("state"));
           // System.out.println("look here");
            new VisitService(request, response).addAjaxVisit();

        } else if (action.equalsIgnoreCase("updateAjaxVisit")) {
            new VisitService(request, response).updateAjaxVisit();

        } else if (action.equalsIgnoreCase("rescheduleAjaxVisit")) {
           // System.out.println("in rescheduleAjaxVisit");
            new VisitService(request, response).rescheduleAjaxVisit();

        } else if (action.equalsIgnoreCase("getAJaxNextVisit")) {

            new VisitService(request, response).getNextVisits();

        } else if (action.equalsIgnoreCase("deleteAppointment")) {
           // System.out.println("test");
            new VisitService(request, response).deleteVisit();
        }
    }
}
