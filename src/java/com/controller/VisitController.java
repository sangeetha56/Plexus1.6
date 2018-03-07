/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.patient.dto.Patient;
import com.model.patient.dao.PatientDAO;
import com.model.visit.dto.Visit;
import com.model.visit.dao.VisitDAO;
import com.util.DateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 *
 * @author Mayur
 */
public class VisitController extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @SuppressWarnings("static-access")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        try {
            String date = request.getParameter("visitDay");
            Date queryDate = DateUtil.simpleDateParser(date);
            List<Visit> visits = new VisitDAO().readListOfObjects(queryDate);
            System.out.println("visit" + visits.size());
            out.write("<Visits>");
            for (int i = 0; i < visits.size(); i++) {
                out.write("<Visit>");
                Visit visit = visits.get(i);
                Calendar calender = Calendar.getInstance();
                calender.setTime(visit.getVisittime());
                //Patient patient = new PatientDAO().queryById(visit.getPatientid());
                out.write("<ID>" + visit.getId() + "</ID>");
                out.write("<HourID>"+calender.get(Calendar.HOUR_OF_DAY)+"</HourID>");
                out.write("<PatientID>" + visit.getPatient().getId() + "</PatientID>");
                out.write("<ReminderTime>" + visit.getRemindertime() + "</ReminderTime>");
                out.write("<VisitTime>" + visit.getVisittime() + "</VisitTime>");
                out.write("<Rating>" + visit.getPatientrating() + "</Rating>");
                out.write("<PatientName>" + visit.getPatient().getName() + "</PatientName>");
                out.write("<PatientComplaint>" + visit.getPatient().getChiefcomplaints() + "</PatientComplaint>");
                
                out.write("</Visit>");
            }
            out.write("</Visits>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
