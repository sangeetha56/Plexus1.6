/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.gst.action;

import com.model.gst.service.GstService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class GstAction {
  HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public GstAction(HttpServletRequest request, HttpServletResponse response) {
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
         if (new GstService(request, response).add()) {

              return "savedGst.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }

    }

}
