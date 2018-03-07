/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.BuildingType.service;
import com.model.BuildingType.dao.BuildingTypeDao;
import com.model.BuildingType.dto.Buildingtypesetup;
import com.model.roomsetup.dto.Roomsetup;


import com.util.DataUtil;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author INTEL
 */
public class BuildingTypeService {
private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public BuildingTypeService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addBuildingType() {

         Buildingtypesetup building = new Buildingtypesetup();

        building.setBuildingblock(request.getParameter("BuildingBlockName"));
        building.setNooffloor(DataUtil.parseLong(request.getParameter("NoOfFloors")));
        //building.setUsefull(true);

          building = new BuildingTypeDao().create(building);

        if (building.getBuildingid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public boolean addBuildingType1() {

         Buildingtypesetup building = new Buildingtypesetup();

        building.setBuildingblock(request.getParameter("BuildingBlockName"));


          building = new BuildingTypeDao().create1(building);
        if (building.getBuildingid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public Boolean updateBuilding() {

        Buildingtypesetup building = new Buildingtypesetup();

        long buildingid = 0;
        buildingid = DataUtil.parseLong(request.getParameter("id"));

         building.setBuildingid(buildingid);
         building.setBuildingblock(DataUtil.emptyString(request.getParameter("BuildingBlockName")));
         building.setNooffloor(DataUtil.parseLong(request.getParameter("NoOfFloors")));
       //  building.setUsefull(true);
         building = new BuildingTypeDao().updateBuilding(building);

        return true;

    }

    public boolean deleteBuilding() {

        long buildingid = 0;

        buildingid = DataUtil.parseLong(request.getParameter("id"));

       new BuildingTypeDao().deleteBuilding(buildingid);
        return true;


    }

    public boolean viewAllBuilding() {

        boolean result = false;
        try {
            List<Buildingtypesetup> list = new BuildingTypeDao().readListOfObjects();
            httpSession.setAttribute("buildingList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsBuildingType() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));

            Buildingtypesetup consultantcy = new BuildingTypeDao().readUniqueObject(id);

            if (consultantcy == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfBuildingType", consultantcy);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

     public void deleteMultiple() {
        String[] consultancyIds = request.getParameterValues("patientIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : consultancyIds) {

            ids.add(Long.valueOf(id));

        }

        new BuildingTypeDao().deleteMultiple(ids);
    }


     public boolean valuechanges() {

        boolean result = false;
        try {

          System.out.println("vvvvvvvvvvvvv:-"+request.getParameter("buildingname"));
           long id = Long.parseLong(request.getParameter("buildingname"));
            Buildingtypesetup consultantcy = new BuildingTypeDao().readUniqueObject(id);

            if (consultantcy == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfBuildingType", consultantcy);
               // httpSession.setAttribute("flag", 0);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }


     public boolean valuechangeforselectroomforoomNdBeds() {

        boolean result = false;
        try {

          System.out.println("vvvvvvvvvvvvv:-"+request.getParameter("buildingname"));
          long buildgid = Long.parseLong(request.getParameter("buildingid"));
          long floorno = Long.parseLong(request.getParameter("floorno"));
          System.out.println("building id:-"+buildgid);
          System.out.println("floor no is:-"+floorno);
         // Buildingtypesetup roomNdBeds = new BuildingTypeDao().valuechangeforselectroomforoomNdBeds(buildgid,floorno);

          Roomsetup roomst=new BuildingTypeDao().valuechangeforselectroomforoomNdBeds(buildgid,floorno);
          System.out.println("floor no is:-"+roomst.getFloorno());
          System.out.println("room no is:-"+roomst.getNoofrooms());
          System.out.println("roomsetup id is:-"+roomst.getRoomsetupid());
          System.out.println("building id is:-"+roomst.getBuildingtypesetup().getBuildingid());
          System.out.println("building block is:-"+roomst.getBuildingtypesetup().getBuildingblock());

            if (roomst == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfBuildgNdRoomFloor", roomst);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }



}
