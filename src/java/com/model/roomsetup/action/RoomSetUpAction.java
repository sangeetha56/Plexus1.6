/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.roomsetup.action;

import com.model.roomsetup.service.RoomSetUpService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kamal
 */
public class RoomSetUpAction {

    HttpServletRequest request;
    HttpServletResponse response;
  //  HttpSession httpSession;
    String url;

    public RoomSetUpAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

          if (action.equalsIgnoreCase("addRoomSetUp")) {

            url = addRoomSetUp();
        }
          else if(action.equalsIgnoreCase("viewAllRoomSetup"))
          {
              url = viewAllRoomSetup();
          }

          else if (action.equalsIgnoreCase("viewDetails"))
           {

            url = viewDetails();
           }

          else if (action.equalsIgnoreCase("deleteMultiple")) {

            url = deleteMultiple();

        }

          else if (action.equalsIgnoreCase("delete")) {

            url = deleteRoomSetUp();
        }

          else if (action.equalsIgnoreCase("updateRoomSetup")) {

            url = updateRoomSetup();
        }
         

           return url;
    }


    private String addRoomSetUp() {


          if (new RoomSetUpService(request, response).addRoomSetUp()) {

              return "savedRoomSetUp.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewAllRoomSetup() {

           new RoomSetUpService(request, response).viewAllRoomSetup();

        return "viewAllRoomSetup.jsp";
    }

    private String viewDetails() {

        if (new RoomSetUpService(request, response).viewDetailsRoomSetUpType()) {

            return "roomsetupDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }


     private String deleteMultiple() {

        new RoomSetUpService(request, response).deleteMultiple();
        return "roomsetupTab.jsp";
    }

     private String deleteRoomSetUp() {

            if (new RoomSetUpService(request, response).deleteRoomSetUp())
            {

                return "roomsetupTab.jsp" ;
            }
            else
            {
               return "notSaved.jsp";
            }



    }

     private String updateRoomSetup() {

          if (new RoomSetUpService(request, response).updateRoomSetup()) {

            return "roomsetupTab.jsp";

        } else {
            return "notSaved.jsp";
        }
    }



    

}
