/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.company.action;

import com.model.company.service.CompanyService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class CompanyAction {
    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    /**
     *
     * @param request
     * @param response
     */
    public CompanyAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }
    /**
     *
     * @param action
     * @return
     */
    public String execute(String action){
        
        if(action.equalsIgnoreCase("addCompany")){
            url=addCompany();
            
        }
        if(action.equalsIgnoreCase("viewAllCompany")){
            url=viewAllCompany();
            
        }
        return url;

    }

    private String viewAllCompany() {
        new CompanyService(request,response).viewAllCompany();
        return "company.jsp";
    }

    private String addCompany() {
        new CompanyService(request, response).addComapny();
        return "Controller?process=CompanyProcess&action=viewAllCompany";
    }

}
