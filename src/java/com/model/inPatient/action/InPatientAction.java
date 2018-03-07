/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.inPatient.action;

import com.model.inPatient.service.InpatientService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class InPatientAction {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private String url;

    public InPatientAction(HttpServletRequest request, HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    public String execute(String action) {

        if (action.equalsIgnoreCase("add")) {
            url = add();
        } else if (action.equalsIgnoreCase("viewAll")) {
            url = viewAll();
        } else if (action.equalsIgnoreCase("viewAllDischarge")) {
            url = viewAllDischarge();
        } else if (action.equalsIgnoreCase("deleteMultiple")) {

            url = deleteMultiple();

        } else if (action.equalsIgnoreCase("viewDetails")) {
            url = viewDetails();
        } else if (action.equalsIgnoreCase("update")) {
            url = updatePatient();
        } else if (action.equalsIgnoreCase("updatePatientDetails")) {
            url = updatePatientDetails();
        } else if (action.equalsIgnoreCase("updateInPatient")) {
            url = updateInPatient();
        } else if (action.equalsIgnoreCase("searchPatientByCardNo")) {

            url = searchPatientByCardNo();
        } else if (action.equalsIgnoreCase("searchByName")) {

            url = searchByName();
        } else if (action.equalsIgnoreCase("searchByMobileNo")) {

            url = searchByMobileNo();
        } else if (action.equalsIgnoreCase("searchPatientByText")) {

            url = searchPatientByText();
        } else if (action.equalsIgnoreCase("viewAllPharmacyInpatientList")) {
            url = viewAllPharmacyInpatientList();
        } else if (action.equalsIgnoreCase("viewAllManage")) {
            url = viewAllManage();
        } else if (action.equalsIgnoreCase("viewAllInPatient")) {
            url = viewAllInPatient();
        } else if (action.equalsIgnoreCase("viewAllDischargeInPatient")) {
            url = viewAllDischargeInPatient();
        } else if (action.equalsIgnoreCase("patientSearch")) {

            url = patientSearch();
        } else if (action.equalsIgnoreCase("viewAllPopUp")) {
            url = viewAllPopUp();
        }
        return url;
    }

    private String add() {

        if (new InpatientService(request, response).addPatient()) {
            return "savedInpatient.jsp";
        } else {
            return "notSavedInpatient.jsp";
        }
    }

    private String viewAll() {

        new InpatientService(request, response).viewAllPatient();

        return "viewAllInPatient_DataTables.jsp";
        //return "viewAllInPatient.jsp";

    }

    private String deleteMultiple() {
        new InpatientService(request, response).deleteMultiple();
        return "Controller?process=InPatientProcess&action=viewAllManage&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null";
    }

    private String viewDetails() {
        if (new InpatientService(request, response).viewDetailsOfPatient()) {
            return "inPatientDetails.jsp";
            // return "Controller?process=MedicineProcess&action=fetchAllMedicineForPrescriptionInpatient";
        } else {
            return "viewAllInPatient.jsp";
        }
    }

    private String updatePatient() {
        if (new InpatientService(request, response).updatePatient()) {

            return "Controller?process=InPatientProcess&action=viewAll&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null";
        } else {

            return "Controller?process=InPatientProcess&action=viewAll&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null";
        }

    }

    private String updatePatientDetails() {
        if (new InpatientService(request, response).viewDetailsOfPatient()) {
            //return "patientDetails_1.jsp";
            return "updateInpatient.jsp";
        } else {
            return "viewAllInPatient.jsp";
        }
    }

    private String updateInPatient() {
        return "Controller?process=InPatientProcess&action=viewDetails&id=" + new InpatientService(request, response).updateInpatient();
    }

    private String viewAllDischarge() {

        new InpatientService(request, response).viewAllDischargePatient();
        return "viewAllDischargeInPatient.jsp";

    }

    private String viewAllPharmacyInpatientList() {
        new InpatientService(request, response).viewAllPharmacyInPatient();

        return "viewAllInPatientForPharmacy.jsp";
    }

    private String searchPatientByCardNo() {

        new InpatientService(request, response).searchPatientByCardNo();



        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "inpatientContactSearch.jsp";
    }

    private String searchByName() {

        new InpatientService(request, response).searchByName();

        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "inpatientContactSearch.jsp";
    }

    private String searchByMobileNo() {

        new InpatientService(request, response).searchByMobileNo();

        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "inpatientContactSearch.jsp";
    }

    private String searchPatientByText() {

        new InpatientService(request, response).searchPatientByText();

        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "inpatientContactSearch.jsp";
    }

    private String viewAllManage() {

        new InpatientService(request, response).viewAllPatient();

        return "viewAllInPatientManage.jsp";
        //return "viewAllInPatient.jsp";

    }

    private String viewAllInPatient() {

        new InpatientService(request, response).viewAllInPatientNoLimit();
        //return "viewAll_1.jsp";
        return "viewALLInPatientNoLimit.jsp";
    }

    private String viewAllDischargeInPatient() {

        new InpatientService(request, response).viewAllDischargeInPatientNoLimit();
        //return "viewAll_1.jsp";
        return "viewALLDischargeInPatientNoLimit.jsp";
    }

    private String patientSearch() {

        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        String firstTimeHit = "firstTime";

        request.setAttribute("firstShowingRecord", firstShowingRecord);
        request.setAttribute("lastShowingRecord", lastShowingRecord);
        request.setAttribute("firstCondition", firstTimeHit);

        return "inpatientContactSearch.jsp";
    }

    private String viewAllPopUp() {

        new InpatientService(request, response).viewAllPatient();

        return "myinContactsPopup.jsp";
    }
}
