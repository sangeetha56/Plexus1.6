/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.medicine.action;

import com.model.inPatient.service.InpatientService;
import com.model.medicine.service.MedicineService;
import com.model.patient.service.PatientService;
import com.util.DataUtil;
import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class MedicineAction {

    HttpServletRequest request;
    HttpServletResponse response;
    String url;

    /**
     *
     * @param request
     * @param response
     */
    public MedicineAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    /**
     *
     * @param action
     * @return
     */
    public String execute(String action) {
        if (action.equalsIgnoreCase("addMedicine")) {
            url = addMedicine();
        }
        if (action.equalsIgnoreCase("updateMedicine")) {
            url = updateMedicine();
        }
        if (action.equalsIgnoreCase("viewAllMedicine")) {
            url = viewAllMedicine();
        }
        if (action.equalsIgnoreCase("viewAllMedicineWithEmptyStocks")) {
            url = viewAllMedicineWithoutStocks();

        }
        if (action.equalsIgnoreCase("viewAllMedicineWithStocks")) {
            
            url = viewAllMedicineWithStocks();

        }
        if (action.equalsIgnoreCase("fetchAllMedicineForPrescription")) {
            url = fetchAllMedicineForPrescription();

        }

        if (action.equalsIgnoreCase(" fetchAllMedicineForPrescriptionInpatient")) {
            url = fetchAllMedicineForPrescriptionInpatient();

        }


        if (action.equalsIgnoreCase("dispensePrescribedMedicine")) {
            url = dispensePrescribedMedicine();

        }
        if (action.equalsIgnoreCase("viewMedicineDetails")) {
            url = viewMedicineDetails();
        }
        if (action.equalsIgnoreCase("deleteMedicines")) {
            url = deleteMedicines();

        } else if (action.equalsIgnoreCase("viewAllRareMedicine")) {
            url = viewAllRareMedicine();
        }

        if (action.equalsIgnoreCase("updateMedicineUsableorNot")) {
            url = updateMedicineUsableorNot();
        } else if (action.equalsIgnoreCase("searchMedicineByName")) {
           
            url = searchMedicineByName();
        } else if (action.equalsIgnoreCase("searchMedicineByText")) {
           
            url = searchMedicineByText();
        } else if (action.equalsIgnoreCase("viewAllMedicineNolimit")) {
            
            url = viewAllMedicineNolimit();
        } else if (action.equalsIgnoreCase("viewAllMedicineManage")) {
            url = viewAllMedicineManage();
        } else if (action.equalsIgnoreCase("viewAllMedicineWithEmptyStocksNoLimit")) {
            url = viewAllMedicineWithEmptyStocksNoLimit();
        } else if (action.equalsIgnoreCase("searchMedicine")) {
           
            url = searchMedicine();
        } else if (action.equalsIgnoreCase("dispensePrescribedMedicinePatient")) {
            url = dispensePrescribedMedicinePatient();

        } else if (action.equalsIgnoreCase("dispensePrescribedMedicineInPatient")) {
            url = dispensePrescribedMedicineInPatient();

        }

        else if (action.equalsIgnoreCase("dispensePrescribedMedicineForMedicineReturn")) {
            url = dispensePrescribedMedicineForMedicineReturn();

        }
        return url;

    }

    private String addMedicine() {
       
        if (new MedicineService(request, response).addMedicine()) {
            return "Controller?process=MedicineProcess&action=viewAllMedicine&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewAllMedicine() {
      
        new MedicineService(request, response).viewAllMedicine();

        return "addMedicine_JQUERY.jsp";
        //return "addMedicine.jsp";

    }

    private String viewAllMedicineWithoutStocks() {
      
        new MedicineService(request, response).viewAllMedicineWithoutStocks();
        return "stock.jsp";

    }

    private String viewAllMedicineWithStocks() {
       
        new MedicineService(request, response).viewAllMedicineWithStocks();
       
        return "currentStock_New.jsp";
        //return "currentStock.jsp";

    }

    private String fetchAllMedicineForPrescription() {
        new MedicineService(request, response).fetchAllMedicine();
        return "patientDetails_1.jsp";
    }

    private String dispensePrescribedMedicine() {
        
        new MedicineService(request, response).viewDispensableMedicine();
        // return "dispensePrescribedMedicine.jsp";
        System.out.println("here kk7:-");
       // return "dispensePrescribedMedicinetabs.jsp";
        return "dispensePrescribedMedicinetest.jsp";
    }

    /* for testing purpose */
    private String dispensePrescribedMedicinePatient() {
       
       // new PatientService(request, response).listAllPatient();
       
        // new MedicineService(request, response).viewAllMedicineWithDispensableStocks();
        new MedicineService(request, response).viewDispensableMedicine();
        // return "dispensePrescribedMedicine.jsp";
       
        return "dispensePrescribedMedicine.jsp";
    }

    private String dispensePrescribedMedicineInPatient() {
       
       // new PatientService(request, response).listAllPatient();
       
        // new MedicineService(request, response).viewAllMedicineWithDispensableStocks();
        new MedicineService(request, response).viewDispensableMedicine();
       // new InpatientService(request, response).viewAllPharmacyInPatient();
        // return "dispensePrescribedMedicine.jsp";
       
        return "dispensePrescribedMedicineInPatient.jsp";
    }

    /* end here */
    private String viewMedicineDetails() {
        new MedicineService(request, response).viewMedicineDetails();
        return "medicineDetails.jsp";
    }

    private String updateMedicine() {
        long id = new MedicineService(request, response).updateMedicine();
        return "Controller?process=MedicineProcess&action=viewMedicineDetails&id=" + id;

    }

    private String deleteMedicines() {
        new MedicineService(request, response).deleteMedicines();
        return "Controller?process=MedicineProcess&action=viewAllMedicineManage&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null";
    }

    private String fetchAllMedicineForPrescriptionInpatient() {
        new MedicineService(request, response).fetchAllMedicine();
        return "inPatientDetails.jsp";
    }

    /* for rare medicine kamal kumar
     *
     */
    private String viewAllRareMedicine() {
       
        new MedicineService(request, response).viewAllRareMedicine();

        return "rareMedicine.jsp";


    }

    private String updateMedicineUsableorNot() {
        new MedicineService(request, response).updateMedicineUsableorNot();
        return "Controller?process=MedicineProcess&action=viewAllMedicine";

    }

    private String searchMedicineByName() {
        

        new MedicineService(request, response).searchMedicineByName();


       
        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "MedicineSearch.jsp";
        // return "addMedicine_JQUERY.jsp";

    }

    private String searchMedicineByText() {
       

        new MedicineService(request, response).searchMedicineByText();


       

        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "MedicineSearch.jsp";
        //return "addMedicine_JQUERY.jsp";

    }

    private String viewAllMedicineNolimit() {
        
        new MedicineService(request, response).viewAllMedicineNolimit();

        return "addMedicineNolimit.jsp";
        //return "addMedicine.jsp";

    }

    private String viewAllMedicineManage() {
       
        new MedicineService(request, response).viewAllMedicineALL();

        return "medicineManage.jsp";
        //return "addMedicine.jsp";

    }

    private String viewAllMedicineWithEmptyStocksNoLimit() {
       
        new MedicineService(request, response).viewAllMedicineWithEmptyStocksNoLimit();
        return "stockMedicineWithEmptyStocksNoLimit.jsp";

    }

    private String searchMedicine() {

        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        String firstTimeHit = "firstTime";

        request.setAttribute("firstShowingRecord", firstShowingRecord);
        request.setAttribute("lastShowingRecord", lastShowingRecord);
        request.setAttribute("firstCondition", firstTimeHit);

        return "MedicineSearch.jsp";
    }

    private String dispensePrescribedMedicineForMedicineReturn() {
        new MedicineService(request, response).viewDispensableMedicineForReturnBill();
        // return "dispensePrescribedMedicine.jsp";

        return "addMedicineReturnBill.jsp";
    }
}
