/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.routineureal.service;

import com.model.routineureal.dao.RoutineurealDao;
import com.model.routineureal.dto.Routineurine;
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
 * @author Admin
 */
public class RoutineurealService {
 private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public RoutineurealService(HttpServletRequest request, HttpServletResponse response) {
         this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean add() {
        Routineurine consultant = new Routineurine();

        consultant.setName(request.getParameter("Name"));
         consultant.setReferredby(request.getParameter("Referred by"));
         consultant.setDdate(request.getParameter("Date"));


         consultant.setNamesample(request.getParameter("sample"));
         consultant.setTimeofcollection(request.getParameter("Collection"));

         consultant.setQuantity(request.getParameter("Quantity"));
         consultant.setAppearance(request.getParameter("Appearance"));
         
         consultant.setSpecificgravity(request.getParameter("Gravity"));
         consultant.setAlbumin(request.getParameter("Albumin"));
         consultant.setSugar(request.getParameter("Sugar"));
         consultant.setBilesalt(request.getParameter("Salt"));
         consultant.setBiltpigment(request.getParameter("Pigment"));
         consultant.setPuscells(request.getParameter("Pus Cells"));
         consultant.setEpithelialcells(request.getParameter("Epithelial Cells"));
         consultant.setCasts(request.getParameter("Casts"));
         consultant.setCrystals(request.getParameter("Crystals"));
         consultant.setRbc(request.getParameter("R.B.C"));
         consultant.setOthers(request.getParameter("Others"));
         consultant.setPragnency(request.getParameter("RESULT"));
         consultant.setOccultblood(request.getParameter("Occult Blood"));
         consultant.setOvacyst(request.getParameter("ovs Cyst"));
         consultant.setRbs(request.getParameter("R.B.S"));
         consultant.setPuscells1(request.getParameter("Pus Cells1"));
         consultant.setAfb(request.getParameter("A.F.B"));
         


        consultant = new RoutineurealDao().create(consultant);

        if (consultant.getId() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }
    }

}
