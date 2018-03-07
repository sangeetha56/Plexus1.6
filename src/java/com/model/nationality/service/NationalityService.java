/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */ 
package com.model.nationality.service;

import com.model.nationality.dao.NationalityDAO;
import com.model.nationality.dto.Nationality;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mayur
 */
public class NationalityService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public NationalityService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        httpSession=request.getSession();
    }
    /**
     *
     */
    public void  setSessionAtrributes(){
        List<Nationality> nationalities=new NationalityDAO().readListOfObjects();
        httpSession.setAttribute("nationalities", nationalities);        
    }
    
}
