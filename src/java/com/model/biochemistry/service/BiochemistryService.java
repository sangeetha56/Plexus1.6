/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.biochemistry.service;
import com.model.biochemistry.dao.biochemistryDao;
import com.model.biochemistry.dto.Biochemistry;
import com.util.DataUtil;
import com.util.DateUtil;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADIL KHAN B A
 */
public class BiochemistryService {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;


    public BiochemistryService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean add() {
        Biochemistry consultant = new Biochemistry();
         
        consultant.setName(request.getParameter("patientName"));
        consultant.setAge(DataUtil.parseShort(request.getParameter("Age")));
        consultant.setSex(request.getParameter("Sex"));
        consultant.setCardno(DataUtil.parseLong(request.getParameter("cardNo")));
        consultant.setReferredby(request.getParameter("Referred by"));
        consultant.setSerialno(DataUtil.parseLong(request.getParameter("Serial No")));
        consultant.setResult1(request.getParameter("result1"));
        consultant.setResult2(request.getParameter("result2"));
        consultant.setResult3(request.getParameter("result3"));
        consultant.setResult4(request.getParameter("result4"));
        consultant.setResult5(request.getParameter("result5"));
        consultant.setResult6(request.getParameter("result6"));
        consultant.setResult7(request.getParameter("result7"));
        consultant.setResult8(request.getParameter("result8"));
        consultant.setResult9(request.getParameter("result9"));
        consultant.setResult10(request.getParameter("result10"));

        
        consultant.setNormalvalue1(request.getParameter("normalvalue1"));
        consultant.setNormalvalue2(request.getParameter("normalvalue2"));
        consultant.setNormalvalue3(request.getParameter("normalvalue3"));
        consultant.setNormalvalue4(request.getParameter("normalvalue4"));
        consultant.setNormalvalue5(request.getParameter("normalvalue5"));
        consultant.setNormalvalue6(request.getParameter("normalvalue6"));
        consultant.setNormalvalue7(request.getParameter("normalvalue7"));
        consultant.setNormalvalue8(request.getParameter("normalvalue8"));
        consultant.setNormalvalue9(request.getParameter("normalvalue9"));
        consultant.setRemarks(request.getParameter("Remarks :"));
        consultant.setLabtech(request.getParameter("Lab.Tech :"));
        consultant.setDdate(DateUtil.simpleDateParser(request.getParameter("creationDate")));
        consultant.setCrp(request.getParameter("crp"));
       consultant.setRa(request.getParameter("ra"));


         consultant = new biochemistryDao().create(consultant);

        if (consultant.getId() == 0l) {
            return false;
        } else {
          httpSession.setAttribute("biochemistry", consultant);
            return true;
        }
    }

    public boolean viewAll() {
        boolean result = false;
        try {
            List<Biochemistry> list = new biochemistryDao().readListOfObjects();
            httpSession.setAttribute("biochemistryList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public void preview() {
        long id=DataUtil.parseLong(request.getParameter("id"));
        Biochemistry list=new biochemistryDao().readUniqueObject(id);
         httpSession.setAttribute("biochemistryList", list);

    }

    }

