/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.consultancytype.service;

import com.model.consultancytype.dao.ConsultancyTypeDao;
import com.model.consultancytype.dto.Consultancytype;
import com.util.DataUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ConsultancyTypeService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;
    

    public ConsultancyTypeService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addConsultancyType() {

         Consultancytype consultant = new Consultancytype();
        
        consultant.setConsultanttypename(request.getParameter("ConsultancyTypeName"));
        consultant.setCntlcycharges(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("ConsultancyTypeCharges"))));
        consultant.setUsefull(true);
        consultant.setRefferedby(request.getParameter("ConsultancyTypeCharges"));
        consultant.setDiscount(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("Discount"))));
        consultant.setTotal(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("Total"))));

          consultant = new ConsultancyTypeDao().create(consultant);
         
        if (consultant.getConsultancyid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public boolean addConsultancyType1() {

         Consultancytype consultant = new Consultancytype();
       
        consultant.setConsultanttypename(request.getParameter("consultancyTypeName"));


          consultant = new ConsultancyTypeDao().create1(consultant);
        if (consultant.getConsultancyid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public Boolean updateConsultancy() {
      
        Consultancytype consultant = new Consultancytype();
       
        long consultancytypeid = 0;
        consultancytypeid = DataUtil.parseLong(request.getParameter("id"));
        
         consultant.setConsultancyid(consultancytypeid);
         consultant.setConsultanttypename(DataUtil.emptyString(request.getParameter("ConsultancyTypeName")));
         consultant.setCntlcycharges(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("ConsultancyTypeCharges"))));
         consultant.setUsefull(true);
         consultant.setRefferedby(DataUtil.emptyString(request.getParameter("ConsultancyTypeCharges")));
        consultant.setDiscount(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("Discount"))));
        consultant.setTotal(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("Total"))));
         consultant = new ConsultancyTypeDao().updateConsultancy(consultant);
     
        return true;

    }

    public boolean deleteConsultancy() {
     
        long consultancytypeid = 0;

        consultancytypeid = DataUtil.parseLong(request.getParameter("id"));
       
       new ConsultancyTypeDao().deleteConsultancy(consultancytypeid);
        return true;


    }

    public boolean viewAllConsultancy() {
            
        boolean result = false;
        try {
            List<Consultancytype> list = new ConsultancyTypeDao().readListOfObjects();
            httpSession.setAttribute("consultancyList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsConsultancyType() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
          
            Consultancytype consultantcy = new ConsultancyTypeDao().readUniqueObject(id);
           
            if (consultantcy == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfConsultantcy", consultantcy);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

     public void deleteMultiple() {
        String[] consultancyIds = request.getParameterValues("patientIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : consultancyIds) {
          
            ids.add(Long.valueOf(id));

        }
      
        new ConsultancyTypeDao().deleteMultiple(ids);
    }



}
