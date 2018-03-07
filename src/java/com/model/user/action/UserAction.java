/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.user.action;

import com.model.user.service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mayur
 */
public class UserAction {

    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    /**
     *
     * @param request
     * @param response
     */
    public UserAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    /**
     *
     * @param action
     * @return
     */
    public String execute(String action) {
        if (action.equalsIgnoreCase("authenticateUser")) {
            url = authenticateUser();
        }
             else if (action.equalsIgnoreCase("addUser")) {
           // System.out.println("addUser");
            url = addUser();
          }
        else if (action.equalsIgnoreCase("addnewuser")) {
           url = addnewuser();
        }
        else if (action.equalsIgnoreCase("viewAllUsers")) {
           // System.out.println("viewAllUsers");
            url = viewAllUsers();
        }
        else if (action.equalsIgnoreCase("logout")) {
            url = logOutUser();
        }

         else if (action.equalsIgnoreCase("deleteMultiple")) {

            url = deleteMultiple();

        }

        else if (action.equalsIgnoreCase("viewDetails")) {
            url = viewDetails();
        }

        else if (action.equalsIgnoreCase("updateUser")) {
            url = updateUser();
        }
        else if (action.equalsIgnoreCase("deleteUser")) {
            url = deleteuser();
        }
        return url;
    }

    private String authenticateUser() {
        if (new UserService(request, response).authenticateUser()) {

            return "login.jsp?login_success=true";
        } else {
            return "login.jsp?login_success=false";
        }
    }

    private String logOutUser() {
        new UserService(request, response).logOutUser();
        return "login.jsp?logout=true";

    }
    private String addUser() {
        if (new UserService(request, response).addUser()) {
            return "savedUser.jsp";
        } else {
            return "notSaved.jsp";
        }
    }
         private String addnewuser() {
        if (new UserService(request, response).addNewUser()) {
            return "userTypeForm.jsp";
        } else {
            return "cannotAdd.jsp";
        }

       
    }
          private String viewAllUsers() {
        if (new UserService(request, response).viewAllUsers()) {
            System.out.println("IN action's view all");
            return "viewAllUsers.jsp";
        }
        return "";
    }

          private String deleteMultiple() {
        new UserService(request, response).deleteMultiple();
        return "Controller?process=UserProcess&action=viewAllUsers";
    }

          private String viewDetails() {
        if (new UserService(request, response).viewDetailsOfUser()) {
            return "userDetails.jsp";
           
        } else {
            return "Controller?process=UserProcess&action=viewAllUsers";
        }
    }

    private String updateUser() {
        if (new UserService(request, response).updateUser()) {

            return "Controller?process=UserProcess&action=viewAllUsers";
        } else {

            return "Controller?process=UserProcess&action=viewAllUsers";
        }

    }


    private String deleteuser() {
        new UserService(request, response).deleteUser();
        return "Controller?process=UserProcess&action=viewAllUsers";
    }
}
    
