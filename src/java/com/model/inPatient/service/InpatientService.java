/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.inPatient.service;

import com.model.inPatient.dao.InpatientDAO;
import com.model.inPatient.dto.Inpatient;
import com.model.inVisit.dao.InvisitDAO;
import com.model.inVisit.dto.Invisit;
import com.model.inreport.dao.InReportDao;
import com.model.inreport.dto.Inreport;
import com.model.patient.dao.PatientDAO;
import com.model.patient.dto.Patient;
import com.model.report.dto.Report;
import com.util.DataUtil;
import com.util.DateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class InpatientService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public InpatientService(HttpServletRequest request, HttpServletResponse response) {

        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();

    }

   


    public boolean addPatient() {

        Inpatient patient = new Inpatient();
        Invisit visit=new Invisit();
      
        Random randomGenerator = new Random();
        int randomInt = randomGenerator.nextInt(1000000);
        long longRandom = randomInt;
      //  String dischargedate=null;
        patient.setName(request.getParameter("name"));
        patient.setRegno(Long.valueOf(longRandom));
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
        patient.setHistoryofpresentillness(request.getParameter("historyOfPresentIllness"));
        patient.setPasthistory(request.getParameter("pastHistory"));
        patient.setFamilyhistory(request.getParameter("familyHistory"));
        patient.setPersonalhistory(request.getParameter("personalHistory"));
        patient.setDrugallergies(request.getParameter("drugAllergies"));
        patient.setAdmitdate(DateUtil.simpleDateParser(request.getParameter("admitDate")));

        patient.setSurname(request.getParameter("surname"));
        patient.setSdwof(request.getParameter("sdwof"));
        patient.setContactperson(request.getParameter("contactperson"));
        patient.setVillage(request.getParameter("village"));
        patient.setTehsil(request.getParameter("tehsil"));
        patient.setDist(request.getParameter("dist"));
        patient.setPincode(DataUtil.parseLong(request.getParameter("pincode")));
        patient.setMobilno(DataUtil.parseLong(request.getParameter("mobilno")));
        patient.setSdw(request.getParameter("sdw"));


     //  patient.setDischargedate(dischargedate);
        visit.setInpatient(patient);
        patient = new InpatientDAO().create(patient);

        if(patient==null)
        {
            return false;
        }
 visit= new InvisitDAO().create(visit);

 //for inserting report to database of inpatient from patient
   long patientid = Long.parseLong(request.getParameter("id"));
  
   Patient patientreport = new PatientDAO().readUniqueObject(patientid);
   
  
   Report report=new Report();
   Iterator<Report> reportIterator = patientreport.getReports().iterator();
       // System.out.println("iterator size is:-");
        int j=1;
        Inreport inreport=new Inreport();
         while (reportIterator.hasNext())
         {

             report=reportIterator.next();
            
       j++;

             inreport.setInreportname(report.getReportname());
             inreport.setInreportdate(report.getReportdate());
             inreport.setInremarks(report.getRemarks());
             inreport.setInobservation(report.getObservation());
             inreport.setReportimage(report.getEpmty());
             patient.setId(patient.getId());
             inreport.setInpatient(patient);
             inreport=new InReportDao().create(inreport);
             
         }
//   for(int i=1;i<=patientreport.getReports().size();i++)
//   {
//       System.out.println("Report:"+i+"Report Details:-");
//       System.out.println("Report Name:-"+patientreport.getReports().iterator());
//       System.out.println("Report Date:-");
//       System.out.println("Report Remarks:-");
//       System.out.println("Report Observation:-");
//       System.out.println("Report Location:-");
//   }


        if ((patient.getId() == 0l) || (visit.getId() == 0l)) {
            return false;
        }
      
      


        else {
            httpSession.setAttribute("Inpatient", patient);
             httpSession.setAttribute("visitId", visit);
            return true;
        }


 
     

    }

    public boolean viewAllPatient() {
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



           



//            firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
//                lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;
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
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
                }
                else
                {
                 
                alphabit=request.getParameter("avalue");
                }




//         System.out.println("in service alphabets is:-"+alphabit);
//
//
//            System.out.println("firstShowingRecord record:-"+firstShowingRecord);
//            System.out.println("lastShowingRecord is:-"+lastShowingRecord);
//            System.out.println("no of records per page:-"+noOfRecordsPerPage);



        try {
            List<Inpatient> list = new InpatientDAO().readListOfObjects(pageNo,noOfRecordsPerPage,alphabit);



          

            int totalnoofrecord = new InpatientDAO().countRecord(alphabit);
          
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           
            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
            }

           
             httpSession.setAttribute("inpatientList", list);
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
        return result;
    }
      

    public void deleteMultiple() {
        String[] patientIds = request.getParameterValues("patientIDs");
        List<Long> ids = new ArrayList<Long>();
        for (String id : patientIds) {
           
            ids.add(Long.valueOf(id));

        }
       
        new InpatientDAO().deleteMultiple(ids);

    }

    public boolean viewDetailsOfPatient() {

        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
           
            Inpatient patient = new InpatientDAO().readUniqueObject(id);
            //Visit activeVisit= new VisitDAO().readObject(patient, false);
            if (patient == null) {
                result = false;
            } else {
                httpSession.setAttribute("inpatient", patient);
                //httpSession.setAttribute("activeVisit", activeVisit);
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;

    }

    public boolean updatePatient() {
         boolean result = false;
          Inpatient patient = new Inpatient();

        String id="",regno="";
        id=request.getParameter("id");
      //  regno=request.getParameter("regno");
        //System.out.println(id);
        long patientId=0;
        Date dischargedatee;
        patientId=Long.parseLong(id);

        dischargedatee=(DateUtil.simpleDateParser(request.getParameter("dischargeDate")));
       // patientRegno=Long.parseLong(regno);
      
     //  patient.setId(patientId);
//patient.setDischargedate(dischargedatee);
       
       
        patient = new InpatientDAO().update( patientId, dischargedatee);
       // return patient.getId();
        return result;

    }

    public Long updateInpatient() {


         Inpatient patient = new Inpatient();

        String id="",regno="";
        id=request.getParameter("id");
        regno=request.getParameter("regno");
      
        long patientId=0,patientRegno=0;
        patientId=Long.parseLong(id);
        patientRegno=Long.parseLong(regno);
        
        patient.setId(patientId);
        patient.setName(request.getParameter("name"));
        patient.setRegno(patientRegno);
        patient.setCardno(DataUtil.parseLong(request.getParameter("cardNo")));
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
        patient.setSdw(request.getParameter("sdw"));

        patient.setHistoryofpresentillness(request.getParameter("historyOfPresentIllness"));
        patient.setPasthistory(request.getParameter("pastHistory"));
        patient.setFamilyhistory(request.getParameter("familyHistory"));
        patient.setPersonalhistory(request.getParameter("personalHistory"));
        patient.setDrugallergies(request.getParameter("drugAllergies"));
        patient.setAdmitdate(DateUtil.simpleDateParser(request.getParameter("admitDate")));
         patient.setDischargedate(DateUtil.simpleDateParser(request.getParameter("dischargeDate")));
        patient.setConcludinghistory(request.getParameter("concludingsammary"));
        patient.setFollowup(request.getParameter("followup"));
        patient = new InpatientDAO().updateInPatient(patient);
        return patient.getId();

    }

    public void viewAllPharmacyInPatient() {
          boolean result = false;
        try {
            List<Inpatient> list = new InpatientDAO().viewAllInpatientList();
            httpSession.setAttribute("inpatientList",list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

    }


    public boolean searchPatientByCardNo() {

        boolean result = false;

        
            String alphabit=null;
              String tempAlphabet=null;
            int pageNo=0;
            int firstShowingRecord=0;
            int lastShowingRecord=0;
            int noOfRecordsPerPage=0;
             long cardNo=0;
             int noOfRecordsPerPageSelect=0;
            String actionValue=null;
            String controllervalue=null;
            String jumpPageValue=null;
            actionValue=request.getParameter("action");
         
            controllervalue=DataUtil.emptyString1(request.getParameter("actionValue"));

           if(controllervalue!=null)
           {
            
                cardNo=Long.parseLong(request.getParameter("actionValue"));
                controllervalue=request.getParameter("actionValue");
           }
           else
           {
               
                 cardNo=Long.parseLong(request.getParameter("patientcardNoSearch"));
                 controllervalue=request.getParameter("patientcardNoSearch");
           }
//            controllervalue=(request.getParameter("actionValue"));
            pageNo=Integer.parseInt(request.getParameter("pageno"));
            // noOfRecordsPerPage=Integer.parseInt(request.getParameter("noOfRecords"));

            alphabit=request.getParameter("alphabit");
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
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
                }
                else
                {
                  
                alphabit=request.getParameter("avalue");
                }


        try {
            List<Inpatient> list = new InpatientDAO().searchPatientByCardNo(cardNo,pageNo, noOfRecordsPerPage,alphabit);


            

            int totalnoofrecord = new InpatientDAO().countRecordSearchPatientCardNo(cardNo,alphabit);
           
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            
            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
            }

         

            httpSession.setAttribute("inpatientList", list);
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
     public boolean searchByName() {

         boolean result = false;

            String alphabit=null;
            String tempAlphabet=null;
            int pageNo=0;
            int firstShowingRecord=0;
            int lastShowingRecord=0;
            int noOfRecordsPerPage=0;

             String patientName=null;
             int noOfRecordsPerPageSelect=0;
            String actionValue=null;
            String jumpPageValue=null;
            String controllervalue=null;
            actionValue=request.getParameter("action");
            pageNo=Integer.parseInt(request.getParameter("pageno"));
             //noOfRecordsPerPage=Integer.parseInt(request.getParameter("noOfRecords"));
              patientName=(request.getParameter("primaryName"));
             alphabit=request.getParameter("alphabit");
              controllervalue=DataUtil.emptyString1(request.getParameter("actionValue"));

            
              if(controllervalue!=null)
           {
              
                patientName=request.getParameter("actionValue");
                controllervalue=request.getParameter("actionValue");
           }
           else
           {
               
                 patientName=request.getParameter("primaryName");
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
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
                }
                else
                {
                  
                alphabit=request.getParameter("avalue");
                }

        try {
            List<Inpatient> list = new InpatientDAO().searchByName(patientName,pageNo, noOfRecordsPerPage,alphabit);



            int totalnoofrecord = new InpatientDAO().countRecordSearchByPatientName(patientName,alphabit);
           
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            

            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
            }


            httpSession.setAttribute("inpatientList", list);
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
     public boolean searchByMobileNo() {

        boolean result = false;

            String alphabit=null;
            String tempAlphabet=null;
            int pageNo=0;
            int firstShowingRecord=0;
            int lastShowingRecord=0;
            int noOfRecordsPerPage=0;
            long mobileNo=0;
            int noOfRecordsPerPageSelect=0;
            String actionValue=null;
            String jumpPageValue=null;
            String controllervalue=null;
            actionValue=request.getParameter("action");
            pageNo=Integer.parseInt(request.getParameter("pageno"));
           //  noOfRecordsPerPage=Integer.parseInt(request.getParameter("noOfRecords"));
             //mobileNo=Long.parseLong(request.getParameter("patientmobileNoSearch"));
              alphabit=request.getParameter("alphabit");
             
           controllervalue=DataUtil.emptyString1(request.getParameter("actionValue"));




             noOfRecordsPerPage=DataUtil.emptyIntValueFromString(request.getParameter("noOFRecordsInput"));
            noOfRecordsPerPageSelect=DataUtil.emptyIntValueFromString(request.getParameter("noOfRecordsFromPage"));

           firstShowingRecord=noOfRecordsPerPage*(pageNo-1)+1;
                lastShowingRecord=firstShowingRecord+noOfRecordsPerPage-1;
                if(controllervalue!=null)
           {
              
                mobileNo=Long.parseLong(request.getParameter("actionValue"));
                controllervalue=request.getParameter("actionValue");
           }
           else
           {
                
                 mobileNo=Long.parseLong(request.getParameter("patientmobileNoSearch"));
                 controllervalue=request.getParameter("patientmobileNoSearch");
           }
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
            List<Inpatient> list = new InpatientDAO().searchByMobileNo(mobileNo,pageNo,noOfRecordsPerPage,alphabit);

            int totalnoofrecord = new InpatientDAO().countRecordSearchPatientMobileNo(mobileNo,alphabit);
           
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           
            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
            }

            httpSession.setAttribute("inpatientList", list);
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
     public boolean searchPatientByText() {
      
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
                        
                    }

                    if(temp!=null)
                    {
                         alphabit=request.getParameter("alphabitFromPage");
                    }
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
                }
                else
                {
                  
                alphabit=request.getParameter("avalue");
                }


        try {
            List<Inpatient> list = new InpatientDAO().searchPatientByText(text,pageNo,noOfRecordsPerPage,alphabit);

            int totalnoofrecord = new InpatientDAO().countRecordsearchPatientByText(text,alphabit);
         
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
           
            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
            }


            httpSession.setAttribute("inpatientList", list);
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


     public boolean viewAllDischargePatient() {
       
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
                        
                    }

                    if(temp!=null)
                    {
                         alphabit=request.getParameter("alphabitFromPage");
                    }
//                    else
//                    {
//                        System.out.println("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
//                    alphabit=request.getParameter("alphabitFromPage");
//
//                    }
                }
                else
                {
                   
                alphabit=request.getParameter("avalue");
                }






        try {
            List<Inpatient> list = new InpatientDAO().viewAllDischargePatient(pageNo,noOfRecordsPerPage,alphabit);


            int totalnoofrecord = new InpatientDAO().countRecordDischarge(alphabit);
            
            int noOfPages = (int) Math.ceil(totalnoofrecord * 1.0 / noOfRecordsPerPage);
            if(totalnoofrecord<lastShowingRecord)
            {
                lastShowingRecord=totalnoofrecord;
            }

             httpSession.setAttribute("inpatientDischargeList", list);
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
        return result;
    }

      public boolean viewAllInPatientNoLimit() {
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
          
            if (alphabit.equalsIgnoreCase("null")) {
               
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }
              
        } else {
           
            alphabit = request.getParameter("avalue");
           
        }

        try {
            List<Inpatient> list = new InpatientDAO().viewAllInPatientNoLimit(alphabit);

            firstShowingRecord = 1;
            lastShowingRecord = list.size();

            httpSession.setAttribute("inpatientList", list);

            request.setAttribute("action", actionValue);
//            request.setAttribute("actionValue", controllerTypeValue);
            request.setAttribute("alphabit", alphabit);
            request.setAttribute("firstShowingRecord", firstShowingRecord);
            request.setAttribute("lastShowingRecord", lastShowingRecord);


          

            // List<Patient> list = new PatientDAO().readListOfObjects();
            //httpSession.setAttribute("patientList", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }


      public boolean viewAllDischargeInPatientNoLimit() {
        
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
          
            if (alphabit.equalsIgnoreCase("null")) {
              
            }

            if (temp != null) {
                alphabit = request.getParameter("alphabitFromPage");
            }

        } else {
           
            alphabit = request.getParameter("avalue");
        }

        try {
            List<Inpatient> list = new InpatientDAO().viewAllDischargeInPatientNoLimit(alphabit);



            firstShowingRecord = 1;
            lastShowingRecord = list.size();

            httpSession.setAttribute("inpatientList", list);

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

    
}
