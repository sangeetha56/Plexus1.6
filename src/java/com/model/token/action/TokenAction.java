/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.token.action;

import com.model.token.service.TokenService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kamal
 */
public class TokenAction {
    
    private HttpServletRequest request;
    private HttpServletResponse response;

    String url;

    public TokenAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public String execute(String action) {
        if (action.equalsIgnoreCase("issueToken")) {

            url = issueToken();
        }

        if (action.equalsIgnoreCase("printToken")) {

            url = printToken();
        }
        if (action.equalsIgnoreCase("resetToken")) {

            url = resetToken();
        }

        if (action.equalsIgnoreCase("issueTokenByDate")) {

            url = issueTokenByDate();
        }

        if (action.equalsIgnoreCase("tokenIssuedToday")) {

            url = tokenIssuedToday();
        }

                if (action.equalsIgnoreCase("showTokenIssuedBetweendate")) {

            url = showTokenIssuedBetweendate();
        }

                if (action.equalsIgnoreCase("showTokenIssuedThisMonth")) {

            url = showTokenIssuedThisMonth();
        }


        return  url;
    }

    private String issueToken() {

        new TokenService(request, response).issueToken();

           return  "issueToken.jsp";
    }

    private String printToken() {

        new TokenService(request, response).printToken();

           return  "printTokenNo.jsp";
    }

    private String resetToken() {

        new TokenService(request, response).resetToken();

           return  "issueToken.jsp";
    }

     private String issueTokenByDate() {

        new TokenService(request, response).issueTokenByDate();

           return  "tokenReport.jsp";
    }

      private String tokenIssuedToday() {

        new TokenService(request, response).tokenIssuedToday();

           return  "tokenReport.jsp";
    }

      private String showTokenIssuedBetweendate() {

        new TokenService(request, response).showTokenIssuedBetweendate();

           return  "tokenReport.jsp";
    }

    private String showTokenIssuedThisMonth() {

        new TokenService(request, response).showTokenIssuedThisMonth();

           return  "tokenReport.jsp";
    }
    



}
