/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.beddetail.service;

import com.model.beddetail.dao.BedDetailsDao;
import com.model.beddetail.dto.Beddetails;
import com.model.roomndbedssetup.dto.Roomndbedsetup;
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
public class BedDetailsService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public BedDetailsService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }


    public boolean addBedSetup() {

        System.out.println("building name:-" + request.getParameter("buildingblock"));
        System.out.println(" floor no :-" + request.getParameter("floorno"));
        System.out.println("room no:-" + request.getParameter("roomno"));
        System.out.println("room type value:-" + request.getParameter("roomtypevalue"));
        System.out.println("room charge:-" + request.getParameter("roomcharge"));

        System.out.println("roomcode:-" + request.getParameter("roomcode"));
        System.out.println("no of beds :-" + request.getParameter("noofbeds"));
        System.out.println("bedno:-" + request.getParameter("bedno"));
        System.out.println("bedcode:-" + request.getParameter("bedcode"));
        System.out.println("roomNdBedid:-" + request.getParameter("roomNdBedid"));

        Beddetails beddetails=new Beddetails();
        Roomndbedsetup roomndbedsetup=new  Roomndbedsetup();

        beddetails.setBuildingblock(request.getParameter("buildingblock"));
        beddetails.setFloorno(DataUtil.parseLong(request.getParameter("floorno")));
        beddetails.setRoomno(DataUtil.parseLong(request.getParameter("roomno")));
        beddetails.setRoomcode(request.getParameter("roomcode"));
        beddetails.setRoomtypevalue(request.getParameter("roomtypevalue"));
        beddetails.setRoomcharges(DataUtil.parseLong(request.getParameter("roomcharge")));
        beddetails.setBedno(DataUtil.parseLong(request.getParameter("bedno")));
        beddetails.setBedcode(request.getParameter("bedcode"));
        beddetails.setOccupied(false);

        roomndbedsetup.setRoomndbedsetupid(DataUtil.parseLong(request.getParameter("roomNdBedid")));
        beddetails.setRoomndbedsetup(roomndbedsetup);


        beddetails = new BedDetailsDao().addBedSetup(beddetails);



        return true;

    }

    public boolean viewAllBeds() {

        boolean result = false;
        try {
            List<Beddetails> list = new BedDetailsDao().viewAllBeds();
            httpSession.setAttribute("bedSetUpList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewDetailsofBed() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));

            Beddetails bedDetail = new BedDetailsDao().viewDetailsofBed(id);

            if (bedDetail == null) {
                result = false;
            } else {
                httpSession.setAttribute("detailsOfBedSetUp", bedDetail);

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

        new BedDetailsDao().deleteMultiple(ids);
    }

    public boolean deleteBedDetail() {

        long bedeid = 0;

        bedeid = DataUtil.parseLong(request.getParameter("id"));

        new BedDetailsDao().deleteBedDetail(bedeid);
        return true;


    }

    public Boolean updateBedSetup() {

        System.out.println("building name:-" + request.getParameter("buildingblock"));
        System.out.println(" floor no :-" + request.getParameter("floorno"));
        System.out.println("room no:-" + request.getParameter("roomno"));
        System.out.println("room type value:-" + request.getParameter("roomtypevalue"));
        System.out.println("room charge:-" + request.getParameter("roomcharge"));

        System.out.println("roomcode:-" + request.getParameter("roomcode"));
        System.out.println("no of beds :-" + request.getParameter("noofbeds"));
        System.out.println("bedno:-" + request.getParameter("bedno"));
        System.out.println("bedcode:-" + request.getParameter("bedcode"));
        System.out.println("roomNdBedid:-" + request.getParameter("roomNdBedid"));

        Beddetails beddetails=new Beddetails();
        Roomndbedsetup roomndbedsetup=new  Roomndbedsetup();

        beddetails.setBeddetailsid(DataUtil.parseLong(request.getParameter("bedid")));
        beddetails.setBuildingblock(request.getParameter("buildingblock"));
        beddetails.setFloorno(DataUtil.parseLong(request.getParameter("floorno")));
        beddetails.setRoomno(DataUtil.parseLong(request.getParameter("roomno")));
        beddetails.setRoomcode(request.getParameter("roomcode"));
        beddetails.setRoomtypevalue(request.getParameter("roomtypevalue"));
        beddetails.setRoomcharges(DataUtil.parseLong(request.getParameter("roomcharge")));
        beddetails.setBedno(DataUtil.parseLong(request.getParameter("bedno")));
        beddetails.setBedcode(request.getParameter("bedcode"));

        roomndbedsetup.setRoomndbedsetupid(DataUtil.parseLong(request.getParameter("roomNdBedid")));
        beddetails.setRoomndbedsetup(roomndbedsetup);


        beddetails = new BedDetailsDao().updateBedSetup(beddetails);

        
        return true;

    }


    public boolean searchByBedType() {

        boolean result = false;
        System.out.println("searchByBedType:-" + request.getParameter("roomtype"));

        try {
            List<Beddetails> list = new BedDetailsDao().searchByBedType(DataUtil.parseLong(request.getParameter("roomtype")));
            httpSession.setAttribute("bedSetUpList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchByBedStatus() {

        boolean result = false;
        boolean passresult = false;
        System.out.println("searchByBedType:-" + request.getParameter("statusFullEmpty"));
        if(request.getParameter("statusFullEmpty").equalsIgnoreCase("false"))
        {
            passresult=false;
        }
        else
        {
            passresult=true;
        }
        
        try {
            List<Beddetails> list = new BedDetailsDao().searchByBedStatus(passresult);
            httpSession.setAttribute("bedSetUpList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }




}
