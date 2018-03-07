/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.therapy.action;

import com.model.therapy.service.TheraphyService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sultan
 */
public class TheraphyAction {

     HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public TheraphyAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

          if (action.equalsIgnoreCase("add")) {
           
            url = addTherapyType();
        }

          else if (action.equalsIgnoreCase("addTherapyType1")) {
           
            url = addTherapyType1();
        }

          else if (action.equalsIgnoreCase("editTherapyType")) {
           
            url = updateTherapyType();
        }

          else if (action.equalsIgnoreCase("deleteTherapyType")) {
           
            url = deleteTherapyType();
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


    private String addTherapyType() {

          if (new TheraphyService(request, response).addTherapyType()) {
        //   return "Controller?process=TherapyProcess&action=viewAll";
              return "savedTherapy.jsp";
        } else {
            return "notSaved.jsp";
        }
    }


    private String addTherapyType1() {

          if (new TheraphyService(request, response).addTherapyType1()) {
           // return "manageTherapy.jsp";
            return "therapy.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String updateTherapyType() {

          if (new TheraphyService(request, response).updateTherapyType()) {
            return "Controller?process=TherapyProcess&action=viewAll";
        } else {
            return "notSaved.jsp";
        }
    }


    private String deleteTherapyType() {

            
            if (new TheraphyService(request, response).deleteTherapyType())
            {
      //  return "Controller?process=TherapyProcess&action=viewAll" ;
                 return "therapy.jsp";
            }
            else
            {
               return "notSaved.jsp";
            }

    }

    private String viewAll() {
       
           new TheraphyService(request, response).viewAllTherapyType();
       
        return "viewAllTherapyType.jsp";
    }


    private String viewDetails() {

        if (new TheraphyService(request, response).viewDetailsTherapyType()) {
           
            return "therapyTypeDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

    private String deleteMultiple() {

        new TheraphyService(request, response).deleteMultiple();
        return "therapy.jsp";
    }

}
