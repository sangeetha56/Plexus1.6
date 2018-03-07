/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.patient.action;

import com.model.patient.service.PatientService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileUploadException;

/**
 *
 * @author Mayur
 */
public class PatientAction {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private String url;

    /**
     *
     * @param request
     * @param response
     */
    public PatientAction(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    /**
     *
     * @param action
     * @return
     */
    public String execute(String action) throws FileUploadException, Exception {
        if (action.equalsIgnoreCase("add")) {
            url = add();
        } else if (action.equalsIgnoreCase("addWithAppointment")) {
           // System.out.println("in addWithAppointment ");
            url = addWithAppointment();
        } else if (action.equalsIgnoreCase("viewDetails")) {
            //System.out.println("view details");
            url = viewDetails();
        } else if (action.equalsIgnoreCase("viewAll")) {
            url = viewAll();
        } else if (action.equalsIgnoreCase("updatePatientDetails")) {
            url = updatePatientDetails();
        } else if (action.equalsIgnoreCase("update")) {
            url = updatePatient();
        } else if (action.equalsIgnoreCase("deleteMultiple")) {
            //System.out.println("deleteMultiple");
            url = deleteMultiple();

        } else if (action.equalsIgnoreCase("viewAllManage")) {
            url = viewAllManage();
        } //for jump to page
        else if (action.equalsIgnoreCase("viewBypage")) {
           // System.out.println("paging process starts from here:-");
            url = viewByPage();

        } else if (action.equalsIgnoreCase("viewAllPatient")) {
            url = viewAllPatient();
        } //end
        /**   else if (action.equalsIgnoreCase("viewByAlphabit")) {
        System.out.println("viewByAlphabit");
        url = viewByAlphabit();

        }**/
        else if (action.equalsIgnoreCase("addPatientAndView")) {
           // System.out.println("addPatientAndView");
            url = addPatientAndView();

        } else if (action.equalsIgnoreCase("updateNewRequirement")) {
           // System.out.println("updateNewRequirement");
            url = updateNewRequirement();


        } else if (action.equalsIgnoreCase("searchPatientByCardNo")) {
           // System.out.println("searchPatientByCardNo process starts from here:-");
            url = searchPatientByCardNo();
        } else if (action.equalsIgnoreCase("searchByName")) {
           // System.out.println("searchByName process starts from here:-");
            url = searchByName();
        } else if (action.equalsIgnoreCase("searchByMobileNo")) {
           // System.out.println("searchByMobileNo process starts from here:-");
            url = searchByMobileNo();
        } else if (action.equalsIgnoreCase("searchPatientByText")) {
           // System.out.println("searchPatientByText process starts from here:-");
            url = searchPatientByText();
        } else if (action.equalsIgnoreCase("patientSearch")) {
           // System.out.println("patientSearch process starts from here:-");
            url = patientSearch();
        } else if (action.equalsIgnoreCase("viewAllPop")) {
           // System.out.println("viewAllPop process starts from here:-");
            url = viewAllPop();
        }

        else if (action.equalsIgnoreCase("viewPatientForPopup")) {
           // System.out.println("viewAllPop process starts from here:-");
            url = viewPatientForPopup();
        }

        else if (action.equalsIgnoreCase("viewAllPopUp")) {
            url = viewAllPopUp();
        }

        else if (action.equalsIgnoreCase("viewAllPopUpForBiochemistry")) {
            url = viewAllPopUpForBiochemistry();
        }

        else if (action.equalsIgnoreCase("viewAllPopUpForInvestigation")) {
            url = viewAllPopUpForInvestigation();
        }
        else if (action.equalsIgnoreCase("viewAllPopUpForOperation")) {
            url = viewAllPopUpForOperation();
        }
        else if (action.equalsIgnoreCase("viewAllPopUpForReturn")) {
            url = viewAllPopUpForReturn();
        }
        return url;
    }

    private String add() throws FileUploadException, Exception {
        if (new PatientService(request, response).addPatient()) {
            return "saved.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String addWithAppointment() throws FileUploadException, Exception {
        if (new PatientService(request, response).addPatient()) {
            //return "addAppointment_1.jsp?withSession=true";
            return "Controller?process=VisitProcess&action=viewTodaysAppointment";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewDetails() {
        //System.out.println("view details 1:-");
        if (new PatientService(request, response).viewDetailsOfPatient()) {
           // System.out.println("view details completes");
            // return "patientDetails_1_NOT_REQUIRED.jsp";
            return "patientDetails_11.jsp";

        } else {
            return "viewAll_1.jsp";
        }
    }
//record per page nd out of

    private String viewAll() {
       // System.out.println("action for everythinh is:-" + request.getParameter("action"));
        new PatientService(request, response).viewAllPatient();
        //return "viewAll_1.jsp";
        return "viewALLPatientNew.jsp";
    }
    //end

    private String updatePatientDetails() {
        if (new PatientService(request, response).viewDetailsOfPatient()) {
            //return "patientDetails_1.jsp";
            return "updatePatient.jsp";
        } else {
            return "viewAll_1.jsp";
        }
    }

    private String updatePatient() {
        return "Controller?process=PatientProcess&action=viewDetails&id=" + new PatientService(request, response).updatePatient();


    }

    private String addWithTodaysAppointment() throws FileUploadException, Exception {
        if (new PatientService(request, response).addPatient()) {
            //return "addAppointment_1.jsp?withSession=true";
            return "Controller?process=VisitProcess&action=setTodaysAppointment";
        } else {
            return "notSaved.jsp";
        }
    }

    private String deleteMultiple() {

        new PatientService(request, response).deleteMultiple();
        return "Controller?process=PatientProcess&action=viewAllManage&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null";
    }

    // private String viewByAlphabit() {
    //new PatientService(request, response).viewByAlphabit();
    //return "viewAll_1.jsp";
    // return "viewAll_DataTables.jsp";
    // }
    private String addPatientAndView() throws FileUploadException, Exception {
        return "Controller?process=PatientProcess&action=viewDetails&id=" + new PatientService(request, response).addPatientAndView();


    }

    private String updateNewRequirement() throws FileUploadException, Exception {
       // System.out.println("check 1");
        new PatientService(request, response).updateNewRequirement();
        return "Controller?process=VisitProcess&action=viewTodaysAppointment&isPatientSelected=no"; //viewAll_1


    }
    //for jump to page

    private String viewByPage() {
      //  System.out.println("step 1 for paging:-");
        new PatientService(request, response).viewByPage();

      //  System.out.println("step 9 for paging:-");

        return "viewAll_1.jsp";
    }

    private String searchPatientByCardNo() {
       // System.out.println("action for everything1 is:-" + request.getParameter("action"));

        new PatientService(request, response).searchPatientByCardNo();


       // System.out.println("step 9 for paging:-");
        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "patientContactSearch.jsp";
        // return "viewALLPatientNew.jsp";
    }

    private String searchByName() {
       // System.out.println("action for everything2 is:-" + request.getParameter("action"));
      //  System.out.println("step 1 for searchByName:-");

        new PatientService(request, response).searchByName();


      //  System.out.println("step 9 for paging:-");
        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "patientContactSearch.jsp";
    }

    private String searchByMobileNo() {
       // System.out.println("action for everything3 is:-" + request.getParameter("action"));

       // System.out.println("step 1 for searchByMobileNo:-");

        new PatientService(request, response).searchByMobileNo();


       // System.out.println("step 10 for paging:-");
        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "patientContactSearch.jsp";
    }

    private String searchPatientByText() {
       // System.out.println("action for everything3 is:-" + request.getParameter("action"));
       // System.out.println("step 1 for searchContactByText:-");

        new PatientService(request, response).searchPatientByText();


      //  System.out.println("step 9 for paging:-");
        String firstTimeHit = "secondTime";


        request.setAttribute("firstCondition", firstTimeHit);

        return "patientContactSearch.jsp";
    }

    private String viewAllManage() {
       // System.out.println("action for everythinh is:-" + request.getParameter("action"));
        new PatientService(request, response).viewAllPatient();
        //return "viewAll_1.jsp";
        return "viewAllPatientManage.jsp";
    }

    private String viewAllPatient() {
       // System.out.println("action for everythinh is:-" + request.getParameter("action"));
        new PatientService(request, response).viewAllPatientNoLimit();
        //return "viewAll_1.jsp";
        return "viewALLPatientNoLimit.jsp";
    }

    private String patientSearch() {

        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        String firstTimeHit = "firstTime";

        request.setAttribute("firstShowingRecord", firstShowingRecord);
        request.setAttribute("lastShowingRecord", lastShowingRecord);
        request.setAttribute("firstCondition", firstTimeHit);

        return "patientContactSearch.jsp";
    }

    private String viewAllPop() {
       // System.out.println("action for everythinh is:-" + request.getParameter("action"));
        new PatientService(request, response).listAllPatient();
        //return "viewAll_1.jsp";
        return "zpopup.jsp";
    }

    private String viewPatientForPopup() {
       // System.out.println("action for everythinh is:-" + request.getParameter("action"));
       // System.out.println("avalue issssssssssss:-"+request.getParameter("alphabit"));
        new PatientService(request, response).viewPatientForPopupAlphabit();
        //return "viewAll_1.jsp";
        return "zpopup.jsp";
    }

     private String viewAllPopUp() {
      //  System.out.println("action for everythinh is:-" + request.getParameter("action"));
        new PatientService(request, response).viewAllPatient();

        return "myContactsPopup.jsp";
    }

    private String viewAllPopUpForBiochemistry() {
        new PatientService(request, response).viewAllPatient();

        return "myContactsPopupForBiochemistry.jsp";
    }
    private String viewAllPopUpForLab() {
        new PatientService(request, response).viewAllPatient();

        return "myContactsPopupForLab.jsp";
    }

    private String viewAllPopUpForInvestigation() {
        new PatientService(request, response).viewAllPatient();

        return "myContactsPopupForInvestigation.jsp";
    }

    private String viewAllPopUpForOperation() {
         new PatientService(request, response).viewAllPatient();

        return "myContactsPopupForOperation.jsp";
    }

    private String viewAllPopUpForReturn() {
         new PatientService(request, response).viewAllPatient();

        return "myContactsPopupForReturn.jsp";

    }
    //end
}
