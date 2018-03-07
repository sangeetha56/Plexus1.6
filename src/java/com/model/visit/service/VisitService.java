/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.visit.service;

import com.model.bill.dao.BillDAO;
import com.model.bill.dto.Bill;
import com.model.doctorProcess.service.DoctorInfoService;
import com.model.investigation.dto.Investigation;
import com.model.investigationbill.dao.InvestigationBillDao;
import com.model.investigationbill.dto.Investigationbill;
import com.model.patient.dto.Patient;
import com.model.therapy.dto.Theraphy;
import com.model.therapybill.dao.TherapybillDao;
import com.model.therapybill.dto.Therapybill;
import com.model.visit.dao.VisitDAO;
import com.model.visit.dto.Visit;
import com.util.DataUtil;
import com.util.DateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mayur
 */
public class VisitService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public VisitService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    /**
     *
     * @return
     */
    public boolean addVisit() {
        long patientid;
        Date remindertime;
        Date visittime;
        long patientrating = 0;
        String remarks = "";
        Visit visit = new Visit();
        patientid = Long.parseLong(request.getParameter("patientID"));
       
        visittime = DateUtil.dateParser1(request.getParameter("appointmentDate"));
        
        remindertime = DateUtil.yesterdayDateParser1(request.getParameter("appointmentDate"));
      
        if (request.getParameter("remarks") == null) {
            remarks = "";
        } else if (request.getParameter("remarks") != null) {
            remarks = request.getParameter("remarks");
        }
        patientrating = 0;
        Patient patient = new Patient();
        patient.setId(patientid);
        visit.setPatient(patient);
        visit.setVisittime(visittime);
        visit.setRemindertime(remindertime);
        visit.setPatientrating(patientrating);
        visit.setRemarks(remarks);
        visit.setBp("");
        visit.setPulse(0l);
        visit.setRr(0l);
        visit.setDiagnosis("");
        visit.setInvestigation("");
        visit.setTreatment("");
        visit.setPresentcomplaint("");
        visit.setStatus(false);
        visit = new VisitDAO().create(visit);
        if (visit.getId() == 0l) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 
     * @return
     */
    public boolean visitByDate() {

        String date = request.getParameter("visitDay");
        Date queryDate = DateUtil.simpleDateParser(date);
        List<Visit> visits = new VisitDAO().readListOfObjects(queryDate);
        if (visits == null) {
            return false;
        } else {
            httpSession.setAttribute("visitsByDate", visits);
            return true;
        }
    }

    /**
     *
     * @return
     */
    public boolean todaysVisit() {
        Date today = new Date();
        String isPatientSelected = request.getParameter("isPatientSelected");
        if (isPatientSelected != null && isPatientSelected.equalsIgnoreCase("no")) {
            Patient patient = new Patient();
            patient.setId(0);
            patient.setName("");
            httpSession.setAttribute("patient", patient);

        } else {
        }
        today = DateUtil.todaysDate();
        List<Visit> visits = new VisitDAO().readListOfObjects(today);
        if (visits == null) {
            return false;
        } else {
            httpSession.setAttribute("visits", visits);
            return true;
        }
    }

    /**
     *
     */
    public void addAjaxVisit() {
        String appointmentDate = "";
        String[] dateTimeField = new String[0];
        String[] dateFields = new String[0];

        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(VisitService.class.getName()).log(Level.SEVERE, null, ex);
        }
        long patientid;
        boolean committed;
        Date remindertime;
        Date visittime;
        long patientrating = 0;
        String remarks = "";
        String departmntname = "";
        String doctrname = "";
        String consultnttypename = "";
        Visit visit = new Visit();
        patientid = Long.parseLong(request.getParameter("patientID"));
       
       
        visittime = DateUtil.dateParser1(request.getParameter("appointmentDate"));
       
        remindertime = DateUtil.yesterdayDateParser1(request.getParameter("appointmentDate"));
       
        if (request.getParameter("remarks") == null) {
            remarks = "";
        } else if (request.getParameter("remarks") != null) {
            remarks = request.getParameter("remarks");
        }
        if (request.getParameter("departmentname") == null) {
            departmntname = "";
        } else if (request.getParameter("departmentname") != null) {
            departmntname = request.getParameter("departmentname");
        }
        if (request.getParameter("doctorname") == null) {
            doctrname = "";
        } else if (request.getParameter("doctorname") != null) {
            doctrname = request.getParameter("doctorname");
        }
        if (request.getParameter("consultancytype") == null) {
            consultnttypename = "";
        } else if (request.getParameter("consultancytype") != null) {
            consultnttypename = request.getParameter("consultancytype");
        }
        patientrating = 0;
        Patient patient = new Patient();
        patient.setId(patientid);
        visit.setPatient(patient);
        visit.setVisittime(visittime);
        visit.setRemindertime(remindertime);
        visit.setPatientrating(patientrating);
        visit.setRemarks(remarks);
        visit.setBp("");
        visit.setPulse(0l);
        visit.setRr(0l);
        visit.setDiagnosis("");
        visit.setInvestigation("");
        visit.setTreatment("");
        visit.setPresentcomplaint("");
        visit.setStatus(true);
        visit.setDepartmenttype(departmntname);
        visit.setDoctorname(doctrname);
        visit.setConsultancytypename(consultnttypename);

        visit = new VisitDAO().create(visit);
        if (visit.getId() == 0l) {
            committed = false;
        } else {
            committed = true;
        }
        if (committed) {
            appointmentDate = request.getParameter("appointmentDate");
            dateTimeField = appointmentDate.split(" ");
            dateFields = dateTimeField[0].split("/");
            out.write("<output>");
            out.write("<success>true</success>");
            out.write("<month>" + dateFields[0] + "</month>");
            out.write("<day>" + dateFields[1] + "</day>");
            out.write("<year>" + dateFields[2] + "</year>");
            out.write("</output>");


        } else {
            out.write("<output>");
            out.write("<success>false</success>");
            out.write("</output>");


        }

    }

    /**
     *
     */
    public void updateAjaxVisit() {
        String appointmentDate = "";
        String[] dateTimeField = new String[0];
        String[] dateFields = new String[0];
        long visitid;
        boolean committed;
        long patientrating = 0;
        String remarks = "";
        String diagnosis = "";
        String investigations = "";
        String treatment = "";
        String bp = "";
        String finalDiagnosis = "";
        String consultationCharges = "";
        long pulse = 0l;
        long rr = 0l;
        Visit visit = new Visit();
        Bill bill = new Bill();
        visitid = Long.parseLong(request.getParameter("visitid"));
        
        remarks = DataUtil.emptyString(request.getParameter("remarks"));
        diagnosis = DataUtil.emptyString(request.getParameter("diagnosis"));
        investigations = DataUtil.emptyString(request.getParameter("investigations"));
        treatment = DataUtil.emptyString(request.getParameter("treatment"));
        bp = DataUtil.emptyString(request.getParameter("bp"));
        finalDiagnosis = DataUtil.emptyString(request.getParameter("finalDiagnosis"));
        
        consultationCharges = DataUtil.emptyString(request.getParameter("consultationCharges"));
        patientrating = DataUtil.parseLong(request.getParameter("patientrating"));
        pulse = DataUtil.parseLong(request.getParameter("pulse"));
        rr = DataUtil.parseLong(request.getParameter("rr"));



       
        String[] personalIds = request.getParameterValues("therapyaaray_id");
       BigDecimal totalcharge = BigDecimal.ZERO;



       
        String p=DataUtil.emptyString(request.getParameter("patient_id"));


        long p_id=DataUtil.parseLong(p);

        BigDecimal totalval = BigDecimal.ZERO;
        BigDecimal therapyval = BigDecimal.ZERO;
        BigDecimal investigationval = BigDecimal.ZERO;
        BigDecimal consultval = BigDecimal.ZERO;
        BigDecimal temp1 = BigDecimal.ZERO;
        BigDecimal temp2 = BigDecimal.ZERO;

        consultval = BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("consultationCharges")));
        therapyval = BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("therapyVal")));
        investigationval = BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("investigationVal")));

        temp1 = consultval.add(therapyval);
        temp2 = temp1.add(investigationval);
        totalval = temp2;

        visit.setPatientrating(patientrating);
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
        bill.setVisit(visit);
        bill.setConsultationcharges(BigDecimal.valueOf(DataUtil.parseDouble(consultationCharges)));
        bill.setCreateddate(DateUtil.todaysDate());
        bill.setTherapyname(request.getParameter("therapyName"));
        bill.setTherapycharge(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("therapyVal"))));
        bill.setInvestigationname(request.getParameter("investigationName"));
        bill.setInvestigationcharge(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("investigationVal"))));
        bill.setTotalbill(totalval);
        bill = new BillDAO().create(bill);

        Therapybill therapybill = new Therapybill();
        Patient patient = new Patient();
        Theraphy therapy = new Theraphy();
        Investigationbill investigationbill = new Investigationbill();
        Investigation investigation = new Investigation();

        if (request.getParameter("therapy_id").isEmpty()) {
          
        } else {

            therapybill.setTherapybilldate(DateUtil.todaysDate());
            therapybill.setTherapybillcharges(therapyval);
            therapybill.setTherapybillremark("");
            patient.setId(DataUtil.parseLong(request.getParameter("patient_id")));
            therapy.setTherphyid(DataUtil.parseLong(request.getParameter("therapy_id")));
            therapybill.setPatient(patient);
            therapybill.setTheraphy(therapy);
            therapybill.setDoctorinfo(null);

            therapybill = new TherapybillDao().addTherapyBill(therapybill);

        }

        if (request.getParameter("investigation_id").isEmpty()) {
            
        } else {
            investigationbill.setInvestigationbilldate(DateUtil.todaysDate());
            investigationbill.setInvestigationbillcharges(investigationval);
            investigationbill.setInvestigationbillremark("");
            patient.setId(DataUtil.parseLong(request.getParameter("patient_id")));
            investigation.setInvestigationid(DataUtil.parseLong(request.getParameter("investigation_id")));
            investigationbill.setPatient(patient);
            investigationbill.setDoctorinfo(null);
            investigationbill.setInvestigation(investigation);
            investigationbill = new InvestigationBillDao().addInvestigationBill(investigationbill);

        }




       
        visit = new VisitDAO().update(visit);
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException ex) {
            Logger.getLogger(VisitService.class.getName()).log(Level.SEVERE, null, ex);
        }
      
        out.write("<output>");
        out.write("<success>" + visit.getStatus() + "</success>");
        out.write("</output>");


    }

    /**
     *
     */
    public void rescheduleAjaxVisit() {
       
        Date remindertime;
        Date visittime;
        long visitId;
        String remark = "";
        Visit visit = new Visit();
        visitId = Long.parseLong(request.getParameter("visitid"));
        if (request.getParameter("remarks") == null) {
            remark = "";
        } else if (request.getParameter("remarks") != null) {
            remark = request.getParameter("remarks");
        }
        visittime = DateUtil.dateParser1(request.getParameter("appointmentDate"));
        remindertime = DateUtil.yesterdayDateParser1(request.getParameter("appointmentDate"));
        visit.setId(visitId);
        visit.setVisittime(visittime);
        visit.setRemindertime(remindertime);
        visit.setStatus(true);
        visit.setRemarks(remark);
        visit = new VisitDAO().update(visit, true);
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        out.write("<output>");
        out.write("<success>true</success>");
        out.write("</output>");

    }

    /**
     *
     * @return
     */
    public long addTodaysVisit() {

        long patientid;
        Date remindertime;
        Date visittime;
        long patientrating = 0;
        String remarks = "";
        Visit visit = new Visit();
        Patient patient = (Patient) httpSession.getAttribute("patient");
        visittime = DateUtil.todaysDateTime();
       
        remindertime = DateUtil.tomorrowsDate(visittime);

        if (request.getParameter("remarks") == null) {
            remarks = "";
        } else if (request.getParameter("remarks") != null) {
            remarks = request.getParameter("remarks");
        }
        patientrating = 0;


        visit.setPatient(patient);
        visit.setVisittime(visittime);
        visit.setRemindertime(remindertime);
        visit.setPatientrating(patientrating);
        visit.setRemarks(remarks);
        visit.setBp("");
        visit.setPulse(0l);
        visit.setRr(0l);
        visit.setDiagnosis("");
        visit.setInvestigation("");
        visit.setTreatment("");
        visit.setPresentcomplaint("");
        visit.setStatus(true);
        visit = new VisitDAO().create(visit);

        return patient.getId();


    }

    /**
     *
     */
    public void getNextVisits() {
        Long startHour, startMin;

        PrintWriter out = null;
        startHour = DataUtil.parseLong(request.getParameter("startHour"));
        startMin = DataUtil.parseLong(request.getParameter("startMin"));

        Date startDateTime, endDateTime;
        startDateTime = DateUtil.todaysDateTime(startHour.intValue(), startMin.intValue());
        endDateTime = DateUtil.todaysDateTime(startHour.intValue() + 1, 0);
        
        List<Visit> visits = new VisitDAO().readListOfObjects(startDateTime, endDateTime);
        try {
            out = response.getWriter();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        out.write("<Visits>");
        for (int i = 0; i < visits.size(); i++) {
            out.write("<Visit>");
            Visit visit = visits.get(i);
            Calendar calender = Calendar.getInstance();
            calender.setTime(visit.getVisittime());
            //Patient patient = new PatientDAO().queryById(visit.getPatientid());

            out.write("<PatientID>" + visit.getPatient().getId() + "</PatientID>");
            out.write("<VisitTime>" + DateUtil.format(visit.getVisittime()) + "</VisitTime>");
            out.write("<PatientName>" + visit.getPatient().getName() + "</PatientName>");


            out.write("</Visit>");
        }
        out.write("</Visits>");

    }

    /**
     *
     */
    public void deleteVisit() {
        long visitid;
        visitid = Long.parseLong(request.getParameter("visitid"));
      
        new VisitDAO().delete(visitid);
    }

    public boolean saveVisitWithoutAjax() {

       


        String appointmentDate = "";
        String[] dateTimeField = new String[0];
        String[] dateFields = new String[0];

        
        
        long patientid;
        
        Date remindertime;
        Date visittime;
        long patientrating = 0;
        String remarks = "";
        String departmntname = "";
        String doctrname = "";
        String consultnttypename = "";
        Visit visit = new Visit();
        String departmentname=null;
        String doctorname=null;
        int doctorid=0;
        int check=0;
        patientid = Long.parseLong(request.getParameter("patientID"));
        
        visittime = DateUtil.dateParser1(request.getParameter("appointmentDate"));
        
        remindertime = DateUtil.yesterdayDateParser1(request.getParameter("appointmentDate"));
       

        if (request.getParameter("remarks") == null) {
            remarks = "";
        } else if (request.getParameter("remarks") != null) {
            remarks = request.getParameter("remarks");
        }
        if (request.getParameter("departmentname") == null) {
            departmntname = "";
        } else if (request.getParameter("departmentname") != null) {
            departmntname = request.getParameter("departmentname");
        }
        if (request.getParameter("doctorname") == null) {
            doctrname = "";
        } else if (request.getParameter("doctorname") != null) {
            doctrname = request.getParameter("doctorname");
        }
        if (request.getParameter("consultancytype") == null) {
            consultnttypename = "";
        } else if (request.getParameter("consultancytype") != null) {
            consultnttypename = request.getParameter("consultancytype");
        }

         check=DataUtil.emptyIntValueFromString(request.getParameter("state"));
       
        if(check==0 || check==-1)
        {
        }
        else{
            
            doctorid=Integer.parseInt(request.getParameter("state"));
       if(new DoctorInfoService(request, response).fetchDoc_DeptName(doctorid))
       {
           
       }
       else
       {
            
       }
        departmentname=(String)httpSession.getAttribute("doctorname");
        doctorname=(String)httpSession.getAttribute("departmentname");

        }
        patientrating = 0;
        Patient patient = new Patient();
        patient.setId(patientid);
        visit.setPatient(patient);
        visit.setVisittime(visittime);
        visit.setRemindertime(remindertime);
        visit.setPatientrating(patientrating);
        visit.setRemarks(remarks);
        visit.setBp("");
        visit.setPulse(0l);
        visit.setRr(0l);
        visit.setDiagnosis("");
        visit.setInvestigation("");
        visit.setTreatment("");
        visit.setPresentcomplaint("");
        visit.setStatus(true);
        visit.setDepartmenttype(departmentname);
        visit.setDoctorname(doctorname);
        visit.setConsultancytypename(consultnttypename);

        visit = new VisitDAO().create(visit);
        if (visit.getId() == 0l) {
            return false;
        } else {
            return true;
        }


    }
}
