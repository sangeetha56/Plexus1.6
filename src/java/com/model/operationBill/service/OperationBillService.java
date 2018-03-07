/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.operationBill.service;

import com.model.detailsOperationBill.dto.Detailsoperationbill;
import com.model.detailsOperationBill.dao.DetailsOperationBillDao;
import com.model.detailsOperationBill.dto.Detailsoperationbillchild;
import com.model.operationBill.dto.Operationbill;
import com.model.operationType.dao.OperationTypeDao;
import com.model.operationType.dto.Operationtype;
import com.model.doctorProcess.dto.Doctorinfo;

import com.model.operationBill.dao.OperationBillDao;
import com.model.operationBill.dto.Operationbillchild;
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
public class OperationBillService {

     private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public OperationBillService(HttpServletRequest request, HttpServletResponse response) {
         this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addOperationBill() {

         String[] operatigIDS = request.getParameterValues("operatigIDS");
        String[] operatigname = request.getParameterValues("operatigNames");
        String[] operatigAmounts = request.getParameterValues("operatigchargeindis");
        BigDecimal totalcharge = BigDecimal.ZERO;


        System.out.println("id  isssss 0000000000:---"+request.getParameterValues("operatigIDS"));

        if(request.getParameterValues("operatigIDS")!=null)
        {
            System.out.println("id length isssss:---"+operatigIDS.length);
           
        }
        else
        {
            System.out.println("id length isssss 0000000000:---");
        }

        
   




//        for (String id : personalIds) {
//            System.out.println("id" + Long.valueOf(id));
//            Investigation investigationdetail = new InvestigationDao().viewDetailsInvestigationType(Long.valueOf(id));
//            totalcharge=totalcharge.add(investigationdetail.getInvestigationcharge());
//        }
//        System.out.println("Toatal Investigation charge is:-"+totalcharge);
      


       Operationbill operationbill=new Operationbill();
       operationbill.setDiscountparcentage(DataUtil.parseLong(request.getParameter("discountparcent")));
       operationbill.setDiscountamount(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("discountamount"))));
       operationbill.setAdvance(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("advancedreceived"))));
       operationbill.setTopay(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totalamounttopay"))));
       operationbill.setTotaldue(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totalduevalue"))));
       operationbill.setTotalpayable(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totalvalue"))));
       operationbill.setReceivedamount(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("receivedamount"))));

        Long patientid=DataUtil.parseLong(request.getParameter("patientID"));
        Long doctorid=DataUtil.parseLong(request.getParameter("state"));
        Patient patient=new Patient();
        Doctorinfo doctor=new Doctorinfo();
        Operationtype operationtype=new Operationtype();
        Detailsoperationbill detailsoperation=new Detailsoperationbill();

        if(request.getParameterValues("operatigIDS")!=null)
        {
            for (int i = 0; i < operatigIDS.length; i++)
        {

            totalcharge=totalcharge.add(BigDecimal.valueOf(DataUtil.parseDouble(operatigAmounts[i])));

        }

        }
        else
        {
            System.out.println("id length isssss 0000000000  totalcharge:---");
        }
        


        operationbill.setOperationbilldate(DateUtil.simpleDateParser(request.getParameter("operationbilldate")));
        operationbill.setOperationbillcharges(totalcharge);
        operationbill.setOperationbillremarks(request.getParameter("operationremarks"));
        
        

        patient.setId(patientid);
        if(doctorid>0)
        {
            doctor.setDoctid(doctorid);
            operationbill.setDoctorinfo(doctor);
        }
        else
        {
            doctor.setDoctid(0);
        }

        //investigation.setInvestigationid(investigationid);
        operationbill.setPatient(patient);

        //investigationbill.setInvestigation(investigation);

        operationbill=new OperationBillDao().addOperationBill(operationbill);


        if(request.getParameterValues("operatigIDS")!=null)
        {
            for (int i = 0; i < operatigIDS.length; i++)
        {


            detailsoperation.setDetailsoperationbilldate(DateUtil.simpleDateParser(request.getParameter("operationbilldate")));
            detailsoperation.setDetailsoperationbillcharges(BigDecimal.valueOf(DataUtil.parseDouble(operatigAmounts[i])));
            operationtype.setOperationtypeid(Long.valueOf(operatigIDS[i]));
            detailsoperation.setOperationtype(operationtype);
            operationbill.setOperationbillid(operationbill.getOperationbillid());
            detailsoperation.setOperationbill(operationbill);


            detailsoperation=new DetailsOperationBillDao().create(detailsoperation);


        }

        }
        else
        {
            System.out.println("id length isssss 0000000000  operation bill:---");
        }

        


        if (operationbill.getOperationbillid() == 00) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }

    }

    public void showTodaysOperationBills() {

         Date today = new Date();
        today = DateUtil.todaysDate();
        Date tommorow=DateUtil.tomorrowsDate(today);
        Double operationbillamount =0.0;
        List<Operationbill> operation=new OperationBillDao().showTodaysOperationBills(today, tommorow);

        Iterator<Operationbill> iterator = operation.iterator();
            System.out.println("operation size " + operation.size());
            while (iterator.hasNext()) {

                Operationbill operationtypecharges = iterator.next();

                operationbillamount=operationbillamount+operationtypecharges.getOperationbillcharges().doubleValue();

            }

        httpSession.setAttribute("operationbill", operation);
        httpSession.setAttribute("firstdate", today);
        httpSession.setAttribute("seconddate", today);
        httpSession.setAttribute("total", operationbillamount);
    }

    public void showOperationBillById() {

        long previousdue=0;
        long id=DataUtil.parseLong(request.getParameter("id"));
        Operationbill operationbill=new OperationBillDao().readUniqueObject(id);
        
        Operationbillchild operationbillchild=new OperationBillDao().readPreviousDueChilLastRecord(operationbill.getOperationbillid());

        if(operationbillchild!=null)
        {
            System.out.println("last due id is:---"+operationbillchild.getOperationbillidchild());
        System.out.println("last due is:---"+operationbillchild.getTotalduechild());
        //previousdue=operationbillchild.getTotalduechild();
        httpSession.setAttribute("previousdue", operationbillchild.getTotalduechild());
        }
        else
        {
           previousdue=0;
           httpSession.setAttribute("previousdue", previousdue);
        }
        
        httpSession.setAttribute("operationbill", operationbill);
        
    }

    public void showOperationBillsByDate() {
        Date operationDate=new Date();
        operationDate=DateUtil.simpleDateParser(request.getParameter("operationbillDate"));
        Double operationbillamount =0.0;

        List<Operationbill> operation=new OperationBillDao().showOperationBillsByDate(operationDate);

        Iterator<Operationbill> iterator = operation.iterator();

            while (iterator.hasNext()) {

                Operationbill operationcharge = iterator.next();

                operationbillamount=operationbillamount+operationcharge.getOperationbillcharges().doubleValue();

            }

        httpSession.setAttribute("operationbill", operation);
        httpSession.setAttribute("firstdate", operationDate);
        httpSession.setAttribute("seconddate", operationDate);
        httpSession.setAttribute("total", operationbillamount);
    }

    public void showBetweendateOperationBill() {

         Date operationfirstDate=new Date();
        Date operationsecondDate=new Date();
        operationfirstDate=DateUtil.simpleDateParser(request.getParameter("firstdate"));
        operationsecondDate=DateUtil.simpleDateParser(request.getParameter("seconddate"));
        Double operationbillamount =0.0;

        List<Operationbill> operation=new OperationBillDao().showBetweendateOperationBill(operationfirstDate,operationsecondDate);

        Iterator<Operationbill> iterator = operation.iterator();

            while (iterator.hasNext()) {

                Operationbill operationcharges = iterator.next();

                operationbillamount=operationbillamount+operationcharges.getOperationbillcharges().doubleValue();

            }

        httpSession.setAttribute("operationbill", operation);
        httpSession.setAttribute("firstdate", operationfirstDate);
        httpSession.setAttribute("seconddate", operationsecondDate);
        httpSession.setAttribute("total", operationbillamount);

    }

    public void showOperationThisMonthBill() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);

         int year = cal.get(Calendar.YEAR);
         int month = cal.get(Calendar.MONTH);
         int day = cal.get(Calendar.DATE);
         Date startingdate = new Date(year-1900, month, day);
         Date currentdate=new Date();
         Double operationbillamount =0.0;

         System.out.println("first date:-"+startingdate);
         System.out.println("second date:-"+currentdate);


        List<Operationbill> operation=new OperationBillDao().showOperationThisMonthBill(startingdate,currentdate);

        Iterator<Operationbill> iterator = operation.iterator();
            System.out.println("size12 " + operation.size());
            while (iterator.hasNext()) {

                Operationbill operationcharges = iterator.next();

                operationbillamount=operationbillamount+operationcharges.getOperationbillcharges().doubleValue();

            }

        httpSession.setAttribute("operationbill", operation);
        httpSession.setAttribute("firstdate", startingdate);
        httpSession.setAttribute("seconddate", currentdate);
        httpSession.setAttribute("total", operationbillamount);

    }

    public boolean viewAllOperigationType() {

         boolean result = false;
        try {
            List<Operationbill> list = new OperationBillDao().readListOfObjects();
            httpSession.setAttribute("operationList", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean addOperationBillChild() {
        String[] operatigIDS = request.getParameterValues("operatigIDS");
        String[] operatigname = request.getParameterValues("operatigNames");
        String[] operatigAmounts = request.getParameterValues("operatigchargeindis");
        BigDecimal totalcharge = BigDecimal.ZERO;


        System.out.println("id  isssss 0000000000:---"+request.getParameterValues("operatigIDS"));

        if(request.getParameterValues("operatigIDS")!=null)
        {
            System.out.println("id length isssss:---"+operatigIDS.length);

        }
        else
        {
            System.out.println("id length isssss 0000000000:---");
        }







//        for (String id : personalIds) {
//            System.out.println("id" + Long.valueOf(id));
//            Investigation investigationdetail = new InvestigationDao().viewDetailsInvestigationType(Long.valueOf(id));
//            totalcharge=totalcharge.add(investigationdetail.getInvestigationcharge());
//        }
//        System.out.println("Toatal Investigation charge is:-"+totalcharge);



        Operationbillchild operationbillchild=new Operationbillchild();
        Operationbill operationbill=new Operationbill();
         operationbillchild.setDiscountparcentagechild(DataUtil.parseLong(request.getParameter("discountparcent")));
        operationbillchild.setDiscountamountchild(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("discountamount"))));
       operationbillchild.setAdvancechild(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("advancedreceived"))));
       operationbillchild.setTopaychild(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totalamounttopay"))));
       operationbillchild.setTotalduechild(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totalduevalue"))));
       operationbillchild.setTotalpayablechild(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totalvalue"))));
       operationbillchild.setReceivedamountchild(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("receivedamount"))));

       operationbill.setOperationbillid(DataUtil.parseLong(request.getParameter("operationbillid")));
       operationbillchild.setOperationbill(operationbill);


        Doctorinfo doctor=new Doctorinfo();
        Operationtype operationtype=new Operationtype();
        Detailsoperationbillchild detailsoperationbillchild=new Detailsoperationbillchild();

        if(request.getParameterValues("operatigIDS")!=null)
        {
            for (int i = 0; i < operatigIDS.length; i++)
        {

            totalcharge=totalcharge.add(BigDecimal.valueOf(DataUtil.parseDouble(operatigAmounts[i])));

        }

        }
        else
        {
            System.out.println("id length isssss 0000000000  totalcharge:---");
        }



        operationbillchild.setOperationbilldatechild(DateUtil.simpleDateParser(request.getParameter("operationbilldate")));
        operationbillchild.setOperationbillchargeschild(totalcharge);
        operationbillchild.setOperationbillremarkschild(request.getParameter("operationremarks"));







        operationbillchild=new OperationBillDao().addOperationBillChild(operationbillchild);


        if(request.getParameterValues("operatigIDS")!=null)
        {
            for (int i = 0; i < operatigIDS.length; i++)
        {


            detailsoperationbillchild.setDetailsoperationbilldatechild(DateUtil.simpleDateParser(request.getParameter("operationbilldate")));
            detailsoperationbillchild.setDetailsoperationbillchargeschild(BigDecimal.valueOf(DataUtil.parseDouble(operatigAmounts[i])));
            operationtype.setOperationtypeid(Long.valueOf(operatigIDS[i]));
            detailsoperationbillchild.setOperationtype(operationtype);
            operationbillchild.setOperationbillidchild(operationbillchild.getOperationbillidchild());
            detailsoperationbillchild.setOperationbillchild(operationbillchild);


            detailsoperationbillchild=new DetailsOperationBillDao().createchildBill(detailsoperationbillchild);


        }

        }
        else
        {
            System.out.println("id length isssss 0000000000  operation bill:---");
        }




        if (operationbillchild.getOperationbillidchild() == 00) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }
    }

}
