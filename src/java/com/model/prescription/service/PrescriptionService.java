/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.prescription.service;

import com.model.prescription.dao.PrescriptionDAO;
import com.model.prescription.dto.Prescription;
import com.model.visit.dto.Visit;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class PrescriptionService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public PrescriptionService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        httpSession = request.getSession();
    }

    /**
     *
     * @return
     */
    public Prescription add() {

        long visitId;
        visitId = Long.parseLong(request.getParameter("visitId"));
        Visit visit = new Visit();
        Prescription prescription = new Prescription();
        visit.setId(visitId);
        prescription.setVisit(visit);
        prescription = new PrescriptionDAO().create(prescription);
        return prescription;
    }

    /**
     *
     */
    public void addAjaxPrescription() {
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
        }
        long visitId;
        visitId = Long.parseLong(request.getParameter("visitid"));
        Visit visit = new Visit();
        Prescription prescription = new Prescription();
        visit.setId(visitId);
        prescription.setVisit(visit);
        prescription = new PrescriptionDAO().create(prescription);
        out.write("<output>");
        out.write("<PrescriptionId>"+prescription.getId()+"</PrescriptionId>");

        out.write("</output>");

    }

    /**
     *
     */
    public void  viewAll() {
       List<Prescription> prescriptions=new PrescriptionDAO().readListofObjects();
       httpSession.setAttribute("prescriptions", prescriptions);

    }
}
 