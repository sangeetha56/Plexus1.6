/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inreport.service;

import com.model.inPatient.dto.Inpatient;
import com.model.inreport.dao.InReportDao;
import com.model.inreport.dto.Inreport;
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
public class InReportService {
     private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;
    private String filePath;



    /**
     *
     * @param request
     * @param response
     */
    public InReportService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }
    public boolean showindividualRepot() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("reportID"));
           
            Inreport inreport = new InReportDao().readIndividualReport(id);
           
            if (inreport == null) {
                result = false;
            } else {
               
                httpSession.setAttribute("inreportDetails", inreport);
                
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
        
        new InReportDao().deleteReport(id);

    }


    public void updateReport() throws FileUploadException, Exception
    {
       
        long inpatientid = Long.parseLong(request.getParameter("id2"));
        long inreportid = Long.parseLong(request.getParameter("id"));
       
        Inpatient inpatient=new Inpatient();
        Inreport inreport=new Inreport();
       
        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        String ipathin="";
        for (FileItem item : items)
             {
            if (item.isFormField())
            {
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();

                inreport.setInreportid(inreportid);
                inpatient.setId(inpatientid);




                if (fieldName.equalsIgnoreCase("inreptname"))
                {

                    inreport.setInreportname(DataUtil.emptyString(item.getString()));
                   
                }

                 if (fieldName.equalsIgnoreCase("inreptdate"))
                {
                    inreport.setInreportdate(DateUtil.simpleDateParser(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("inreportremarks"))
                {
                    inreport.setInremarks(DataUtil.emptyString(item.getString()));
                   
                }
                if (fieldName.equalsIgnoreCase("inreportobservation"))
                {
                    inreport.setInobservation(DataUtil.emptyString(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("inimagelocation"))
                {
                    ipathin=item.getString();
                   
                }

            }

                 else
            {
                 String fieldName = item.getFieldName();
                 if (fieldName.equalsIgnoreCase("inreportfile")) {
                   

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
                       
                        inreport.setReportimage("reportdocuments/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {
                        
                        inreport.setReportimage(ipathin);
                    }
                   }
                 }
            }

        inreport.setInpatient(inpatient);
        inreport=new InReportDao().updateReport(inreport);




    }


    public void addNewReport() throws FileUploadException, Exception
    {
       
        long inpatientid = Long.parseLong(request.getParameter("parentID"));

        Inpatient inpatient=new Inpatient();
        Inreport inreport=new Inreport();
       
        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        for (FileItem item : items)
             {
            if (item.isFormField())
            {
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();




                if (fieldName.equalsIgnoreCase("inreptname"))
                {

                    inreport.setInreportname(DataUtil.emptyString(item.getString()));
                   
                }

                 if (fieldName.equalsIgnoreCase("inreptdate"))
                {
                    inreport.setInreportdate(DateUtil.simpleDateParser(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("inreportremarks"))
                {
                    inreport.setInremarks(DataUtil.emptyString(item.getString()));
                    
                }
                if (fieldName.equalsIgnoreCase("inreportobservation"))
                {
                    inreport.setInobservation(DataUtil.emptyString(item.getString()));
                   
                }
            }

                 else
            {
                 String fieldName = item.getFieldName();
                 if (fieldName.equalsIgnoreCase("inreportfile")) {
                    

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
                       
                        inreport.setReportimage("reportdocuments/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {
                        inreport.setReportimage(fileName);
                    }
                   }
                 }
            }

        inpatient.setId(inpatientid);
        inreport.setInpatient(inpatient);
        inreport=new InReportDao().create(inreport);




    }






}
