/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.report.service;

import com.model.patient.dto.Patient;
import com.model.report.dao.ReportDao;
import com.model.report.dto.Report;
import com.util.DataUtil;
import com.util.DateUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author sultan
 */
public class ReportService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;
    private String filePath;



    /**
     *
     * @param request
     * @param response
     */

    public ReportService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }


    public boolean showindividualRepot() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("reportID"));
           
            Report report = new ReportDao().readIndividualReport(id);
           
            if (report == null) {
                result = false;
            } else {
               
                httpSession.setAttribute("reportDetails", report);
                
                
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            
            result = false;
        }

        return result;

    }


    public void deleteReport() {

        
        String id=request.getParameter("id");
      
        new ReportDao().deleteReport(id);

    }


    public void updateReport() throws FileUploadException, Exception
    {
        
        long patientid = Long.parseLong(request.getParameter("id2"));
        long reportid = Long.parseLong(request.getParameter("id"));
        

        Patient patient = new Patient();
        Report report=new Report();
        
        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        String ipath="";
        for (FileItem item : items)
             {
            if (item.isFormField())
            {
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                
                report.setReportid(reportid);
                patient.setId(patientid);

                if (fieldName.equalsIgnoreCase("reptname"))
                {
                    //report.setPatient(patient);
                    report.setReportname(DataUtil.emptyString(item.getString()));
                   
                }

                 if (fieldName.equalsIgnoreCase("reptdate"))
                {
                    report.setReportdate(DateUtil.simpleDateParser(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("reportremarks"))
                {
                    report.setRemarks(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("reportobservation"))
                {
                    report.setObservation(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("imagelocation"))
                {
                   ipath=item.getString();
                   
                }
            }

                 else
            {
                 String fieldName = item.getFieldName();
                 if (fieldName.equalsIgnoreCase("reportfile")) {
                  

                    String fileName = (DataUtil.emptyString(item.getName()));
                   
                    if (!fileName.equalsIgnoreCase("")) {

                        String ipaths = httpSession.getAttribute("imagepath").toString();
                        String remain="reportdocuments";
                        String completepath=ipaths+remain;
                       
                        File path=new File(completepath);
                         

                     
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }

                        File uploadedFile = new File(path + "/" + fileName);
                        
                        report.setEpmty("reportdocuments/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {
                        
                        report.setEpmty(ipath);
                    }
                   }
                 }
            }

        report.setPatient(patient);
        report=new ReportDao().updateReport(report);
  

    }


    public void addNewReport() throws FileUploadException,Exception
    {
       
        long patientid = Long.parseLong(request.getParameter("parentID"));
        
        Patient patient = new Patient();
        Report report=new Report();
        
        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        for (FileItem item : items)
             {
            if (item.isFormField())
            {
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();

                
                

                if (fieldName.equalsIgnoreCase("reptname"))
                {
                    
                    report.setReportname(DataUtil.emptyString(item.getString()));
                    
                }

                 if (fieldName.equalsIgnoreCase("reptdate"))
                {
                    report.setReportdate(DateUtil.simpleDateParser(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("reportremarks"))
                {
                    report.setRemarks(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("reportobservation"))
                {
                    report.setObservation(DataUtil.emptyString(item.getString()));
                    
                }
            }

                 else
            {
                 String fieldName = item.getFieldName();
                 if (fieldName.equalsIgnoreCase("reportfile")) {
                   

                    String fileName = (DataUtil.emptyString(item.getName()));
                    
                    if (!fileName.equalsIgnoreCase("")) {
                        String ipath = httpSession.getAttribute("imagepath").toString();
                        String remain="reportdocuments";
                        String completepath=ipath+remain;
                       
                        File path=new File(completepath);

                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }

                        File uploadedFile = new File(path + "/" + fileName);
                     
                        report.setEpmty("reportdocuments/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {
                        report.setEpmty(fileName);
                    }
                   }
                 }
            }

        patient.setId(patientid);
        report.setPatient(patient);
        report=new ReportDao().create(report);




    }



}
