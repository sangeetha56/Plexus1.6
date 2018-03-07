/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.dialySales.action;

import com.model.dialySales.service.DailySalesService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sultan
 */
public class DailySalesAction {

     HttpServletRequest request;
    HttpServletResponse response;
    String url;

    public DailySalesAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }


    public String execute(String action) {
        if (action.equalsIgnoreCase("showTodaysSalesReport")) {
            
            url = showTodaysSalesReport();
        }

        
        else  if (action.equalsIgnoreCase("showByDateSalesReport")) {
           
            url = showByDateSalesReport();
        }

        else  if (action.equalsIgnoreCase("showBetweenDateSalesReport")) {
           
            url = showBetweenDateSalesReport();
        }

        else  if (action.equalsIgnoreCase("showSalesThisMonth")) {
           
            url = showSalesThisMonth();
        }
        

        return url;
    }


    private String showTodaysSalesReport() {
       
        new DailySalesService(request, response).showTodaysSalesReport();
        return "dialySalesReport.jsp";
    }

    private String showByDateSalesReport() {
        
        new DailySalesService(request, response).showByDateSalesReport();
        return "dialySalesReport.jsp";
    }


    private String showBetweenDateSalesReport() {
         
        new DailySalesService(request, response).showBetweenDateSalesReport();
        return "dialySalesReport.jsp";
    }

    private String showSalesThisMonth() {
        
        new DailySalesService(request, response).showSalesThisMonth();
        return "dialySalesReport.jsp";
    }

}
