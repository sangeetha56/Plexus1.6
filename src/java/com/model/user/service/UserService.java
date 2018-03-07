/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.user.service;

import com.model.nationality.service.NationalityService;
import com.model.user.dao.UserDAO;
import com.model.user.dto.User;
import com.util.DataUtil;
import com.util.HibernateUtil;
import java.lang.Long;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
/**
 *
 * @author Mayur
 */
public class UserService {    
    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;
    private User user;
    /**
     *
     * @param request
     * @param response
     */
    public UserService(HttpServletRequest request, HttpServletResponse response) {
        this.request=request;
        this.response=response;
        this.httpSession=request.getSession();
    }
    
    /**
     *
     * @return
     */
    public boolean  authenticateUser(){
        boolean result;
        String userName=request.getParameter("loginName");
        String password=request.getParameter("password");
        user=new UserDAO().readUniqueObject(userName, password);
        if(user!=null){
           // System.out.println("type"+user.getType());
            request.setAttribute("userType", user.getType());
            new NationalityService(request, response).setSessionAtrributes();
            result=true;
        }
        else{
            result=false;
        }
        return result;
    }

    /**
     *
     */
    public void  logOutUser(){
       httpSession.invalidate();
       new UserDAO().sessionClose();
    }
    public boolean addUser() {
        //System.out.println("user service add user");
        User user1 =  new User();
        Date d=new Date();
//        System.out.println("loginname"+request.getParameter("loginname"));
//        System.out.println("password"+request.getParameter("password"));
//        System.out.println("usertype"+request.getParameter("usertype"));
             user1.setLoginname(DataUtil.emptyString(request.getParameter("loginname")));
             user1.setPassword(DataUtil.emptyString(request.getParameter("password")));
            // user1.setCreatedDate(DateUtil.simpleDateParser(request.getParameter("createdDate")));
             user1.setType(DataUtil.emptyString(request.getParameter("usertype")));
             user1.setCreateddate(d);
             


          user1 = new UserDAO().create(user1);

           if (user1.getId() == 01) {
              // System.out.println("here kamal :-");
            return false;
        } else {
              // System.out.println("here kamal2:--");
            httpSession.setAttribute("user1", user1);
           // System.out.println("must display");


            return true;
        }
    }
          public boolean addNewUser() {
        boolean result = false;
        try {
            List<User> list = new UserDAO().readListOfObjects();
            httpSession.setAttribute("PersonalDetailsList", list);
            //System.out.println("size of list is ::::::::::::::: "+list.size());
            if(list.size()< 90){
                result=true;
            }else{
            result = false;
            }
           } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }
          public boolean viewAllUsers() {
        boolean result = false;
            try{ 
                List<User> list = new UserDAO().readListOfObjects();
                httpSession.setAttribute("UserList", list);
                result = true;

            }catch(Exception e){
                e.printStackTrace();
                result = false;
            }


        return result;
    }

          public void deleteMultiple() {
        String[] patientIds = request.getParameterValues("personalIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : patientIds) {

            ids.add(Long.valueOf(id));

        }

        new UserDAO().deleteMulutiple(ids);

    }


          public boolean viewDetailsOfUser()
          {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));

            User user = new UserDAO().readUniqueObject(id);
            //Visit activeVisit= new VisitDAO().readObject(patient, false);
            if (user == null) {
                result = false;
            } else {
                httpSession.setAttribute("userList", user);
                //httpSession.setAttribute("activeVisit", activeVisit);
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

    public boolean updateUser() {
         boolean result = false;
          User user = new User();
          long userid = Long.parseLong(request.getParameter("id"));

        user.setId(userid);
        user.setLoginname(request.getParameter("loginname"));
        user.setPassword(request.getParameter("password"));
        user.setType(request.getParameter("usertype"));
        
        user = new UserDAO().update(user);
       // return patient.getId();
        return result;

    }

    public void deleteUser() {
       Long userId = Long.parseLong(request.getParameter("userid"));
        
        new UserDAO().deleteUser(userId);

    }


}
