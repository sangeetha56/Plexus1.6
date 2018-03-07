/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.department.service;

import com.model.department.dao.DepartmentNameDao;
import com.model.department.dto.Departmentname;
import com.util.DataUtil;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class DepartmentNameService {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public DepartmentNameService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addDepartmentName() {

         Departmentname dname = new Departmentname();
       
        dname.setDptname(request.getParameter("DepartmentName"));
        dname.setUsefull(true);


          dname = new DepartmentNameDao().create(dname);
        if (dname.getDepartmentnameid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public boolean addDepartmentName1() {

         Departmentname dname = new Departmentname();
       
        dname.setDptname(request.getParameter("departmentName"));


          dname = new DepartmentNameDao().create1(dname);
        if (dname.getDepartmentnameid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public Boolean updateDepartmentName() {
        Departmentname dname = new Departmentname();
       
        long dnameid = 0;
        dnameid = DataUtil.parseLong(request.getParameter("departmentNameid"));
        
         dname.setDepartmentnameid(dnameid);
         dname.setDptname(DataUtil.emptyString(request.getParameter("departmentNameDetails")));
         dname.setUsefull(true);

         dname = new DepartmentNameDao().updateDepartmentName(dname);
        return true;

    }

    public boolean deleteDepartmentName() {
       
        long dnameid = 0;

        dnameid = DataUtil.parseLong(request.getParameter("departmentNameid"));
        
       new DepartmentNameDao().deleteDepartmentName(dnameid);
        return true;


    }
    public boolean viewAllDepartment() {
            
        boolean result = false;
        try {
            List<Departmentname> list = new DepartmentNameDao().readListOfObjects();
            httpSession.setAttribute("departmentList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }
      public boolean viewDetailsDepartmentType() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
          
            Departmentname departmentname = new DepartmentNameDao().readUniqueObject1(id);
          
            if (departmentname == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfDepartment", departmentname);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

       public void deleteMultiple() {
        String[] departmentIds = request.getParameterValues("patientIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : departmentIds) {
            
            ids.add(Long.valueOf(id));

        }
        
        new DepartmentNameDao().deleteMultiple(ids);
    }



}
