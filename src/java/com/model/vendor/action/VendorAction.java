/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.vendor.action;

import com.model.vendor.service.VendorService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class VendorAction {
    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    /**
     *
     * @param request
     * @param response
     */
    public VendorAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }
    
    /**
     *
     * @param action
     * @return
     */
    public String execute(String action){
        if(action.equalsIgnoreCase("addVendor")){
            url=addVendor();

        }
        if(action.equalsIgnoreCase("viewAllVendor")){
            url=viewAllVendor();
        }
        if(action.equalsIgnoreCase("viewDetails")){
            url=viewDetails();

        }
        if(action.equalsIgnoreCase("update")){
            url=updateVendor();

        }
        return url;
    }
    private String viewAllVendor(){
        new VendorService(request, response).viewAllVendor();
        return "vendor.jsp";
    }

    private String addVendor() {
        new VendorService(request, response).addVendor();
        return "Controller?process=VendorProcess&action=viewAllVendor";
    }

    private String viewDetails() {
        new VendorService(request, response).viewDetailsOfPatient();
        return "vendorDetails.jsp";
    }

    private String updateVendor() {
        
        return "Controller?process=VendorProcess&action=viewDetails&id="+new VendorService(request, response).updateVendor();
    }

}
