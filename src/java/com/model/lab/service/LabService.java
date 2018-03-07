/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.lab.service;

import com.model.lab.dao.LabDao;
import com.model.lab.dto.Lab;
import com.util.DataUtil;
import com.util.DateUtil;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Admin
 */
public class LabService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public LabService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean add() {
        Lab consultant = new Lab();

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
        consultant.setResult11(request.getParameter("result11"));
        consultant.setResult12(request.getParameter("result12"));
        consultant.setResult13(request.getParameter("result13"));
        consultant.setResult14(request.getParameter("result14"));
        consultant.setResult15(request.getParameter("result15"));
        consultant.setResult16(request.getParameter("result16"));
        consultant.setResult17(request.getParameter("result17"));
        consultant.setResult18(request.getParameter("result18"));
        consultant.setResult19(request.getParameter("result19"));
        consultant.setResult20(request.getParameter("result20"));
        consultant.setResult21(request.getParameter("result21"));
        consultant.setResult22(request.getParameter("result22"));
        consultant.setResult23(request.getParameter("result23"));
        consultant.setResult24(request.getParameter("result24"));
        consultant.setResult25(request.getParameter("result25"));
        consultant.setResult26(request.getParameter("result26"));
        consultant.setResult27(request.getParameter("result27"));
        consultant.setResult28(request.getParameter("result28"));
        consultant.setResult29(request.getParameter("result29"));
        consultant.setResult30(request.getParameter("result30"));
        consultant.setResult31(request.getParameter("result31"));
        consultant.setResult32(request.getParameter("result32"));
        consultant.setResult33(request.getParameter("result33"));
        consultant.setResult34(request.getParameter("result34"));
        consultant.setResult35(request.getParameter("result35"));
        consultant.setResult36(request.getParameter("result36"));
        consultant.setResult37(request.getParameter("result37"));
        consultant.setResult38(request.getParameter("result38"));
        consultant.setResult39(request.getParameter("result39"));
        consultant.setResult40(request.getParameter("result40"));
        consultant.setResult41(request.getParameter("result41"));
        consultant.setResult42(request.getParameter("result42"));
        consultant.setResult43(request.getParameter("result43"));
        consultant.setResult44(request.getParameter("result44"));
        consultant.setResult45(request.getParameter("result45"));
        consultant.setResult46(request.getParameter("result46"));
        consultant.setResult47(request.getParameter("result47"));
        consultant.setResult48(request.getParameter("result48"));
        consultant.setResult49(request.getParameter("result49"));
        





        /* consultant.setNormalvalue1(request.getParameter("normalvalue1"));
        consultant.setNormalvalue2(request.getParameter("normalvalue2"));
        consultant.setNormalvalue3(request.getParameter("normalvalue3"));
        consultant.setNormalvalue4(request.getParameter("normalvalue4"));
        consultant.setNormalvalue5(request.getParameter("normalvalue5"));
        consultant.setNormalvalue6(request.getParameter("normalvalue6"));
        consultant.setNormalvalue7(request.getParameter("normalvalue7"));
        consultant.setNormalvalue8(request.getParameter("normalvalue8"));
        consultant.setNormalvalue9(request.getParameter("normalvalue9"));
        consultant.setRemarks(request.getParameter("Remarks :"));
        consultant.setLabtech(request.getParameter("Lab.Tech :"));*/
        consultant.setDdate(DateUtil.simpleDateParser(request.getParameter("creationDate")));
        /* consultant.setCrp(request.getParameter("crp")
        );
        consultant.setRa(request.getParameter("ra"));*/


        consultant = new LabDao().create(consultant);

        if (consultant.getId() == 0l) {
            return false;
        } else {
            httpSession.setAttribute("lab", consultant);
            return true;
        }
    }

    public boolean viewAll() {
        boolean result = false;
        try {
            List<Lab> list = new LabDao().readListOfObjects();
            httpSession.setAttribute("labList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public void preview() {
        long id = DataUtil.parseLong(request.getParameter("id"));
        
        Lab list = new LabDao().readUniqueObject(id);
        httpSession.setAttribute("labList", list);

    }
}
