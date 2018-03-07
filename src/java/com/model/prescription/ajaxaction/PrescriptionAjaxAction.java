/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.prescription.ajaxaction;

import com.model.prescription.service.PrescriptionService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class PrescriptionAjaxAction {
    HttpServletRequest request;
    HttpServletResponse response;

    /**
     *
     * @param request
     * @param response
     */
    public PrescriptionAjaxAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }
    /**
     *
     * @param action
     */
    public void execute(String action) {
        if (action.equalsIgnoreCase("addAjaxPrescription")) {
            new PrescriptionService(request, response).addAjaxPrescription();

        }
    }

}
