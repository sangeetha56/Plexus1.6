/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.vendor.service;

import com.model.vendor.dao.VendorDAO;
import com.model.vendor.dto.Vendor;
import com.util.DataUtil;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
/**
 *
 * @author Administrator
 */
public class VendorService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public VendorService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    /**
     *
     */
    public void viewAllVendor() {
        List<Vendor> vendors = new VendorDAO().readListOfObjects();
        httpSession.setAttribute("vendors", vendors);
    }

    /**
     *
     * @return
     */
    public boolean addVendor() {
        String name;
        Long contactno;
        String address;
        String representativeName;
        Vendor vendor = new Vendor();
        name = request.getParameter("vendorName");
        contactno = DataUtil.parseLong(request.getParameter("vendorContactNo"));
        address = request.getParameter("vendorAddress");
        representativeName=request.getParameter("representativeName");
        vendor.setName(name);
        vendor.setRepresentativename(representativeName);
        vendor.setContactno(contactno);
        vendor.setAddress(address);
        vendor = new VendorDAO().create(vendor);
        if (vendor.getId() == 0l) {
            return false;
        } else {

            return true;
        }
    }

    /**
     *
     */
    public void viewDetailsOfPatient() {
        long id=DataUtil.parseLong(request.getParameter("id"));
        Vendor vendor=new VendorDAO().readUniqueObject(id);
        httpSession.setAttribute("vendor", vendor);

    }

    /**
     *
     * @return
     */
    public long updateVendor() {

        String name;
        Long contactno;
        String address;
        String representativeName;
        Vendor vendor = new Vendor();
        long id=DataUtil.parseLong(request.getParameter("id"));
        name = request.getParameter("vendorName");
        contactno = DataUtil.parseLong(request.getParameter("vendorContactNo"));
        address = request.getParameter("vendorAddress");
        representativeName=request.getParameter("representativeName");
        vendor.setId(id);
        vendor.setName(name);
        vendor.setRepresentativename(representativeName);
        vendor.setContactno(contactno);
        vendor.setAddress(address);
        vendor = new VendorDAO().create(vendor);
        return vendor.getId();
    }
}
