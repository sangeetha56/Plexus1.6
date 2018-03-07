/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.token.service;

import com.model.token.dao.ToeknDao;
import com.model.token.dto.Tokenlist;
import com.util.DateUtil;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kamal
 */
public class TokenService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public TokenService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public void issueToken() {
        Date todaysDate = new Date();
        System.out.println("dateeeeee:-" + todaysDate);
        int tokenno = 0;
        tokenno = new ToeknDao().readMaxTokenNo(todaysDate);
        tokenno = tokenno + 1;

        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        String formatted = format1.format(todaysDate);
        System.out.println("max token no is:-" + formatted);


        httpSession.setAttribute("tokenno", tokenno);
        httpSession.setAttribute("tokendate", formatted);

    }

    public void printToken() {
        Tokenlist token = new Tokenlist();
        Date todaysDate = new Date();
        int tokenno = (Integer.parseInt(request.getParameter("tokenno")));
        String tokendateS = request.getParameter("tokendate");
        System.out.println("kkkkkkkkkkkkkk:-" + DateUtil.simpleDateParser(tokendateS));
        token.setTokenno(tokenno);
        token.setTdate(DateUtil.simpleDateParser(tokendateS));
        token = new ToeknDao().saveToken(token);


        System.out.println("token no after dave:-" + token.getTokenno());
        System.out.println("token no after dave:-" + token.getTdate());
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        String formatted = format1.format(token.getTdate());
        System.out.println("max token no is:-" + formatted);
        httpSession.setAttribute("tokenno", token.getTokenno());
        httpSession.setAttribute("tokendetails", formatted);

    }

    public void resetToken() {
        Date todaysDate = new Date();
        System.out.println("dateeeeee:-" + todaysDate);
        int tokenno = 1;
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        String formatted = format1.format(todaysDate);


        httpSession.setAttribute("tokenno", tokenno);
        httpSession.setAttribute("tokendate", formatted);

    }

    public void issueTokenByDate() {
        Date tokenByDate = new Date();
        tokenByDate = DateUtil.simpleDateParser(request.getParameter("tokenByDate"));

        System.out.println("date is:-" + tokenByDate);

        List<Tokenlist> issuedToken = new ToeknDao().issuedtokenListByDate(tokenByDate, tokenByDate);




        httpSession.setAttribute("tokenno", issuedToken.size());
        //httpSession.setAttribute("tokendetails", issuedToken);
        httpSession.setAttribute("firstdate", tokenByDate);
        httpSession.setAttribute("seconddate", tokenByDate);

    }

    public void tokenIssuedToday() {
        Date firstDate = new Date();
        firstDate = DateUtil.simpleDateParser(request.getParameter("tokenDate2day"));

        System.out.println("date is:-" + firstDate);

        List<Tokenlist> issuedToken = new ToeknDao().issuedtokenListByDate(firstDate, firstDate);




        httpSession.setAttribute("tokenno", issuedToken.size());
        //httpSession.setAttribute("tokendetails", issuedToken);
        httpSession.setAttribute("firstdate", firstDate);
        httpSession.setAttribute("seconddate", firstDate);

    }

    public void showTokenIssuedBetweendate() {
        Date firstDate = new Date();
        Date seconddate = new Date();
        firstDate = DateUtil.simpleDateParser(request.getParameter("firstdate"));
        seconddate = DateUtil.simpleDateParser(request.getParameter("seconddate"));

        System.out.println("date is:-" + firstDate);

        List<Tokenlist> issuedToken = new ToeknDao().issuedtokenListByDate(firstDate, seconddate);




        httpSession.setAttribute("tokenno", issuedToken.size());
        //httpSession.setAttribute("tokendetails", issuedToken);
        httpSession.setAttribute("firstdate", firstDate);
        httpSession.setAttribute("seconddate", seconddate);

    }

    public void showTokenIssuedThisMonth() {
        Calendar cal = Calendar.getInstance();   // this takes current date
        cal.set(Calendar.DAY_OF_MONTH, 1);

         int year = cal.get(Calendar.YEAR);
         int month = cal.get(Calendar.MONTH);
         int day = cal.get(Calendar.DATE);
         Date startingdate = new Date(year-1900, month, day);
         Date currentdate=new Date();
        

         /* this is for getting consultation charges only
         *
        */

        

        List<Tokenlist> issuedToken = new ToeknDao().issuedtokenListByDate(startingdate,currentdate);




        httpSession.setAttribute("tokenno", issuedToken.size());
        //httpSession.setAttribute("tokendetails", issuedToken);
        httpSession.setAttribute("firstdate", startingdate);
        httpSession.setAttribute("seconddate", currentdate);

    }
}
