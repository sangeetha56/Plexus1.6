/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.therapybill.service;

import com.model.detailTherapyBill.dao.DetailstherapybillDao;
import com.model.detailTherapyBill.dto.Detailstherapybill;
import com.model.doctorProcess.dto.Doctorinfo;
import com.model.patient.dto.Patient;
import com.model.therapy.dao.TheraphyDao;
import com.model.therapy.dto.Theraphy;
import com.model.therapybill.dao.TherapybillDao;
import com.model.therapybill.dto.Therapybill;
import com.util.DataUtil;
import com.util.DateUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sultan
 */
public class TherapybillService {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public TherapybillService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addTherapyBill() {
        


        String[] therapyIDS = request.getParameterValues("therapyIDS");
        String[] therapyname = request.getParameterValues("therapyNames");
        String[] therapyAmounts = request.getParameterValues("therapychargeindis");
        BigDecimal totalcharge = BigDecimal.ZERO;


        Long patientid=DataUtil.parseLong(request.getParameter("patientID"));
        Long doctorid=DataUtil.parseLong(request.getParameter("state"));
        
        Therapybill therapybill=new Therapybill();
        Patient patient=new Patient();
        Doctorinfo doctor=new Doctorinfo();
        Theraphy therapy=new Theraphy();
        Detailstherapybill detailstherapybill=new Detailstherapybill();

        for (int i = 0; i < therapyIDS.length; i++)
        {
           
            totalcharge=totalcharge.add(BigDecimal.valueOf(DataUtil.parseDouble(therapyAmounts[i])));

        }
       
        therapybill.setTherapybilldate(DateUtil.simpleDateParser(request.getParameter("thpybilldate")));
        therapybill.setTherapybillcharges(totalcharge);
        therapybill.setTherapybillremark(request.getParameter("therapyremarks"));

        patient.setId(patientid);
        if(doctorid>0)
        {
            doctor.setDoctid(doctorid);
            therapybill.setDoctorinfo(doctor);
        }
        else
        {
            doctor.setDoctid(0);
        }

        //therapy.setTherphyid(therpyid);
        therapybill.setPatient(patient);

        //therapybill.setTheraphy(therapy);

        therapybill=new TherapybillDao().addTherapyBill(therapybill);

        for (int i = 0; i < therapyIDS.length; i++)
        {
            
            therapy.setTherphyid(Long.valueOf(therapyIDS[i]));
            detailstherapybill.setTheraphy(therapy);
            detailstherapybill.setDetailstherapybillcharge(BigDecimal.valueOf(DataUtil.parseDouble(therapyAmounts[i])));
            therapybill.setTherapybillid(therapybill.getTherapybillid());
            detailstherapybill.setDetailstherapybilldate(DateUtil.simpleDateParser(request.getParameter("thpybilldate")));
            detailstherapybill.setTherapybill(therapybill);
            detailstherapybill=new DetailstherapybillDao().create(detailstherapybill);
            

        }


        
        if (therapybill.getTherapybillid() == 00) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }


    public void showTodaysTherapyBills(){
        Date today = new Date();
        today = DateUtil.todaysDate();
        Date tommorow=DateUtil.tomorrowsDate(today);
        Double therapybillamount =0.0;
        List<Therapybill> therapy=new TherapybillDao().showTodaysTherapyBills(today, tommorow);
       
        Iterator<Therapybill> iterator = therapy.iterator();
           
            while (iterator.hasNext()) {

                Therapybill therapycharges = iterator.next();

                therapybillamount=therapybillamount+therapycharges.getTherapybillcharges().doubleValue();
                
            }
       
        httpSession.setAttribute("therapybill", therapy);
        httpSession.setAttribute("firstdate", today);
        httpSession.setAttribute("seconddate", today);
        httpSession.setAttribute("total", therapybillamount);
    }

    /**
     *
     */
    public void showTherapyBillById() {
        long id=DataUtil.parseLong(request.getParameter("id"));
        Therapybill therapybill=new TherapybillDao().readUniqueObject(id);
        httpSession.setAttribute("therapybill", therapybill);

    }

    public void showTherapyBillsByDate() {
        Date therapyDate=new Date();
        therapyDate=DateUtil.simpleDateParser(request.getParameter("therapybillDate"));
        Double therapybillamount =0.0;

        List<Therapybill> therapy=new TherapybillDao().showTherapyBillsByDate(therapyDate);
       
        Iterator<Therapybill> iterator = therapy.iterator();
            
            while (iterator.hasNext()) {

                Therapybill therapycharges = iterator.next();

                therapybillamount=therapybillamount+therapycharges.getTherapybillcharges().doubleValue();
                
            }
           
        httpSession.setAttribute("therapybill", therapy);
        httpSession.setAttribute("firstdate", therapyDate);
        httpSession.setAttribute("seconddate", therapyDate);
        httpSession.setAttribute("total", therapybillamount);
    }

    public void showBetweenDateTherapyBills() {
        Date therapyfirstDate=new Date();
        Date therapysecondDate=new Date();
        therapyfirstDate=DateUtil.simpleDateParser(request.getParameter("firstdate"));
        therapysecondDate=DateUtil.simpleDateParser(request.getParameter("seconddate"));
        Double therapybillamount =0.0;
       
        List<Therapybill> therapy=new TherapybillDao().showBetweenDateTherapyBills(therapyfirstDate,therapysecondDate);

        Iterator<Therapybill> iterator = therapy.iterator();
           
            while (iterator.hasNext()) {

                Therapybill therapycharges = iterator.next();

                therapybillamount=therapybillamount+therapycharges.getTherapybillcharges().doubleValue();
               
            }
           
        httpSession.setAttribute("therapybill", therapy);
        httpSession.setAttribute("firstdate", therapyfirstDate);
        httpSession.setAttribute("seconddate", therapysecondDate);
        httpSession.setAttribute("total", therapybillamount);
    }

    public void showTherapyForThisMonth() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);
        
         int year = cal.get(Calendar.YEAR);
         int month = cal.get(Calendar.MONTH);
         int day = cal.get(Calendar.DATE);
         Date startingdate = new Date(year-1900, month, day);
         Date currentdate=new Date();
         Double therapybillamount =0.0;

        List<Therapybill> therapy=new TherapybillDao().showTherapyForThisMonth(startingdate,currentdate);
       
        Iterator<Therapybill> iterator = therapy.iterator();
         
            while (iterator.hasNext()) {

                Therapybill therapycharges = iterator.next();

                therapybillamount=therapybillamount+therapycharges.getTherapybillcharges().doubleValue();
               
            }
          
        httpSession.setAttribute("therapybill", therapy);
        httpSession.setAttribute("firstdate", startingdate);
        httpSession.setAttribute("seconddate", currentdate);
        httpSession.setAttribute("total", therapybillamount);
    }
    public boolean viewAllTherapy() {
       
        boolean result = false;
        try {
            List<Theraphy> list = new TherapybillDao().readListOfObjects();
            httpSession.setAttribute("TherapyList", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }





}
