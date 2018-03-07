/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.company.service;

import com.model.company.dao.CompanyDAO;
import com.model.company.dto.Company;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
/**
 *
 * @author Administrator
 */
public class CompanyService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public CompanyService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    /**
     *
     */
    public void viewAllCompany() {
        List<Company> companies = new CompanyDAO().readListofObjects();
        httpSession.setAttribute("companies", companies);
    }

    /**
     *
     * @return
     */
    public boolean addComapny() {
        String name;
        String address;
        Company company=new Company();
        address=request.getParameter("companyAddress");
        name=request.getParameter("companyName");
        company.setName(name);
        company.setAddress(address);
        company=new CompanyDAO().create(company);
        if (company.getId() == 0l) {
            return false;
        } else {

            return true;
        }
    }
}
