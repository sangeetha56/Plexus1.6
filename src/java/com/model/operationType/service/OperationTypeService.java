/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.operationType.service;

import com.model.operationType.dao.OperationTypeDao;
import com.model.operationType.dto.Operationtype;
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
public class OperationTypeService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public OperationTypeService(HttpServletRequest request, HttpServletResponse response) {

        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addOperationTypeName() {

        Operationtype operationname = new Operationtype();

        operationname.setOperationtype(request.getParameter("Operationtypename"));
        operationname.setOperationtypecharge(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("operationtypecharges"))));
        operationname.setUsefull(true);
System.out.println("nishathhhhhhhhhhh....");

        operationname = new OperationTypeDao().create(operationname);
        if (operationname.getOperationtypeid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }
    }

    public boolean addOperationTypeName1() {

         Operationtype operationname1 = new Operationtype();

        operationname1.setOperationtype(request.getParameter("operationtypename"));


        operationname1   = new OperationTypeDao().create1(operationname1);
        if (operationname1.getOperationtypeid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }
    }

    public boolean deleteOperationTypeName() {

         long operationid=0;

        operationid = DataUtil.parseLong(request.getParameter("id"));

       new OperationTypeDao().deleteOperationTypeName(operationid);
        return true;
    }

    public boolean updateOperationTypeName() {

         Operationtype operation = new Operationtype();

        long operationtypeid = 0;
        operationtypeid = DataUtil.parseLong(request.getParameter("id"));

         operation.setOperationtypeid(operationtypeid);
         operation.setOperationtype(request.getParameter("operationtypename"));
         operation.setOperationtypecharge(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("operationTypeCharges"))));
         operation.setUsefull(true);

         operation = new OperationTypeDao().updateOperationTypeName(operation);
        return true;
    }

    public boolean viewAllOperationType() {

         boolean result = false;
        try {
            List<Operationtype> list = new OperationTypeDao().viewAllOperationType();
            httpSession.setAttribute("operationList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsOperationType() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));

            Operationtype operationtypedetail = new OperationTypeDao().viewDetailsOperationType(id);

            if (operationtypedetail == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfOperationType", operationtypedetail);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public void deleteMultiple() {

         String[] operationIds = request.getParameterValues("patientIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : operationIds) {
           // System.out.println("id" + id);
            ids.add(Long.valueOf(id));

        }

        new OperationTypeDao().deleteMultiple(ids);
    }

}
