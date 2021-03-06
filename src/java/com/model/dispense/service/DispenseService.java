/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dispense.service;

import com.model.dispense.dao.DispenseDAO;
import com.model.dispense.dto.Dispense;
import com.model.patient.dto.Patient;
import com.util.DataUtil;
import com.util.DateUtil;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class DispenseService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public DispenseService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession=request.getSession();
    }

    /**
     *
     * @return
     */
    public Dispense add() {
        Patient patient=new Patient();
        Dispense dispense=new Dispense();
        Date dispenseDate=new Date();
        Long patientId=0l;       
        patientId=DataUtil.parseLong(request.getParameter("patientID"));
        patient.setId(patientId);
        dispense.setPatient(patient);
        dispenseDate=DateUtil.simpleDateParser(request.getParameter("dispenseDate"));
        dispense.setDispensedate(dispenseDate);
        dispense=new DispenseDAO().create(dispense);
        return dispense;
    }

    /**
     *
     * @param dispense
     */
    public void preview(Dispense dispense) {

        dispense=new DispenseDAO().readUniqueObject(dispense.getId());
        httpSession.setAttribute("dispense", dispense);
    }
    /**
     *
     */
    public void preview() {
        long id=DataUtil.parseLong(request.getParameter("id"));
        Dispense dispense=new DispenseDAO().readUniqueObject(id);
        httpSession.setAttribute("dispense", dispense);
    }
    /**
     *
     */
    public void todaysBill() {
       
        Double medicinebillnamount =0.0;
        
        Date todays=new Date();
       
        List<Dispense> dispenses=new DispenseDAO().readListOfObjects();
        Iterator<Dispense> iterator=dispenses.iterator();
       
        while (iterator.hasNext()) {
            Dispense dispense = iterator.next();
            medicinebillnamount=medicinebillnamount+0.0;
           
        }


        httpSession.setAttribute("dispenses", dispenses);
        httpSession.setAttribute("firstdate", todays);
        httpSession.setAttribute("seconddate", todays);
        httpSession.setAttribute("totalMedicineBill", todays);
    }

    /**
     *
     */
    public void showBills() {
        Date dispenseDate=new Date();
        dispenseDate=DateUtil.simpleDateParser(request.getParameter("dispenseDate"));

        
        List<Dispense> dispenses=new DispenseDAO().readListOfObjects(dispenseDate);
        httpSession.setAttribute("dispenses", dispenses);
        httpSession.setAttribute("firstdate", dispenseDate);
        httpSession.setAttribute("seconddate", dispenseDate);
    }

    public void showBetweenTodaysDispensedBills() {
        Date dispensefirstDate=new Date();
        Date dispensesecondDate=new Date();
        dispensefirstDate=DateUtil.simpleDateParser(request.getParameter("firstdate"));
        dispensesecondDate=DateUtil.simpleDateParser(request.getParameter("seconddate"));
       
        List<Dispense> dispenses=new DispenseDAO().showBetweenTodaysDispensedBills(dispensefirstDate,dispensesecondDate);
        httpSession.setAttribute("dispenses", dispenses);
        httpSession.setAttribute("firstdate", dispensefirstDate);
        httpSession.setAttribute("seconddate", dispensesecondDate);
        httpSession.setAttribute("seconddate", dispensesecondDate);
    }

    public void showDispensedBillsForThisMonth() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);
       
         int year = cal.get(Calendar.YEAR);
         int month = cal.get(Calendar.MONTH);
         int day = cal.get(Calendar.DATE);
         Date startingdate = new Date(year-1900, month, day);
         Date currentdate=new Date();
         
        
        List<Dispense> dispenses=new DispenseDAO().showDispensedBillsForThisMonth(startingdate,currentdate);
        httpSession.setAttribute("dispenses", dispenses);
        httpSession.setAttribute("firstdate", startingdate);
        httpSession.setAttribute("seconddate", currentdate);
        httpSession.setAttribute("seconddate", currentdate);
    }



}
