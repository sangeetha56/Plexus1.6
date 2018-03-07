/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inVisit.service;

import com.model.inPatient.dto.Inpatient;
import com.model.inVisit.dao.InvisitDAO;
import com.model.inVisit.dto.Invisit;
import com.model.inbill.dao.InbillDAO;
import com.model.inbill.dto.Inbill;
import com.util.DataUtil;
import com.util.DateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class InVisitService {

      private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public InVisitService(HttpServletRequest request, HttpServletResponse response) {
         this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public void addAjaxVisit() {

          String appointmentDate = "";
        String[] dateTimeField = new String[0];
        String[] dateFields = new String[0];
        long visitid;
        Long countid;
         long patientid;
        boolean committed;

        long patientrating = 0;
        String remarks = "";
        String diagnosis = "";
        String investigations = "";
        String treatment = "";
        String bp = "";
        String finalDiagnosis = "";
        String consultationCharges = "";
        String managentPlan="";
        String timeVisit="";
        long pulse = 0l;
        long rr = 0l;
        Date doctorvisit;
        Invisit visit = new Invisit();
   Inbill bill = new Inbill();
    Inpatient patient = new Inpatient();
      
        
       // visitid = Long.parseLong(request.getParameter("visitid"));
      //  System.out.println("visitid" + request.getParameter("visitid") + visitid);



   // doctorvisit =DateUtil.dateParser1(request.getParameter("appointmentDate"));
    countid=DataUtil.parseLong(request.getParameter("countid"));
     doctorvisit =DateUtil.simpleDateParser(request.getParameter("doctorvisit"));
      timeVisit =DataUtil.emptyString(request.getParameter("visittime"));
      // System.out.println("doctor's visittime =" + doctorvisit);
        remarks = DataUtil.emptyString(request.getParameter("remarks"));
        diagnosis = DataUtil.emptyString(request.getParameter("diagnosis"));
        investigations = DataUtil.emptyString(request.getParameter("investigations"));
        treatment = DataUtil.emptyString(request.getParameter("treatment"));
        bp = DataUtil.emptyString(request.getParameter("bp"));
        finalDiagnosis = DataUtil.emptyString(request.getParameter("finalDiagnosis"));
       // System.out.println("finalDiagnosis "+finalDiagnosis);
        consultationCharges = DataUtil.emptyString(request.getParameter("consultationCharges"));
        patientrating = DataUtil.parseLong(request.getParameter("patientrating"));
        pulse = DataUtil.parseLong(request.getParameter("pulse"));
        rr = DataUtil.parseLong(request.getParameter("rr"));
         managentPlan=DataUtil.emptyString(request.getParameter("managementPlan"));
         patientid = Long.parseLong(request.getParameter("patientid"));

           patient.setId(patientid);

          visit.setVisittime(doctorvisit);
          visit.setTime(timeVisit);
        //  visit.setCountid(countid);
        visit.setPatientrating(patientrating);
       visit.setInpatient(patient);
        visit.setRemarks(remarks);
        visit.setCountid(countid);
        visit.setBp(bp);
        visit.setPulse(pulse);
        visit.setRr(rr);
        visit.setDiagnosis(diagnosis);
        visit.setPatientrating(patientrating);
        visit.setInvestigation(investigations);
        visit.setTreatment(treatment);
        visit.setPresentcomplaint("");
        visit.setFinaldiagnosis(finalDiagnosis);
        visit.setStatus(false);
        visit.setManagementplan(managentPlan);
          visit = new InvisitDAO().create(visit);
 
           visit.setId(visit.getId());
      bill.setInvisit(visit);
        bill.setConsultationcharges(BigDecimal.valueOf(DataUtil.parseDouble(consultationCharges)));
       bill.setCreateddate(DateUtil.todaysDate());
       bill = new InbillDAO().create(bill);
       // System.out.println("diagnosis " + visit.getDiagnosis());

         // System.out.println("cosult charge= " + bill.getConsultationcharges());
         //System.out.println("created date= " + bill.getCreateddate());
      
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(InVisitService.class.getName()).log(Level.SEVERE, null, ex);
        }
       // System.out.println("status " + visit.getStatus());
        out.write("<output>");
        out.write("<success>" + visit.getStatus() + "</success>");
        out.write("</output>");


    }

    public void updateAjaxVisit() {



           String appointmentDate = "";
        String[] dateTimeField = new String[0];
        String[] dateFields = new String[0];
        long visitid;
         long patientid;
        boolean committed;

        long patientrating = 0;
        String remarks = "";
        String diagnosis = "";
        String investigations = "";
        String treatment = "";
        String bp = "";
        String finalDiagnosis = "";
        String consultationCharges = "";
        String managentPlan="";
        long pulse = 0l;
        long rr = 0l;
        Date doctorvisit;
        String visittime="";
        Long visitno;
        Invisit visit = new Invisit();
   Inbill bill = new Inbill();
    Inpatient patient = new Inpatient();


      visitid = Long.parseLong(request.getParameter("visitid"));
      // System.out.println("visitid" + request.getParameter("visitid") + visitid);



    doctorvisit = DateUtil.simpleDateParser(request.getParameter("doctorvisit"));
    visitno=DataUtil.parseLong(request.getParameter("visitno"));
       // System.out.println("visit no==="+visitno);
    visittime=DataUtil.emptyString(request.getParameter("visittime"));
    // System.out.println("visittime =" + visittime);
     //  System.out.println("doctor's visittime =" + doctorvisit);
        remarks = DataUtil.emptyString(request.getParameter("remarks"));
        diagnosis = DataUtil.emptyString(request.getParameter("diagnosis"));
        investigations = DataUtil.emptyString(request.getParameter("investigations"));
        treatment = DataUtil.emptyString(request.getParameter("treatment"));
        bp = DataUtil.emptyString(request.getParameter("bp"));
        finalDiagnosis = DataUtil.emptyString(request.getParameter("finalDiagnosis"));
       // System.out.println("finalDiagnosis "+finalDiagnosis);
        consultationCharges = DataUtil.emptyString(request.getParameter("consultationCharges"));
        patientrating = DataUtil.parseLong(request.getParameter("patientrating"));
        pulse = DataUtil.parseLong(request.getParameter("pulse"));
        rr = DataUtil.parseLong(request.getParameter("rr"));
         managentPlan=DataUtil.emptyString(request.getParameter("managementplan"));
        // System.out.println("management plan"+managentPlan);
         patientid = Long.parseLong(request.getParameter("patientid"));

           patient.setId(patientid);
          visit.setVisittime(doctorvisit);
          visit.setTime(visittime);
          visit.setCountid(visitno);
        visit.setPatientrating(patientrating);
       visit.setInpatient(patient);
       visit.setId(visitid);
        visit.setRemarks(remarks);
        visit.setBp(bp);
        visit.setPulse(pulse);
        visit.setRr(rr);
        visit.setDiagnosis(diagnosis);
        visit.setPatientrating(patientrating);
        visit.setInvestigation(investigations);
        visit.setTreatment(treatment);
        visit.setPresentcomplaint("");
        visit.setFinaldiagnosis(finalDiagnosis);
        visit.setStatus(false);
        visit.setManagementplan(managentPlan);
          visit = new InvisitDAO().update(visit);

      //     visit.setId(visit.getId());
//      bill.setInvisit(visit);
//        bill.setConsultationcharges(BigDecimal.valueOf(DataUtil.parseDouble(consultationCharges)));
//       bill.setCreateddate(DateUtil.todaysDate());
//       bill = new InbillDAO().create(bill);
//        System.out.println("diagnosis " + visit.getDiagnosis());
//
//          System.out.println("cosult charge= " + bill.getConsultationcharges());
//         System.out.println("created date= " + bill.getCreateddate());

        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(InVisitService.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("status " + visit.getStatus());
        out.write("<output>");
        out.write("<success>" + visit.getStatus() + "</success>");
        out.write("</output>");


        
    }

    public Long deletePatientVisit() {

          long visitid=0;
          long patientid=0;
        visitid = Long.parseLong(request.getParameter("visitid"));
       patientid=Long.parseLong(request.getParameter("patientId"));
       // System.out.println("id " +visitid);
        // System.out.println("id " +patientid);

        new InvisitDAO().delete(visitid);

          response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(InVisitService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return patientid;
    }

    public void deleteAjaxPatientVisit() {
  Invisit visit = new Invisit();
          long visitid;
          long patientid;
        visitid = Long.parseLong(request.getParameter("visitid"));
       patientid=Long.parseLong(request.getParameter("patientid"));
        //System.out.println("id " +visitid);
         //System.out.println("id " +patientid);
         visit.setId(visitid);
           visit = new InvisitDAO().delete(visit);
      //  new InvisitDAO().delete(visit);

         response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(InVisitService.class.getName()).log(Level.SEVERE, null, ex);
        }
        //System.out.println("status " + visit.getStatus());
        out.write("<output>");
        out.write("<success>" + visit.getStatus() + "</success>");
        out.write("</output>");

    

    }







   
    }

