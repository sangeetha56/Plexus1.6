/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.user.ajaxaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mayur
 */
public class UserAjaxAction {
    HttpServletRequest request;
    HttpServletResponse response;

    /**
     *
     * @param request
     * @param response
     */
    public UserAjaxAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }
    /**
     *
     * @param action
     */
    public void execute(String action) {
    }


}
