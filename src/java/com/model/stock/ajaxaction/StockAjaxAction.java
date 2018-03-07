/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.stock.ajaxaction;

import com.model.stock.service.StockService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class StockAjaxAction {
    HttpServletRequest request;
    HttpServletResponse response;

    /**
     *
     * @param request
     * @param response
     */
    public StockAjaxAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }
    /**
     *
     * @param action
     */
    public void execute(String action) {
        if(action.equalsIgnoreCase("getExpiringStock")){
            System.out.println("check here:-");
            new StockService(request, response).getExpiringStock();

        }
        if(action.equalsIgnoreCase("getDepletingStock")){
            System.out.println("check here fro diplettion:-");
            new StockService(request, response).getDepletingStock();

        }

                if(action.equalsIgnoreCase("getRareMedicineS")){
            System.out.println("check here fro getRareMedicineS:-");
            new StockService(request, response).getRareMedicineS();

        }

    }

}
