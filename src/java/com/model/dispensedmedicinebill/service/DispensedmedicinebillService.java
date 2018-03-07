/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.dispensedmedicinebill.service;
import com.model.dispense.dto.Dispense;
import com.model.dispensedmedicinebill.dao.DispensedmedicinebillDAO;
import com.model.dispensedmedicinebill.dto.Dispensedmedicinebill;

import com.model.doctorProcess.service.DoctorInfoService;
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
public class DispensedmedicinebillService {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public DispensedmedicinebillService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession=request.getSession();

    }
    /**
     *
     * @param dispense
     */
    public void add(Dispense dispense){
        Dispensedmedicinebill  dispensedmedicinebill=new Dispensedmedicinebill();
        Date publishedDate=dispense.getDispensedate();
        long id=1;
        BigDecimal amount = BigDecimal.ZERO;
        BigDecimal consultationamount = BigDecimal.ZERO;
        BigDecimal miscellanousamount = BigDecimal.ZERO;
        BigDecimal medicineamount = BigDecimal.ZERO;
        //kamal added for additional information
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

        id=DataUtil.parseLong(request.getParameter("id"));
        amount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totalvalue")));
        consultationamount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("consultationamount")));
        miscellanousamount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("miscellanousamount")));
        medicineamount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("medicineTotalAmount")));

        billvalueBeforeDiscount=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("grandTotalAmount")));
        discountedvalue=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("discountamount")));
        discoutparcentge=DataUtil.parseLong(request.getParameter("discountparcent"));

        cgst=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("cgst")));
        sgst=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("sgst")));
        igst=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("igst")));
        totaltaxvalue=BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("totaltaxvalue")));
        gst=DataUtil.parseLong(request.getParameter("gst"));
        //departmentname=request.getParameter("countryID");
        //doctorname=request.getParameter("state");
        System.out.println("medicine amount:-"+medicineamount);
        System.out.println("bill value before discount amount:-"+billvalueBeforeDiscount);
        System.out.println("discount parcentage:-"+discoutparcentge);
        System.out.println("discounted amount:-"+discountedvalue);
        System.out.println("department name amount:-"+departmentname);
        System.out.println("doctor name amount:-"+doctorname);

        check=DataUtil.emptyIntValueFromString(request.getParameter("state"));
        System.out.println("checkkkkkk is:-"+check);
        if(check==0 || check==-1)
        {
            System.out.println("not to go further");
        }
        else{
            System.out.println("to go further");
            doctorid=Integer.parseInt(request.getParameter("state"));
       if(new DoctorInfoService(request, response).fetchDoc_DeptName(doctorid))
       {
           System.out.println("ggggggggggggggggggggggggg");
       }
       else
       {
            System.out.println("fffffffffffffffffffffff");
       }
        departmentname=(String)httpSession.getAttribute("departmentname");
        doctorname=(String)httpSession.getAttribute("doctorname");

        System.out.println("department name amount:-"+departmentname);
        System.out.println("doctor name amount:-"+doctorname);
        }
        

        dispensedmedicinebill.setDispense(dispense);
        dispensedmedicinebill.setPublisheddate(publishedDate);
        dispensedmedicinebill.setAmount(amount);
        dispensedmedicinebill.setConsultationamount(consultationamount);
        dispensedmedicinebill.setMiscellanousamount(miscellanousamount);
        dispensedmedicinebill.setMedicineamount(medicineamount);
        dispensedmedicinebill.setBillvaluebeforediscount(billvalueBeforeDiscount);
        dispensedmedicinebill.setDiscountedvalue(discountedvalue);
        dispensedmedicinebill.setDiscountparcentage(discoutparcentge);
        dispensedmedicinebill.setDoctordepartment(departmentname);
        dispensedmedicinebill.setDoctorname(doctorname);
        dispensedmedicinebill.setCgst(cgst);
        dispensedmedicinebill.setSgst(sgst);
        dispensedmedicinebill.setIgst(igst);
        dispensedmedicinebill.setTotaltaxvalue(totaltaxvalue);
        dispensedmedicinebill.setGst(gst);
        dispensedmedicinebill=new DispensedmedicinebillDAO().create(dispensedmedicinebill);
        
    }

}
