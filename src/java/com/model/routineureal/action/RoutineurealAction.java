/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.routineureal.action;

import com.model.routineureal.service.RoutineurealService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class RoutineurealAction {
 HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;


    public RoutineurealAction(HttpServletRequest request, HttpServletResponse response) {
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
        if (new RoutineurealService(request, response).add()) {

              return "savedRoutineurine.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }

    }

}
