/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.bbiochemistry.action;

import com.model.bbiochemistry.service.BbiochemistryService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class BbiochemistryAction {
 HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;
    public BbiochemistryAction(HttpServletRequest request, HttpServletResponse response) {
    this.request = request;
        this.response = response;
    }

    public String execute(String action) {
       if (action.equalsIgnoreCase("add")) {

            url = add();
        }
       return url;
    }

    private String add() {
        if (new BbiochemistryService(request, response).add()) {

              return "savedBbiochemistry.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }

    }

}
