/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.roomsetup.service;

import com.model.BuildingType.dto.Buildingtypesetup;
import com.model.roomsetup.dao.RoomSetUpDao;
import com.model.roomsetup.dto.Roomsetup;
import com.util.DataUtil;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kamal
 */
public class RoomSetUpService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public RoomSetUpService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addRoomSetUp() {

        System.out.println("building name:-" + request.getParameter("buildingname"));
        System.out.println("no of floor:-" + request.getParameter("floorno"));
        System.out.println("no of rooms:-" + request.getParameter("NoOfrooms"));
        System.out.println("building id:-" + request.getParameter("buildingid"));

        Roomsetup roomsetup = new Roomsetup();
        Buildingtypesetup buildingtypesetup = new Buildingtypesetup();

        roomsetup.setFloorno(DataUtil.parseLong(request.getParameter("floorno")));
        roomsetup.setNoofrooms(DataUtil.parseLong(request.getParameter("NoOfrooms")));

        buildingtypesetup.setBuildingid(DataUtil.parseLong(request.getParameter("buildingid")));
        roomsetup.setBuildingtypesetup(buildingtypesetup);


        roomsetup = new RoomSetUpDao().addRoomSetUp(roomsetup);






        return true;

    }

    public boolean viewAllRoomSetup() {

        boolean result = false;
        try {
            List<Roomsetup> list = new RoomSetUpDao().viewAllRoomSetup();
            httpSession.setAttribute("roomSetUpList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsRoomSetUpType() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));

            Roomsetup roomsetup = new RoomSetUpDao().viewDetailsRoomSetUpType(id);

            if (roomsetup == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfRoomSetUp", roomsetup);

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

        new RoomSetUpDao().deleteMultiple(ids);
    }

    public boolean deleteRoomSetUp() {

        long roomseuptypeid = 0;

        roomseuptypeid = DataUtil.parseLong(request.getParameter("id"));

        new RoomSetUpDao().deleteRoomSetUp(roomseuptypeid);
        return true;


    }

    public Boolean updateRoomSetup() {

        long roomseuptypeid = 0;
        long buildingid = 0;
        Roomsetup roomsetup = new Roomsetup();
        Buildingtypesetup buildingtypesetup = new Buildingtypesetup();

        roomseuptypeid = DataUtil.parseLong(request.getParameter("roomsetupid"));
        buildingid = DataUtil.parseLong(request.getParameter("buildingid"));

         System.out.println("building name:-" + buildingid);
        System.out.println("no of floor:-" + DataUtil.parseLong(request.getParameter("floorno")));
        System.out.println("no of rooms:-" + DataUtil.parseLong(request.getParameter("NoOfrooms")));
        System.out.println("room id:-" + roomseuptypeid);
        roomsetup.setRoomsetupid(roomseuptypeid);
        buildingtypesetup.setBuildingid(buildingid);

        roomsetup.setFloorno(DataUtil.parseLong(request.getParameter("floorno")));
        roomsetup.setNoofrooms(DataUtil.parseLong(request.getParameter("NoOfrooms")));
        roomsetup.setBuildingtypesetup(buildingtypesetup);

        roomsetup = new RoomSetUpDao().updateRoomSetup(roomsetup);



        return true;

    }
}
