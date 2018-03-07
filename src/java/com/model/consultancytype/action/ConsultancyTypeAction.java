/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.consultancytype.action;
import com.model.consultancytype.service.ConsultancyTypeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Admin
 */
public class ConsultancyTypeAction {

    HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public ConsultancyTypeAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

          if (action.equalsIgnoreCase("add")) {
           
            url = addConsultancyType();
        }
          else if (action.equalsIgnoreCase("add1")) {
           
            url = addConsultancyType1();
        }

          else if (action.equalsIgnoreCase("updateConsultancy")) {
            
            url = updateConsultancy();
        }

          else if (action.equalsIgnoreCase("delete")) {
          
            url = deleteConsultancy();
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

    private String addConsultancyType() {
       

          if (new ConsultancyTypeService(request, response).addConsultancyType()) {
             
              return "savedConsultancyType.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String addConsultancyType1() {

          if (new ConsultancyTypeService(request, response).addConsultancyType1()) {
            return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String updateConsultancy() {
       
          if (new ConsultancyTypeService(request, response).updateConsultancy()) {
            
            return "updatedConsultancy.jsp";
              //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }


    private String deleteConsultancy() {

            if (new ConsultancyTypeService(request, response).deleteConsultancy())
            {
                 // return "Controller?process=ConsultancyProcess&action=viewAll" ;
                return "consultancyTab.jsp" ;
            }
            else
            {
               return "notSaved.jsp";
            }

    }
    private String viewAll() {
       
           new ConsultancyTypeService(request, response).viewAllConsultancy();
       
        return "viewAllConsultancy.jsp";
    }


    private String viewDetails() {

        if (new ConsultancyTypeService(request, response).viewDetailsConsultancyType()) {
            
            return "consultancyTypeDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }


     private String deleteMultiple() {

        new ConsultancyTypeService(request, response).deleteMultiple();
        return "consultancyTab.jsp";
    }




}
