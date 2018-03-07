/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.RoomType.Action;

import com.model.RoomType.Service.RoomTypeService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author INTEL
 */
public class RoomTypeAction {

 HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public RoomTypeAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

          if (action.equalsIgnoreCase("add")) {

            url = addRoomType();
        }
          else if (action.equalsIgnoreCase("add1")) {

            url = addRoomType1();
        }

          else if (action.equalsIgnoreCase("updateRoom")) {

            url = updateRoom();
        }

          else if (action.equalsIgnoreCase("delete")) {

            url = deleteRoom();
        }
          else if (action.equalsIgnoreCase("viewAll")) {

            url = viewAll();
              }

          else if (action.equalsIgnoreCase("viewDetails"))
           {

            url = viewDetails();
           }

          else if (action.equalsIgnoreCase("deleteMultiple")) {

            url = deleteMultiple();

        }


           return url;
    }

    private String addRoomType() {


          if (new RoomTypeService(request, response).addRoomType()) {

              return "savedRoomType.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String addRoomType1() {

          if (new RoomTypeService(request, response).addRoomType1()) {
            return "roomTypeTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String updateRoom() {

          if (new RoomTypeService(request, response).updateRoom()) {

            return "updatedroom.jsp";
              //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }


    private String deleteRoom() {

            if (new RoomTypeService(request, response).deleteRoom())
            {
                 // return "Controller?process=ConsultancyProcess&action=viewAll" ;
                return "roomTypeTab.jsp" ;
            }
            else
            {
               return "notSaved.jsp";
            }

    }
    private String viewAll() {

           new RoomTypeService(request, response).viewAllRoom();

        return "viewAllRoom.jsp";
    }


    private String viewDetails() {

        if (new RoomTypeService(request, response).viewDetailsRoomType()) {

            return "roomTypeDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }


     private String deleteMultiple() {

        new RoomTypeService(request, response).deleteMultiple();
        return "roomTypeTab.jsp";
    }




}
