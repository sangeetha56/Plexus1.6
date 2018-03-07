/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.biochemistry.action.BiochemistryAction;
import com.model.BuildingType.action.BuildingTypeAction;
import com.model.RoomType.Action.RoomTypeAction;
import com.model.advance.action.AdvanceAction;
import com.model.bbiochemistry.action.BbiochemistryAction;
import com.model.beddetail.action.BedDetailsAction;


import com.model.bill.action.BillAction;
import com.model.bloodtransfucion.action.bloodtransfucionAction;
import com.model.company.action.CompanyAction;
import com.model.consultancytype.action.ConsultancyTypeAction;
import com.model.dispense.action.DispenseAction;
import com.model.inPatient.action.InPatientAction;
import com.model.indispense.action.InDispenseAction;
import com.model.medicine.action.MedicineAction;
import com.model.patient.action.PatientAction;
import com.model.prescription.action.PrescriptionAction;
import com.model.stock.action.StockAction;
import com.model.user.action.UserAction;
import com.model.vendor.action.VendorAction;
import com.model.visit.action.VisitAction;
import com.model.department.action.DepartmentNameAction;
import com.model.dialySales.action.DailySalesAction;
import com.model.doctorProcess.action.DoctorInfoAction;
import com.model.gst.action.GstAction;
import com.model.inreport.action.InReportAction;
import com.model.investigation.action.InvestigationAction;
import com.model.investigationbill.action.InvestigationBillAction;

import com.model.operationType.action.OperationTypeAction;
import com.model.operationBill.action.OperationBillAction;
import com.model.lab.action.LabAction;
import com.model.licenceInfo.action.LicenceInfoAction;
import com.model.operation.action.OperationAction;
import com.model.redispense.action.RedispenseAction;
import com.model.report.action.ReportAction;
import com.model.roomndbedssetup.action.RoomndBedsAction;
import com.model.roomsetup.action.RoomSetUpAction;
import com.model.routineureal.action.RoutineurealAction;
import com.model.sonography.action.SonographyAction;
import com.model.therapy.action.TheraphyAction;
import com.model.therapybill.action.TherapybillAction;
import com.model.token.action.TokenAction;
import com.model.xray.action.XrayAction;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileUploadException;

/**
 * Handles the synchronous request and response from client
 * @author Mayur
 *
 */
public class Controller extends HttpServlet {

    private HttpSession httpSession;
    private HttpServletRequest request;
    private HttpServletResponse response;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) {

        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();


        String process = request.getParameter("process");
        String action = request.getParameter("action");
        String nextUrl = "";
        String ipath = "";

        ipath = getServletContext().getRealPath("/").toString();

        httpSession.setAttribute("imagepath", ipath);
        if (process.equalsIgnoreCase("UserProcess")) {
            nextUrl = new UserAction(request, response).execute(action);
        } //        else if(process.equalsIgnoreCase("PatientProcess")){
        //            nextUrl= new PatientAction(request, response).execute(action);
        //        }
        else if (process.equalsIgnoreCase("PatientProcess")) {
            try {
                nextUrl = new PatientAction(request, response).execute(action);
            } catch (FileUploadException ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (process.equalsIgnoreCase("VisitProcess")) {
            nextUrl = new VisitAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("MedicineProcess")) {
            nextUrl = new MedicineAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("StockProcess")) {
            nextUrl = new StockAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("CompanyProcess")) {
            nextUrl = new CompanyAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("VendorProcess")) {
            nextUrl = new VendorAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("PrescriptionProcess")) {
            nextUrl = new PrescriptionAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("BillProcess")) {
            nextUrl = new BillAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("DispenseProcess")) {
            nextUrl = new DispenseAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("inDispenseProcess")) {
            nextUrl = new InDispenseAction(request, response).execute(action);

        }  else if (process.equalsIgnoreCase("RedispenseProcess")) {
            nextUrl = new RedispenseAction(request, response).execute(action);

        }else if (process.equalsIgnoreCase("InPatientProcess")) {
            nextUrl = new InPatientAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("ConsultancyProcess")) {
            nextUrl = new ConsultancyTypeAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("DepartmentProcess")) {
            nextUrl = new DepartmentNameAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("DoctorProcess")) {
            nextUrl = new DoctorInfoAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("LicenceProcess")) {
            try {
                nextUrl = new LicenceInfoAction(request, response).execute(action);
            } catch (FileUploadException ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (process.equalsIgnoreCase("DailySalesProcess")) {
            nextUrl = new DailySalesAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("ReportProcess")) {
            try {
                nextUrl = new ReportAction(request, response).execute(action);
            } catch (FileUploadException ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (process.equalsIgnoreCase("InReportProcess")) {
            try {
                nextUrl = new InReportAction(request, response).execute(action);
            } catch (FileUploadException ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (process.equalsIgnoreCase("TherapyProcess")) {
            nextUrl = new TheraphyAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("TherapyBillProcess")) {
            nextUrl = new TherapybillAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("InvestigationProcess")) {
            nextUrl = new InvestigationAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("InvestigationBillProcess")) {
            nextUrl = new InvestigationBillAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("AdvanceProcess")) {
            nextUrl = new AdvanceAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("OperationTypeProcess")) {
            nextUrl = new OperationTypeAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("OperationBillProcess")) {
            nextUrl = new OperationBillAction(request, response).execute(action);

        } else if (process.equalsIgnoreCase("TokenSystemProcess")) {
            nextUrl = new TokenAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("BiochemistryProcess")) {
            nextUrl = new BiochemistryAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("BloodtransfucionProcess")) {
            nextUrl = new bloodtransfucionAction(request, response).execute(action);
        }else if (process.equalsIgnoreCase("GstProcess")) {
            nextUrl = new GstAction(request, response).execute(action);
        }else if (process.equalsIgnoreCase("RoutineurealProcess")) {
            nextUrl = new RoutineurealAction(request, response).execute(action);
        }else if (process.equalsIgnoreCase("LabProcess")) {
            nextUrl = new LabAction(request, response).execute(action);
        }else if (process.equalsIgnoreCase("BbiochemistryProcess")) {
            nextUrl = new BbiochemistryAction(request, response).execute(action);
        }else if (process.equalsIgnoreCase("OperationProcess")) {
            nextUrl = new OperationAction(request, response).execute(action);
        }else if (process.equalsIgnoreCase("XrayProcess")) {
            nextUrl = new XrayAction(request, response).execute(action);
        }else if (process.equalsIgnoreCase("SonographyProcess")) {
            nextUrl = new SonographyAction(request, response).execute(action);
        }



        else if (process.equalsIgnoreCase("BuildingProcess")) {
            nextUrl = new BuildingTypeAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("RoomProcess")) {
            nextUrl = new RoomTypeAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("RoomSetUpProcess")) {
            nextUrl = new RoomSetUpAction(request, response).execute(action);
        } else if (process.equalsIgnoreCase("RoomManagement")) {
            nextUrl = new RoomndBedsAction(request, response).execute(action);
        }
        else if (process.equalsIgnoreCase("BedManagement")) {
            nextUrl = new BedDetailsAction(request, response).execute(action);
        }



        RequestDispatcher reg = request.getRequestDispatcher(nextUrl);
        response.toString();
        try {
            reg.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
  