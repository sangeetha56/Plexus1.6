/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.bbiochemistry.service;

import com.model.bbiochemistry.dao.BbiochemistryDao;
import com.model.bbiochemistry.dto.Bbiochemistry;
import com.util.DataUtil;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class BbiochemistryService {
 private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public BbiochemistryService(HttpServletRequest request, HttpServletResponse response) {
          this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean add() {
         Bbiochemistry consultant = new Bbiochemistry();

        consultant.setName(request.getParameter("Name"));
        consultant.setAge(DataUtil.parseShort(request.getParameter("Age")));
        consultant.setSex(request.getParameter("Sex"));
        consultant.setOpIpdno(DataUtil.parseLong(request.getParameter("O.P/I.P.D NO")));
        consultant.setReferredby(request.getParameter("Referred by"));
        consultant.setSerialno(DataUtil.parseLong(request.getParameter("Serial No")));
        consultant.setLipid(request.getParameter("result1"));
        consultant.setLipid1(request.getParameter("result2"));
        consultant.setLipid2(request.getParameter("result3"));
        consultant.setLipid3(request.getParameter("result4"));
        consultant.setLipid4(request.getParameter("result5"));
        consultant.setRemarks(request.getParameter("Remarks :"));
        consultant.setLabtech(request.getParameter("Lab.Tech :"));
        consultant.setDdate(request.getParameter("Date :"));
       



         consultant = new BbiochemistryDao().create(consultant);

        if (consultant.getId() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }
    }
    }


