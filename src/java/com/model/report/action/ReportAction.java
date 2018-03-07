/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.report.action;

import com.model.report.service.ReportService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileUploadException;

/**
 *
 * @author sultan
 */
public class ReportAction {

     private HttpServletRequest request;
     private HttpServletResponse response;
     private String url;

    /**
     *
     * @param request
     * @param response
     */
     public ReportAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

     /**
     *
     * @param action
     * @return
     */

     public String execute(String action) throws FileUploadException, Exception{
        if (action.equalsIgnoreCase("showindividualRepot")) {
         
            url = showindividualRepot();
        }

        else if (action.equalsIgnoreCase("deleteReport")) {
           
            url = deleteReport();
        }
        else if (action.equalsIgnoreCase("updateReport"))
        {
           
            url = updateReport();
        }

        else if (action.equalsIgnoreCase("addNewReport"))
        {
           
            url = addNewReport();
        }

        return url;
    }

     private String showindividualRepot() {
       
        if (new ReportService(request, response).showindividualRepot()) {
            
            return "reportIndividualDetails.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

     private String deleteReport() {

      
        long id = Long.parseLong(request.getParameter("id2"));

        new ReportService(request, response).deleteReport();

          return "Controller?process=PatientProcess&action=viewDetails&id="+id;

    }


     private String updateReport() throws FileUploadException, Exception
    {
       
        long id = Long.parseLong(request.getParameter("id2"));

         new ReportService(request, response).updateReport();
         
         return "Controller?process=PatientProcess&action=viewDetails&id="+id;
    }

     private String addNewReport() throws FileUploadException, Exception
    {
       
        long id = Long.parseLong(request.getParameter("parentID"));

         new ReportService(request, response).addNewReport();

         return "Controller?process=PatientProcess&action=viewDetails&id="+id;
    }


}
