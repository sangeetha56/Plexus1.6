/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.advance.service;

import com.model.advance.dao.AdvanceDao;
import com.model.advance.dto.Advance;
import com.model.advance.dtochild.Advancechildbill;
import com.model.doctorProcess.dto.Doctorinfo;
import com.model.patient.dto.Patient;
import com.util.DataUtil;
import com.util.DateUtil;
import java.math.BigDecimal;
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
public class AdvanceService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public AdvanceService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addAdvanceBill() {
        Long patientid = DataUtil.parseLong(request.getParameter("patientID"));
        Long doctorid = DataUtil.parseLong(request.getParameter("state"));


        Advance advance = new Advance();
        Patient patient = new Patient();
        Doctorinfo doctor = new Doctorinfo();
        advance.setAdvancebilldate(DateUtil.simpleDateParser(request.getParameter("advancebilldate")));
        advance.setAdvanceamount(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("advanceamount"))));
        advance.setTotalbill(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("totalbill"))));
        advance.setPaid(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("paid"))));
        patient.setId(patientid);
        if (doctorid > 0) {
            doctor.setDoctid(doctorid);
            advance.setDoctorinfo(doctor);
        } else {
            doctor.setDoctid(0);
        }
        advance.setPatient(patient);
        advance = new AdvanceDao().addAdvance(advance);
        if (advance.getAdvancebillid() == 00) {
            return false;
        } else {
            //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public void showTodaysAdvanceBills() {
        Double totalbill = 0.0;

        Date today = new Date();
        today = DateUtil.todaysDate();
        Date tommorow = DateUtil.tomorrowsDate(today);

        List<Advance> advances = new AdvanceDao().showTodaysAdvanceBills(today, tommorow);

        System.out.println("advances size " + advances.size());



        httpSession.setAttribute("advance", advances);
        httpSession.setAttribute("firstdate", today);
        httpSession.setAttribute("seconddate", today);
        httpSession.setAttribute("total", totalbill);
    }

    public void showAdvanceBillById() {
        long id = DataUtil.parseLong(request.getParameter("id"));
        Advance advance = new AdvanceDao().readUniqueObject(id);
        httpSession.setAttribute("advance", advance);

    }

    public void showAdvanceBillsByDate() {
        Date advancebilldate = new Date();
        advancebilldate = DateUtil.simpleDateParser(request.getParameter("advancebilldate"));
        Double totalbill = 0.0;

        List<Advance> advance = new AdvanceDao().showAdvanceBillsByDate(advancebilldate);


        httpSession.setAttribute("advance", advance);
        httpSession.setAttribute("firstdate", advancebilldate);
        httpSession.setAttribute("seconddate", advancebilldate);
        httpSession.setAttribute("total", totalbill);

    }

    public void showBetweendateAdvanceBill() {
        Date advancefirstDate = new Date();
        Date advancesecondDate = new Date();
        advancefirstDate = DateUtil.simpleDateParser(request.getParameter("firstdate"));
        advancesecondDate = DateUtil.simpleDateParser(request.getParameter("seconddate"));
        Double totalbill = 0.0;
        List<Advance> advance = new AdvanceDao().showBetweendateAdvanceBill(advancefirstDate, advancesecondDate);
        httpSession.setAttribute("advance", advance);
        httpSession.setAttribute("firstdate", advancefirstDate);
        httpSession.setAttribute("seconddate", advancesecondDate);
        httpSession.setAttribute("total", totalbill);
    }

    public void showAdvanceThisMonthBill() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);

        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        int day = cal.get(Calendar.DATE);
        Date startingdate = new Date(year - 1900, month, day);
        Date currentdate = new Date();
        Double totalbill = 0.0;
        List<Advance> advance = new AdvanceDao().showAdvanceThisMonthBill(startingdate, currentdate);
        httpSession.setAttribute("advance", advance);
        httpSession.setAttribute("firstdate", startingdate);
        httpSession.setAttribute("seconddate", currentdate);
        httpSession.setAttribute("total", totalbill);
    }

    public boolean viewAllAdvance() {
        boolean result = false;
        try {
            List<Advance> list = new AdvanceDao().readListOfObjects();
            httpSession.setAttribute("AdvanceList", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean addAdvanceChildBill() {
        Long advancebillid = DataUtil.parseLong(request.getParameter("advancebillid"));


        Advance advance = new Advance();
        Advancechildbill advancechildbill=new Advancechildbill();

        advance.setAdvancebillid(advancebillid);
        advancechildbill.setAdvance(advance);

        advancechildbill.setAdvancebilldate(DateUtil.simpleDateParser(request.getParameter("advancebilldate")));
        advancechildbill.setAdvanceamountchild(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("advanceamountchild"))));
        advancechildbill.setTotalbillchild(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("totalbillchild"))));
        advancechildbill.setPaidchild(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("paidchild"))));
        advancechildbill.setRemainingchildamount(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("remainingchildamount"))));

        advancechildbill = new AdvanceDao().addAdvanceBillChild(advancechildbill);
        if (advancechildbill.getAdvancechildbillid() == 00) {
            return false;
        } else {
            //  httpSession.setAttribute("countryNames", country);
            return true;
        }
    }
}
