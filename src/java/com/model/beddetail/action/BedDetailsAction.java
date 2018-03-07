/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.beddetail.action;

import com.model.beddetail.service.BedDetailsService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kamal
 */
public class BedDetailsAction {

    HttpServletRequest request;
    HttpServletResponse response;
    //  HttpSession httpSession;
    String url;

    public BedDetailsAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

        if (action.equalsIgnoreCase("addBedSetup")) {

            url = addBedSetup();
        } else if (action.equalsIgnoreCase("viewAllBeds")) {
            url = viewAllBeds();
        } else if (action.equalsIgnoreCase("viewDetails")) {

            url = viewDetails();
        } else if (action.equalsIgnoreCase("deleteMultiple")) {

            url = deleteMultiple();

        } else if (action.equalsIgnoreCase("deleteBed")) {

            url = deleteBed();
        } else if (action.equalsIgnoreCase("updateBedSetup")) {

            url = updateBedSetup();
        } else if (action.equalsIgnoreCase("viewAllBed")) {

            url = viewAllBed();
        }

         else if (action.equalsIgnoreCase("searchByBedType")) {

            url = searchByBedType();
        }

         else if (action.equalsIgnoreCase("searchByBedStatus")) {

            url = searchByBedStatus();
        }



        return url;

    }

    private String addBedSetup() {


        if (new BedDetailsService(request, response).addBedSetup()) {

            return "bedmanagementTab.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewAllBeds() {

        new BedDetailsService(request, response).viewAllBeds();

        return "viewAllBeds.jsp";
    }

    private String viewDetails() {

        if (new BedDetailsService(request, response).viewDetailsofBed()) {

            return "bedsDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

    private String deleteMultiple() {

        new BedDetailsService(request, response).deleteMultiple();
        return "bedmanagementTab.jsp";
    }

    private String deleteBed() {

        if (new BedDetailsService(request, response).deleteBedDetail()) {

            return "bedmanagementTab.jsp";
        } else {
            return "notSaved.jsp";
        }



    }

    private String updateBedSetup() {

        if (new BedDetailsService(request, response).updateBedSetup()) {

            return "bedmanagementTab.jsp";

        } else {
            return "notSaved.jsp";
        }
    }

    private String viewAllBed() {

        new BedDetailsService(request, response).viewAllBeds();

        return "bedSearch.jsp";
    }

    private String searchByBedType() {

        new BedDetailsService(request, response).searchByBedType();

        return "bedSearch.jsp";
    }

    private String searchByBedStatus() {

        new BedDetailsService(request, response).searchByBedStatus();

        return "bedSearch.jsp";
    }
}
