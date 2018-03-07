/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.medicine.service;

import com.model.company.dao.CompanyDAO;
import com.model.company.dto.Company;
import com.model.medicine.dao.MedicineDAO;
import com.model.medicine.dto.AvailableMedicine;
import com.model.medicine.dto.Medicine;
import com.model.medicine.dto.MedicineStock;
import com.model.stock.dao.StockDAO;
import com.model.stock.dto.Stock;
import com.model.vendor.dao.VendorDAO;
import com.model.vendor.dto.Vendor;
import com.util.DataUtil;
import com.util.DateUtil;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class MedicineService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public MedicineService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    /**
     *
     * @return
     */
    public boolean addMedicine() {
       
        long id;
        Date todays=new Date();
        String name, strength, nature, batchNo, unitType, remarks;
        //Date expirydate;
        BigDecimal price, unitPrice;
        Long unitQuantity;
        long vendorId;
        long companyId;
        Medicine medicine = new Medicine();
        Company company = new Company();
        Vendor vendor = new Vendor();
        name = request.getParameter("name");
        strength = request.getParameter("strength");
        nature = request.getParameter("nature");
        batchNo = request.getParameter("batchNo");
        unitType = request.getParameter("unitType");
        remarks = request.getParameter("remarks");
        price = BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("price")));
        unitPrice = BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("unitPrice")));
        unitQuantity = DataUtil.parseLong(request.getParameter("unitQuantity"));
        vendorId = DataUtil.parseLong(request.getParameter("vendorID"));
        companyId = DataUtil.parseLong(request.getParameter("companyID"));
       
        vendor = new Vendor();
        vendor.setId(vendorId);
        company = new Company();
        company.setId(companyId);
        medicine.setName(name);
        medicine.setStrength(strength);
        medicine.setNature(nature);
        medicine.setUnittype(unitType);
        medicine.setPrice(price);
        medicine.setUnitprice(unitPrice);
        medicine.setUnitquantity(unitQuantity);
        medicine.setBatchno(batchNo);
        medicine.setRemarks(remarks);
        medicine.setVat(BigDecimal.valueOf(0));
        medicine.setCgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("cgst"))));
        medicine.setIgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("igst"))));
        medicine.setSgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("sgst"))));
        medicine.setGst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("gst"))));
        System.out.println("gsttttt:-"+request.getParameter("gst"));
        medicine.setCompany(company);
        medicine.setVendor(vendor);
        medicine.setLastaccessdate(todays);
        medicine.setUsable(true);
        medicine = new MedicineDAO().create(medicine);
        if (medicine.getId() == 0l) {
            return false;
        } else {
            return true;
        }
    }

    /**
     *
     */
    public void viewAllMedicine() {
        List<Medicine> medicines = new ArrayList<Medicine>();
        List<Vendor> vendors = new ArrayList<Vendor>();
        List<Company> companies = new ArrayList<Company>();
        vendors = new VendorDAO().readListOfObjects();
        companies = new CompanyDAO().readListofObjects();
        //medicines = new MedicineDAO().readListOfObjects();
       // httpSession.setAttribute("medicines", medicines);
        httpSession.setAttribute("vendors", vendors);
        httpSession.setAttribute("companies", companies);

        ////////////////////////////////////

        
        boolean result = false;

            String alphabit=null;
             String tempAlphabet=null;
            int pageNo=0;
            int firstShowingRecord=0;
            int lastShowingRecord=0;
            int noOfRecordsPerPage=0;
            int noOfRecordsPerPageSelect=0;
            String actionValue=null;
            String jumpPageValue=null;
            actionValue=request.getParameter("action");
            pageNo=DataUtil.emptyIntValueFromString(request.getParameter("pageno"));
           
            alphabit=request.getParameter("alphabit");
            noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
            noOfRecordsPerPageSelect=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

           
            if(noOfRecordsPerPage==0)
            {
              noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
            }

            
             jumpPageValue=request.getParameter("value");
             if(jumpPageValue!=null)
             {
                
                 pageNo=Integer.parseInt(request.getParameter("pageno1"));
             }
            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
            lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;

            if(DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"))==0)
            {
               
            }
            else
            {
                if(noOfRecordsPerPage==noOfRecordsPerPageSelect)
            {
                
            }
            else
            {
                
                pageNo=1;
                noOfRecordsPerPage=noOfRecordsPerPageSelect;
                firstShowingRecord=1;
                lastShowingRecord=noOfRecordsPerPage;
            }
            }



           
               tempAlphabet=DataUtil.emptyStringAvalue(request.getParameter("avalue"));
                if(tempAlphabet.equalsIgnoreCase("null"))
                {
                  
                    String temp=null;
                    temp=request.getParameter("alphabitFromPage");
                   
                    if(alphabit.equalsIgnoreCase("null"))
                    {
                        //alphabit=alphabit;
                      
                    }

                    if(temp!=null)
                    {
                         alphabit=request.getParameter("alphabitFromPage");
                    }

                }
                else
                {
                   
                alphabit=request.getParameter("avalue");
                }






               try {
            List<Medicine> medicinesList = new MedicineDAO().readListOfObjects1(pageNo,noOfRecordsPerPage,alphabit);



           
            int totalnoofrecord = new MedicineDAO().countRecord(alphabit);
            
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            
            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
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

    /**
     *
     */
    public void fetchAllMedicine() {
        List<Medicine> medicines = new ArrayList<Medicine>();
        Medicine medicine;
        MedicineStock medicineStock;
        medicines = new MedicineDAO().readListOfObjects();
        long availableStock = 0;
        List<MedicineStock> allMedicines = new ArrayList<MedicineStock>();
        ListIterator<Medicine> medicineIterable = (ListIterator<Medicine>) (medicines.listIterator());
        while (medicineIterable.hasNext()) {
            medicine = medicineIterable.next();
            medicineStock = new MedicineStock();
           
            Iterator<Stock> stockIterator = medicine.getStocks().iterator();
            while (stockIterator.hasNext()) {
                availableStock += stockIterator.next().getAvailablestock();
            }
            medicineStock.setMedicineName(medicine.getName());
            medicineStock.setId(medicine.getId());
            medicineStock.setMedicineNature(medicine.getNature());
            medicineStock.setMedicineStrength(medicine.getStrength());
            medicineStock.setAvailableStock(availableStock);
            medicineStock.setStocks(medicine.getStocks());

            allMedicines.add(medicineStock);
            availableStock = 0;
        }
        httpSession.setAttribute("allMedicines", allMedicines);
    }

    /**
     *
     */
    public void viewAllMedicineWithoutStocks() {
//        List<Medicine> medicines = new ArrayList<Medicine>();
//        medicines = new MedicineDAO().readListOfObjects(true);
      
        boolean result = false;

            String alphabit=null;
             String tempAlphabet=null;
            int pageNo=0;
            int firstShowingRecord=0;
            int lastShowingRecord=0;
            int noOfRecordsPerPage=0;
            int noOfRecordsPerPageSelect=0;
            String actionValue=null;
            String jumpPageValue=null;
            actionValue=request.getParameter("action");
            pageNo=DataUtil.emptyIntValueFromString(request.getParameter("pageno"));
           
            alphabit=request.getParameter("alphabit");
            noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
            noOfRecordsPerPageSelect=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

            
            if(noOfRecordsPerPage==0)
            {
              noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
            }

            
             jumpPageValue=request.getParameter("value");
             if(jumpPageValue!=null)
             {
                
                 pageNo=Integer.parseInt(request.getParameter("pageno1"));
             }
            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
            lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;

            if(DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"))==0)
            {
               
            }
            else
            {
                if(noOfRecordsPerPage==noOfRecordsPerPageSelect)
            {
                
            }
            else
            {
                
                pageNo=1;
                noOfRecordsPerPage=noOfRecordsPerPageSelect;
                firstShowingRecord=1;
                lastShowingRecord=noOfRecordsPerPage;
            }
            }



               tempAlphabet=DataUtil.emptyStringAvalue(request.getParameter("avalue"));
                if(tempAlphabet.equalsIgnoreCase("null"))
                {
                  
                    String temp=null;
                    temp=request.getParameter("alphabitFromPage");
                   
                    if(alphabit.equalsIgnoreCase("null"))
                    {
                        //alphabit=alphabit;
                        
                    }

                    if(temp!=null)
                    {
                         alphabit=request.getParameter("alphabitFromPage");
                    }

                }
                else
                {
                  
                alphabit=request.getParameter("avalue");
                }




               try {
            List<Medicine> medicinesList = new MedicineDAO().viewAllMedicineWithoutStocks(pageNo,noOfRecordsPerPage,alphabit);



            int totalnoofrecord = new MedicineDAO().countRecordMedicineWithoutStocks(alphabit);
            
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            
            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
            }

           
            httpSession.setAttribute("medicinesWithoutStocks", medicinesList);
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

    /**
     *
     */
    public void viewAllMedicineWithStocks() {
       
     /*
      * for current stock older version

        List<Medicine> medicines = new ArrayList<Medicine>();
        Medicine medicine;
        long availableStock = 0;
        MedicineStock medicineStock;
        List<MedicineStock> allMedicines = new ArrayList<MedicineStock>();
        medicines = new MedicineDAO().readListOfObjects(false);
        System.out.println("size" + medicines.size());
        ListIterator<Medicine> medicineIterable = (ListIterator<Medicine>) (medicines.listIterator());
        while (medicineIterable.hasNext()) {
            medicine = medicineIterable.next();
            medicineStock = new MedicineStock();
            System.out.println("medicine id:- " + medicine.getId());
            System.out.println("medicine name:-"+medicine.getName() + " stock1 " + medicine.getStocks().size());
            Iterator<Stock> stockIterator = medicine.getStocks().iterator();
            while (stockIterator.hasNext()) {
                availableStock += stockIterator.next().getAvailablestock();
            }
            System.out.println("stock value" + availableStock);
//            medicineStock.setMedicineName(medicine.getName());
//            medicineStock.setId(medicine.getId());
//            medicineStock.setAvailableStock(availableStock);
//            medicineStock.setStocks(medicine.getStocks());
//            medicineStock.setPrice(medicine.getPrice());
//            System.out.println("stock value" + availableStock);
//            allMedicines.add(medicineStock);
//            availableStock = 0;
        }
        httpSession.setAttribute("allMedicines", allMedicines);
        httpSession.setAttribute("medicinesWithStocks", medicines);
        httpSession.setAttribute("size", Integer.valueOf(medicines.size()));
      *
      * 
      */

         List<Medicine> medicines = new ArrayList<Medicine>();
        List<Vendor> vendors = new ArrayList<Vendor>();
        List<Company> companies = new ArrayList<Company>();
        vendors = new VendorDAO().readListOfObjects();
        companies = new CompanyDAO().readListofObjects();
        medicines = new MedicineDAO().readListOfObjects();
        httpSession.setAttribute("medicines", medicines);
        httpSession.setAttribute("vendors", vendors);
        httpSession.setAttribute("companies", companies);
    }

    /**
     *
     */
    public void viewAllMedicineWithDispensableStocks() {
        List<Medicine> medicines = new ArrayList<Medicine>();
        Medicine medicine;
        long availableStock = 0;
        Stock stock = new Stock();
        MedicineStock medicineStock;
        List<MedicineStock> allMedicines = new ArrayList<MedicineStock>();
        medicines = new MedicineDAO().readListOfObjects(false, true);
      
        ListIterator<Medicine> medicineIterable = (ListIterator<Medicine>) (medicines.listIterator());
        while (medicineIterable.hasNext()) {
            medicine = medicineIterable.next();
            medicineStock = new MedicineStock();
          
            Iterator<Stock> stockIterator = medicine.getStocks().iterator();
            while (stockIterator.hasNext()) {
                stock = stockIterator.next();
                if (stock.getExpirydate().after(DateUtil.forwardMonths(DateUtil.todaysDate(), 2))) {
                    availableStock += stock.getAvailablestock();
                }

            }
            if (availableStock > 0) {
                medicineStock.setMedicineName(medicine.getName());
                medicineStock.setId(medicine.getId());
                medicineStock.setAvailableStock(availableStock);
                medicineStock.setStocks(medicine.getStocks());
                medicineStock.setPrice(medicine.getPrice());
              
                allMedicines.add(medicineStock);

            }

            availableStock = 0;
        }
        httpSession.setAttribute("allMedicines", allMedicines);
        httpSession.setAttribute("medicinesWithStocks", medicines);
        httpSession.setAttribute("size", Integer.valueOf(medicines.size()));
    }

    /**
     *
     */
    public void viewMedicineDetails() {
        Long id = DataUtil.parseLong(request.getParameter("id"));
        Medicine medicine = new MedicineDAO().readObject(id);
        httpSession.setAttribute("medicine", medicine);

    }

    /**
     *
     * @return
     */
    public long updateMedicine() {
        long id;
        String name, strength, nature, batchNo, unitType, remarks;
        //Date expirydate;
        BigDecimal price, unitPrice;
        Long unitQuantity;
        long vendorId;
        long companyId;
        long medicineId;
      
        Medicine medicine = new Medicine();
        Company company = new Company();
        Vendor vendor = new Vendor();
        name = request.getParameter("name");
        strength = request.getParameter("strength");
        nature = request.getParameter("nature");
        batchNo = request.getParameter("batchNo");
        unitType = request.getParameter("unitType");
        remarks = request.getParameter("remarks");
        price = BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("price")));
        unitPrice = BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("unitPrice")));
        unitQuantity = DataUtil.parseLong(request.getParameter("unitQuantity"));
        vendorId = DataUtil.parseLong(request.getParameter("vendorID"));
      
        companyId = DataUtil.parseLong(request.getParameter("companyID"));
        medicineId = DataUtil.parseLong(request.getParameter("medicineID"));
        vendor = new VendorDAO().readUniqueObject(vendorId);
        company = new CompanyDAO().readUniqueObject(companyId);

        medicine.setId(medicineId);
        medicine.setName(name);
        medicine.setStrength(strength);
        medicine.setNature(nature);
        medicine.setUnittype(unitType);
        medicine.setPrice(price);
        medicine.setUnitprice(unitPrice);
        medicine.setUnitquantity(unitQuantity);
        medicine.setBatchno(batchNo);
        medicine.setRemarks(remarks);
        medicine.setVat(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("vat"))));
        medicine.setCgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("cgst"))));
        medicine.setIgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("igst"))));
        medicine.setSgst(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("sgst"))));
        medicine.setLastaccessdate(DateUtil.simpleDateParser(request.getParameter("lastdatee")));
        medicine.setCompany(company);
        medicine.setVendor(vendor);
    
        medicine = new MedicineDAO().update(medicine);
        return medicine.getId();
    }

    /**
     *
     */
    public void deleteMedicines() {
        String[] medicineIDs = request.getParameterValues("medicineIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : medicineIDs) {
           
            ids.add(Long.valueOf(id));

        }
        new MedicineDAO().deleteMultiple(ids);
    }

    /**
     *
     */
    public void getExpiringStock() {
    }

    /**
     *
     */
    public void viewDispensableMedicine() {
       
        List<AvailableMedicine> availableMedicines=new MedicineDAO().readListOfAvailableMedicines();
        System.out.println("check here1");
        httpSession.setAttribute("allMedicines", availableMedicines);

    }


    public void viewAllRareMedicine() {
        
        Calendar cal2 = Calendar.getInstance();
        cal2.add(Calendar.DAY_OF_MONTH, -60);
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
       

        
        List<Medicine> medicinesrare = new ArrayList<Medicine>();
        List<Vendor> vendorsrare = new ArrayList<Vendor>();
        List<Company> companiesrare = new ArrayList<Company>();

        List<Stock> stockrare = new ArrayList<Stock>();
        //vendorsrare = new VendorDAO().readListOfObjects();
        //companiesrare = new CompanyDAO().readListofObjects();
        medicinesrare = new MedicineDAO().readRareMedicine(cal2.getTime());
        //stockrare=new StockDAO().readAllStock(cal2.getTime());
       
        httpSession.setAttribute("medicinesrare", medicinesrare);
        httpSession.setAttribute("vendorsrare", vendorsrare);
        httpSession.setAttribute("companiesrare", companiesrare);
        httpSession.setAttribute("stockrare", stockrare);
    }
    
    
    public void getRareMedicine() {
        

        Calendar cal2 = Calendar.getInstance();
        cal2.add(Calendar.DAY_OF_MONTH, -60);
        SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
       


        
        PrintWriter out = null;
        BigInteger expiringStockCount=new MedicineDAO().countRareMedicine(cal2.getTime());
        try {
            out = response.getWriter();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        out.write("<MedicineRareCount>");
        out.write(expiringStockCount.toString());
        out.write("</MedicineRareCount>");

    }

    public long updateMedicineUsableorNot() {
       
        long medicineId;
        medicineId = DataUtil.parseLong(request.getParameter("medicineID"));
        
        Medicine medicine = new Medicine();

        medicine.setId(medicineId);
        medicine.setUsable(false);
        
        medicine = new MedicineDAO().updateMedicineUsableorNot(medicine);
        return medicine.getId();
    }
     public boolean searchMedicineByName() {

         boolean result = false;




            String alphabit=null;
            String tempAlphabet=null;
            int pageNo=0;
            int firstShowingRecord=0;
            int lastShowingRecord=0;
            int noOfRecordsPerPage=0;

             String medicineName=null;
             int noOfRecordsPerPageSelect=0;
            String actionValue=null;
            String jumpPageValue=null;
            String controllervalue=null;
            actionValue=request.getParameter("action");
            pageNo=Integer.parseInt(request.getParameter("pageno"));
             //noOfRecordsPerPage=Integer.parseInt(request.getParameter("noOfRecords"));
              medicineName=(request.getParameter("primaryName"));
             alphabit=request.getParameter("alphabit");
              controllervalue=DataUtil.emptyString1(request.getParameter("actionValue"));

             
              if(controllervalue!=null)
           {
             
                medicineName=request.getParameter("actionValue");
                controllervalue=request.getParameter("actionValue");
           }
           else
           {
               
                 medicineName=request.getParameter("primaryName");
                 controllervalue=request.getParameter("primaryName");
           }
            noOfRecordsPerPageSelect=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));
            noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));




           
                firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
                lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;
                 if(noOfRecordsPerPage==0)
            {
              noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
            }

           
             jumpPageValue=request.getParameter("value");
             if(jumpPageValue!=null)
             {
                 
                 pageNo=Integer.parseInt(request.getParameter("pageno1"));
             }
            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
            lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;

            if(DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"))==0)
            {
                
            }
            else
            {
                if(noOfRecordsPerPage==noOfRecordsPerPageSelect)
            {
               
            }
            else
            {
               
                pageNo=1;
                noOfRecordsPerPage=noOfRecordsPerPageSelect;
                firstShowingRecord=1;
                lastShowingRecord=noOfRecordsPerPage;
            }
            }




               tempAlphabet=DataUtil.emptyStringAvalue(request.getParameter("avalue"));
                if(tempAlphabet.equalsIgnoreCase("null"))
                {
                    
                    String temp=null;
                    temp=request.getParameter("alphabitFromPage");
                   
                    if(alphabit.equalsIgnoreCase("null"))
                    {
                        //alphabit=alphabit;
                       
                    }

                    if(temp!=null)
                    {
                         alphabit=request.getParameter("alphabitFromPage");
                    }

                }
                else
                {
                  
                alphabit=request.getParameter("avalue");
                }

        try {
            List<Medicine> list = new MedicineDAO().searchMedicineByName(medicineName,pageNo, noOfRecordsPerPage,alphabit);


           

            int totalnoofrecord = new MedicineDAO().countRecordSearchByMedicineName(medicineName,alphabit);
            
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           

            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
            }




            httpSession.setAttribute("medicines", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);

            request.setAttribute("controllerValue", controllervalue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }
     public boolean searchMedicineByText() {
       
        boolean result = false;

        

            String alphabit=null;
            String tempAlphabet=null;
            int pageNo=0;
            int firstShowingRecord=0;
            int lastShowingRecord=0;
            int noOfRecordsPerPage=0;
            String text =null;

           int noOfRecordsPerPageSelect=0;
            String actionValue=null;
            String jumpPageValue=null;
            String controllervalue=null;
            pageNo=Integer.parseInt(request.getParameter("pageno"));
            // noOfRecordsPerPage=Integer.parseInt(request.getParameter("noOfRecords"));
             text=(request.getParameter("byText"));
             alphabit=request.getParameter("alphabit");
           
            controllervalue=DataUtil.emptyString1(request.getParameter("actionValue"));



            actionValue=request.getParameter("action");
            if(controllervalue!=null)
           {
              
                text=request.getParameter("actionValue");
                controllervalue=request.getParameter("actionValue");
           }
           else
           {
               
                 text=request.getParameter("byText");
                 controllervalue=request.getParameter("byText");
           }
           noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
            noOfRecordsPerPageSelect=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

           
           firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
                lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;
                 if(noOfRecordsPerPage==0)
            {
              noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
            }

             jumpPageValue=request.getParameter("value");
             if(jumpPageValue!=null)
             {
                 
                 pageNo=Integer.parseInt(request.getParameter("pageno1"));
             }
            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
            lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;

            if(DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"))==0)
            {
               
            }
            else
            {
                if(noOfRecordsPerPage==noOfRecordsPerPageSelect)
            {
               
            }
            else
            {
               
                pageNo=1;
                noOfRecordsPerPage=noOfRecordsPerPageSelect;
                firstShowingRecord=1;
                lastShowingRecord=noOfRecordsPerPage;
            }
            }





               tempAlphabet=DataUtil.emptyStringAvalue(request.getParameter("avalue"));
                if(tempAlphabet.equalsIgnoreCase("null"))
                {
                   
                    String temp=null;
                    temp=request.getParameter("alphabitFromPage");
                  
                    if(alphabit.equalsIgnoreCase("null"))
                    {
                        //alphabit=alphabit;
                      
                    }

                    if(temp!=null)
                    {
                         alphabit=request.getParameter("alphabitFromPage");
                    }

                }
                else
                {
                  
                alphabit=request.getParameter("avalue");
                }


        try {
            List<Medicine> list = new MedicineDAO().searchMedicineByText(text,pageNo,noOfRecordsPerPage,alphabit);


           

            int totalnoofrecord = new MedicineDAO().countRecordsearchMedicineByText(text,alphabit);
          
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            
            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
            }

           

            httpSession.setAttribute("medicines", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);
            request.setAttribute("controllerValue", controllervalue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);


            

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }



     public void viewAllMedicineNolimit() {


    
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
            List<Medicine> medicinesList = new MedicineDAO().viewAllMedicineNolimit(alphabit);

         

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

     public void viewAllMedicineWithEmptyStocksNoLimit() {
//        List<Medicine> medicines = new ArrayList<Medicine>();
//        medicines = new MedicineDAO().readListOfObjects(true);
     
      
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
              
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
           
            alphabit = request.getParameter("avalue");
        }


               try {
            List<Medicine> medicinesList = new MedicineDAO().viewAllMedicineWithEmptyStocksNoLimit(alphabit);

           


            firstShowingRecord = 1;
            lastShowingRecord = medicinesList.size();

           
            httpSession.setAttribute("medicinesWithoutStocks", medicinesList);
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


      public void viewAllMedicineALL() {
        List<Medicine> medicines = new ArrayList<Medicine>();
        List<Vendor> vendors = new ArrayList<Vendor>();
        List<Company> companies = new ArrayList<Company>();
        vendors = new VendorDAO().readListOfObjects();
        companies = new CompanyDAO().readListofObjects();
        //medicines = new MedicineDAO().readListOfObjects();
       // httpSession.setAttribute("medicines", medicines);
        httpSession.setAttribute("vendors", vendors);
        httpSession.setAttribute("companies", companies);

      
        boolean result = false;

            String alphabit=null;
             String tempAlphabet=null;
            int pageNo=0;
            int firstShowingRecord=0;
            int lastShowingRecord=0;
            int noOfRecordsPerPage=0;
            int noOfRecordsPerPageSelect=0;
            String actionValue=null;
            String jumpPageValue=null;
            actionValue=request.getParameter("action");
            pageNo=DataUtil.emptyIntValueFromString(request.getParameter("pageno"));
         
            alphabit=request.getParameter("alphabit");
            noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
            noOfRecordsPerPageSelect=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

           
            if(noOfRecordsPerPage==0)
            {
              noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
            }

         

             jumpPageValue=request.getParameter("value");
             if(jumpPageValue!=null)
             {
                
                 pageNo=Integer.parseInt(request.getParameter("pageno1"));
             }
            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
            lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;

            if(DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"))==0)
            {
               
            }
            else
            {
                if(noOfRecordsPerPage==noOfRecordsPerPageSelect)
            {
                
            }
            else
            {
               
                pageNo=1;
                noOfRecordsPerPage=noOfRecordsPerPageSelect;
                firstShowingRecord=1;
                lastShowingRecord=noOfRecordsPerPage;
            }
            }




               tempAlphabet=DataUtil.emptyStringAvalue(request.getParameter("avalue"));
                if(tempAlphabet.equalsIgnoreCase("null"))
                {
                  
                    String temp=null;
                    temp=request.getParameter("alphabitFromPage");
                 
                    if(alphabit.equalsIgnoreCase("null"))
                    {
                        //alphabit=alphabit;
                       
                    }

                    if(temp!=null)
                    {
                         alphabit=request.getParameter("alphabitFromPage");
                    }

                }
                else
                {
                  
                alphabit=request.getParameter("avalue");
                }







               try {
            List<Medicine> medicinesList = new MedicineDAO().readListOfObjectsALL(pageNo,noOfRecordsPerPage,alphabit);



            

            int totalnoofrecord = new MedicineDAO().countRecordALL(alphabit);
            
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           
            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
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

    public void viewDispensableMedicineForReturnBill() {
        List<AvailableMedicine> availableMedicines=new MedicineDAO().viewDispensableMedicineForReturnBill();
        System.out.println("check here1");
        httpSession.setAttribute("allMedicines", availableMedicines);
    }



}
