/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.redispensedmedicinebill.service;

import com.model.doctorProcess.service.DoctorInfoService;
import com.model.redispense.dto.Redispense;
import com.model.redispensedmedicinebill.dao.RedispensedmedicinebillDao;
import com.model.redispensedmedicinebill.dto.Redispensedmedicinebill;
import com.util.DataUtil;
import java.math.BigDecimal;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class RedispensedmedicinebillService {
     private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public RedispensedmedicinebillService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession=request.getSession();

    }

    public void add(Redispense redispense) {
        Redispensedmedicinebill  redispensedmedicinebill=new Redispensedmedicinebill();
        Date publishedDate=redispense.getDispensedate();
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


        redispensedmedicinebill.setRedispense(redispense);
        redispensedmedicinebill.setPublisheddate(publishedDate);
        redispensedmedicinebill.setAmount(amount);

        redispensedmedicinebill.setMedicineamount(medicineamount);
        redispensedmedicinebill.setBillvaluebeforediscount(billvalueBeforeDiscount);
        redispensedmedicinebill.setDiscountedvalue(discountedvalue);
        redispensedmedicinebill.setDiscountparcentage(discoutparcentge);
        redispensedmedicinebill.setDoctordepartment(departmentname);
        redispensedmedicinebill.setDoctorname(doctorname);
        redispensedmedicinebill.setCgst(cgst);
        redispensedmedicinebill.setSgst(sgst);
        redispensedmedicinebill.setIgst(igst);
        redispensedmedicinebill.setTotaltaxvalue(totaltaxvalue);
        redispensedmedicinebill.setGst(gst);
        redispensedmedicinebill=new RedispensedmedicinebillDao().create(redispensedmedicinebill);

    }
    }


