
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.licenceInfo.action;

import com.model.licenceInfo.service.LicenceInfoService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileUploadException;

/**
 *
 * @author Admin
 */
public class LicenceInfoAction {

    HttpServletRequest request;
    HttpServletResponse response;
    HttpSession httpSession;
    String url;

    public LicenceInfoAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public String execute(String action) throws FileUploadException, Exception {


        if (action.equalsIgnoreCase("checkRequest")) {
          
            url = checkRequest();
        }
        
        if (action.equalsIgnoreCase("addLicence")) {
           
            url = addLicence();
        }

        if (action.equalsIgnoreCase("viewLicence")) {
           
            url = viewLicence();
        }

        if (action.equalsIgnoreCase("viewLicenceDetails")) {
           
            url = viewLicenceDetails();
        }
        if (action.equalsIgnoreCase("deleteLicence"))
        {
           
            url = deleteLicence();
        }

        if (action.equalsIgnoreCase("updateLicence"))
        {
           
            url = updateLicence();
        }


        return url;
    }

    private String checkRequest()
    {
        String userResponse=null;
        int userrequest=new LicenceInfoService(request, response).viewLicenceInt();
       
        if(userrequest==0)
        {
           
            userResponse="addLicenceInfo.jsp";
        }
        else if(userrequest >0)
        {
           
            userResponse="Controller?process=LicenceProcess&action=viewLicenceDetails&id=0";
        }

        return userResponse;

    }

    private String addLicence() throws FileUploadException, Exception {
        if (new LicenceInfoService(request, response).addLicence())
        {
            return "savedLicence.jsp";
        } else
        {
            return "notSaved.jsp";
        }
    }

    private String viewLicence()
    {
        new LicenceInfoService(request, response).viewLicence();
      
        return "viewAllLicence.jsp";

    }

    private String viewLicenceDetails() {
        if (new LicenceInfoService(request, response).viewLicenceDetails())
        {

            return "LicenceDetails.jsp";
        } else
        {
            return "viewAll_1.jsp";
        }
    }

    private String deleteLicence()
    {

      
        new LicenceInfoService(request, response).deleteLicence();
      
        return "Controller?process=LicenceProcess&action=viewLicence";


    }

    private String updateLicence() throws FileUploadException, Exception
    {
        
         return "Controller?process=LicenceProcess&action=viewLicenceDetails&id=" + new LicenceInfoService(request, response).updateLicence();
    }



}
