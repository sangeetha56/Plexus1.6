/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.visit.action;

import com.model.patient.service.PatientService;
import com.model.visit.service.VisitService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mayur
 */
public class VisitAction {

    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    /**
     *
     * @param request
     * @param response
     */
    public VisitAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }
    /**
     *
     * @param action
     * @return
     */
    public String execute(String action) {
        if (action.equalsIgnoreCase("add")) {
            url = add();
        } else if (action.equalsIgnoreCase("viewTodaysAppointment")) {
            url = viewTodaysVisit();
        }
        else if (action.equalsIgnoreCase("addAppointmentForExistingPatient")) {
            url = addAppointmentForExistingPatient();
        }
        else if (action.equalsIgnoreCase("setTodaysAppointment")) {
            url = setTodaysAppointment();
        }
        else if (action.equalsIgnoreCase("deleteAppointment")){
            url=deleteAppointment();
        }


        else if (action.equalsIgnoreCase("saveVisitWithoutAjax")){
            url=saveVisitWithoutAjax();
        }
        return url;
    }

    private String add() {
        if (new VisitService(request, response).addVisit()) {
            return "saved.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewTodaysVisit() {
        if (new VisitService(request, response).todaysVisit()) {
          //  new PatientService(request, response).listAllPatient();


            return  "scheduler.jsp";
        } else {
            return  "notSaved.jsp";
        }
    }
    private String addAppointmentForExistingPatient() {
        new PatientService(request, response).fetchAllPatient();
        return "addAppointment_1.jsp";
    }

    private String setTodaysAppointment() {
        return "Controller?process=PatientProcess&action=viewDetails&id="+new VisitService(request, response).addTodaysVisit() ;


    }

    private String deleteAppointment() {
        new VisitService(request, response).deleteVisit();
        return "Controller?process=VisitProcess&action=viewTodaysAppointment&isPatientSelected=no";
    }

    private String saveVisitWithoutAjax() {
      
         if (new VisitService(request, response).saveVisitWithoutAjax()) {
            return "Controller?process=VisitProcess&action=viewTodaysAppointment&isPatientSelected=no";
        } else {
            return "notSaved.jsp";
        }
        //return "Controller?process=VisitProcess&action=viewTodaysAppointment&isPatientSelected=no";
    }

    
}
