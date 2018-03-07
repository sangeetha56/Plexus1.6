/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.indispense.service;

import com.model.inPatient.dto.Inpatient;
import com.model.indispense.dao.InDispenseDAO;
import com.model.indispense.dto.Indispense;
import com.util.DataUtil;
import com.util.DateUtil;
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
public class InDispenseService {

      private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;


    public InDispenseService(HttpServletRequest request, HttpServletResponse response) {
         this.request = request;
        this.response = response;
        this.httpSession=request.getSession();
    }

    public Indispense add() {

          Inpatient patient=new Inpatient();
        Indispense dispense=new Indispense();
        Date dispensedate;
   Long patientId=0l;
      patientId=DataUtil.parseLong(request.getParameter("inpatientId"));

       
        patient.setId(patientId);
         
        dispense.setInpatient(patient);
        dispensedate=DateUtil.simpleDateParser(request.getParameter("dispenseDateInpatient"));
        dispense.setDispensedate(dispensedate);
       
        dispense=new InDispenseDAO().create(dispense);
        return dispense;

    }

    public void preview(Indispense dispense) {
         dispense=new InDispenseDAO().readUniqueObject(dispense.getId());
        httpSession.setAttribute("dispenseInpatient", dispense);
    }

    public void todaysBill() {
        
        Date todays=new Date();
      
        List<Indispense> dispenses=new InDispenseDAO().readListOfObjects();
        Iterator<Indispense> iterator=dispenses.iterator();
       
        while (iterator.hasNext()) {
            Indispense dispense = iterator.next();
         

        }


        httpSession.setAttribute("indispenses", dispenses);
        httpSession.setAttribute("infirstdate", todays);
        httpSession.setAttribute("inseconddate", todays);
    }

    public void showBills() {
         Date dispenseDate=new Date();
        dispenseDate=DateUtil.simpleDateParser(request.getParameter("dispenseDatee"));
        
        List<Indispense> dispenses=new InDispenseDAO().readListOfObjects(dispenseDate);
        httpSession.setAttribute("indispenses", dispenses);
        httpSession.setAttribute("infirstdate", dispenseDate);
        httpSession.setAttribute("inseconddate", dispenseDate);
    }

    public void preview() {
          long id=DataUtil.parseLong(request.getParameter("id"));
        Indispense dispense=new InDispenseDAO().readUniqueObject(id);
        httpSession.setAttribute("dispenseInpatient", dispense);
    }

    public void showBetweenTodaysDispensedBills() {
        Date dispensefirstDate=new Date();
        Date dispensesecondDate=new Date();
        dispensefirstDate=DateUtil.simpleDateParser(request.getParameter("infirstdate"));
        dispensesecondDate=DateUtil.simpleDateParser(request.getParameter("inseconddate"));
       
        List<Indispense> dispenses=new InDispenseDAO().showBetweenTodaysDispensedBills(dispensefirstDate,dispensesecondDate);
        httpSession.setAttribute("indispenses", dispenses);
        httpSession.setAttribute("infirstdate", dispensefirstDate);
        httpSession.setAttribute("inseconddate", dispensesecondDate);
        httpSession.setAttribute("inseconddate", dispensesecondDate);
    }

    public void showDispensedBillsForThisMonth() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);
       
         int year = cal.get(Calendar.YEAR);
         int month = cal.get(Calendar.MONTH);
         int day = cal.get(Calendar.DATE);
         Date startingdate = new Date(year-1900, month, day);
         Date currentdate=new Date();

       
        List<Indispense> dispenses=new InDispenseDAO().showDispensedBillsForThisMonth(startingdate,currentdate);
        httpSession.setAttribute("indispenses", dispenses);
        httpSession.setAttribute("infirstdate", startingdate);
        httpSession.setAttribute("inseconddate", currentdate);
        httpSession.setAttribute("inseconddate", currentdate);
    }

}
