/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
  
package com.model.medicine.ajaxaction;

import com.model.medicine.service.MedicineService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Administrator
 */
public class MedicineAjaxAction {
    HttpServletRequest request;
    HttpServletResponse response;

    /**
     *
     * @param request
     * @param response
     */
    public MedicineAjaxAction(HttpServletRequest request, HttpServletResponse response) {
        this.request=request;
        this.response=response;
    }
    /**
     *
     * @param action
     */
    public void execute(String action) {
        if(action.equalsIgnoreCase("getExpiringStock")){
            new MedicineService(request, response).getExpiringStock();
            
            
        }

        if(action.equalsIgnoreCase("getRareMedicine")){
            new MedicineService(request, response).getRareMedicine();


        }
        
    }


}
