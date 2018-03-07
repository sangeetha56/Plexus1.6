/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.prescription.action;

import com.model.dossage.service.DossageService;
import com.model.prescription.dto.Prescription;
import com.model.prescription.service.PrescriptionService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class PrescriptionAction {

    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    /**
     *
     * @param request
     * @param response
     */
    public PrescriptionAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    /**
     *
     * @param action
     * @return
     */
    public String execute(String action) {
        if (action.equalsIgnoreCase("add")) {
            url = add();

        }
        if (action.equalsIgnoreCase("viewAll")) {
            url = viewAll();

        }

        return url;

    }

    private String add() {

        Prescription prescription = new PrescriptionService(request, response).add();
        new DossageService(request, response).addMultipleDossage(prescription);
        return "saved.jsp";
    }

    private String viewAll() {

        new PrescriptionService(request, response).viewAll();
        return "viewAllPrescription.jsp";
    }
}
