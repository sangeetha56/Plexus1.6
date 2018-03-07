/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.roomndbedssetup.service;

import com.model.RoomType.Dao.RoomTypeDao;
import com.model.RoomType.Dto.Roomtype;
import com.model.roomndbedssetup.dao.RoomsndBedsDao;
import com.model.roomndbedssetup.dto.Roomndbedsetup;
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
public class RoomsndBedsService {

     private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public RoomsndBedsService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

     public boolean addRoomndBedSetup() {

        System.out.println("building name:-" + request.getParameter("buildingname"));
        System.out.println(" floor no :-" + request.getParameter("floorno"));
        System.out.println("room no:-" + request.getParameter("NoOfrooms"));
        System.out.println("room type:-" + request.getParameter("roomtype"));
        System.out.println("no of beds:-" + request.getParameter("noofbeds"));

        System.out.println("room setup id:-" + request.getParameter("roomstpid"));
        System.out.println("building id:-" + request.getParameter("buildingid"));
        System.out.println("room type id:-" + request.getParameter("roomtype"));

        Roomndbedsetup roomndbedsetup=new Roomndbedsetup();
        Roomsetup roomsetup=new Roomsetup();
        Roomtype roomtype=new Roomtype();
        Roomtype roomtype1=new Roomtype();

        long floorno;
        long roomno;
        long noofbeds;
        long roomtypeidv;
        long roomsetpid;
        String roomtypev=null;

        floorno=DataUtil.parseLong(request.getParameter("floorno"));
        roomno=DataUtil.parseLong(request.getParameter("NoOfrooms"));
        noofbeds=DataUtil.parseLong(request.getParameter("noofbeds"));
        roomtypeidv=DataUtil.parseLong(request.getParameter("roomtype"));
        roomsetpid=DataUtil.parseLong(request.getParameter("roomstpid"));

        roomtype1=new RoomTypeDao().readUniqueObject(roomtypeidv);
        roomndbedsetup.setFloorno(DataUtil.parseLong(request.getParameter("floorno")));
        roomndbedsetup.setRoomno(DataUtil.parseLong(request.getParameter("NoOfrooms")));
        roomndbedsetup.setRoomtypevalue(roomtype1.getRoomtype());
        roomndbedsetup.setRoomcharges(roomtype1.getRoomcharges());
        roomndbedsetup.setNoofbeds(DataUtil.parseLong(request.getParameter("noofbeds")));
        roomndbedsetup.setRoomcode(request.getParameter("roomcode"));


        roomtype.setRoomtypeid(roomtypeidv);
        roomndbedsetup.setRoomtype(roomtype);

        roomsetup.setRoomsetupid(roomsetpid);
        roomndbedsetup.setRoomsetup(roomsetup);


       roomndbedsetup = new RoomsndBedsDao().addRoomndBedSetup(roomndbedsetup);


        return true;

    }

     public boolean viewAllRoomndBeds() {

        boolean result = false;
        try {
            List<Roomndbedsetup> list = new RoomsndBedsDao().viewAllRoomndBeds();
            httpSession.setAttribute("roomndBedSetUpList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsRoomndBeds() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));

            Roomndbedsetup roomndbedsetup = new RoomsndBedsDao().viewDetailsRoomndBeds(id);

            if (roomndbedsetup == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfRoomNdBedSetUp", roomndbedsetup);

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

        new RoomsndBedsDao().deleteMultiple(ids);
    }

    public boolean deleteRoomNdBed() {

        long roomndBedeid = 0;

        roomndBedeid = DataUtil.parseLong(request.getParameter("id"));

        new RoomsndBedsDao().deleteRoomNdBed(roomndBedeid);
        return true;


    }

    public Boolean updateRoomNdBedSetup() {

        System.out.println("building name:-" + request.getParameter("buildingblock"));
        System.out.println(" floor no :-" + request.getParameter("floorno"));
        System.out.println("room no:-" + request.getParameter("roomno"));
        System.out.println("room type:-" + request.getParameter("roomtype"));
        System.out.println("room charges:-" + request.getParameter("roomcharge"));
        System.out.println("room code:-" + request.getParameter("roomcode"));
        System.out.println("no of beds:-" + request.getParameter("noofbeds"));

        System.out.println("room setup id:-" + request.getParameter("roomsetupid"));
        System.out.println("room type id:-" + request.getParameter("roomtypeid"));
        System.out.println("room and bed type id:-" + request.getParameter("roomNdBedid"));


        Roomndbedsetup roomndbedsetup=new Roomndbedsetup();
        Roomsetup roomsetup=new Roomsetup();
        Roomtype roomtype=new Roomtype();
        Roomtype roomtype1=new Roomtype();

        long floorno;
        long roomno;
        long noofbeds;
        long roomtypeidv;
        long roomsetpid;
        long roomndBedid;
        String roomtypev=null;

//        floorno=DataUtil.parseLong(request.getParameter("floorno"));
//        roomno=DataUtil.parseLong(request.getParameter("roomno"));
//        noofbeds=DataUtil.parseLong(request.getParameter("noofbeds"));
//
//

        roomsetpid=DataUtil.parseLong(request.getParameter("roomsetupid"));
        roomtypeidv=DataUtil.parseLong(request.getParameter("roomtype"));

        roomtype1=new RoomTypeDao().readUniqueObject(roomtypeidv);

        roomndbedsetup.setRoomndbedsetupid(DataUtil.parseLong(request.getParameter("roomNdBedid")));
        roomndbedsetup.setFloorno(DataUtil.parseLong(request.getParameter("floorno")));
        roomndbedsetup.setRoomno(DataUtil.parseLong(request.getParameter("roomno")));
        roomndbedsetup.setRoomtypevalue(roomtype1.getRoomtype());
        roomndbedsetup.setNoofbeds(DataUtil.parseLong(request.getParameter("noofbeds")));
        roomndbedsetup.setRoomcode(request.getParameter("roomcode"));
        roomndbedsetup.setRoomcharges(roomtype1.getRoomcharges());


        roomtype.setRoomtypeid(roomtypeidv);
        roomndbedsetup.setRoomtype(roomtype);

        roomsetup.setRoomsetupid(roomsetpid);
        roomndbedsetup.setRoomsetup(roomsetup);


       roomndbedsetup = new RoomsndBedsDao().updateRoomNdBedSetup(roomndbedsetup);



        return true;

    }

    public boolean viewRoomDetail() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));

            Roomndbedsetup roomndbedsetup = new RoomsndBedsDao().viewDetailsRoomndBeds(id);

            if (roomndbedsetup == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfRoom", roomndbedsetup);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }



}
