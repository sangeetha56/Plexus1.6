/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.therapy.service;

import com.model.therapy.dao.TheraphyDao;
import com.model.therapy.dto.Theraphy;
import com.util.DataUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sultan
 */
public class TheraphyService {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public TheraphyService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }


    public boolean addTherapyType() {

         Theraphy therapy = new Theraphy();
         
         therapy.setTheraphytype(request.getParameter("therapytypename"));
         therapy.setTheraphycharge(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("TherapyTypeCharges"))));
         therapy.setUsefull(true);
        


          therapy = new TheraphyDao().addTherapyType(therapy);
        if (therapy.getTherphyid() == 00) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }


    public boolean addTherapyType1() {

         Theraphy therapy = new Theraphy();
      
        therapy.setTheraphytype(request.getParameter("therapyname"));
        therapy.setTheraphycharge(BigDecimal.ZERO);


          therapy = new TheraphyDao().addTherapyType1(therapy);
        if (therapy.getTherphyid() == 01) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public Boolean updateTherapyType() {
        Theraphy therapy = new Theraphy();
       
        long therapyid = 0;
        therapyid = DataUtil.parseLong(request.getParameter("id"));
      
         therapy.setTherphyid(therapyid);
         therapy.setTheraphytype(request.getParameter("therapytypeName"));
         therapy.setTheraphycharge(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("TherapyTypeCharges"))));
         therapy.setUsefull(true);

         therapy = new TheraphyDao().updateTherapyType(therapy);
        return true;

    }

    public boolean deleteTherapyType() {
      
        long therapyid = 0;

        therapyid = DataUtil.parseLong(request.getParameter("id"));
        
       new TheraphyDao().deleteTherapyType(therapyid);
        return true;


    }

    public boolean viewAllTherapyType() {
             
        boolean result = false;
        try {
            List<Theraphy> list = new TheraphyDao().viewAllTherapyType();
            httpSession.setAttribute("therapyList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsTherapyType() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
           
            Theraphy therapydetail = new TheraphyDao().viewDetailsTherapyType(id);
           
            if (therapydetail == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfTherapy", therapydetail);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }


     public void deleteMultiple() {
        String[] theraphyIds = request.getParameterValues("patientIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : theraphyIds) {
           
            ids.add(Long.valueOf(id));

        }
      
        new TheraphyDao().deleteMultiple(ids);
    }



}
