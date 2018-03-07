/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dossage.service;

import com.model.dossage.dao.DossageDAO;
import com.model.dossage.dto.Dossage;
import com.model.medicine.dto.Medicine;
import com.model.prescription.dto.Prescription;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class DossageService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    /**
     *
     * @param request
     * @param response
     */
    public DossageService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    /**
     *
     * @param prescription
     */
    public void addMultipleDossage(Prescription prescription) {
        Dossage dossage = null;
        Medicine medicine = null;
        
        String rowIdString = request.getParameter("rowIdString");
        
        String rowMedicineIdString = request.getParameter("rowMedicineIdString");
        String rowMedicineNatureString = request.getParameter("rowMedicineNatureString");
        String rowMedicineStrengthString = request.getParameter("rowMedicineStrengthString");
        String rowMedicineDurationString = request.getParameter("rowMedicineDurationString");
        String rowMedicineDosingString = request.getParameter("rowMedicineDosingString");
        String rowMedicineRemarkString = request.getParameter("rowMedicineRemarkString");
        long medicineId = 0;
        //String visitId="";
        //visitId=request.getParameter("visitId");
//        System.out.println("rowString" + rowIdString);
//        System.out.println("rowMedicineIdString" + rowMedicineIdString);
//        System.out.println("rowMedicineNatureString" + rowMedicineNatureString);
//        System.out.println("rowMedicineStrengthString" + rowMedicineStrengthString);
//        System.out.println("rowMedicineDurationString" + rowMedicineDurationString);
//        System.out.println("rowMedicineDosingString" + rowMedicineDosingString);
//        System.out.println("rowMedicineRemarkString" + rowMedicineRemarkString);
        String[] rowIds = rowIdString.substring(1, rowIdString.length()).split(",");
        String[] rowMedicineIdStrings = rowMedicineIdString.substring(1, rowMedicineIdString.length()).split(",");
        String[] rowMedicineNatureStrings = rowMedicineNatureString.substring(1, rowMedicineNatureString.length()).split("\\|");
        String[] rowMedicineStrengthStrings = rowMedicineStrengthString.substring(1, rowMedicineStrengthString.length()).split("\\|");
        String[] rowMedicineDurationStrings = rowMedicineDurationString.substring(1, rowMedicineDurationString.length()).split("\\|");
        String[] rowMedicineDosingStrings = rowMedicineDosingString.substring(1, rowMedicineDosingString.length()).split("\\|");
        String[] rowMedicineRemarkStrings = rowMedicineRemarkString.substring(1, rowMedicineRemarkString.length()).split("\\|");
        int i = 0;
        for (String s : rowIds) {
            dossage = new Dossage();
            medicine = new Medicine();
            medicineId = Long.parseLong(rowMedicineIdStrings[i]);
            medicine.setId(medicineId);
            dossage.setMedicine(medicine);
            dossage.setPrescription(prescription);
            dossage.setDosing(rowMedicineDosingStrings[i]);
            dossage.setDuration(rowMedicineDurationStrings[i]);
            dossage.setRemarks(rowMedicineRemarkStrings[i]);
            dossage=new DossageDAO().create(dossage);
           // System.out.println("id: " + s + " " + rowMedicineIdStrings[i] + " " + rowMedicineNatureStrings[i] + " " + rowMedicineStrengthStrings[i] + " " + rowMedicineDurationStrings[i] + " " + rowMedicineDosingStrings[i] + " " + rowMedicineRemarkStrings[i]);
            i++;

        }
    }
}
