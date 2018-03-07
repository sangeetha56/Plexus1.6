/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.investigation.service;

import com.model.investigation.dao.InvestigationDao;
import com.model.investigation.dto.Investigation;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class InvestigationService
{
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public InvestigationService(HttpServletRequest request, HttpServletResponse response)
    {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addInvestigationName() {
        Investigation investname = new Investigation();
        
        investname.setInvestigationtype(request.getParameter("investigationtypename"));
        investname.setInvestigationcharge(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("investigationtypecharges"))));
        investname.setUsefull(true);


        investname = new InvestigationDao().create(investname);
        if (investname.getInvestigationid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }
    }

    public boolean addInvestigationName1() {
        Investigation investname1 = new Investigation();
      
        investname1.setInvestigationtype(request.getParameter("investigationName"));


        investname1   = new InvestigationDao().create1(investname1);
        if (investname1.getInvestigationid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }

    }

    public boolean deleteInvestigationName() {
      
        long investid=0;

        investid = DataUtil.parseLong(request.getParameter("id"));
       
       new InvestigationDao().deleteInvestigationName(investid);
        return true;
    }

    public boolean updateInvestigationName() {
        Investigation invest = new Investigation();
       
        long investid = 0;
        investid = DataUtil.parseLong(request.getParameter("id"));
        
         invest.setInvestigationid(investid);
         invest.setInvestigationtype(request.getParameter("investigationtypeName"));
         invest.setInvestigationcharge(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("investigationTypeCharges"))));
         invest.setUsefull(true);

         invest = new InvestigationDao().updateInvestigationName(invest);
        return true;
    }

    public boolean viewAllInvestigationType() {
             
        boolean result = false;
        try {
            List<Investigation> list = new InvestigationDao().viewAllInvestigationType();
            httpSession.setAttribute("investigationList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsInvestigationType() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
          
            Investigation investigationdetail = new InvestigationDao().viewDetailsInvestigationType(id);
           
            if (investigationdetail == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfInvestigation", investigationdetail);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }


    public void deleteMultiple() {
        String[] investigationIds = request.getParameterValues("patientIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : investigationIds) {
           // System.out.println("id" + id);
            ids.add(Long.valueOf(id));

        }
        
        new InvestigationDao().deleteMultiple(ids);
    }
}
