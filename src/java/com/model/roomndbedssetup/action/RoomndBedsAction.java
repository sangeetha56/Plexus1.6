/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.roomndbedssetup.action;

import com.model.roomndbedssetup.service.RoomsndBedsService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kamal
 */
public class RoomndBedsAction {

    HttpServletRequest request;
    HttpServletResponse response;
    //  HttpSession httpSession;
    String url;

    public RoomndBedsAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

        if (action.equalsIgnoreCase("addRoomndBedSetup")) {

            url = addRoomndBedSetup();
        } else if (action.equalsIgnoreCase("viewAllRoomndBeds")) {
            url = viewAllRoomndBeds();
        } else if (action.equalsIgnoreCase("viewDetails")) {

            url = viewDetails();
        } else if (action.equalsIgnoreCase("deleteMultiple")) {

            url = deleteMultiple();

        } else if (action.equalsIgnoreCase("deleteRoomNdBed")) {

            url = deleteRoomNdBed();
        } else if (action.equalsIgnoreCase("updateRoomNdBedSetup")) {

            url = updateRoomNdBedSetup();
        } else if (action.equalsIgnoreCase("addBedDetailPopup")) {

            url = addBedDetailPopup();
        } else if (action.equalsIgnoreCase("viewAllRooms")) {

            url = viewAllRooms();
        } else if (action.equalsIgnoreCase("viewRoomDetail")) {

            url = viewRoomDetail();
        }


        return url;
    }

    private String addRoomndBedSetup() {


        if (new RoomsndBedsService(request, response).addRoomndBedSetup()) {

            return "savedRoomndBedSetup.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewAllRoomndBeds() {

        new RoomsndBedsService(request, response).viewAllRoomndBeds();

        return "viewAllRoomndBeds.jsp";
    }

    private String viewDetails() {

        if (new RoomsndBedsService(request, response).viewDetailsRoomndBeds()) {

            return "roomndBedsDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

    private String deleteMultiple() {

        new RoomsndBedsService(request, response).deleteMultiple();
        return "roommanagementTab.jsp";
    }

    private String deleteRoomNdBed() {

        if (new RoomsndBedsService(request, response).deleteRoomNdBed()) {

            return "roommanagementTab.jsp";
        } else {
            return "notSaved.jsp";
        }



    }

    private String updateRoomNdBedSetup() {

        if (new RoomsndBedsService(request, response).updateRoomNdBedSetup()) {

            return "roommanagementTab.jsp";

        } else {
            return "notSaved.jsp";
        }
    }

    private String addBedDetailPopup() {

        new RoomsndBedsService(request, response).viewAllRoomndBeds();

        return "addBedDetail.jsp";
    }

    private String viewAllRooms() {

        new RoomsndBedsService(request, response).viewAllRoomndBeds();

        return "viewAllRooms.jsp";
    }

    private String viewRoomDetail() {

        new RoomsndBedsService(request, response).viewRoomDetail();

        return "viewRoomDetail.jsp";
    }
}
