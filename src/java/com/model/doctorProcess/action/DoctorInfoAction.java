/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.doctorProcess.action;

import com.model.doctorProcess.service.DoctorInfoService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Admin
 */
public class DoctorInfoAction {
    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    public DoctorInfoAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

            if (action.equalsIgnoreCase("add")) {
            
            url = addDoctor();
        }

         else if (action.equalsIgnoreCase("viewAll")) {
           
            url = viewAll();
              }

            else if (action.equalsIgnoreCase("viewDetails"))
           {
           
            url = viewDetails();
           }

           else if (action.equalsIgnoreCase("updateDoctorDetails")) {
           
            url = updateDoctorDetails();
        }
            else if (action.equalsIgnoreCase("deleteDoctor")) {
            
            url = deleteDoctor();
        }

             else if (action.equalsIgnoreCase("deleteMultiple")) {
           
            url = deleteMultiple();

        }



           return url;

    }

    private String addDoctor() {
        
          if (new DoctorInfoService(request, response).addDoctor()) {
            return "savedDoctor.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewAll() {
       
           new DoctorInfoService(request, response).viewAllDoctor();
       // System.out.println("IN action's view all");
        return "viewAllDoctor.jsp";
    }

    private String viewDetails() {

        if (new DoctorInfoService(request, response).viewDetailsOfDoctor()) {
           
            return "doctorDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

    private String updateDoctorDetails() {


       
        new DoctorInfoService(request, response).updateDoctorDetails();
        return "doctorTab.jsp";
        
    }

    private String deleteDoctor() {

        new DoctorInfoService(request, response).deleteDoctor();
        return "doctorTab.jsp";

    }

    private String deleteMultiple() {

        new DoctorInfoService(request, response).deleteMultiple();
        return "doctorTab.jsp";
    }

}
