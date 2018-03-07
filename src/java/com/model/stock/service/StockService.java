/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.stock.service;

import com.model.medicine.dto.AvailableMedicine;
import com.model.medicine.dto.Medicine;
import com.model.medicine.dto.MedicineStock;
import com.model.stock.dao.StockDAO;
import com.model.stock.dto.Stock;
import com.util.DataUtil;
import com.util.DateUtil;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class StockService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public StockService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        httpSession = request.getSession();
    }

    /**
     *
     * @return
     */
    public boolean addStock() {
        Stock stock = new Stock();
        Medicine medicine = new Medicine();
        long medicineId;
        long availablestock;
        Date creationDate;
        Date expiryDate;
        Date manufactureDate;
        medicineId = Long.parseLong(request.getParameter("medicineId"));
        availablestock = Long.parseLong(request.getParameter("stockQuantity"));
        creationDate = DateUtil.simpleDateParser(request.getParameter("creationDate"));
        expiryDate = DateUtil.simpleDateParser(request.getParameter("expiryDate"));
        manufactureDate = DateUtil.simpleDateParser(request.getParameter("manufactureDate"));
        String batchNo = request.getParameter("batchNo");
        medicine.setId(medicineId);
        stock.setMedicine(medicine);
        stock.setAvailablestock(availablestock);
        stock.setCreationdate(creationDate);
        stock.setExpirydate(expiryDate);
        stock.setManufacturedate(manufactureDate);
        stock.setBatchno(batchNo);
        stock = new StockDAO().create(stock);
        if (stock.getId() != 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     *
     */
    public void printCurrentStock() {
        List<MedicineStock> allMedicines = new ArrayList<MedicineStock>();
        allMedicines = (List<MedicineStock>) httpSession.getAttribute("allMedicines");
        httpSession.setAttribute("allMedicineStock", allMedicines);
    }

    /**
     *
     * @return
     */
    public long updateStock() {
        Stock stock = new Stock();
        Medicine medicine = new Medicine();
        long id = 0;
        long medicineId;
        long availablestock;
        Date creationDate;
        Date expiryDate;
        Date manufactureDate;
        id = DataUtil.parseLong(request.getParameter("stockId"));
        medicineId = Long.parseLong(request.getParameter("medicineId"));
        availablestock = Long.parseLong(request.getParameter("stockQuantity"));
        creationDate = DateUtil.simpleDateParser(request.getParameter("creationDate"));
        expiryDate = DateUtil.simpleDateParser(request.getParameter("expiryDate"));
        manufactureDate = DateUtil.simpleDateParser(request.getParameter("manufactureDate"));
        String batchNo = request.getParameter("batchNo");
        stock.setId(id);
        stock.setAvailablestock(availablestock);
        stock.setCreationdate(creationDate);
        stock.setExpirydate(expiryDate);
        stock.setManufacturedate(manufactureDate);
        stock.setBatchno(batchNo);
        stock = new StockDAO().update(stock);
        return stock.getMedicine().getId();
    }

    /**
     *
     */
    public void viewStock() {
        Long id = DataUtil.parseLong(request.getParameter("stockId"));
        Stock stock = new StockDAO().readUniqueObject(id);
        httpSession.setAttribute("stock", stock);

    }

    /**
     *
     * @return
     */
    public long deleteStock() {
        long id = DataUtil.parseLong(request.getParameter("stockId"));
        long medicineId = DataUtil.parseLong(request.getParameter("medicineId"));
        new StockDAO().delete(id);
        return medicineId;
    }

    /**
     *
     */
    public void getExpiringStock() {
        
        int totalnoofrecord = new StockDAO().expiringStockCount();

        PrintWriter out = null;
       
        BigInteger expiringStockCount = BigInteger.valueOf(totalnoofrecord);

        try {
            out = response.getWriter();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        out.write("<ExpiringStockCount>");
        out.write(expiringStockCount.toString());
        out.write("</ExpiringStockCount>");

    }

    /**
     *
     */
    public void getDepletingStock() {
        
        PrintWriter out = null;
        BigInteger expiringStockCount = new StockDAO().countDepletingStock();
       
        try {
            out = response.getWriter();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        out.write("<DepletingStockCount>");
        out.write(expiringStockCount.toString());
        out.write("</DepletingStockCount>");
    }

    /**
     *
     */
    public void viewExpiringStock() {


        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;
        int noOfRecordsPerPageSelect = 0;
        String actionValue = null;
        String jumpPageValue = null;
        actionValue = request.getParameter("action");
        pageNo = DataUtil.emptyIntValueFromString(request.getParameter("pageno"));
        
        alphabit = request.getParameter("alphabit");
        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

       
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

        
        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
           
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
            
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
                
            } else {
                
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }


        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
           
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
            
            if (alphabit.equalsIgnoreCase("null")) {
               
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
           
            alphabit = request.getParameter("avalue");
        }



        try {
            List<Stock> expiringStocks = new StockDAO().getexpiringStock(pageNo, noOfRecordsPerPage, alphabit);



            

            int totalnoofrecord = new StockDAO().countgetexpiringStockRecord(alphabit);
            
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           
            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

           
            httpSession.setAttribute("expiringStocks", expiringStocks);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);

           

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        //return result;
    }

    /**
     *
     */
    public void viewDepletingStock() {

        
        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;
        int noOfRecordsPerPageSelect = 0;
        String actionValue = null;
        String jumpPageValue = null;
        actionValue = request.getParameter("action");
        pageNo = DataUtil.emptyIntValueFromString(request.getParameter("pageno"));
       
        alphabit = request.getParameter("alphabit");
        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

        
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

        
        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
           
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
           
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
               
            } else {
               
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }


        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
           
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
           
            if (alphabit.equalsIgnoreCase("null")) {
               
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
           
            alphabit = request.getParameter("avalue");
        }




        try {
            List<Stock> depletingStocks = new StockDAO().getdepletingStock(pageNo, noOfRecordsPerPage, alphabit);


            int totalnoofrecord = new StockDAO().countgetdepletingStockRecord(alphabit);
            
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            
            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

            httpSession.setAttribute("depletingStocks", depletingStocks);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);

            

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        //return result;
    }
    
    public void getRareMedicineS() {
       
        Calendar cal2 = Calendar.getInstance();
        cal2.add(Calendar.DAY_OF_MONTH, -14);
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        

        PrintWriter out = null;
        //BigInteger expiringStockCount=BigInteger.valueOf(rareStocks.size());

        BigInteger expiringStockCount = new StockDAO().countRarePrescribedMedicineStock(cal2.getTime());
        try {
            out = response.getWriter();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        out.write("<MedicineRareCount>");
        out.write(expiringStockCount.toString());
        out.write("</MedicineRareCount>");
        // httpSession.setAttribute("ratreStocks", rareStocks);
    }

    public void viewCurrentStocks() {
       
        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;
        int noOfRecordsPerPageSelect = 0;
        String actionValue = null;
        String jumpPageValue = null;
        actionValue = request.getParameter("action");
        pageNo = DataUtil.emptyIntValueFromString(request.getParameter("pageno"));
        
        alphabit = request.getParameter("alphabit");
        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

        
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

       
        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
           
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
            
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
               
            } else {
                
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }


        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
           
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
           
            if (alphabit.equalsIgnoreCase("null")) {
               
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
          
            alphabit = request.getParameter("avalue");
        }



        try {
            List<Stock> medicinesList = new StockDAO().readListOfObjects1(pageNo, noOfRecordsPerPage, alphabit);



           

            int totalnoofrecord = new StockDAO().countRecord(alphabit);
           
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            
            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

            httpSession.setAttribute("medicines", medicinesList);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);

           
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        // return result;

    }

    public void viewAllRareMedicine() {

       
        Calendar cal2 = Calendar.getInstance();
        cal2.add(Calendar.DAY_OF_MONTH, -14);
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        
        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;
        int noOfRecordsPerPageSelect = 0;
        String actionValue = null;
        String jumpPageValue = null;
        actionValue = request.getParameter("action");
        pageNo = DataUtil.emptyIntValueFromString(request.getParameter("pageno"));
     
        alphabit = request.getParameter("alphabit");
        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

        
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

       
        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
           
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
            
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
               
            } else {
                
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }



        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
           
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
           
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
               
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
          
            alphabit = request.getParameter("avalue");
        }



        try {
            List<Stock> ratreStocks = new StockDAO().getrareStock(pageNo, noOfRecordsPerPage, alphabit, cal2.getTime());



            int totalnoofrecord = new StockDAO().countgetrareStockRecord(alphabit, cal2.getTime());
            
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            
            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

            httpSession.setAttribute("ratreStocks", ratreStocks);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);

            //System.out.println("step 8 for paging:-");

            // List<Patient> list = new PatientDAO().readListOfObjects();
            //httpSession.setAttribute("patientList", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
    }

    public void viewAllCurrentStockNoLimit() {
      
        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;

        int firstShowingRecord = 0;
        int lastShowingRecord = 0;

        String actionValue = null;

        actionValue = request.getParameter("action");

        alphabit = request.getParameter("alphabit");
      
        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("All")) {
         
            String temp = null;
           // temp = request.getParameter("alphabitFromPage");
           
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
              
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
           
            alphabit = request.getParameter("avalue");
        }


        try {
            List<Stock> medicinesList = new StockDAO().viewAllCurrentStockNoLimit(alphabit);




            firstShowingRecord = 1;
            lastShowingRecord = medicinesList.size();

           
            httpSession.setAttribute("medicines", medicinesList);
           // request.setAttribute("noOfPages", noOfPages);
           // request.setAttribute("currentPage", pageNo);
           // request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
           // request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);

           
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        // return result;

    }
      public boolean viewAllExpiringStockNoLimit() {
        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;

        int firstShowingRecord = 0;
        int lastShowingRecord = 0;

        String actionValue = null;

        actionValue = request.getParameter("action");

        alphabit = request.getParameter("alphabit");
      
        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("All")) {
           
            String temp = null;
           // temp = request.getParameter("alphabitFromPage");
          
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
               
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
            
            alphabit = request.getParameter("avalue");
        }

        try {
            List<Stock> list = new StockDAO().viewAllExpiringStockNoLimit(alphabit);



            firstShowingRecord = 1;
            lastShowingRecord = list.size();

            httpSession.setAttribute("ratreStocks", list);

            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);



            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }
       public boolean viewAllDepletingStockNoLimit() {
       
        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;

        int firstShowingRecord = 0;
        int lastShowingRecord = 0;

        String actionValue = null;

        actionValue = request.getParameter("action");

        alphabit = request.getParameter("alphabit");
        

        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("All")) {
           
            String temp = null;
            //temp = request.getParameter("alphabitFromPage");
           
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
               
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
            
            alphabit = request.getParameter("avalue");
        }

        try {
            List<Stock> list = new StockDAO().viewAllDepletingStockNoLimit(alphabit);



            firstShowingRecord = 1;
            lastShowingRecord = list.size();

            
            httpSession.setAttribute("depletingStocks", list);

            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);



            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }



       public void viewAllRareMedicineNoLimit() {

        
        Calendar cal2 = Calendar.getInstance();
        cal2.add(Calendar.DAY_OF_MONTH, -14);
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
       
        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;

        int firstShowingRecord = 0;
        int lastShowingRecord = 0;

        String actionValue = null;

        actionValue = request.getParameter("action");

        alphabit = request.getParameter("alphabit");
       

        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("All")) {
           
            String temp = null;
            //temp = request.getParameter("alphabitFromPage");
           
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
            
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
           
            alphabit = request.getParameter("avalue");
        }




        try {
            List<Stock> ratreStocks = new StockDAO().viewAllRareMedicineNoLimit(alphabit, cal2.getTime());



            firstShowingRecord = 1;
            lastShowingRecord = ratreStocks.size();

            
            httpSession.setAttribute("ratreStocks", ratreStocks);

            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);



            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
    }


       public void viewAllMedicineForPopUp() {
       
        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;
        int noOfRecordsPerPageSelect = 0;
        String actionValue = null;
        String jumpPageValue = null;
        actionValue = request.getParameter("action");
        pageNo = DataUtil.emptyIntValueFromString(request.getParameter("pageno"));
       
        alphabit = request.getParameter("alphabit");
        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

       
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

       
        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
           
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
           
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
                
            } else {
             
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }


        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
           
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
           
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
              
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
           
            alphabit = request.getParameter("avalue");
        }



        try {
            List<AvailableMedicine> medicinesList = new StockDAO().viewAllMedicineForPopUp(pageNo, noOfRecordsPerPage, alphabit);



            

            int totalnoofrecord = new StockDAO().countRecordMedicineForPopUp(alphabit);
            

            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           

            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

           
            httpSession.setAttribute("medicines", medicinesList);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);

           
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        // return result;

    }
}

    

