/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.bloodtransfucion.service;
import com.model.bloodtransfucion.dao.bloodtransfucionDao;
import com.model.bloodtransfucion.dto.Bloodtransfucion;
import com.util.DataUtil;
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
public class bloodtransfucionService {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public bloodtransfucionService(HttpServletRequest request, HttpServletResponse response) {
       this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean add() {
        Bloodtransfucion consultant = new Bloodtransfucion();

        consultant.setPateintname(request.getParameter("patientname"));
        consultant.setWarddept(request.getParameter("wardDept"));
          consultant.setWarddep(request.getParameter("wardDep."));
          consultant.setBedno(DataUtil.parseLong(request.getParameter("bedNo.")));
          consultant.setAge(DataUtil.parseShort(request.getParameter("age")));
          consultant.setSex(request.getParameter("sex"));
          consultant.setPtsdoctor(request.getParameter("ptsDoctor"));
          consultant.setBloodgroup(request.getParameter("patientBloodGroup"));
          consultant.setRh(request.getParameter("rh"));
          consultant.setDdate(request.getParameter("date"));
          consultant.setDonors(request.getParameter("donor's"));
          consultant.setBottleno(DataUtil.parseLong(request.getParameter("bottle No.")));
          consultant.setBgroup(request.getParameter("group"));
          consultant.setHiv(request.getParameter("hIV"));
          consultant.setHcv(request.getParameter("hCV"));
          consultant.setHbsag(request.getParameter("hBSAG"));
          consultant.setVdrl(request.getParameter("vDRL"));
          consultant.setMp(request.getParameter("mP"));


          consultant.setDdate1(request.getParameter("date1"));
          consultant.setDonors1(request.getParameter("donor's1"));
          consultant.setBottleno1(DataUtil.parseLong(request.getParameter("bottle No.1")));
          consultant.setBgroup1(request.getParameter("group1"));
          consultant.setHiv1(request.getParameter("hIV1"));
          consultant.setHcv1(request.getParameter("hCV1"));
          consultant.setHbsag1(request.getParameter("hBSAG1"));
          consultant.setVdrl1(request.getParameter("vDRL1"));
          consultant.setMp1(request.getParameter("mP1"));


          consultant.setDdate2(request.getParameter("date2"));
          consultant.setDonors2(request.getParameter("donor's2"));
          consultant.setBottleno2(DataUtil.parseLong(request.getParameter("bottle No.2")));
          consultant.setBgroup2(request.getParameter("group2"));
          consultant.setHiv2(request.getParameter("hIV2"));
          consultant.setHcv2(request.getParameter("hCV2"));
          consultant.setHbsag2(request.getParameter("hBSAG2"));
          consultant.setVdrl2(request.getParameter("vDRL2"));
          consultant.setMp2(request.getParameter("mP2"));

           consultant.setQualityofblood(DataUtil.parseLong(request.getParameter("qualityofBlood")));
          consultant.setSd(request.getParameter("sd"));
          consultant.setMl(request.getParameter("ml issued"));
          consultant.setMl1(request.getParameter("ml issued1"));
          consultant.setMl2(request.getParameter("ml issued2"));
          consultant.setMl3(request.getParameter("ml issued3"));
          


          consultant = new bloodtransfucionDao().create(consultant);

        if (consultant.getId() == 0l) {
            return false;
        } else {
              httpSession.setAttribute("bloodtransfucionList", consultant);
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }
    }

    public boolean viewAll() {
        boolean result = false;
        try {
            List<Bloodtransfucion> list = new bloodtransfucionDao().readListOfObjects();
            httpSession.setAttribute("bloodtransfucionList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsOfUser() {
        boolean result = false;
        try {
            int id =Integer.parseInt(request.getParameter("id"));

            Bloodtransfucion consultant = new bloodtransfucionDao().readUniqueObjectdetails(id);
            //Visit activeVisit= new VisitDAO().readObject(patient, false);
            if (consultant == null) {
                result = false;
            } else {
                httpSession.setAttribute("bloodtransfucionList", consultant);
                //httpSession.setAttribute("activeVisit", activeVisit);
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public void deleteUser() {
        int Id = Integer.parseInt(request.getParameter("id"));

        new bloodtransfucionDao().deleteUser(Id);
    }

    public boolean viewDetails() {
      boolean result = false;
            try{
                List<Bloodtransfucion> list = new bloodtransfucionDao().contactListOfObjects();
                httpSession.setAttribute("bloodtransfucionList", list);
                result = true;

            }catch(Exception e){
                e.printStackTrace();
                result = false;
            }


        return result;
    }
    }

    

