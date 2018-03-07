/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.investigationbill.service;

import com.model.detailInvestigationBill.dao.DetailsinvestigationbillDao;
import com.model.detailInvestigationBill.dto.Detailsinvestigationbill;
import com.model.doctorProcess.dto.Doctorinfo;
import com.model.investigation.dao.InvestigationDao;
import com.model.investigation.dto.Investigation;
import com.model.investigationbill.dao.InvestigationBillDao;
import com.model.investigationbill.dto.Investigationbill;
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
 * @author sultan
 */
public class InvestigationBillService {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public InvestigationBillService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }
     public boolean addInvestigationBill() {
       
        String[] investigIDS = request.getParameterValues("investigIDS");
        String[] investigname = request.getParameterValues("investigNames");
        String[] investigAmounts = request.getParameterValues("investigchargeindis");
        BigDecimal totalcharge = BigDecimal.ZERO;



//        for (String id : personalIds) {
//            System.out.println("id" + Long.valueOf(id));
//            Investigation investigationdetail = new InvestigationDao().viewDetailsInvestigationType(Long.valueOf(id));
//            totalcharge=totalcharge.add(investigationdetail.getInvestigationcharge());
//        }
//        System.out.println("Toatal Investigation charge is:-"+totalcharge);

        Long patientid=DataUtil.parseLong(request.getParameter("patientID"));
        Long doctorid=DataUtil.parseLong(request.getParameter("state"));
        

        Investigationbill investigationbill=new Investigationbill();
        Patient patient=new Patient();
        Doctorinfo doctor=new Doctorinfo();
        Investigation investigation=new Investigation();
        Detailsinvestigationbill detailsinvestigation=new Detailsinvestigationbill();

        for (int i = 0; i < investigIDS.length; i++)
        {
           
            totalcharge=totalcharge.add(BigDecimal.valueOf(DataUtil.parseDouble(investigAmounts[i])));

        }
      

        investigationbill.setInvestigationbilldate(DateUtil.simpleDateParser(request.getParameter("investigationbilldate")));
        investigationbill.setInvestigationbillcharges(totalcharge);
        investigationbill.setInvestigationbillremark(request.getParameter("investigationremarks"));

        patient.setId(patientid);
        if(doctorid>0)
        {
            doctor.setDoctid(doctorid);
            investigationbill.setDoctorinfo(doctor);
        }
        else
        {
            doctor.setDoctid(0);
        }
        
        //investigation.setInvestigationid(investigationid);
        investigationbill.setPatient(patient);
        
        //investigationbill.setInvestigation(investigation);

        investigationbill=new InvestigationBillDao().addInvestigationBill(investigationbill);



        for (int i = 0; i < investigIDS.length; i++)
        {
           

            detailsinvestigation.setDetailsinvestigationbilldate(DateUtil.simpleDateParser(request.getParameter("investigationbilldate")));
            detailsinvestigation.setDetailsinvestigationbillcharge(BigDecimal.valueOf(DataUtil.parseDouble(investigAmounts[i])));
            investigation.setInvestigationid(Long.valueOf(investigIDS[i]));
            detailsinvestigation.setInvestigation(investigation);
            investigationbill.setInvestigationbillid(investigationbill.getInvestigationbillid());
            detailsinvestigation.setInvestigationbill(investigationbill);


            detailsinvestigation=new DetailsinvestigationbillDao().create(detailsinvestigation);


        }


        if (investigationbill.getInvestigationbillid() == 00) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }


    public void showTodaysInvestigationBills(){
        Date today = new Date();
        today = DateUtil.todaysDate();
        Date tommorow=DateUtil.tomorrowsDate(today);
        Double investigationbillamount =0.0;
        List<Investigationbill> investigation=new InvestigationBillDao().showTodaysInvestigationBills(today, tommorow);
       
        Iterator<Investigationbill> iterator = investigation.iterator();
            System.out.println("investigation size " + investigation.size());
            while (iterator.hasNext()) {

                Investigationbill investigatiocharges = iterator.next();

                investigationbillamount=investigationbillamount+investigatiocharges.getInvestigationbillcharges().doubleValue();
               
            }
            
        httpSession.setAttribute("investigationbill", investigation);
        httpSession.setAttribute("firstdate", today);
        httpSession.setAttribute("seconddate", today);
        httpSession.setAttribute("total", investigationbillamount);
    }

    /**
     *
     */
    public void showInvestigationBillById() {
        long id=DataUtil.parseLong(request.getParameter("id"));
        Investigationbill investigationbill=new InvestigationBillDao().readUniqueObject(id);
        httpSession.setAttribute("investigationbill", investigationbill);

    }

    public void showInvestigationBillsByDate() {
        Date investigationDate=new Date();
        investigationDate=DateUtil.simpleDateParser(request.getParameter("investigationbillDate"));
        Double investigationbillamount =0.0;

        List<Investigationbill> investigation=new InvestigationBillDao().showInvestigationBillsByDate(investigationDate);
        
        Iterator<Investigationbill> iterator = investigation.iterator();
           
            while (iterator.hasNext()) {

                Investigationbill investigationcharge = iterator.next();

                investigationbillamount=investigationbillamount+investigationcharge.getInvestigationbillcharges().doubleValue();
                
            }
            
        httpSession.setAttribute("investigationbill", investigation);
        httpSession.setAttribute("firstdate", investigationDate);
        httpSession.setAttribute("seconddate", investigationDate);
        httpSession.setAttribute("total", investigationbillamount);
    }

    public void showBetweendateInvestigationBill() {
        Date investigationfirstDate=new Date();
        Date investigationsecondDate=new Date();
        investigationfirstDate=DateUtil.simpleDateParser(request.getParameter("firstdate"));
        investigationsecondDate=DateUtil.simpleDateParser(request.getParameter("seconddate"));
        Double investigationbillamount =0.0;
        
        List<Investigationbill> investigation=new InvestigationBillDao().showBetweendateInvestigationBill(investigationfirstDate,investigationsecondDate);

        Iterator<Investigationbill> iterator = investigation.iterator();
            
            while (iterator.hasNext()) {

                Investigationbill investigationcharges = iterator.next();

                investigationbillamount=investigationbillamount+investigationcharges.getInvestigationbillcharges().doubleValue();
                
            }
            
        httpSession.setAttribute("investigationbill", investigation);
        httpSession.setAttribute("firstdate", investigationfirstDate);
        httpSession.setAttribute("seconddate", investigationsecondDate);
        httpSession.setAttribute("total", investigationbillamount);
    }

    public void showInvestigationThisMonthBill() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);
       
         int year = cal.get(Calendar.YEAR);
         int month = cal.get(Calendar.MONTH);
         int day = cal.get(Calendar.DATE);
         Date startingdate = new Date(year-1900, month, day);
         Date currentdate=new Date();
         Double investigationbillamount =0.0;

        
        List<Investigationbill> investigation=new InvestigationBillDao().showInvestigationThisMonthBill(startingdate,currentdate);
       
        Iterator<Investigationbill> iterator = investigation.iterator();
            System.out.println("size12 " + investigation.size());
            while (iterator.hasNext()) {

                Investigationbill investigationcharges = iterator.next();

                investigationbillamount=investigationbillamount+investigationcharges.getInvestigationbillcharges().doubleValue();
                
            }
            
        httpSession.setAttribute("investigationbill", investigation);
        httpSession.setAttribute("firstdate", startingdate);
        httpSession.setAttribute("seconddate", currentdate);
        httpSession.setAttribute("total", investigationbillamount);
    }


    public boolean viewAllInvestigation() {
       
        boolean result = false;
        try {
            List<Investigation> list = new InvestigationBillDao().readListOfObjects();
            httpSession.setAttribute("InvestigationList", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }





}
