/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.department.action;
import com.model.department.service.DepartmentNameService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class DepartmentNameAction {
    HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public DepartmentNameAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

          if (action.equalsIgnoreCase("add")) {
           
            url = addDepartmentName();
        }
         
          else if (action.equalsIgnoreCase("add1")) {
           
            url = addDepartmentName1();
        }

          else if (action.equalsIgnoreCase("editDepartment")) {
            
            url = updateDepartmentName();
        }

          else if (action.equalsIgnoreCase("delete")) {
           
            url = deleteDepartmentName();
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

    private String addDepartmentName() {

          if (new DepartmentNameService(request, response).addDepartmentName()) {
            return "savedDepartmentType.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String addDepartmentName1() {

          if (new DepartmentNameService(request, response).addDepartmentName1()) {
            return "DepartmentTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String updateDepartmentName() {

          if (new DepartmentNameService(request, response).updateDepartmentName()) {
            return "savedDepartmentType.jsp";
        } else {
            return "notSaved.jsp";
        }
    }


    private String deleteDepartmentName() {

            
            if (new DepartmentNameService(request, response).deleteDepartmentName())
            {
        return "DepartmentTab.jsp" ;
            }
            else
            {
               return "notSaved.jsp";
            }

    }
     private String viewAll() {
    
           new DepartmentNameService(request, response).viewAllDepartment();
        
        return "viewAllDepartment.jsp";
    }
      private String viewDetails() {

        if (new DepartmentNameService(request, response).viewDetailsDepartmentType()) {
           
            return "departmentDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

      private String deleteMultiple() {

        new DepartmentNameService(request, response).deleteMultiple();
        return "DepartmentTab.jsp";
    }


}

