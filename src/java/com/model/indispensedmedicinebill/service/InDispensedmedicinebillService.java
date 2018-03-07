/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.indispensedmedicinebill.service;

import com.model.doctorProcess.service.DoctorInfoService;
import com.model.indispense.dto.Indispense;
import com.model.indispensedmedicinebill.dao.InDispensedmedicinebillDAO;
import com.model.indispensedmedicinebill.dto.Indispensedmedicinebill;
import com.util.DataUtil;
import java.math.BigDecimal;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class InDispensedmedicinebillService {

     private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;


    public InDispensedmedicinebillService(HttpServletRequest request, HttpServletResponse response) {
         this.request = request;
        this.response = response;
        this.httpSession=request.getSession();
    }

    public void add(Indispense dispense) {
         Indispensedmedicinebill  dispensedmedicinebill=new Indispensedmedicinebill();
        Date publishedDate=dispense.getDispensedate();
        BigDecimal amount = BigDecimal.ZERO;
        BigDecimal consultationamount = BigDecimal.ZERO;
        BigDecimal miscellanousamount = BigDecimal.ZERO;
        BigDecimal medicineamount = BigDecimal.ZERO;
        BigDecimal billvalueBeforeDiscount=BigDecimal.ZERO;
        BigDecimal discountedvalue=BigDecimal.ZERO;
        BigDecimal cgst=BigDecimal.ZERO;
        BigDecimal sgst=BigDecimal.ZERO;
        BigDecimal igst=BigDecimal.ZERO;
        long gst=0;
        BigDecimal totaltaxvalue=BigDecimal.ZERO;
        long discoutparcentge=0;
        String departmentname=null;
        String doctorname=null;
        int doctorid=0;
        int check=0;


        amount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totalvalueinPatient")));
        consultationamount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("consultationamountinPatient")));
        miscellanousamount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("miscellanousamountinPatient")));
        medicineamount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("medicineTotalAmountinPatient")));

        billvalueBeforeDiscount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("grandTotalAmountinPatient")));
        discountedvalue=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("discountamountinPatient")));
        discoutparcentge=DataUtil.parseLong(request.getParameter("discountparcentinPatient"));

        cgst=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("cgst")));
        sgst=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("sgst")));
        igst=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("igst")));
        totaltaxvalue=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totaltaxvalue")));
        gst=DataUtil.parseLong(request.getParameter("gst"));


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
        departmentname=(String)httpSession.getAttribute("departmentname");
        doctorname=(String)httpSession.getAttribute("doctorname");


        }


        dispensedmedicinebill.setIndispense(dispense);
        dispensedmedicinebill.setPublisheddate(publishedDate);
        dispensedmedicinebill.setAmount(amount);
        dispensedmedicinebill.setConsultationamount(consultationamount);
        dispensedmedicinebill.setMiscellanousamount(miscellanousamount);
        dispensedmedicinebill.setMedicineamount(medicineamount);
        dispensedmedicinebill.setBillvaluebeforediscount(billvalueBeforeDiscount);
        dispensedmedicinebill.setDiscountparcentage(discoutparcentge);
        dispensedmedicinebill.setDiscountedvalue(discountedvalue);
        dispensedmedicinebill.setDoctordepartment(departmentname);
        dispensedmedicinebill.setDoctorname(doctorname);
        dispensedmedicinebill.setCgst(cgst);
        dispensedmedicinebill.setSgst(sgst);
        dispensedmedicinebill.setIgst(igst);
        dispensedmedicinebill.setTotaltaxvalue(totaltaxvalue);
        dispensedmedicinebill.setGst(gst);

        dispensedmedicinebill=new InDispensedmedicinebillDAO().create(dispensedmedicinebill);

    }

}
