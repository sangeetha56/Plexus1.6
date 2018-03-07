/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.BuildingType.action;
import com.model.BuildingType.service.BuildingTypeService;
import com.model.consultancytype.service.ConsultancyTypeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author INTEL
 */
public class BuildingTypeAction {

HttpServletRequest request;
    HttpServletResponse response;
    HttpSession httpSession;
    String url;

    public BuildingTypeAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
         this.httpSession = request.getSession();
    }

    public String execute(String action) {

          if (action.equalsIgnoreCase("add")) {

            url = addBuildingType();
        }
          else if (action.equalsIgnoreCase("add1")) {

            url = addBuildingType1();
        }

          else if (action.equalsIgnoreCase("updateBuilding")) {

            url = updateBuilding();
        }

          else if (action.equalsIgnoreCase("delete")) {

            url = deleteBuilding();
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

           else if (action.equalsIgnoreCase("valuechanges")) {

            url = valuechanges();

        }
          else if (action.equalsIgnoreCase("changeValueforfloorforoomNdBeds")) {

            url = changeValueforfloorforoomNdBeds();

        }

          else if (action.equalsIgnoreCase("valuechangeforselectroomforoomNdBeds")) {

            url = valuechangeforselectroomforoomNdBeds();

        }

                  else if (action.equalsIgnoreCase("firstAddpageforroomNdBed")) {

            url = firstAddpageforroomNdBed();

        }


           return url;
    }

    private String addBuildingType() {


          if (new BuildingTypeService(request, response).addBuildingType()) {

              return "savedBuildingType.jsp";
            //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String addBuildingType1() {

          if (new BuildingTypeService(request, response).addBuildingType1()) {
            return "buildingtypeTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String updateBuilding() {

          if (new BuildingTypeService(request, response).updateBuilding()) {

            return "updatedBuilding.jsp";
              //return "consultancyTab.jsp";
        } else {
            return "notSaved.jsp";
        }
    }


    private String deleteBuilding() {

            if (new BuildingTypeService(request, response).deleteBuilding())
            {
                 // return "Controller?process=ConsultancyProcess&action=viewAll" ;
                return "buildingtypeTab.jsp" ;
            }
            else
            {
               return "notSaved.jsp";
            }

    }
    private String viewAll() {

           new BuildingTypeService(request, response).viewAllBuilding();

        return "viewAllBuilding.jsp";
    }


    private String viewDetails() {

        if (new BuildingTypeService(request, response).viewDetailsBuildingType()) {

            return "buildingTypeDetails.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }


     private String deleteMultiple() {

        new BuildingTypeService(request, response).deleteMultiple();
        return "buildingtypeTab.jsp";
    }

     private String valuechanges() {

        if (new BuildingTypeService(request, response).valuechanges()) {

            return "addRoomSetup.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

     private String changeValueforfloorforoomNdBeds() {

        if (new BuildingTypeService(request, response).valuechanges()) {
            httpSession.setAttribute("flag", 1);

            return "addRoomndBeds.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

     private String valuechangeforselectroomforoomNdBeds() {

        if (new BuildingTypeService(request, response).valuechangeforselectroomforoomNdBeds()) {
            httpSession.setAttribute("flag", 2);

            return "addRoomndBeds.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

     private String firstAddpageforroomNdBed() {

           new BuildingTypeService(request, response).viewAllBuilding();
           httpSession.setAttribute("flag", 0);

        return "addRoomndBeds.jsp";
    }






}