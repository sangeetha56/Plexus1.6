/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.dialySales.service;


import com.model.advance.dao.AdvanceDao;
import com.model.advance.dto.Advance;
import com.model.bill.dao.BillDAO;
import com.model.bill.dto.Bill;
import com.model.dispense.dao.DispenseDAO;
import com.model.dispense.dto.Dispense;
import com.model.indispense.dao.InDispenseDAO;
import com.model.indispense.dto.Indispense;
import com.model.investigationbill.dao.InvestigationBillDao;
import com.model.investigationbill.dto.Investigationbill;
import com.model.operationBill.dao.OperationBillDao;
import com.model.operationBill.dto.Operationbill;
import com.model.operationBill.dto.Operationbillchild;
import com.model.redispense.dao.RedispenseDao;
import com.model.redispense.dto.Redispense;
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
public class DailySalesService {


    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public DailySalesService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession=request.getSession();
    }






    public void showTodaysSalesReport(){
        Date today = new Date();
        today = DateUtil.todaysDate();
        Date tommorow=DateUtil.tomorrowsDate(today);
        int totalNoofBills =0;
/* this is for getting consultation charges only
 *
 */
         List<Bill> bills=new BillDAO().readListOfObjects(today, tommorow);
         Double saleamount =0.0;
        
        Iterator<Bill> iterator = bills.iterator();
           
            while (iterator.hasNext()) {

                Bill charges = iterator.next();

                saleamount=saleamount+charges.getConsultationcharges().doubleValue();
               
            }
            
         httpSession.setAttribute("bills", bills);
         httpSession.setAttribute("firstdate", today);
         httpSession.setAttribute("seconddate", today);
         httpSession.setAttribute("billsize", bills.size());
         httpSession.setAttribute("total", saleamount);

         /*
          * till here
          */
         /* this is for pharmacy out patient
          *
          */

         List<Dispense> dispenses=new DispenseDAO().readListOfObjects();
         httpSession.setAttribute("dispenses", dispenses);
         httpSession.setAttribute("dispensessize", dispenses.size());

         /*
          * till here
          */
         /* this is for pharmacy out patient
          *
          */

         List<Indispense> indispenses=new InDispenseDAO().readListOfObjects();
         httpSession.setAttribute("indispenses", indispenses);
         httpSession.setAttribute("indispensessize", indispenses.size());



         List< Redispense> redispenses=new RedispenseDao().readListOfObjects();
         httpSession.setAttribute("redispenses", redispenses);
         httpSession.setAttribute("redispensessize", redispenses.size());

          /*
          * till here
          */
         /* this is for therapy 
          *
          */

         List<Therapybill> therapy=new TherapybillDao().showTodaysTherapyBills(today, tommorow);
         httpSession.setAttribute("therapy", therapy);
         httpSession.setAttribute("therapysize", therapy.size());
         /*
          * till here
          */
         /* this is for investigation
          *
          */

         List<Investigationbill> investigation=new InvestigationBillDao().showTodaysInvestigationBills(today, tommorow);
         httpSession.setAttribute("investigation", investigation);
         httpSession.setAttribute("investigationsize", investigation.size());



          List<Advance> advance=new AdvanceDao().showTodaysAdvanceBills(today, tommorow);
         httpSession.setAttribute("advance", advance);
         httpSession.setAttribute("advancesize", advance.size());

         /*  for opertaion
          *
          *
          */
         List<Operationbill> operation=new OperationBillDao().showTodaysOperationBills(today, tommorow);
         System.out.println("sizeeeeeeeeee of parent:-----"+operation.size());
         List<Operationbillchild> operationbillchildList = new ArrayList<Operationbillchild>();
         List<Operationbillchild> operationbillchildListReturn = new ArrayList<Operationbillchild>();
         for(int i=0;i<operation.size();i++)
         {
             List<Operationbillchild> operationbillchild = new OperationBillDao().showTodaysOperationChildsBills(today, tommorow,operation.get(i).getOperationbillid());
             System.out.println("sizeeeeeeeeee:-----"+operationbillchild.size());

             for(int j=0;j<operationbillchild.size();j++)
             {
                 operationbillchildList.add(operationbillchild.get(j));
             }
         }

         for(int k=0;k<operationbillchildList.size();k++)
         {

             if(operationbillchildList.get(k).getTotalduechild().compareTo(BigDecimal.ZERO) <0)
             {
                 System.out.println("ddddddddddddd:::::"+operationbillchildList.get(k).getTotalduechild());
                 operationbillchildListReturn.add(operationbillchildList.get(k));

             }
             else
             {
                 System.out.println("no dueeeee for hospital:-----");
             }
         }

         //System.out.println("sizeeeeeeeeee of child:-----"+operationbillchildList.size());
         System.out.println("sizeeeeeeeeee of due for hospital:::::"+operationbillchildListReturn.size());

//         for(int g=0;g<operationbillchildListReturn.size();g++)
//         {
//             System.out.println("total due hostpital to pay:::::"+operationbillchildListReturn.get(g).getTotalduechild());
//         }
         httpSession.setAttribute("operationbill", operation);
         httpSession.setAttribute("operationbillchild", operationbillchildList);
         httpSession.setAttribute("operationbillchildListReturn", operationbillchildListReturn);
         httpSession.setAttribute("operationbillsize", operation.size());
          httpSession.setAttribute("operationbillsizehospitaldue", +operationbillchildListReturn.size());


         totalNoofBills=bills.size()+dispenses.size()+indispenses.size()+redispenses.size()+therapy.size()+investigation.size()+advance.size()+operation.size();
        
          httpSession.setAttribute("totalNoofBills", totalNoofBills);
        
    }


    public void showByDateSalesReport() {
        Date salesDate=new Date();
        salesDate=DateUtil.simpleDateParser(request.getParameter("salesreportDate"));
        Double saleamount =0.0;


        /* this is for getting consultation charges only
         *
        */


        List<Bill> bil=new BillDAO().readListOfObjects(salesDate);
       
        Iterator<Bill> iterator = bil.iterator();
          
            while (iterator.hasNext()) {

                Bill charges = iterator.next();

                saleamount=saleamount+charges.getConsultationcharges().doubleValue();
               
            }
            
         httpSession.setAttribute("bills", bil);
         httpSession.setAttribute("firstdate", salesDate);
         httpSession.setAttribute("seconddate", salesDate);
         httpSession.setAttribute("billsize", bil.size());
         httpSession.setAttribute("total", saleamount);

          /*
          * till here
          */
         /* this is for pharmacy out patient
          *
          */

         List<Dispense> dispenses=new DispenseDAO().readListOfObjects(salesDate);
         httpSession.setAttribute("dispenses", dispenses);
         httpSession.setAttribute("dispensessize", dispenses.size());


         /*
          * till here
          */
         /* this is for pharmacy in patient
          *
          */


         List<Indispense> indispenses=new InDispenseDAO().readListOfObjects(salesDate);
         httpSession.setAttribute("indispenses", indispenses);
         httpSession.setAttribute("indispensessize", indispenses.size());


         List< Redispense> redispenses=new RedispenseDao().readListOfObjects(salesDate);
         httpSession.setAttribute("redispenses", redispenses);
         httpSession.setAttribute("redispensessize", redispenses.size());
          /*
          * till here
          */
         /* this is for therapy
          *
          */

         List<Therapybill> therapy=new TherapybillDao().showTherapyBillsByDate(salesDate);
         httpSession.setAttribute("therapy", therapy);
         httpSession.setAttribute("therapysize", therapy.size());
         /*
          * till here
          */
         /* this is for investigation
          *
          */

         List<Investigationbill> investigation=new InvestigationBillDao().showInvestigationBillsByDate(salesDate);
         httpSession.setAttribute("investigation", investigation);
         httpSession.setAttribute("investigationsize", investigation.size());



         List<Advance> advance=new AdvanceDao().showAdvanceBillsByDate(salesDate);
         httpSession.setAttribute("advance", advance);
         httpSession.setAttribute("advancesize", advance.size());
         /*
          *
          * for operation
          *
          *
          */

         List<Operationbill> operation=new OperationBillDao().showOperationBillsByDate(salesDate);
         System.out.println("sizeeeeeeeeee of parent:-----"+operation.size());
         List<Operationbillchild> operationbillchildList = new ArrayList<Operationbillchild>();
         List<Operationbillchild> operationbillchildListReturn = new ArrayList<Operationbillchild>();
         for(int i=0;i<operation.size();i++)
         {
             List<Operationbillchild> operationbillchild = new OperationBillDao().showTodaysOperationChildsBills(salesDate, salesDate,operation.get(i).getOperationbillid());
             System.out.println("sizeeeeeeeeee:-----"+operationbillchild.size());

             for(int j=0;j<operationbillchild.size();j++)
             {
                 operationbillchildList.add(operationbillchild.get(j));
             }
         }

         for(int k=0;k<operationbillchildList.size();k++)
         {

             if(operationbillchildList.get(k).getTotalduechild().compareTo(BigDecimal.ZERO) <0)
             {
                 System.out.println("ddddddddddddd:::::"+operationbillchildList.get(k).getTotalduechild());
                 operationbillchildListReturn.add(operationbillchildList.get(k));

             }
             else
             {
                 System.out.println("no dueeeee for hospital:-----");
             }
         }

         //System.out.println("sizeeeeeeeeee of child:-----"+operationbillchildList.size());
         System.out.println("sizeeeeeeeeee of due for hospital:::::"+operationbillchildListReturn.size());

//         for(int g=0;g<operationbillchildListReturn.size();g++)
//         {
//             System.out.println("total due hostpital to pay:::::"+operationbillchildListReturn.get(g).getTotalduechild());
//         }
         httpSession.setAttribute("operationbill", operation);
         httpSession.setAttribute("operationbillchild", operationbillchildList);
         httpSession.setAttribute("operationbillchildListReturn", operationbillchildListReturn);
         httpSession.setAttribute("operationbillsize", operation.size());
          httpSession.setAttribute("operationbillsizehospitaldue", +operationbillchildListReturn.size());

         int totalNoofBills =0;
         totalNoofBills=bil.size()+dispenses.size()+indispenses.size()+redispenses.size()+therapy.size()+investigation.size()+advance.size()+operation.size();
        
          httpSession.setAttribute("totalNoofBills", totalNoofBills);
    }



    public void showBetweenDateSalesReport() {
        Date salesfirstDate=new Date();
        Date salessecondDate=new Date();
        salesfirstDate=DateUtil.simpleDateParser(request.getParameter("salesfirstdate"));
        salessecondDate=DateUtil.simpleDateParser(request.getParameter("salesseconddate"));
        
        /* this is for getting consultation charges only
         *
        */

        Double saleamount =0.0;
       
        List<Bill> bil=new BillDAO().showConsultantBetweenDateBills(salesfirstDate,salessecondDate);

        Iterator<Bill> iterator = bil.iterator();
            
            while (iterator.hasNext()) {

                Bill charges = iterator.next();

                saleamount=saleamount+charges.getConsultationcharges().doubleValue();
                
            }
            
        httpSession.setAttribute("bills", bil);
        httpSession.setAttribute("firstdate", salesfirstDate);
        httpSession.setAttribute("seconddate", salessecondDate);
        httpSession.setAttribute("billsize", bil.size());
         httpSession.setAttribute("total", saleamount);

         /*
          * till here
          */
         /* this is for pharmacy out patient
          *
          */

          List<Dispense> dispenses=new DispenseDAO().showBetweenTodaysDispensedBills(salesfirstDate,salessecondDate);
         httpSession.setAttribute("dispenses", dispenses);
         httpSession.setAttribute("dispensessize", dispenses.size());

         /*
          * till here
          */
         /* this is for pharmacy in patient
          *
          */

         List<Indispense> indispenses=new InDispenseDAO().showBetweenTodaysDispensedBills(salesfirstDate,salessecondDate);
         httpSession.setAttribute("indispenses", indispenses);
         httpSession.setAttribute("indispensessize", indispenses.size());



         List< Redispense> redispenses=new RedispenseDao().showBetweenTodaysRedispensedBills(salesfirstDate,salessecondDate);
         httpSession.setAttribute("redispenses", redispenses);
         httpSession.setAttribute("redispensessize", redispenses.size());
         /*
          * till here
          */
         /* this is for therapy
          *
          */

         List<Therapybill> therapy=new TherapybillDao().showBetweenDateTherapyBills(salesfirstDate,salessecondDate);
         httpSession.setAttribute("therapy", therapy);
         httpSession.setAttribute("therapysize", therapy.size());
         /*
          * till here
          */
         /* this is for investigation
          *
          */

         List<Investigationbill> investigation=new InvestigationBillDao().showBetweendateInvestigationBill(salesfirstDate,salessecondDate);
         httpSession.setAttribute("investigation", investigation);
         httpSession.setAttribute("investigationsize", investigation.size());

          List<Advance> advance=new AdvanceDao().showBetweendateAdvanceBill(salesfirstDate,salessecondDate);
         httpSession.setAttribute("advance", advance);
         httpSession.setAttribute("advancesize", advance.size());
         /*
          *
          * for operation
          */
         List<Operationbill> operation=new OperationBillDao().showBetweendateOperationBill(salesfirstDate,salessecondDate);
         System.out.println("sizeeeeeeeeee of parent:-----"+operation.size());
         List<Operationbillchild> operationbillchildList = new ArrayList<Operationbillchild>();
         List<Operationbillchild> operationbillchildListReturn = new ArrayList<Operationbillchild>();
         for(int i=0;i<operation.size();i++)
         {
             List<Operationbillchild> operationbillchild = new OperationBillDao().showTodaysOperationChildsBills(salesfirstDate, salessecondDate,operation.get(i).getOperationbillid());
             System.out.println("sizeeeeeeeeee:-----"+operationbillchild.size());

             for(int j=0;j<operationbillchild.size();j++)
             {
                 operationbillchildList.add(operationbillchild.get(j));
             }
         }

         for(int k=0;k<operationbillchildList.size();k++)
         {

             if(operationbillchildList.get(k).getTotalduechild().compareTo(BigDecimal.ZERO) <0)
             {
                 System.out.println("ddddddddddddd:::::"+operationbillchildList.get(k).getTotalduechild());
                 operationbillchildListReturn.add(operationbillchildList.get(k));

             }
             else
             {
                 System.out.println("no dueeeee for hospital:-----");
             }
         }

         //System.out.println("sizeeeeeeeeee of child:-----"+operationbillchildList.size());
         System.out.println("sizeeeeeeeeee of due for hospital:::::"+operationbillchildListReturn.size());

//         for(int g=0;g<operationbillchildListReturn.size();g++)
//         {
//             System.out.println("total due hostpital to pay:::::"+operationbillchildListReturn.get(g).getTotalduechild());
//         }
         httpSession.setAttribute("operationbill", operation);
         httpSession.setAttribute("operationbillchild", operationbillchildList);
         httpSession.setAttribute("operationbillchildListReturn", operationbillchildListReturn);
         httpSession.setAttribute("operationbillsize", operation.size());
          httpSession.setAttribute("operationbillsizehospitaldue", +operationbillchildListReturn.size());
         int totalNoofBills =0;
         totalNoofBills=bil.size()+dispenses.size()+indispenses.size()+redispenses.size()+therapy.size()+investigation.size()+advance.size()+operation.size();
        
          httpSession.setAttribute("totalNoofBills", totalNoofBills);

    }

    public void showSalesThisMonth() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);
       
         int year = cal.get(Calendar.YEAR);
         int month = cal.get(Calendar.MONTH);
         int day = cal.get(Calendar.DATE);
         Date startingdate = new Date(year-1900, month, day);
         Date currentdate=new Date();
         Double saleamount =0.0;

         /* this is for getting consultation charges only
         *
        */

         List<Bill> bil=new BillDAO().showConsultantForThisMonth(startingdate,currentdate);
       
        Iterator<Bill> iterator = bil.iterator();
            
            while (iterator.hasNext()) {

                Bill charges = iterator.next();

                saleamount=saleamount+charges.getConsultationcharges().doubleValue();
               
            }
           
        httpSession.setAttribute("bills", bil);
        httpSession.setAttribute("firstdate", startingdate);
        httpSession.setAttribute("seconddate", currentdate);
        httpSession.setAttribute("billsize", bil.size());
        httpSession.setAttribute("total", saleamount);

         /*
          * till here
          */
         /* this is for pharmacy out patient
          *
          */

         List<Dispense> dispenses=new DispenseDAO().showDispensedBillsForThisMonth(startingdate,currentdate);
         httpSession.setAttribute("dispenses", dispenses);
         httpSession.setAttribute("dispensessize", dispenses.size());

         /*
          * till here
          */
         /* this is for pharmacy in patient
          *
          */

         List<Indispense> indispenses=new InDispenseDAO().showDispensedBillsForThisMonth(startingdate,currentdate);
         httpSession.setAttribute("indispenses", indispenses);
         httpSession.setAttribute("indispensessize", indispenses.size());


         List< Redispense> redispenses=new RedispenseDao().showRedispensedBillsForThisMonth(startingdate,currentdate);
         httpSession.setAttribute("redispenses", redispenses);
         httpSession.setAttribute("redispensessize", redispenses.size());

         /*
          * till here
          */
         /* this is for therapy
          *
          */

         List<Therapybill> therapy=new TherapybillDao().showTherapyForThisMonth(startingdate,currentdate);
         httpSession.setAttribute("therapy", therapy);
         httpSession.setAttribute("therapysize", therapy.size());
         /*
          * till here
          */
         /* this is for investigation
          *
          */

         List<Investigationbill> investigation=new InvestigationBillDao().showInvestigationThisMonthBill(startingdate,currentdate);
         httpSession.setAttribute("investigation", investigation);
         httpSession.setAttribute("investigationsize", investigation.size());


         List<Advance> advance=new AdvanceDao().showAdvanceThisMonthBill(startingdate,currentdate);
         httpSession.setAttribute("advance", advance);
         httpSession.setAttribute("advancesize", advance.size());

         /* for operation bill charges
          *
          *
          */

         List<Operationbill> operation=new OperationBillDao().showOperationThisMonthBill(startingdate,currentdate);
         System.out.println("sizeeeeeeeeee of parent:-----"+operation.size());
         List<Operationbillchild> operationbillchildList = new ArrayList<Operationbillchild>();
         List<Operationbillchild> operationbillchildListReturn = new ArrayList<Operationbillchild>();
         for(int i=0;i<operation.size();i++)
         {
             List<Operationbillchild> operationbillchild = new OperationBillDao().showTodaysOperationChildsBills(startingdate, currentdate,operation.get(i).getOperationbillid());
             System.out.println("sizeeeeeeeeee:-----"+operationbillchild.size());

             for(int j=0;j<operationbillchild.size();j++)
             {
                 operationbillchildList.add(operationbillchild.get(j));
             }
         }

         for(int k=0;k<operationbillchildList.size();k++)
         {

             if(operationbillchildList.get(k).getTotalduechild().compareTo(BigDecimal.ZERO) <0)
             {
                 System.out.println("ddddddddddddd:::::"+operationbillchildList.get(k).getTotalduechild());
                 operationbillchildListReturn.add(operationbillchildList.get(k));

             }
             else
             {
                 System.out.println("no dueeeee for hospital:-----");
             }
         }

         //System.out.println("sizeeeeeeeeee of child:-----"+operationbillchildList.size());
         System.out.println("sizeeeeeeeeee of due for hospital:::::"+operationbillchildListReturn.size());

//         for(int g=0;g<operationbillchildListReturn.size();g++)
//         {
//             System.out.println("total due hostpital to pay:::::"+operationbillchildListReturn.get(g).getTotalduechild());
//         }
         httpSession.setAttribute("operationbill", operation);
         httpSession.setAttribute("operationbillchild", operationbillchildList);
         httpSession.setAttribute("operationbillchildListReturn", operationbillchildListReturn);
         httpSession.setAttribute("operationbillsize", operation.size());
          httpSession.setAttribute("operationbillsizehospitaldue", +operationbillchildListReturn.size());

         int totalNoofBills =0;
         totalNoofBills=bil.size()+dispenses.size()+indispenses.size()+redispenses.size()+therapy.size()+investigation.size()+advance.size()+operation.size();
       
          httpSession.setAttribute("totalNoofBills", totalNoofBills);
    }

}
