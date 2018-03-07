/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.doctorProcess.service;

import com.model.doctorProcess.dao.DoctorInfoDao;
import com.model.department.dto.Departmentname;
import com.model.doctorProcess.dto.Doctorinfo;
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
public class DoctorInfoService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public DoctorInfoService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public DoctorInfoService() {
        
    }
    public boolean addDoctor() {
         Doctorinfo doctor = new Doctorinfo();
         Departmentname deprtname=new Departmentname();
        
         deprtname.setDepartmentnameid(DataUtil.parseLong(request.getParameter("doctid")));
         doctor.setDepartmentname(deprtname);
         doctor.setDoctname(request.getParameter("doctrname"));
         doctor.setDoctqualification(request.getParameter("doctrqualifaication"));
         doctor.setDoctdesignation(request.getParameter("doctrdesignation"));
         doctor.setDoctemailid(request.getParameter("doctremailid"));
         doctor.setDoctmobno(DataUtil.parseLong(request.getParameter("doctrmobno")));
         doctor.setUsefull(true);
         
        doctor = new DoctorInfoDao().create(doctor);
        if (doctor.getDoctid() == 0l) {
            return false;
        } else {
            httpSession.setAttribute("DoctorInfo", doctor);
            return true;
        }



    }

    public boolean viewAllDoctor() {
            
        boolean result = false;
        try {
            List<Doctorinfo> list = new DoctorInfoDao().readListOfObjects();
            httpSession.setAttribute("doctorList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsOfDoctor() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
           
            Doctorinfo doctor = new DoctorInfoDao().readUniqueObject(id);
           
            if (doctor == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfDoctor", doctor);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

    public Long updateDoctorDetails() {


        
        String id = "";
        long dctrID = 0;
        long dptid=0;
       
        dctrID = DataUtil.parseLong(request.getParameter("id"));
        dptid = DataUtil.parseLong(request.getParameter("id1"));
        
        Doctorinfo doctor = new Doctorinfo();
        Departmentname deprtname=new Departmentname();
        
        doctor.setDoctid(dctrID);
        deprtname.setDepartmentnameid(dptid);
        doctor.setDepartmentname(deprtname);
        doctor.setDoctname(request.getParameter("doctrname"));
        doctor.setDoctqualification(request.getParameter("doctrqualifaication"));
        doctor.setDoctdesignation(request.getParameter("doctrdesignation"));
        doctor.setDoctemailid(request.getParameter("doctremailid"));
        doctor.setDoctmobno(DataUtil.parseLong(request.getParameter("doctrmobno")));
        doctor.setUsefull(true);

        

        doctor = new DoctorInfoDao().update(doctor);

        return doctor.getDoctid();

    }

    public void deleteDoctor() {

       
        String id=request.getParameter("id");
      
        new DoctorInfoDao().deleteDoctor(id);

    }


    public void deleteMultiple() {
        String[] doctorIds = request.getParameterValues("patientIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : doctorIds) {
            
            ids.add(Long.valueOf(id));

        }
       
        new DoctorInfoDao().deleteMultiple(ids);
    }

    public boolean fetchDoc_DeptName(int doctorid) {


        boolean result = false;
        try {
            long id = doctorid;
           
            String docname=null;
            String dptname=null;
           
            docname=new DoctorInfoDao().readDoctorName(id);
           
            dptname=new DoctorInfoDao().readDepartmentName(id);
           

            httpSession.setAttribute("doctorname", docname);
            httpSession.setAttribute("departmentname", dptname);
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
         return result;
        
    }



}
