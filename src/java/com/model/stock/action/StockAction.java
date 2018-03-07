/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.stock.action;

import com.model.stock.service.StockService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class StockAction {

    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    /**
     *
     * @param request
     * @param response
     */
    public StockAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    /**
     *
     * @param action
     * @return
     */
    public String execute(String action) {
        if (action.equalsIgnoreCase("addInitialStock")) {
            url = addInitailStock();
        }
        if (action.equalsIgnoreCase("addStock")) {
            url = addStock();
        }
        if (action.equalsIgnoreCase("printCurrentStock")) {
            url = printCurrentStock();
        }
        if(action.equalsIgnoreCase("updateStock")){
            url=updateStock();

        }
        if(action.equalsIgnoreCase("viewStock")){
            url=viewStock();

        }
        if(action.equalsIgnoreCase("deleteStock")){
            url=deleteStock();

        }
        if(action.equalsIgnoreCase("viewExpiringStock")){
            url=viewExpiringStock();

        }
        if(action.equalsIgnoreCase("viewDepletingStock")){
            url=viewDepletingStock();

        }

        if(action.equalsIgnoreCase("viewAllRareMedicine")){
            url=viewAllRareMedicine();

        }

        if(action.equalsIgnoreCase("CurrentStocks")){
            url=viewCurrentStocks();

        }

        else if(action.equalsIgnoreCase("viewAllCurrentStockNoLimit")){
            url=viewAllCurrentStockNoLimit();

        }
         else if(action.equalsIgnoreCase("viewAllExpiringStockNoLimit")){
            url=viewAllExpiringStockNoLimit();

        }
        else if(action.equalsIgnoreCase("viewAllDepletingStockNoLimit")){
            url=viewAllDepletingStockNoLimit();

        }
        else if(action.equalsIgnoreCase("viewAllRareMedicineNoLimit")){
            url=viewAllRareMedicineNoLimit();

        }

        else if(action.equalsIgnoreCase("medicineForPopUp")){
            url=viewAllMedicineForPopUp();

        }

                else if(action.equalsIgnoreCase("medicineForPopUpOpen")){
            url=viewAllMedicineForPopUpOpen();

        }
        return url;
    }

    private String addStock() {
        new StockService(request, response).addStock();
       
        return "Controller?process=MedicineProcess&action=viewAllMedicineWithStocks";

    }
    private String addInitailStock() {
        new StockService(request, response).addStock();
        return "Controller?process=MedicineProcess&action=viewAllMedicineWithEmptyStocks&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null";

    }

    private String printCurrentStock() {
        new StockService(request, response).printCurrentStock();
        return "printCurrentStock.jsp";
    }

    private String updateStock() {
        
        return "Controller?process=MedicineProcess&action=viewMedicineDetails&id="+new StockService(request, response).updateStock();
    }

    private String viewStock() {
        new StockService(request, response).viewStock();
        return "viewStock.jsp";
    }

    private String deleteStock() {
        return "Controller?process=MedicineProcess&action=viewMedicineDetails&id="+new StockService(request, response).deleteStock();
    }

    private String viewExpiringStock() {
        new StockService(request, response).viewExpiringStock();

        return "viewExpiringStock_Jquery.jsp";
        //return "viewExpiringStock.jsp";
    }

    private String viewDepletingStock() {

        new StockService(request, response).viewDepletingStock();

        return "viewDepletingStock_Jquery.jsp";
        //return "viewDepletingStock.jsp";
    }

    private String viewAllRareMedicine() {
        new StockService(request, response).viewAllRareMedicine();

        return "rareMedicine_Jquery.jsp";
        //return "viewExpiringStock.jsp";
    }

    private String viewCurrentStocks() {
       
        new StockService(request, response).viewCurrentStocks();

        return "currentStock_New.jsp";
        //return "viewExpiringStock.jsp";
    }

     private String viewAllCurrentStockNoLimit() {
       
        new StockService(request, response).viewAllCurrentStockNoLimit();

        return "currentStockNoLimit.jsp";
        //return "viewExpiringStock.jsp";
    }
     private String viewAllExpiringStockNoLimit() {
        new StockService(request, response).viewAllExpiringStockNoLimit();

        return "viewAllExpiringStockNoLimit.jsp";
        //return "viewExpiringStock.jsp";
    }
       private String viewAllDepletingStockNoLimit() {
        new StockService(request, response).viewAllDepletingStockNoLimit();

        return "viewAllDepletingStockNoLimit.jsp";
        //return "viewExpiringStock.jsp";
    }
        private String viewAllRareMedicineNoLimit() {
        new StockService(request, response).viewAllRareMedicineNoLimit();

        return "viewAllRareMedicineNoLimit.jsp";
        //return "viewExpiringStock.jsp";
    }


        private String viewAllMedicineForPopUp() {
       
        new StockService(request, response).viewAllMedicineForPopUp();

        return "viewAllMedicineForPopUpList.jsp";
        //return "viewExpiringStock.jsp";
    }

                private String viewAllMedicineForPopUpOpen() {
       
        new StockService(request, response).viewAllMedicineForPopUp();

        return "viewAllMedicineForPopUp.jsp";
        //return "viewExpiringStock.jsp";
    }


}
