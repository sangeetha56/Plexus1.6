/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.patient.service;

import com.model.bill.dao.BillDAO;
import com.model.bill.dto.Bill;
import com.model.detailTherapyBill.dao.DetailstherapybillDao;
import com.model.detailTherapyBill.dto.Detailstherapybill;
import com.model.patient.dao.PatientDAO;
import com.model.patient.dto.Patient;
import com.model.report.dao.ReportDao;
import com.model.report.dto.Report;
import com.model.therapy.dao.TheraphyDao;
import com.model.therapy.dto.Theraphy;
import com.model.therapybill.dao.TherapybillDao;
import com.model.therapybill.dto.Therapybill;
import com.model.visit.dao.VisitDAO;
import com.model.visit.dto.Visit;
import com.util.DataUtil;
import com.util.DateUtil;
import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Mayur
 */
public class PatientService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;
    private String filePath;

    /**
     *
     * @param request
     * @param response
     */
    public PatientService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    /**
     *
     * @return
     */
    public boolean addPatient() throws FileUploadException, Exception {
//        Patient patient = new Patient();
//        System.out.println("in add");
//        Random randomGenerator = new Random();
//        int randomInt = randomGenerator.nextInt(1000000);
//        long longRandom = randomInt;
//        patient.setName(request.getParameter("name"));
//        patient.setRegno(Long.valueOf(longRandom));
//        patient.setCardno(DataUtil.parseLong(request.getParameter("cardNo")));
//        patient.setBloodgroup(request.getParameter("bloodGroup"));
//        patient.setSex(request.getParameter("sex"));
//        patient.setMarried(request.getParameter("married"));
//        patient.setAge(DataUtil.parseShort(request.getParameter("age")));
//        patient.setNationality(request.getParameter("nationality"));
//        patient.setTelephoneno(DataUtil.parseLong(request.getParameter("contactNO")));
//        patient.setAddress(request.getParameter("address"));
//        patient.setRefferedby(request.getParameter("referencedBy"));
//        patient.setChiefcomplaints(request.getParameter("chiefComplaints"));
//        patient.setHistoryofpresentillness(request.getParameter("historyOfPresentIllness"));
//        patient.setPasthistory(request.getParameter("pastHistory"));
//        patient.setFamilyhistory(request.getParameter("familyHistory"));
//        patient.setPersonalhistory(request.getParameter("personalHistory"));
//        patient.setDrugallergies(request.getParameter("drugAllergies"));

        Patient patient = new Patient();
        Report report = new Report();
       // System.out.println("in add");
        httpSession.getAttribute("imagepath");
//        System.out.println("image path=" + httpSession.getAttribute("imagepath"));
//        System.out.println("Report name:-" + request.getParameter("reptname"));
//        System.out.println("repostDate:-" + request.getParameter("reptdate"));
//        System.out.println("hhh:-" + request.getParameter("file1"));

        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        for (FileItem item : items) {
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                Random randomGenerator = new Random();
                int randomInt = randomGenerator.nextInt(1000000);
                long longRandom = randomInt;

                if (fieldName.equalsIgnoreCase("name")) {
                    patient.setName(DataUtil.emptyString(item.getString()));
                    patient.setRegno(Long.valueOf(longRandom));
                    System.out.println("name is:-" + item.getString());
                }
//                if (fieldName.equalsIgnoreCase("longRandom"))
//                {
//                    patient.setRegno(DataUtil.parseLong(item.getString()));
//                    System.out.println("Regno is:-"+DataUtil.parseLong(item.getString()));
//                }
                if (fieldName.equalsIgnoreCase("cardNo")) {
                    patient.setCardno(DataUtil.parseLong(item.getString()));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                }
                
                if (fieldName.equalsIgnoreCase("bloodGroup")) {
                    patient.setBloodgroup(DataUtil.emptyString(item.getString()));
                  //  System.out.println("bloodGroup is:-" + item.getString());
                }

                if (fieldName.equalsIgnoreCase("sex")) {
                    patient.setSex(DataUtil.emptyString(item.getString()));
                  //  System.out.println("sex is:-" + item.getString());
                }

                if (fieldName.equalsIgnoreCase("married")) {
                    patient.setMarried(DataUtil.emptyString(item.getString()));
                  //  System.out.println("married is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("age")) {
                    patient.setAge(DataUtil.parseShort(item.getString()));
                  //  System.out.println("Age is:-" + DataUtil.parseLong(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("nationality")) {
                    patient.setNationality(DataUtil.emptyString(item.getString()));
                   // System.out.println("nationality is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("contactNO")) {
                    patient.setTelephoneno(DataUtil.parseLong(item.getString()));
                   // System.out.println("contactNO is:-" + DataUtil.parseLong(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("address")) {
                    patient.setAddress(DataUtil.emptyString(item.getString()));
                   // System.out.println("address is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("referencedBy")) {
                    patient.setRefferedby(DataUtil.emptyString(item.getString()));
                   // System.out.println("referencedBy is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("chiefComplaints")) {
                    patient.setChiefcomplaints(DataUtil.emptyString(item.getString()));
                   // System.out.println("chiefComplaints is:-" + item.getString());
                }
                 if (fieldName.equalsIgnoreCase("adharcardno")) {
                    patient.setAdharcardno(DataUtil.parseLong(item.getString()));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("surname")) {
                    patient.setSurname(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("sdwof")) {
                    patient.setSdwof(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("contactperson")) {
                    patient.setContactperson(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("village")) {
                    patient.setVillage(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("tehsil")) {
                    patient.setTehsil(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("dist")) {
                    patient.setDist(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("pincode")) {
                    patient.setPincode(DataUtil.parseLong(item.getString()));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("mobilno")) {
                    patient.setMobilno(DataUtil.parseLong(item.getString()));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                }
               //  if (fieldName.equalsIgnoreCase("creationDate")) {
                //    patient.setRegdate(DataUtil.simpleDateParser(item.getString()));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
               // }
              //   patient.setRegdate(DateUtil.simpleDateParser(request.getParameter("creationDate")));
                 if (fieldName.equalsIgnoreCase("sdw")) {
                    patient.setSdw(DataUtil.emptyString(item.getString()));
                }
               if (fieldName.equalsIgnoreCase("creationDate")) {
                  patient.setRegdate(DateUtil.simpleDateParser(item.getString()));
                   System.out.println("reptdate is:-" + item.getString());
               }
                 if (fieldName.equalsIgnoreCase("advance")) {
                    patient.setAdvancecharges(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("advance"))));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                 }
                 if (fieldName.equalsIgnoreCase("due")) {
                    patient.setDuecharges(BigDecimal.valueOf(DataUtil.parseDouble(request.getParameter("due"))));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                }













                if (fieldName.equalsIgnoreCase("historyOfPresentIllness")) {
                    patient.setHistoryofpresentillness(DataUtil.emptyString(item.getString()));
                   // System.out.println("historyOfPresentIllness is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("pastHistory")) {
                    patient.setPasthistory(DataUtil.emptyString(item.getString()));
                   // System.out.println("pastHistory is:-" + item.getString());
                }

                if (fieldName.equalsIgnoreCase("familyHistory")) {
                    patient.setFamilyhistory(DataUtil.emptyString(item.getString()));
                   // System.out.println("familyHistory is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("personalHistory")) {
                    patient.setPersonalhistory(DataUtil.emptyString(item.getString()));
                   // System.out.println("personalHistory is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("drugAllergies")) {
                    patient.setDrugallergies(DataUtil.emptyString(item.getString()));
                   // System.out.println("drugAllergies is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("reptname")) {
                    //report.setPatient(patient);
                    report.setReportname(DataUtil.emptyString(item.getString()));
                    //System.out.println("reptname is:-" + item.getString());
                }

                if (fieldName.equalsIgnoreCase("reptdate")) {
                    report.setReportdate(DateUtil.simpleDateParser(item.getString()));
                   // System.out.println("reptdate is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("reportremarks")) {
                    report.setRemarks(DataUtil.emptyString(item.getString()));
                    //System.out.println("reportremarks :-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("reportobservation")) {
                    report.setObservation(DataUtil.emptyString(item.getString()));
                   // System.out.println("reportobservation :-" + item.getString());
                }
            } else {
                String fieldName = item.getFieldName();
                if (fieldName.equalsIgnoreCase("reportfile")) {
                    //System.out.println("for photo uploadingggg");

                    String fileName = (DataUtil.emptyString(item.getName()));
                   // System.out.println("file name:" + fileName);
                    if (!fileName.equalsIgnoreCase("")) {

                        String ipath = httpSession.getAttribute("imagepath").toString();
                        String remain = "reportdocuments";
                        String completepath = ipath + remain;
//                        System.out.println("ipath:-" + ipath);
//                        System.out.println("p:-" + remain);
//                        System.out.println("sum:-" + completepath);

                        //File path = new File("D:/8-7-2014/Plexus 1.6/build/web/reportdocuments");
                        File path = new File(completepath);

                        //File path = new File("C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/salesForce/stationaryPhoto");
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }

                        File uploadedFile = new File(path + "/" + fileName);
                        //System.out.println(uploadedFile.getAbsolutePath());
                        report.setEpmty("reportdocuments/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {
                        report.setEpmty(fileName);
                    }
                }
            }
        }



        patient = new PatientDAO().create(patient);

        patient.setId(patient.getId());

        for (FileItem item : items) {
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                if (fieldName.equalsIgnoreCase("reptname")) {
                    if (item.getString().isEmpty()) {
                       // System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");

                    } else {
                        //System.out.println("reptname is checkinhhhhhh:-" + item.getString());
                        report.setPatient(patient);
                        report = new ReportDao().create(report);
                    }


                }

            }
        }

        if (patient.getId() == 0l) {
            return false;
        } else {
            httpSession.setAttribute("patient", patient);
            return true;
        }
    }

    /**
     *
     * @return
     */
    public long updatePatient() {
        Patient patient = new Patient();

        String id = "", regno = "";
        id = request.getParameter("id");
        regno = request.getParameter("regno");
        //System.out.println(id + regno);
        long patientId = 0, patientRegno = 0;
        patientId = Long.parseLong(id);
        patientRegno = Long.parseLong(regno);
        //System.out.println(patientId + " " + patientRegno);
        patient.setId(patientId);
        patient.setName(request.getParameter("name"));
        patient.setRegno(patientRegno);
        patient.setCardno(DataUtil.parseLong(request.getParameter("cardNo")));
        patient.setAdharcardno(DataUtil.parseLong(request.getParameter("adharcardno")));
        patient.setBloodgroup(request.getParameter("bloodGroup"));
        patient.setSex(request.getParameter("sex"));
        patient.setMarried(request.getParameter("married"));
        patient.setAge(DataUtil.parseShort(request.getParameter("age")));
        patient.setNationality(request.getParameter("nationality"));
        patient.setTelephoneno(DataUtil.parseLong(request.getParameter("contactNO")));
        patient.setAddress(request.getParameter("address"));
        patient.setRefferedby(request.getParameter("referencedBy"));
        patient.setChiefcomplaints(request.getParameter("chiefComplaints"));
        
        patient.setSurname(request.getParameter("surname"));
        patient.setSdwof(request.getParameter("sdwof"));
        patient.setContactperson(request.getParameter("contactperson"));
        patient.setVillage(request.getParameter("village"));
        patient.setTehsil(request.getParameter("tehsil"));
        patient.setDist(request.getParameter("dist"));
        patient.setPincode(DataUtil.parseLong(request.getParameter("pincode")));
        patient.setMobilno(DataUtil.parseLong(request.getParameter("mobilno")));
        patient.setRegdate(DateUtil.simpleDateParser(request.getParameter("creationDate")));
        patient.setSdw(request.getParameter("sdw"));



        patient.setAdvancecharges(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("advancecharges"))));
        patient.setDuecharges(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("duecharges"))));
        patient.setHistoryofpresentillness(request.getParameter("historyOfPresentIllness"));
        patient.setPasthistory(request.getParameter("pastHistory"));
        patient.setFamilyhistory(request.getParameter("familyHistory"));
        patient.setPersonalhistory(request.getParameter("personalHistory"));
        patient.setDrugallergies(request.getParameter("drugAllergies"));

        patient.setAdvancecharges(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("advancecharges"))));
        patient.setDuecharges(BigDecimal.valueOf(DataUtil.parseLong(request.getParameter("duecharges"))));

        patient = new PatientDAO().update(patient);
        return patient.getId();

    }

    /**
     *
     * @return
     */
    //record per page nd out of
    public boolean viewAllPatient() {
       // System.out.println("ffffff:-");
       // System.out.println("action for everythinh is:-" + request.getParameter("action"));
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
        //System.out.println("ppppppppppppppppp:-" + pageNo);
        alphabit = request.getParameter("alphabit");
        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

       // System.out.println("kusum confusion first record:-" + noOfRecordsPerPage);
       // System.out.println("kusum confusion second record:-" + noOfRecordsPerPageSelect);
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

       // System.out.println("kusum confusion third record:-" + noOfRecordsPerPage);

        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
           // System.out.println("from condition jump to page:");
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
            //System.out.println("from view all page");
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
               // System.out.println("do nothing no changes");
            } else {
                //System.out.println("do changes no of  changes are over write pageno to 0 and noOfRecordsPerPage");
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }



//        System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//        System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//        System.out.println("no of records per page:-" + noOfRecordsPerPage);
//        System.out.println("alpabhit :-" + alphabit);
//        System.out.println("no of records per page selectttt:-" + noOfRecordsPerPageSelect);
//        System.out.println("action for service is:-" + actionValue);
//        System.out.println("page no is:-" + pageNo);



//            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
//                lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;
        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
           // System.out.println("means avalue is null:");
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
           // System.out.println("temppppppppp:-" + temp);
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
                //System.out.println("ddddddddddddddddddddddddd");
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
        } else {
            //System.out.println("means avalue is not null");
            alphabit = request.getParameter("avalue");
        }




//         System.out.println("in service alphabets is:-"+alphabit);
//
//
//            System.out.println("firstShowingRecord record:-"+firstShowingRecord);
//            System.out.println("lastShowingRecord is:-"+lastShowingRecord);
//            System.out.println("no of records per page:-"+noOfRecordsPerPage);



        try {
            List<Patient> list = new PatientDAO().readListOfObjectsPage(pageNo, noOfRecordsPerPage, alphabit);
            


           // System.out.println("step 7 for paging:-");

            int totalnoofrecord = new PatientDAO().countRecord(alphabit);
           // System.out.println("Total no of Record in service file:-" + totalnoofrecord);

            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           // System.out.println("Total no pages will be:-" + noOfPages);

            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

//            System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//            System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//            System.out.println("Total no of records will be:-" + totalnoofrecord);
//            System.out.println("Total no pages will be:-" + noOfPages);

            httpSession.setAttribute("patientList", list);
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
        return result;
    }

//end
    /**
     *
     * @return
     */
    public boolean fetchAllPatient() {
       // System.out.println("ttttttt");
        boolean result = false;
        try {
            List<Patient> list = new PatientDAO().readListOfObjects();
          //  System.out.println("date" + request.getParameter("date"));
            String date = "";
            String[] dateAttributes = new String[0];
            String day = String.valueOf(Calendar.getInstance().get(Calendar.DAY_OF_MONTH));
            String month = String.valueOf(Calendar.getInstance().get(Calendar.MONTH) + 1);
            String year = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
            if (day.length() == 1) {
                day = "0" + day;

            }
            if (month.length() == 1) {
                month = "0" + month;

            }
            if (year.length() == 1) {
                year = "0" + year;

            }
            if (request.getParameter("date") == null) {
            } else {
                date = request.getParameter("date");
                dateAttributes = date.split("/");
                day = dateAttributes[1];
                month = dateAttributes[0];
                year = dateAttributes[2];
            }

           // System.out.println("dateAttributes" + day + " " + " " + month + " " + year);
            httpSession.setAttribute("dateFromSession", request.getParameter("date"));
            httpSession.setAttribute("day", day);
            httpSession.setAttribute("month", month);
            httpSession.setAttribute("year", year);
            httpSession.setAttribute("patientList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    /**
     *
     */
    public void listAllPatient() {
        try {
           // System.out.println("here kk2:-");
            List<Patient> list = new PatientDAO().readListOfObjects();
            httpSession.setAttribute("patientList", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     *
     * @return
     */
    public boolean viewDetailsOfPatient() {
       // System.out.println("view details service:-");
        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
            Patient patient = new PatientDAO().readUniqueObject(id);
            List<Theraphy> list = new TherapybillDao().readListOfObjects();

            //Visit activeVisit= new VisitDAO().readObject(patient, false);
            if (patient == null) {
                result = false;
            } else {
                httpSession.setAttribute("patient", patient);
                httpSession.setAttribute("TherapyList", list);
                //httpSession.setAttribute("activeVisit", activeVisit);
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    /**
     *
     */
    public void deleteMultiple() {
        String[] patientIds = request.getParameterValues("patientIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : patientIds) {
           // System.out.println("id" + id);
            ids.add(Long.valueOf(id));

        }
       // System.out.println("id length" + patientIds.length);
        new PatientDAO().deleteMultiple(ids);
    }

    /**   public boolean viewByAlphabit() {

    String temp = request.getParameter("avalue");
    System.out.println("ffffff:-viewByAlphabit");
    System.out.println("value is:-" + request.getParameter("avalue"));
    String alpha = request.getParameter("avalue");
    boolean result = false;

    if (temp.equalsIgnoreCase("A")) {
    System.out.println("A");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }

    } else if (temp.equalsIgnoreCase("B")) {
    System.out.println("B");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("C")) {
    System.out.println("C");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("D")) {
    System.out.println("D");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("E")) {
    System.out.println("E");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("F")) {
    System.out.println("F");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("G")) {
    System.out.println("G");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("H")) {
    System.out.println("H");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("I")) {
    System.out.println("I");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("J")) {
    System.out.println("J");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("K")) {
    System.out.println("K");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("L")) {
    System.out.println("L");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("M")) {
    System.out.println("M");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("N")) {
    System.out.println("N");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("O")) {
    System.out.println("O");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("P")) {
    System.out.println("P");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("Q")) {
    System.out.println("Q");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("R")) {
    System.out.println("R");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("S")) {
    System.out.println("S");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("T")) {
    System.out.println("T");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("U")) {
    System.out.println("U");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("V")) {
    System.out.println("V");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("W")) {
    System.out.println("W");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("X")) {
    System.out.println("X");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("Y")) {
    System.out.println("Y");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("Z")) {
    System.out.println("Z");
    String alphabitlower = alpha.toLowerCase();
    String alphabitupper = alpha.toUpperCase();
    System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
    System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);

    try {
    List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    } else if (temp.equalsIgnoreCase("ALL")) {
    System.out.println("ALL");
    try {
    List<Patient> list = new PatientDAO().readListOfObjects();
    httpSession.setAttribute("patientList", list);

    result = true;
    } catch (Exception e) {
    e.printStackTrace();
    result = false;
    }
    }

     **/
//        String alphabitlower = alpha.toLowerCase();
//        String alphabitupper = alpha.toUpperCase();
//        System.out.println("ffffff:-viewByAlphabit lower:-" + alphabitlower);
//        System.out.println("ffffff:-viewByAlphabit upper:-" + alphabitupper);
//        //boolean result = false;
//        try {
//            List<Patient> list = new PatientDAO().viewByAlphabit(alphabitlower, alphabitupper);
//            httpSession.setAttribute("patientList", list);
//
//            result = true;
//        } catch (Exception e) {
//            e.printStackTrace();
//            result = false;
//        }
    // return result;
    //}
    public long addPatientAndView() throws FileUploadException, Exception {

        Patient patient = new Patient();
        Report report = new Report();
//        System.out.println("in add and view");
//
//        System.out.println("Report name:-" + request.getParameter("reptname"));
//        System.out.println("repostDate:-" + request.getParameter("reptdate"));
//        System.out.println("hhh:-" + request.getParameter("file1"));

        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        for (FileItem item : items) {
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                Random randomGenerator = new Random();
                int randomInt = randomGenerator.nextInt(1000000);
                long longRandom = randomInt;

                if (fieldName.equalsIgnoreCase("name")) {
                    patient.setName(DataUtil.emptyString(item.getString()));
                    patient.setRegno(Long.valueOf(longRandom));
                   // System.out.println("name is:-" + item.getString());
                }
//                if (fieldName.equalsIgnoreCase("longRandom"))
//                {
//                    patient.setRegno(DataUtil.parseLong(item.getString()));
//                    System.out.println("Regno is:-"+DataUtil.parseLong(item.getString()));
//                }
                if (fieldName.equalsIgnoreCase("cardNo")) {
                    patient.setCardno(DataUtil.parseLong(item.getString()));
                   // System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("bloodGroup")) {
                    patient.setBloodgroup(DataUtil.emptyString(item.getString()));
                   // System.out.println("bloodGroup is:-" + item.getString());
                }

                if (fieldName.equalsIgnoreCase("sex")) {
                    patient.setSex(DataUtil.emptyString(item.getString()));
                    //System.out.println("sex is:-" + item.getString());
                }

                if (fieldName.equalsIgnoreCase("married")) {
                    patient.setMarried(DataUtil.emptyString(item.getString()));
                   // System.out.println("married is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("age")) {
                    patient.setAge(DataUtil.parseShort(item.getString()));
                   // System.out.println("Age is:-" + DataUtil.parseLong(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("nationality")) {
                    patient.setNationality(DataUtil.emptyString(item.getString()));
                   // System.out.println("nationality is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("contactNO")) {
                    patient.setTelephoneno(DataUtil.parseLong(item.getString()));
                   // System.out.println("contactNO is:-" + DataUtil.parseLong(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("address")) {
                    patient.setAddress(DataUtil.emptyString(item.getString()));
                   // System.out.println("address is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("referencedBy")) {
                    patient.setRefferedby(DataUtil.emptyString(item.getString()));
                    //System.out.println("referencedBy is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("chiefComplaints")) {
                    patient.setChiefcomplaints(DataUtil.emptyString(item.getString()));
                    //System.out.println("chiefComplaints is:-" + item.getString());
                }

                if (fieldName.equalsIgnoreCase("adharcardno")) {
                    patient.setAdharcardno(DataUtil.parseLong(item.getString()));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("surname")) {
                    patient.setSurname(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("sdwof")) {
                    patient.setSdwof(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("contactperson")) {
                    patient.setContactperson(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("village")) {
                    patient.setVillage(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("tehsil")) {
                    patient.setTehsil(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("dist")) {
                    patient.setDist(DataUtil.emptyString(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("pincode")) {
                    patient.setPincode(DataUtil.parseLong(item.getString()));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                }
                if (fieldName.equalsIgnoreCase("mobilno")) {
                    patient.setMobilno(DataUtil.parseLong(item.getString()));
                  //  System.out.println("Cardno is:-" + DataUtil.parseLong(item.getString()));
                }
                 patient.setRegdate(DateUtil.simpleDateParser(request.getParameter("creationDate")));
                 if (fieldName.equalsIgnoreCase("sdw")) {
                    patient.setSdw(DataUtil.emptyString(item.getString()));
                }



                if (fieldName.equalsIgnoreCase("historyOfPresentIllness")) {
                    patient.setHistoryofpresentillness(DataUtil.emptyString(item.getString()));
                    //System.out.println("historyOfPresentIllness is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("pastHistory")) {
                    patient.setPasthistory(DataUtil.emptyString(item.getString()));
                   // System.out.println("pastHistory is:-" + item.getString());
                }

                if (fieldName.equalsIgnoreCase("familyHistory")) {
                    patient.setFamilyhistory(DataUtil.emptyString(item.getString()));
                   // System.out.println("familyHistory is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("personalHistory")) {
                    patient.setPersonalhistory(DataUtil.emptyString(item.getString()));
                    //System.out.println("personalHistory is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("drugAllergies")) {
                    patient.setDrugallergies(DataUtil.emptyString(item.getString()));
                   // System.out.println("drugAllergies is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("reptname")) {
                    //report.setPatient(patient);
                    report.setReportname(DataUtil.emptyString(item.getString()));
                    //System.out.println("reptname is:-" + item.getString());
                }

                if (fieldName.equalsIgnoreCase("reptdate")) {
                    report.setReportdate(DateUtil.simpleDateParser(item.getString()));
                    //System.out.println("reptdate is:-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("reportremarks")) {
                    report.setRemarks(DataUtil.emptyString(item.getString()));
                    //System.out.println("reportremarks :-" + item.getString());
                }
                if (fieldName.equalsIgnoreCase("reportobservation")) {
                    report.setObservation(DataUtil.emptyString(item.getString()));
                    //System.out.println("reportobservation :-" + item.getString());
                }
            } else {
                String fieldName = item.getFieldName();
                if (fieldName.equalsIgnoreCase("reportfile")) {
                    //System.out.println("for photo uploadingggg");

                    String fileName = (DataUtil.emptyString(item.getName()));
                    //System.out.println("file name:" + fileName);
                    if (!fileName.equalsIgnoreCase("")) {

                        String ipath = httpSession.getAttribute("imagepath").toString();
                        String remain = "reportdocuments";
                        String completepath = ipath + remain;
//                        System.out.println("ipath:-" + ipath);
//                        System.out.println("p:-" + remain);
//                        System.out.println("sum:-" + completepath);

                        //File path = new File("D:/8-7-2014/Plexus 1.6/build/web/reportdocuments");
                        File path = new File(completepath);

                        //File path = new File("D:/8-7-2014/Plexus 1.6/build/web/reportdocuments");

                        //File path = new File("C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/salesForce/stationaryPhoto");
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }

                        File uploadedFile = new File(path + "/" + fileName);
                       // System.out.println(uploadedFile.getAbsolutePath());
                        report.setEpmty("reportdocuments/" + fileName);
                        String filePath1 = (uploadedFile.getAbsolutePath());
                        filePath = filePath1;
                        item.write(uploadedFile);

                    } else {
                        report.setEpmty(fileName);
                    }
                }
            }
        }



        patient = new PatientDAO().create(patient);

        patient.setId(patient.getId());

        for (FileItem item : items) {
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                if (fieldName.equalsIgnoreCase("reptname")) {
                    if (item.getString().isEmpty()) {
                       // System.out.println("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");

                    } else {
                       // System.out.println("reptname is checkinhhhhhh:-" + item.getString());
                        report.setPatient(patient);
                        report = new ReportDao().create(report);
                    }


                }

            }
        }

        if (patient.getId() == 0l) {
            return 0;
        } else {
            httpSession.setAttribute("patient", patient);
            return patient.getId();
        }

    }

    public long updateNewRequirement() throws FileUploadException, Exception {
//        System.out.println("check 2:");
//        System.out.println("Doctor kkkkkk name is:-" + request.getParameter("doctname"));
        Visit visit = new Visit();
        Bill bill = new Bill();
        Therapybill therapybill = new Therapybill();
        Patient patient = new Patient();
        Theraphy therapy = new Theraphy();
        Detailstherapybill detailstherapybill = new Detailstherapybill();
        String[] personalIdss = null;
        List<Long> ids = new ArrayList<Long>();
        List<String> therapyids = new ArrayList<String>();
        List<String> therapynames = new ArrayList<String>();
        List<String> therapyAmount = new ArrayList<String>();
        BigDecimal totalval = BigDecimal.ZERO;
        long patientid = 0;
        long visitid = 0;
        String doctorname = "";
        String deptname = "";
        String remark = "";
        String diagnosiss = "";
        String investigation = "";
        String treatment = "";
        String finalDiagnosiss = "";
        long pulses = 0;
        String bps = "";
        long Respiratoryrate = 0;
        long ratings = 0;
        BigDecimal consultationCharge = BigDecimal.ZERO;
        BigDecimal consultationChargetotal = BigDecimal.ZERO;






        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        for (FileItem item : items) {
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                Random randomGenerator = new Random();
                int randomInt = randomGenerator.nextInt(1000000);
                long longRandom = randomInt;

                if (fieldName.equalsIgnoreCase("visitid")) {

                   // System.out.println("Visit id is:-" + item.getString());
                    //visit.setId(DataUtil.parseLong(item.getString()));
                    visitid = DataUtil.parseLong(item.getString());
                }

                if (fieldName.equalsIgnoreCase("paientid")) {

                    //System.out.println("paientid id is:-" + DataUtil.parseLong(item.getString()));
                    patientid = DataUtil.parseLong(item.getString());
                }
                if (fieldName.equalsIgnoreCase("doctname")) {
                   // System.out.println("Doctor name is:-" + item.getString());
                    //visit.setDoctorname(item.getString());
                    doctorname = item.getString();
                }
                if (fieldName.equalsIgnoreCase("dept")) {

                    //System.out.println("Department  is:-" + item.getString());
                    //visit.setDepartmenttype(item.getString());
                    deptname = item.getString();
                }
                if (fieldName.equalsIgnoreCase("remarks")) {

                    //System.out.println("Remarks is:-" + item.getString());
                    //visit.setRemarks(item.getString());
                    remark = item.getString();
                }
                if (fieldName.equalsIgnoreCase("diagnosis")) {

                   // System.out.println("diagnosis  is:-" + item.getString());
                    //visit.setDiagnosis(item.getString());
                    diagnosiss = item.getString();
                }
                if (fieldName.equalsIgnoreCase("investigations")) {

                   // System.out.println("investigations is:-" + item.getString());
                    //visit.setInvestigation(item.getString());
                    investigation = item.getString();
                }
                if (fieldName.equalsIgnoreCase("treatment")) {

                   // System.out.println("treatment is:-" + item.getString());
                    //visit.setTreatment(item.getString());
                    treatment = item.getString();
                }
                if (fieldName.equalsIgnoreCase("finalDiagnosis")) {

                   // System.out.println("finalDiagnosis is:-" + item.getString());
                    //visit.setFinaldiagnosis(item.getString());
                    finalDiagnosiss = item.getString();
                }
                if (fieldName.equalsIgnoreCase("pulse")) {

                   // System.out.println("pulse is:-" + item.getString());
                    //visit.setPulse(DataUtil.parseLong(item.getString()));
                    pulses = DataUtil.parseLong(item.getString());
                }
                if (fieldName.equalsIgnoreCase("bp")) {

                  //  System.out.println("bp is:-" + item.getString());
                    //visit.setBp(item.getString());
                    bps = item.getString();
                }
                if (fieldName.equalsIgnoreCase("rr")) {

                  //  System.out.println("Respiratory Rate is:-" + item.getString());
                    //visit.setRr(DataUtil.parseLong(item.getString()));
                    Respiratoryrate = DataUtil.parseLong(item.getString());
                }
                if (fieldName.equalsIgnoreCase("rating")) {

                   // System.out.println("rating is:-" + item.getString());
                    //visit.setPatientrating(DataUtil.parseLong(item.getString()));
                    ratings = DataUtil.parseLong(item.getString());
                }
                if (fieldName.equalsIgnoreCase("consultationCharges")) {

                   // System.out.println("consultationCharges is:-" + item.getString());
//                    bill.setVisit(visit);
//                    bill.setConsultationcharges(BigDecimal.valueOf(DataUtil.parseDouble(item.getString())));
//                    bill.setCreateddate(DateUtil.todaysDate());
                    consultationCharge = BigDecimal.valueOf(DataUtil.parseDouble(item.getString()));

                }

//                if (fieldName.equalsIgnoreCase("personalIDs"))
//                {
//                    if(item.getString().length()!=0)
//                    {
//                        System.out.println("selection is not null:-");
//                        System.out.println("selection length is:-"+item.getString().length());
//                        for(int i=0;i<item.getString().length();i++)
//                    {
//                        System.out.println("Therapy inside therapybill saving id is:-"+DataUtil.parseLong(item.getString()));
//                        Theraphy therapydetail = new TheraphyDao().viewDetailsTherapyType(Long.valueOf(item.getString()));
//                        totalval=totalval.add(therapydetail.getTheraphycharge());
//
//
//                    }
//                        System.out.println("total selection charge is:-"+totalval);
////                        therapybill.setTherapybilldate(DateUtil.todaysDate());
////                        therapybill.setTherapybillcharges(totalval);
////                        therapybill.setTherapybillremark("");
////                        patient.setId(patientid);
////                        therapybill.setPatient(patient);
////                        therapybill=new TherapybillDao().addTherapyBill(therapybill);
//
//                    }
//                    else
//                    {
//                        System.out.println("selection is null:-");
//                    }
//
//
//
//
//                    System.out.println("Therapy id is:-"+DataUtil.parseLong(item.getString()));
//                }

                if (fieldName.equalsIgnoreCase("personalIDs")) {

//                    for(int i=0;i<item.getString().length();i++)
//                    {
//                        System.out.println("Therapy inside therapybill saving id is:-"+DataUtil.parseLong(item.getString()));
//                        Theraphy therapydetail = new TheraphyDao().viewDetailsTherapyType(Long.valueOf(item.getString()));
//                        totalval=totalval.add(therapydetail.getTheraphycharge());
//
//                        detailstherapybill.setDetailstherapybilldate(DateUtil.todaysDate());
//
//                        therapy.setTherphyid(Long.valueOf(Long.valueOf(item.getString())));
//                        detailstherapybill.setTheraphy(therapy);
//                        detailstherapybill.setDetailstherapybillcharge(therapydetail.getTheraphycharge());
//                        therapybill.setTherapybillid(therapybill.getTherapybillid());
//                        detailstherapybill.setTherapybill(therapybill);
//
//
//                        detailstherapybill=new DetailstherapybillDao().create(detailstherapybill);
//
//
//                    }
                    ids.add(Long.valueOf(item.getString()));


                }
                if (fieldName.equalsIgnoreCase("therapyIDS")) {

                  //  System.out.println("Therapy id are:-" + item.getString());
                    therapyids.add(item.getString());

                }
                if (fieldName.equalsIgnoreCase("therapyNames")) {
                  //  System.out.println("Therapy name are:-" + item.getString());
                    therapynames.add(item.getString());

                }
                if (fieldName.equalsIgnoreCase("therapychargeindis")) {
                  //  System.out.println("Therapy Charge are:-" + item.getString());
                    therapyAmount.add(item.getString());

                }


            }

        }

//         bill = new BillDAO().create(bill);
//
//         visit = new VisitDAO().update(visit);
//        System.out.println("visitid is:-" + visitid);
//        System.out.println("patientid is:-" + patientid);
//        System.out.println("doctorname is:-" + doctorname);
//        System.out.println("deptname is:-" + deptname);
//        System.out.println("remark is:-" + remark);
//        System.out.println("diagnosiss is:-" + diagnosiss);
//        System.out.println("investigation is:-" + investigation);
//        System.out.println("treatment is:-" + treatment);
//        System.out.println("finalDiagnosiss is:-" + finalDiagnosiss);
//        System.out.println("pulses is:-" + pulses);
//        System.out.println("bps is:-" + bps);
//        System.out.println("Respiratoryrate is:-" + Respiratoryrate);
//        System.out.println("ratings is:-" + ratings);
//        System.out.println("consultationCharge is:-" + consultationCharge);
//        System.out.println("totalval charge is:-" + totalval);
//        System.out.println("total charge are:-" + consultationCharge.add(totalval));
//        System.out.println("array length is:-" + ids.size());
        for (int j = 0; j < ids.size(); j++) {
          //  System.out.println("selected ids are:-" + ids.get(j));
        }
        for (int j = 0; j < therapyids.size(); j++) {
           // System.out.println("selected ids for kamal mk :-" + therapyids.get(j));
        }
        for (int j = 0; j < therapynames.size(); j++) {
           // System.out.println("selected therapynames are:-" + therapynames.get(j));
        }
        for (int j = 0; j < therapyAmount.size(); j++) {
           // System.out.println("selected therapynsmes are:-" + therapyAmount.get(j));
        }

        visit.setId(visitid);
        visit.setDoctorname(doctorname);
        visit.setDepartmenttype(deptname);
        visit.setRemarks(remark);
        visit.setDiagnosis(diagnosiss);
        visit.setInvestigation(investigation);
        visit.setTreatment(treatment);
        visit.setFinaldiagnosis(finalDiagnosiss);
        visit.setPulse(pulses);
        visit.setBp(bps);
        visit.setRr(Respiratoryrate);
        visit.setPatientrating(ratings);
        visit.setStatus(false);
        visit = new VisitDAO().update(visit);


        visit.setId(visitid);
        bill.setVisit(visit);
        bill.setConsultationcharges(consultationCharge);
        bill.setCreateddate(DateUtil.todaysDate());
        for (int j = 0; j < therapyAmount.size(); j++) {
           // System.out.println("selected therapyAmount are:-" + therapyAmount.get(j));
            totalval = totalval.add(BigDecimal.valueOf(DataUtil.parseDouble(therapyAmount.get(j))));
        }
        consultationChargetotal = totalval.add(consultationCharge);
//        System.out.println("total value before adding consultataion charge is:-" + totalval);
//        System.out.println("total kamal after adding consultation charge is:-" + consultationChargetotal);
        bill.setTotalbill(consultationChargetotal);

        bill = new BillDAO().create(bill);

        if (therapyids.size() == 0) {
           // System.out.println("do nothing:-");
        } else {
          //  System.out.println("do to create therapy bill");
            therapybill.setTherapybilldate(DateUtil.todaysDate());
            therapybill.setTherapybillcharges(totalval);
            therapybill.setTherapybillremark("");
            patient.setId(patientid);
            therapybill.setPatient(patient);
            bill.setId(bill.getId());
            therapybill.setBill(bill);
            therapybill = new TherapybillDao().addTherapyBill(therapybill);

          //  System.out.println("therapy bill id newly created is:-" + therapybill.getTherapybillid());


            for (int j = 0; j < therapyids.size(); j++) {
              //  System.out.println("selected ids are:-" + therapyids.get(j));
                detailstherapybill.setDetailstherapybilldate(DateUtil.todaysDate());

                therapy.setTherphyid(Long.valueOf(therapyids.get(j)));
                detailstherapybill.setTheraphy(therapy);
                detailstherapybill.setDetailstherapybillcharge(BigDecimal.valueOf(DataUtil.parseDouble(therapyAmount.get(j))));
                therapybill.setTherapybillid(therapybill.getTherapybillid());
                detailstherapybill.setTherapybill(therapybill);


                detailstherapybill = new DetailstherapybillDao().create(detailstherapybill);

            }



        }

        return patientid;

    }
//for jump to page

    public boolean viewByPage() {
      //  System.out.println("step 2 for paging:-");


        boolean result = false;

//        System.out.println("kkkkkkkkkkkkkkkkkk");
//        System.out.println("contactControllerPassingValue:-" + request.getParameter("contactControllerPassingValue"));
//        System.out.println("contactControllerValue:-" + request.getParameter("contactControllerValue"));
//
//        System.out.println("alphabit:-" + request.getParameter("alphabit"));


        String controllerType = "viewAll";
        String controllerTypeValue = request.getParameter("contactControllerValue");
        String alphabit = "null";
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;

        pageNo = Integer.parseInt(request.getParameter("pageno"));
        noOfRecordsPerPage = Integer.parseInt(request.getParameter("noOFRecordsInput"));

        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage;



//        System.out.println("action :-" + controllerType);
//        System.out.println("action value:-" + controllerTypeValue);
//        System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//        System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//        System.out.println("no of records per page:-" + noOfRecordsPerPage);
//        System.out.println("alpabhit :-" + alphabit);
        try {
            List<Patient> list = new PatientDAO().readListOfObjectsPage(pageNo, noOfRecordsPerPage, alphabit);


          //  System.out.println("step 7 for paging:-");

            int totalnoofrecord = new PatientDAO().countRecord(alphabit);
          //  System.out.println("Total no of Record in service file is:-" + totalnoofrecord);

            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           // System.out.println("Total no pages will be:-" + noOfPages);

            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

//            System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//            System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//            System.out.println("Total no of records is:-" + totalnoofrecord);
//            System.out.println("Total no pages will be:-" + noOfPages);

            httpSession.setAttribute("patientList", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", controllerType);
            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);

           // System.out.println("step 8 for paging:-");

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchPatientByCardNo() {

        boolean result = false;

      //  System.out.println("action for everything1 is:-" + request.getParameter("action"));




        String alphabit = null;
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;
        long cardNo = 0;
        int noOfRecordsPerPageSelect = 0;
        String actionValue = null;
        String controllervalue = null;
        String jumpPageValue = null;
        actionValue = request.getParameter("action");
       // System.out.println("kukum 1:-" + DataUtil.emptyString(request.getParameter("actionValue")));
        controllervalue = DataUtil.emptyString1(request.getParameter("actionValue"));
       // System.out.println("controller value issssssssss:-"+controllervalue);

        if (controllervalue != null) {
         //   System.out.println("from view all page:-");
            cardNo = Long.parseLong(request.getParameter("actionValue"));
            controllervalue = request.getParameter("actionValue");
        } else {
          //  System.out.println("from searech page:-");
            cardNo = Long.parseLong(request.getParameter("patientcardNoSearch"));
            controllervalue = request.getParameter("patientcardNoSearch");
        }
//            controllervalue=(request.getParameter("actionValue"));
        pageNo = Integer.parseInt(request.getParameter("pageno"));
        // noOfRecordsPerPage=Integer.parseInt(request.getParameter("noOfRecords"));

        alphabit = request.getParameter("alphabit");
        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

//        System.out.println("kusum confusion first record:-" + noOfRecordsPerPage);
//        System.out.println("kusum confusion second record:-" + noOfRecordsPerPageSelect);




//        System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//        System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//        System.out.println("no of records per page:-" + noOfRecordsPerPage);
//        System.out.println("alpabhit :-" + alphabit);
//        System.out.println("cardNo :-" + cardNo);
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

      //  System.out.println("kusum confusion third record:-" + noOfRecordsPerPage);

        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
          //  System.out.println("from condition jump to page:");
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
          //  System.out.println("from view all page");
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
               // System.out.println("do nothing no changes");
            } else {
              //  System.out.println("do changes no of  changes are over write pageno to 0 and noOfRecordsPerPage");
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }



//        System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//        System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//        System.out.println("no of records per page:-" + noOfRecordsPerPage);
//        System.out.println("alpabhit :-" + alphabit);
//        System.out.println("no of records per page selectttt:-" + noOfRecordsPerPageSelect);
//        System.out.println("action for service is:-" + actionValue);
//        System.out.println("page no is:-" + pageNo);
//        System.out.println("card no is:-" + cardNo);



//            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
//                lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;
        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
           // System.out.println("means avalue is null:");
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
          //  System.out.println("temppppppppp:-" + temp);
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
              //  System.out.println("ddddddddddddddddddddddddd");
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
        } else {
          //  System.out.println("means avalue is not null");
            alphabit = request.getParameter("avalue");
        }


        try {
            List<Patient> list = new PatientDAO().searchPatientByCardNo(cardNo, pageNo, noOfRecordsPerPage, alphabit);


          //  System.out.println("step 7 for paging:-");

            int totalnoofrecord = new PatientDAO().countRecordSearchPatientCardNo(cardNo, alphabit);
           // System.out.println("Total no of Record in service file is:-" + totalnoofrecord);

            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            //System.out.println("Total no pages will be:-" + noOfPages);

            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

//            System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//            System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//            System.out.println("Total no of records is:-" + totalnoofrecord);
//            System.out.println("Total no pages will be:-" + noOfPages);





            httpSession.setAttribute("patientList", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);
            request.setAttribute("controllerValue", controllervalue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);


           // System.out.println("step 8 for paging:-");

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

    public boolean searchByName() {

        boolean result = false;

       // System.out.println("in service ................................");




        String alphabit = null;
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;

        String patientName = null;
        int noOfRecordsPerPageSelect = 0;
        String actionValue = null;
        String jumpPageValue = null;
        String controllervalue = null;
        actionValue = request.getParameter("action");
        pageNo = Integer.parseInt(request.getParameter("pageno"));
        //noOfRecordsPerPage=Integer.parseInt(request.getParameter("noOfRecords"));
        patientName = (request.getParameter("primaryName"));
        alphabit = request.getParameter("alphabit");
        controllervalue = DataUtil.emptyString1(request.getParameter("actionValue"));

      //  System.out.println("kukum 1:-" + DataUtil.emptyString(request.getParameter("actionValue")));
        if (controllervalue != null) {
          //  System.out.println("from view all page:-");
            patientName = request.getParameter("actionValue");
            controllervalue = request.getParameter("actionValue");
        } else {
           // System.out.println("from searech page:-");
            patientName = request.getParameter("primaryName");
            controllervalue = request.getParameter("primaryName");
        }
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));
        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));




//        System.out.println("kusum confusion second record:-" + noOfRecordsPerPageSelect);
//        System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//        System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//        System.out.println("no of records per page:-" + noOfRecordsPerPage);
//        System.out.println("alpabhit :-" + alphabit);
//        System.out.println("patientName :-" + patientName);
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

       // System.out.println("kusum confusion third record:-" + noOfRecordsPerPage);

        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
          //  System.out.println("from condition jump to page:");
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
          //  System.out.println("from view all page");
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
              //  System.out.println("do nothing no changes");
            } else {
              //  System.out.println("do changes no of  changes are over write pageno to 0 and noOfRecordsPerPage");
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }



//        System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//        System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//        System.out.println("no of records per page:-" + noOfRecordsPerPage);
//        System.out.println("alpabhit :-" + alphabit);
//        System.out.println("no of records per page selectttt:-" + noOfRecordsPerPageSelect);
//        System.out.println("action for service is:-" + actionValue);
//        System.out.println("page no is:-" + pageNo);



//            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
//                lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;
        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
           // System.out.println("means avalue is null:");
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
           // System.out.println("temppppppppp:-" + temp);
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
             //   System.out.println("ddddddddddddddddddddddddd");
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
        } else {
          //  System.out.println("means avalue is not null");
            alphabit = request.getParameter("avalue");
        }

        try {
            List<Patient> list = new PatientDAO().searchByName(patientName, pageNo, noOfRecordsPerPage, alphabit);


          // System.out.println("step 7 for paging:-");

            int totalnoofrecord = new PatientDAO().countRecordSearchByPatientName(patientName, alphabit);
           // System.out.println("Total no of Record in service file is:-" + totalnoofrecord);

            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           // System.out.println("Total no pages will be:-" + noOfPages);

            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

//            System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//            System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//            System.out.println("Total no of records is:-" + totalnoofrecord);
//            System.out.println("Total no pages will be:-" + noOfPages);





            httpSession.setAttribute("patientList", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);

            request.setAttribute("controllerValue", controllervalue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);


           // System.out.println("step 8 for paging:-");

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

    public boolean searchByMobileNo() {

        boolean result = false;

      //  System.out.println("in service ................................");




        String alphabit = null;
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;
        long mobileNo = 0;
        int noOfRecordsPerPageSelect = 0;
        String actionValue = null;
        String jumpPageValue = null;
        String controllervalue = null;
        actionValue = request.getParameter("action");
        pageNo = Integer.parseInt(request.getParameter("pageno"));
        //  noOfRecordsPerPage=Integer.parseInt(request.getParameter("noOfRecords"));
        //mobileNo=Long.parseLong(request.getParameter("patientmobileNoSearch"));
        alphabit = request.getParameter("alphabit");
       // System.out.println("kukum 1:-" + DataUtil.emptyString(request.getParameter("actionValue")));
        controllervalue = DataUtil.emptyString1(request.getParameter("actionValue"));




        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

//        System.out.println("kusum confusion first record:-" + noOfRecordsPerPage);
//        System.out.println("kusum confusion second record:-" + noOfRecordsPerPageSelect);
//
//        // System.out.println("firstShowingRecord record:-"+firstShowingRecord);
//        //System.out.println("lastShowingRecord is:-"+lastShowingRecord);
//        //System.out.println("no of records per page:-"+noOfRecordsPerPage);
//        System.out.println("alphabit :-" + alphabit);
//        System.out.println("mobileNo :-" + mobileNo);
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;
        if (controllervalue != null) {
          //  System.out.println("from view all page:-");
            mobileNo = Long.parseLong(request.getParameter("actionValue"));
            controllervalue = request.getParameter("actionValue");
        } else {
          //  System.out.println("from searech page:-");
            mobileNo = Long.parseLong(request.getParameter("patientmobileNoSearch"));
            controllervalue = request.getParameter("patientmobileNoSearch");
        }
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

      //  System.out.println("kusum confusion third record:-" + noOfRecordsPerPage);

        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
          //  System.out.println("from condition jump to page:");
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
          //  System.out.println("from view all page");
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
             //   System.out.println("do nothing no changes");
            } else {
              //  System.out.println("do changes no of  changes are over write pageno to 0 and noOfRecordsPerPage");
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }



//        System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//        System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//        System.out.println("no of records per page:-" + noOfRecordsPerPage);
//        System.out.println("alpabhit :-" + alphabit);
//        System.out.println("no of records per page selectttt:-" + noOfRecordsPerPageSelect);
//        System.out.println("action for service is:-" + actionValue);
//        System.out.println("page no is:-" + pageNo);



//            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
//                lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;
        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
           // System.out.println("means avalue is null:");
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
           // System.out.println("temppppppppp:-" + temp);
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
              //  System.out.println("ddddddddddddddddddddddddd");
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
        } else {
           // System.out.println("means avalue is not null");
            alphabit = request.getParameter("avalue");
        }

        try {
            List<Patient> list = new PatientDAO().searchByMobileNo(mobileNo, pageNo, noOfRecordsPerPage, alphabit);


           // System.out.println("step 7 for paging:-");

            int totalnoofrecord = new PatientDAO().countRecordSearchPatientMobileNo(mobileNo, alphabit);
           // System.out.println("Total no of Record in service file is:-" + totalnoofrecord);

            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
          //  System.out.println("Total no pages will be:-" + noOfPages);

            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

//            System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//            System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//            System.out.println("Total no of records is:-" + totalnoofrecord);
//            System.out.println("Total no pages will be:-" + noOfPages);





            httpSession.setAttribute("patientList", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);

            request.setAttribute("controllerValue", controllervalue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);


          //  System.out.println("step 8 for paging:-");

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

    public boolean searchPatientByText() {
      //  System.out.println("searchPatientByText process");
        boolean result = false;

      //  System.out.println("in service ................................");




        String alphabit = null;
        String tempAlphabet = null;
        int pageNo = 0;
        int firstShowingRecord = 0;
        int lastShowingRecord = 0;
        int noOfRecordsPerPage = 0;
        String text = null;

        int noOfRecordsPerPageSelect = 0;
        String actionValue = null;
        String jumpPageValue = null;
        String controllervalue = null;
        pageNo = Integer.parseInt(request.getParameter("pageno"));
        // noOfRecordsPerPage=Integer.parseInt(request.getParameter("noOfRecords"));
        text = (request.getParameter("byText"));
        alphabit = request.getParameter("alphabit");
       // System.out.println("kukum 1:-" + DataUtil.emptyString(request.getParameter("actionValue")));
        controllervalue = DataUtil.emptyString1(request.getParameter("actionValue"));



        actionValue = request.getParameter("action");
        if (controllervalue != null) {
          //  System.out.println("from view all page:-");
            text = request.getParameter("actionValue");
            controllervalue = request.getParameter("actionValue");
        } else {
           // System.out.println("from searech page:-");
            text = request.getParameter("byText");
            controllervalue = request.getParameter("byText");
        }
        noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
        noOfRecordsPerPageSelect = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

//        System.out.println("kusum confusion first record:-" + noOfRecordsPerPage);
//        System.out.println("kusum confusion second record:-" + noOfRecordsPerPageSelect);
//
//        System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//        System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//
//        System.out.println("alphabit :-" + alphabit);
//        System.out.println("text :-" + text);
//        System.out.println("page no is:-" + pageNo);
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;
        if (noOfRecordsPerPage == 0) {
            noOfRecordsPerPage = DataUtil.emptyIntValueFromString(request.getParameter("noOfRecords"));
        }

      //  System.out.println("kusum confusion third record:-" + noOfRecordsPerPage);

        jumpPageValue = request.getParameter("value");
        if (jumpPageValue != null) {
         //   System.out.println("from condition jump to page:");
            pageNo = Integer.parseInt(request.getParameter("pageno1"));
        }
        firstShowingRecord = noOfRecordsPerPage * (pageNo - 1) + 1;
        lastShowingRecord = firstShowingRecord + noOfRecordsPerPage - 1;

        if (DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput")) == 0) {
          //  System.out.println("from view all page");
        } else {
            if (noOfRecordsPerPage == noOfRecordsPerPageSelect) {
              //  System.out.println("do nothing no changes");
            } else {
             //   System.out.println("do changes no of  changes are over write pageno to 0 and noOfRecordsPerPage");
                pageNo = 1;
                noOfRecordsPerPage = noOfRecordsPerPageSelect;
                firstShowingRecord = 1;
                lastShowingRecord = noOfRecordsPerPage;
            }
        }





//        System.out.println("no of records per page:-" + noOfRecordsPerPage);
//
//        System.out.println("no of records per page selectttt:-" + noOfRecordsPerPageSelect);
//        System.out.println("action for service is:-" + actionValue);
//        System.out.println("page no is:-" + pageNo);




//            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
//                lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;
        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
        if (tempAlphabet.equalsIgnoreCase("null")) {
          //  System.out.println("means avalue is null:");
            String temp = null;
            temp = request.getParameter("alphabitFromPage");
          //  System.out.println("temppppppppp:-" + temp);
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
            //    System.out.println("ddddddddddddddddddddddddd");
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
        } else {
           // System.out.println("means avalue is not null");
            alphabit = request.getParameter("avalue");
          //  System.out.println("means avalue is not nulllllllllllllll:-"+alphabit);
        }


        try {
            List<Patient> list = new PatientDAO().searchPatientByText(text, pageNo, noOfRecordsPerPage, alphabit);


           // System.out.println("step 7 for paging:-");

            int totalnoofrecord = new PatientDAO().countRecordsearchPatientByText(text, alphabit);
           // System.out.println("Total no of Record in service file is:-" + totalnoofrecord);

            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
          //  System.out.println("Total no pages will be:-" + noOfPages);

            if (totalnoofrecord < lastShowingRecord) {
                lastShowingRecord = totalnoofrecord;
            }

//            System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//            System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//            System.out.println("Total no of records is:-" + totalnoofrecord);
//            System.out.println("Total no pages will be:-" + noOfPages);





            httpSession.setAttribute("patientList", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalRecord", totalnoofrecord);
            request.setAttribute("action", actionValue);
            request.setAttribute("controllerValue", controllervalue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);
            request.setAttribute("noOfRecordPerPage", noOfRecordsPerPage);


           // System.out.println("step 8 for paging:-");

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

    public boolean viewAllPatientNoLimit() {
//        System.out.println("ffffff:-");
//        System.out.println("action for everythinh is:-" + request.getParameter("action"));
        boolean result = false;

        String alphabit = null;
        String tempAlphabet = null;

        int firstShowingRecord = 0;
        int lastShowingRecord = 0;

        String actionValue = null;

        actionValue = request.getParameter("action");

        alphabit = request.getParameter("alphabit");
//        System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//        System.out.println("lastShowingRecord is:-" + lastShowingRecord);
//        System.out.println("alpabhit :-" + alphabit);
//        System.out.println("action for service is:-" + actionValue);

        tempAlphabet = DataUtil.emptyStringAvalue(request.getParameter("avalue"));
      //  System.out.println("gggggggggggggggggggggggggggggggggggg kkkkkkkkkkkkkkkkkkkkkk:-"+tempAlphabet);
        if (tempAlphabet.equalsIgnoreCase("All")) {
          //  System.out.println("means avalue is null:");
            String temp = null;
           // temp = request.getParameter("alphabitFromPage");
           // System.out.println("temppppppppp:-" + temp);
            if (alphabit.equalsIgnoreCase("null")) {
                //alphabit=alphabit;
            //    System.out.println("ddddddddddddddddddddddddd");
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
        } else {
           // System.out.println("means avalue is not null");
            alphabit = request.getParameter("avalue");
        }

        try {
            List<Patient> list = new PatientDAO().viewAllPatientNoLimit(alphabit);



          //  System.out.println("step 7 for paging:-");





            firstShowingRecord = 1;
            lastShowingRecord = list.size();

//            System.out.println("firstShowingRecord record:-" + firstShowingRecord);
//            System.out.println("lastShowingRecord is:-" + lastShowingRecord);

            httpSession.setAttribute("patientList", list);

            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);


           // System.out.println("step 8 for paging:-");

            // List<Patient> list = new PatientDAO().readListOfObjects();
            //httpSession.setAttribute("patientList", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public void viewPatientForPopupAlphabit() {
       // System.out.println("ankit 1:");
        String alphabit=request.getParameter("alphabit");
       // System.out.println("avalue issssssssssss:-"+alphabit);
        try {
          //  System.out.println("here kk2:-");
            List<Patient> list = new PatientDAO().viewPatientForPopupAlphabit(alphabit);
            httpSession.setAttribute("patientList", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//end
}
