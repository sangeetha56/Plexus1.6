/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inPatient.dao;

import com.model.inPatient.dto.Inpatient;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Administrator
 */
public class InpatientDAO {
     Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;

     public InpatientDAO() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }


    public Inpatient create(Inpatient patient) {

         try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(patient);

            transaction.commit();
         
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
            return patient=null;
        } finally {
            //session.close();
            return patient;
        }
    }

    public List<Inpatient> readListOfObjects(int pageNo, int noOfRecordsPerPage, String alphabit) {
       
          List<Inpatient> results = new ArrayList<Inpatient>();
       try {
            
            if(alphabit.equalsIgnoreCase("null"))
            {
                
                transaction = session.beginTransaction();
           
            Query query = session.createQuery("From Inpatient where dischargedate is null order by name asc");
            query.setFirstResult(noOfRecordsPerPage*(pageNo-1));
            query.setMaxResults(noOfRecordsPerPage);
            
            results = (List<Inpatient>) query.list();
            
            }

            else
            {
                  
                  String alphabitlower = alphabit.toLowerCase();
                  String alphabitupper = alphabit.toUpperCase();
            transaction = session.beginTransaction();
            
            Query query = session.createQuery("From Inpatient where  dischargedate is null and   name like '"+alphabitlower+"%' or name like '"+alphabitupper+"%'");
            query.setFirstResult(noOfRecordsPerPage*(pageNo-1));
            query.setMaxResults(noOfRecordsPerPage);
            
            results = (List<Inpatient>) query.list();
           
            }
           


            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }
     public int countRecord(String alphabit) {
        int totalnoofrecord=0;
        try {
            if(alphabit.equalsIgnoreCase("null"))
            {
                transaction=session.beginTransaction();
            String query1 = (String)session.createQuery("SELECT count(*) FROM Inpatient where dischargedate is null ").uniqueResult().toString();
            totalnoofrecord=Integer.parseInt(query1);
           
            transaction.commit();
            }
            else
            {
                 String alphabitlower = alphabit.toLowerCase();
                  String alphabitupper = alphabit.toUpperCase();
            transaction=session.beginTransaction();
            String query1 = (String)session.createQuery("SELECT count(*) FROM Inpatient where  dischargedate is null and  name like '"+alphabitlower+"%' or name like '"+alphabitupper+"%'").uniqueResult().toString();
            totalnoofrecord=Integer.parseInt(query1);
            
            transaction.commit();
            }
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }

        finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public void deleteMultiple(List<Long> ids) {

          try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Inpatient where id IN (:ids)");
            query.setParameterList("ids",ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }

    public Inpatient readUniqueObject(long id) {
         Inpatient patient = new Inpatient();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Inpatient as patient where patient.id=" + id);
            patient = (Inpatient) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return patient;
    }

    public Inpatient update(Inpatient patient) {

          Inpatient patientt = new Inpatient();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("delete from Inpatient inpatient where inpatient.id=:patient.getId()");
              query.setParameter("id",patient.getId());
            query.setParameter("dischargedate",patient.getDischargedate());
            int res = query.executeUpdate();
            patientt = (Inpatient) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return patientt;

    }

    public Inpatient update(long patientId, Date dischargedatee) {

          Inpatient patientt = new Inpatient();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            String hqlUpdate = "update Inpatient inpatient set inpatient.dischargedate = :dischargedatee where inpatient.id = :patientId";
// or String hqlUpdate = "update Customer set name = :newName where name = :oldName";
int updatedEntities = session.createQuery( hqlUpdate )
        .setDate( "dischargedatee", dischargedatee)
        .setLong( "patientId", patientId )
        .executeUpdate();

//
//            Query query = session.createQuery("delete from Inpatient inpatient where inpatient.id="+patientId);
//         query.setParameter("patientId",patientId);
//
//          query.setParameter("dischargedatee",dischargedatee);
//          query.executeUpdate();
         //   patientt = (Inpatient) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return patientt;

    }

    public Inpatient updateInPatient(Inpatient patient) {
          try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(patient);
            transaction.commit();
            
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return patient;
        }
    }


    public List<Inpatient> searchPatientByCardNo(long cardNo, int pageNo, int noOfRecordsPerPage, String alphabit) {
       

        List<Inpatient> results = new ArrayList<Inpatient>();




        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            if (alphabit.equalsIgnoreCase("null")) {
                

                transaction = session.beginTransaction();
               
                Query query = session.createQuery("from Inpatient patientsearch  where patientsearch.cardno=:cardNo and  dischargedate is null");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("cardNo", cardNo);
                
                results = (List<Inpatient>) query.list();

            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("from Inpatient patientsearch  where patientsearch.cardno=:cardNo and (patientsearch.name like :alphabitupper or patientsearch.name like :alphabitlower ) and  dischargedate is null");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("cardNo", cardNo);
                query.setParameter("alphabitlower",alphabitlower+"%");
                query.setParameter("alphabitupper",alphabitupper+"%");
                
                results = (List<Inpatient>) query.list();

            }


           

            transaction.commit();
        } catch (HibernateException hibernateException) {
          
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public int countRecordSearchPatientCardNo(long searchValueType, String alphabit) {
        int totalnoofrecord = 0;
        List<Inpatient> results = new ArrayList<Inpatient>();

        try {
            transaction = session.beginTransaction();
            if (alphabit.equalsIgnoreCase("null")) {
               
                Query query = session.createQuery("from Inpatient patientsearch  where patientsearch.cardno=:searchValueType and  dischargedate is null");

                query.setParameter("searchValueType", searchValueType);
                results = (List<Inpatient>) query.list();
                totalnoofrecord = results.size();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
               
                Query query = session.createQuery("from Inpatient patientsearch  where patientsearch.cardno=:searchValueType and (patientsearch.name like :alphabitupper or patientsearch.name like :alphabitlower ) and  dischargedate is null");
                query.setParameter("searchValueType", searchValueType);
                query.setParameter("alphabitlower",alphabitlower+"%");
                query.setParameter("alphabitupper",alphabitupper+"%");
               
                results = (List<Inpatient>) query.list();
                totalnoofrecord = results.size();
            }
            

            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public List<Inpatient> searchByName(String searchValueType, int pageNo, int noOfRecordsPerPage, String alphabit) {
       

        List<Inpatient> results = new ArrayList<Inpatient>();


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                
                Query query = session.createQuery("from Inpatient where  dischargedate is null and (name like :searchValueTypelower or name like :searchValueTypeupper)");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                

                results = (List<Inpatient>) query.list();
                

            } else {
                transaction = session.beginTransaction();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
              
                Query query = session.createQuery("from Inpatient where  dischargedate is null and ((name like :searchValueTypelower or name like :searchValueTypeupper) and (name like :alphabitlower or name like :alphabitupper))");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitlower", alphabitlower+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
               

                results = (List<Inpatient>) query.list();
                

            }

           
            transaction.commit();
        } catch (HibernateException hibernateException) {
          
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public int countRecordSearchByPatientName(String searchValueType, String alphabit) {
        int totalnoofrecord = 0;
         List<Inpatient> results = new ArrayList<Inpatient>();

        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();

                Query query = session.createQuery("from Inpatient where  dischargedate is null and (name like :searchValueTypelower or name like :searchValueTypeupper)");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
               
                results = (List<Inpatient>) query.list();
                totalnoofrecord = results.size();
                
                transaction.commit();

            } else {
                transaction = session.beginTransaction();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                Query query = session.createQuery("from Inpatient where  dischargedate is null and ((name like :searchValueTypelower or name like :searchValueTypeupper) and (name like :alphabitlower or name like :alphabitupper))");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitlower", alphabitlower+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                results = (List<Inpatient>) query.list();
                totalnoofrecord = results.size();
               
                transaction.commit();

            }

        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public int countRecordSearchPatientMobileNo(long searchValueType, String alphabit) {
        int totalnoofrecord = 0;
        List<Inpatient> results = new ArrayList<Inpatient>();

        try {
            transaction = session.beginTransaction();
            if (alphabit.equalsIgnoreCase("null")) {
              
                Query query = session.createQuery("from Inpatient patientsearch  where patientsearch.telephoneno=:searchValueType and dischargedate is null"); //  Query query = session.createQuery("from Patient patientsearch  where CAST(patientsearch.telephoneno AS TEXT) LIKE '"+mobileNo+"%'");
                query.setParameter("searchValueType", searchValueType);
                
                results = (List<Inpatient>) query.list();
                totalnoofrecord =results.size();
            } else {

                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                
                Query query = session.createQuery("from Inpatient patientsearch  where patientsearch.telephoneno = :searchValueType  and  (patientsearch.name like :alphabitupper or patientsearch.name like :alphabitlower ) and dischargedate is null");// Query query = session.createQuery("from Patient patientsearch  where CAST(patientsearch.telephoneno AS TEXT) LIKE '"+mobileNo+"' and patientsearch.name like '"+alphabit+"%'");
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("searchValueType", searchValueType);
                query.setParameter("alphabitlower", alphabitlower+"%");
               
                results = (List<Inpatient>) query.list();
                totalnoofrecord = results.size();
            }
           
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public List<Inpatient> searchByMobileNo(long mobileNo, int pageNo, int noOfRecordsPerPage, String alphabit) {
        

        List<Inpatient> results = new ArrayList<Inpatient>();




        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            if (alphabit.equalsIgnoreCase("null")) {
              
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("from Inpatient patientsearch  where patientsearch.telephoneno=:mobileNo and dischargedate is null"); //  Query query = session.createQuery("from Patient patientsearch  where CAST(patientsearch.telephoneno AS TEXT) LIKE '"+mobileNo+"%'");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("mobileNo", mobileNo);
                
                results = (List<Inpatient>) query.list();

            } else {
               
                transaction = session.beginTransaction();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                
                Query query = session.createQuery("from Inpatient patientsearch  where patientsearch.telephoneno = :mobileNo  and  (patientsearch.name like :alphabitupper or patientsearch.name like :alphabitlower ) and dischargedate is null");// Query query = session.createQuery("from Patient patientsearch  where CAST(patientsearch.telephoneno AS TEXT) LIKE '"+mobileNo+"' and patientsearch.name like '"+alphabit+"%'");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("mobileNo", mobileNo);
                query.setParameter("alphabitlower", alphabitlower+"%");
                
                results = (List<Inpatient>) query.list();

            }



            transaction.commit();
        } catch (HibernateException hibernateException) {
           
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public List<Inpatient> searchPatientByText(String searchValueType, int pageNo, int noOfRecordsPerPage, String alphabit) {
       

        List<Inpatient> results = new ArrayList<Inpatient>();


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                Query query = session.createQuery("from Inpatient patient where patient.name like :searchValueTypeupper  or patient.name like :searchValueTypelower  or patient.nationality like :searchValueTypelower or patient.historyofpresentillness like :searchValueTypelower  or patient.pasthistory like :searchValueTypelower  or patient.familyhistory like :searchValueTypelower  or patient.personalhistory like :searchValueTypelower or patient.drugallergies like :searchValueTypelower  or patient.sex like :searchValueTypelower  or patient.chiefcomplaints like :searchValueTypelower  or patient.married like :searchValueTypelower  or patient.refferedby like :searchValueTypelower or patient.bloodgroup like :searchValueTypelower or patient.address like :searchValueTypelower or  patient.concludinghistory like :searchValueTypelower or patient.followup like :searchValueTypelower  or patient.nationality like :searchValueTypeupper or patient.historyofpresentillness like :searchValueTypeupper  or patient.pasthistory like :searchValueTypeupper  or patient.familyhistory like :searchValueTypeupper  or patient.personalhistory like :searchValueTypeupper  or patient.drugallergies like :searchValueTypeupper  or patient.sex like :searchValueTypeupper or patient.chiefcomplaints like :searchValueTypeupper  or patient.married like :searchValueTypeupper  or patient.refferedby like :searchValueTypeupper  or patient.bloodgroup like :searchValueTypeupper  or patient.address like :searchValueTypeupper or  patient.concludinghistory like :searchValueTypeupper or patient.followup like :searchValueTypeupper ");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                
                results = (List<Inpatient>) query.list();
            } else {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
               
                Query query = session.createQuery("from Inpatient patient where (patient.name like :alphabitupper  or patient.name like :alphabitlower)  and ( patient.name like :searchValueTypeupper  or patient.name like :searchValueTypelower or patient.nationality like :searchValueTypelower or patient.historyofpresentillness like :searchValueTypelower  or patient.pasthistory like :searchValueTypelower  or patient.familyhistory like :searchValueTypelower  or patient.personalhistory like :searchValueTypelower or patient.drugallergies like :searchValueTypelower  or patient.sex like :searchValueTypelower  or patient.chiefcomplaints like :searchValueTypelower  or patient.married like :searchValueTypelower  or patient.refferedby like :searchValueTypelower or patient.bloodgroup like :searchValueTypelower or patient.address like :searchValueTypelower or  patient.concludinghistory like :searchValueTypelower or patient.followup like :searchValueTypelower  or patient.nationality like :searchValueTypeupper or patient.historyofpresentillness like :searchValueTypeupper  or patient.pasthistory like :searchValueTypeupper  or patient.familyhistory like :searchValueTypeupper  or patient.personalhistory like :searchValueTypeupper  or patient.drugallergies like :searchValueTypeupper  or patient.sex like :searchValueTypeupper or patient.chiefcomplaints like :searchValueTypeupper  or patient.married like :searchValueTypeupper  or patient.refferedby like :searchValueTypeupper  or patient.bloodgroup like :searchValueTypeupper  or patient.address like :searchValueTypeupper or  patient.concludinghistory like :searchValueTypeupper or patient.followup like :searchValueTypeupper)");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
               

                results = (List<Inpatient>) query.list();
            }


           

            transaction.commit();
        } catch (HibernateException hibernateException) {
            System.out.println("print exception is:-" + hibernateException.getMessage());
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public int countRecordsearchPatientByText(String searchValueType, String alphabit) {
        int totalnoofrecord = 0;
        List<Inpatient> results = new ArrayList<Inpatient>();

        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();

                Query query = session.createQuery("from Inpatient patient where patient.name like :searchValueTypeupper  or patient.name like :searchValueTypelower  or patient.nationality like :searchValueTypelower or patient.historyofpresentillness like :searchValueTypelower  or patient.pasthistory like :searchValueTypelower  or patient.familyhistory like :searchValueTypelower  or patient.personalhistory like :searchValueTypelower or patient.drugallergies like :searchValueTypelower  or patient.sex like :searchValueTypelower  or patient.chiefcomplaints like :searchValueTypelower  or patient.married like :searchValueTypelower  or patient.refferedby like :searchValueTypelower or patient.bloodgroup like :searchValueTypelower or patient.address like :searchValueTypelower or  patient.concludinghistory like :searchValueTypelower or patient.followup like :searchValueTypelower  or patient.nationality like :searchValueTypeupper or patient.historyofpresentillness like :searchValueTypeupper  or patient.pasthistory like :searchValueTypeupper  or patient.familyhistory like :searchValueTypeupper  or patient.personalhistory like :searchValueTypeupper  or patient.drugallergies like :searchValueTypeupper  or patient.sex like :searchValueTypeupper or patient.chiefcomplaints like :searchValueTypeupper  or patient.married like :searchValueTypeupper  or patient.refferedby like :searchValueTypeupper  or patient.bloodgroup like :searchValueTypeupper  or patient.address like :searchValueTypeupper or  patient.concludinghistory like :searchValueTypeupper or patient.followup like :searchValueTypeupper ");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
              
                results = (List<Inpatient>) query.list();
                totalnoofrecord = results.size();
               
                transaction.commit();
            } else {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();

                Query query = session.createQuery("from Inpatient patient where (patient.name like :alphabitupper  or patient.name like :alphabitlower)  and ( patient.name like :searchValueTypeupper  or patient.name like :searchValueTypelower or patient.nationality like :searchValueTypelower or patient.historyofpresentillness like :searchValueTypelower  or patient.pasthistory like :searchValueTypelower  or patient.familyhistory like :searchValueTypelower  or patient.personalhistory like :searchValueTypelower or patient.drugallergies like :searchValueTypelower  or patient.sex like :searchValueTypelower  or patient.chiefcomplaints like :searchValueTypelower  or patient.married like :searchValueTypelower  or patient.refferedby like :searchValueTypelower or patient.bloodgroup like :searchValueTypelower or patient.address like :searchValueTypelower or  patient.concludinghistory like :searchValueTypelower or patient.followup like :searchValueTypelower  or patient.nationality like :searchValueTypeupper or patient.historyofpresentillness like :searchValueTypeupper  or patient.pasthistory like :searchValueTypeupper  or patient.familyhistory like :searchValueTypeupper  or patient.personalhistory like :searchValueTypeupper  or patient.drugallergies like :searchValueTypeupper  or patient.sex like :searchValueTypeupper or patient.chiefcomplaints like :searchValueTypeupper  or patient.married like :searchValueTypeupper  or patient.refferedby like :searchValueTypeupper  or patient.bloodgroup like :searchValueTypeupper  or patient.address like :searchValueTypeupper or  patient.concludinghistory like :searchValueTypeupper or patient.followup like :searchValueTypeupper)");

                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
               
                results = (List<Inpatient>) query.list();
                totalnoofrecord = results.size();
               
                transaction.commit();
            }

        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }


    public List<Inpatient> viewAllDischargePatient(int pageNo, int noOfRecordsPerPage, String alphabit) {
      
          List<Inpatient> results = new ArrayList<Inpatient>();
          List<Inpatient> results1 = new ArrayList<Inpatient>();
       try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
             
            if(alphabit.equalsIgnoreCase("null"))
            {
                 
                transaction = session.beginTransaction();
           
            Query query = session.createQuery("From Inpatient where dischargedate is not null order by name asc");//where dischargedate is not null
            query.setFirstResult(noOfRecordsPerPage*(pageNo-1));
            query.setMaxResults(noOfRecordsPerPage);
            
            results = (List<Inpatient>) query.list();
           
            }

            else
            {
                 
                  String alphabitlower = alphabit.toLowerCase();
                  String alphabitupper = alphabit.toUpperCase();
            transaction = session.beginTransaction();
         
            Query query = session.createQuery("From Inpatient where  dischargedate is not null and  ( name like '"+alphabitlower+"%' or name like '"+alphabitupper+"%' )");
            query.setFirstResult(noOfRecordsPerPage*(pageNo-1));
            query.setMaxResults(noOfRecordsPerPage);
           

            results = (List<Inpatient>) query.list();
            
            }
           

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public int countRecordDischarge(String alphabit) {
        int totalnoofrecord=0;
        try {
            if(alphabit.equalsIgnoreCase("null"))
            {
                transaction=session.beginTransaction();
            String query1 = (String)session.createQuery("SELECT count(*) FROM Inpatient where dischargedate is not null ").uniqueResult().toString();
            totalnoofrecord=Integer.parseInt(query1);
           
            transaction.commit();
            }
            else
            {
                 String alphabitlower = alphabit.toLowerCase();
                  String alphabitupper = alphabit.toUpperCase();
            transaction=session.beginTransaction();
            String query1 = (String)session.createQuery("SELECT count(*) FROM Inpatient where  dischargedate is not null and  ( name like '"+alphabitlower+"%' or name like '"+alphabitupper+"%' ) ").uniqueResult().toString();
            totalnoofrecord=Integer.parseInt(query1);
           
            transaction.commit();
            }
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }

        finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public List<Inpatient> viewAllInPatientNoLimit(String alphabit) {
        

        List<Inpatient> results = new ArrayList<Inpatient>();
       

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
           
            if (alphabit.equalsIgnoreCase("null")) {
               
                transaction = session.beginTransaction();
                System.out.println("step 4 for paging:-");
                Query query = session.createQuery("From Inpatient order by name asc");

                results = (List<Inpatient>) query.list();
                
            } else {
                
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
              
                Query query = session.createQuery("From Inpatient where  name like '" + alphabitlower + "%' or name like '" + alphabitupper + "%'");

                results = (List<Inpatient>) query.list();
                
            }
           
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public List<Inpatient> viewAllDischargeInPatientNoLimit(String alphabit) {
        

        List<Inpatient> results = new ArrayList<Inpatient>();
       


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
           
            if (alphabit.equalsIgnoreCase("null")) {
              
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("From Inpatient where dischargedate is not null order by name asc");

                results = (List<Inpatient>) query.list();
               
            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("From Inpatient where  dischargedate is not null and   (name like '"+alphabitlower+"%' or name like '"+alphabitupper+"%' )");

              
                results = (List<Inpatient>) query.list();
                //System.out.println("All size mk is:-" + results.size());
            }
            
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public List<Inpatient> viewAllInpatientList() {
          
        List<Inpatient> results = new ArrayList<Inpatient>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Inpatient>) session.createQuery("From Inpatient  order by name asc").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }


}


