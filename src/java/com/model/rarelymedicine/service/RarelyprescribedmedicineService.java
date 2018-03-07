/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.rarelymedicine.service;

import com.model.rarelymedicine.dto.Rarelyprescribedmedicine;
import com.util.DataUtil;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sultan
 */
public class RarelyprescribedmedicineService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public RarelyprescribedmedicineService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public void updateLastAccessDate(long fornid)
    {
        Rarelyprescribedmedicine rpm=new Rarelyprescribedmedicine();

        //rpm.setMedicine(null);

    }



}
