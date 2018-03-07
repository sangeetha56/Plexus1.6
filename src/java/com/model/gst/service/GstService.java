/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.gst.service;
import com.model.gst.dao.GstDao;
import com.model.gst.dto.Gst;
import com.util.DataUtil;
import java.math.BigDecimal;
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
public class GstService {
private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public GstService(HttpServletRequest request, HttpServletResponse response) {
       this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean add() {
         Gst consultant = new Gst();
        
         
consultant.setId(DataUtil.parseLong(request.getParameter("id")));

 consultant.setPatient(request.getParameter("Name"));
 consultant.setCardno(DataUtil.parseLong(request.getParameter("cardno")));
 consultant.setReferredby(request.getParameter("Referred by"));
 consultant.setDdate(request.getParameter("Date :"));
 consultant.setInvoice(request.getParameter("invoice"));

 consultant.setSubtotal(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("qlty"))));
 consultant.setSgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("qlty"))));
 consultant.setCgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("qlty"))));
 consultant.setIgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("qlty"))));
 consultant.setRoundoff(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("qlty"))));
 consultant.setGsttotal(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("qlty"))));
 consultant.setGrandtotal(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("qlty"))));



consultant.setItems(request.getParameter("items"));
consultant.setQlty(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("qlty"))));
consultant.setAddcgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("cgst"))));
consultant.setAddsgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("sgst"))));
consultant.setAddigst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("igst"))));
consultant.setRate(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("rate"))));
consultant.setAmount(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("amount"))));
consultant.setMdate(request.getParameter("mdate"));
consultant.setEdate(request.getParameter("edate"));
consultant.setBatchno(request.getParameter("batchno"));
consultant = new GstDao().create(consultant);
        if (consultant.getId() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }
    }

}
