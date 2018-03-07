/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inreport.action;

import com.model.inreport.service.InReportService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileUploadException;

/**
 *
 * @author sultan
 */
public class InReportAction {

     private HttpServletRequest request;
     private HttpServletResponse response;
     private String url;

    /**
     *
     * @param request
     * @param response
     */
     public InReportAction(HttpServletRequest request, HttpServletResponse response) {
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
        
        if (new InReportService(request, response).showindividualRepot()) {
           
            return "inreportIndividualDetails.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

     private String deleteReport() {

       
        long id = Long.parseLong(request.getParameter("id2"));

        new InReportService(request, response).deleteReport();

          return "Controller?process=InPatientProcess&action=viewDetails&id="+id;

    }


     private String updateReport() throws FileUploadException, Exception
    {
       
        long id = Long.parseLong(request.getParameter("id2"));

         new InReportService(request, response).updateReport();

         return "Controller?process=InPatientProcess&action=viewDetails&id="+id;
    }

     private String addNewReport() throws FileUploadException, Exception
    {
       
        long id = Long.parseLong(request.getParameter("parentID"));

         new InReportService(request, response).addNewReport();

         return "Controller?process=InPatientProcess&action=viewDetails&id="+id;
    }




}
