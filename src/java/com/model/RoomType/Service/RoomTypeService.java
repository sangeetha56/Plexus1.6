/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.RoomType.Service;

import com.model.RoomType.Dao.RoomTypeDao;
import com.model.RoomType.Dto.Roomtype;
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
public class RoomTypeService {

 private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public RoomTypeService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean addRoomType() {

         Roomtype consultant = new Roomtype();

        consultant.setRoomtype(request.getParameter("RoomType"));
        consultant.setRoomcode(request.getParameter("RoomCode"));
        consultant.setRoomcharges(DataUtil.parseLong(request.getParameter("RoomCharges")));

          consultant = new RoomTypeDao().create(consultant);

        if (consultant.getRoomtypeid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public boolean addRoomType1() {

         Roomtype consultant = new Roomtype();

        consultant.setRoomtype(request.getParameter("consultancyTypeName"));


          consultant = new RoomTypeDao().create1(consultant);
        if (consultant.getRoomtypeid() == 0l) {
            return false;
        } else {
          //  httpSession.setAttribute("countryNames", country);
            return true;
        }


    }

    public Boolean updateRoom() {

        Roomtype consultant = new Roomtype();

        long roomtypeid = 0;
        roomtypeid = DataUtil.parseLong(request.getParameter("id"));

         consultant.setRoomtypeid(roomtypeid);
         consultant.setRoomtype(request.getParameter("RoomType"));
        consultant.setRoomcode(request.getParameter("RoomCode"));
        consultant.setRoomcharges(DataUtil.parseLong(request.getParameter("RoomCharges")));
         
         consultant = new RoomTypeDao().updateRoom(consultant);

        return true;

    }

    public boolean deleteRoom() {

        long roomtypeid = 0;

        roomtypeid = DataUtil.parseLong(request.getParameter("id"));

       new RoomTypeDao().deleteRoom(roomtypeid);
        return true;


    }

    public boolean viewAllRoom() {

        boolean result = false;
        try {
            List<Roomtype> list = new RoomTypeDao().readListOfObjects();
            httpSession.setAttribute("roomList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsRoomType() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));

            Roomtype consultantcy = new RoomTypeDao().readUniqueObject(id);

            if (consultantcy == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfRoom", consultantcy);

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

        new RoomTypeDao().deleteMultiple(ids);
    }



}