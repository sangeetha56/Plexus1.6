/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.redispense.service;

import com.model.patient.dto.Patient;
import com.model.redispense.dao.RedispenseDao;
import com.model.redispense.dto.Redispense;
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
 * @author Admin
 */
public class RedispenseService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public RedispenseService(HttpServletRequest request, HttpServletResponse response) {

        this.request = request;
        this.response = response;
        this.httpSession=request.getSession();
    }

    public Redispense add() {

        Patient patient=new Patient();
        Redispense redispense=new Redispense();
        Date dispenseDate=new Date();
        Long patientId=0l;
        patientId=DataUtil.parseLong(request.getParameter("patientID"));
        patient.setId(patientId);
        redispense.setPatient(patient);
        dispenseDate=DateUtil.simpleDateParser(request.getParameter("dispenseDate"));
        redispense.setDispensedate(dispenseDate);
        redispense=new RedispenseDao().create(redispense);
        return redispense;

    }

    public void preview(Redispense redispense) {
        redispense=new RedispenseDao().readUniqueObject(redispense.getId());
        httpSession.setAttribute("redispense", redispense);
    }

    public void todaysBill() {

        Double medicinebillnamount =0.0;

        Date todays=new Date();

        List<Redispense> redispenses=new RedispenseDao().readListOfObjects();
        Iterator<Redispense> iterator=redispenses.iterator();

        while (iterator.hasNext()) {
            Redispense redispense = iterator.next();
            medicinebillnamount=medicinebillnamount+0.0;
            }


        httpSession.setAttribute("redispenses", redispenses);
        httpSession.setAttribute("firstdate", todays);
        httpSession.setAttribute("seconddate", todays);
        httpSession.setAttribute("totalMedicineBill", todays);
    }

    public void preview() {

        long id=DataUtil.parseLong(request.getParameter("id"));
        Redispense redispense=new RedispenseDao().readUniqueObject(id);
        httpSession.setAttribute("redispense", redispense);
        
    }

    public void showBills() {

        Date dispenseDate=new Date();
        dispenseDate=DateUtil.simpleDateParser(request.getParameter("dispenseDate"));


        List<Redispense> redispenses=new RedispenseDao().readListOfObjects(dispenseDate);
        httpSession.setAttribute("redispenses", redispenses);
        httpSession.setAttribute("firstdate", dispenseDate);
        httpSession.setAttribute("seconddate", dispenseDate);
    }

    public void showBetweenTodaysRedispensedBills() {
        Date dispensefirstDate=new Date();
        Date dispensesecondDate=new Date();
        dispensefirstDate=DateUtil.simpleDateParser(request.getParameter("firstdate"));
        dispensesecondDate=DateUtil.simpleDateParser(request.getParameter("seconddate"));

        List<Redispense> redispenses=new RedispenseDao().showBetweenTodaysRedispensedBills(dispensefirstDate,dispensesecondDate);
        httpSession.setAttribute("redispenses", redispenses);
        httpSession.setAttribute("firstdate", dispensefirstDate);
        httpSession.setAttribute("seconddate", dispensesecondDate);
        httpSession.setAttribute("seconddate", dispensesecondDate);

    }

    public void showRedispensedBillsForThisMonth() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);

         int year = cal.get(Calendar.YEAR);
         int month = cal.get(Calendar.MONTH);
         int day = cal.get(Calendar.DATE);
         Date startingdate = new Date(year-1900, month, day);
         Date currentdate=new Date();


        List<Redispense> redispenses=new RedispenseDao().showRedispensedBillsForThisMonth(startingdate,currentdate);
        httpSession.setAttribute("redispenses", redispenses);
        httpSession.setAttribute("firstdate", startingdate);
        httpSession.setAttribute("seconddate", currentdate);
        httpSession.setAttribute("seconddate", currentdate);

    }

}
