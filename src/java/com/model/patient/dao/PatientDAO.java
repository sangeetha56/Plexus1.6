/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.patient.dao;

import com.model.patient.dto.Patient;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;

/**
 *
 * @author Mayur Mahale 
 * @version 1.0
 * @since February 9th 2012
 */
public class PatientDAO {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;
    SessionFactory sessionFactory;

    /** * Hibernate SessionFactory Variable */
    /**
     * Constructor PatientDAO
     * Initializes sessionFactory
     * 
     */
   public PatientDAO() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session = HibernateUtil.openSession();

    }

    public List<Patient> viewAllPatient(String searchValueType, int pageNo, int noOfRecordsPerPage, String alphabit) {
       // System.out.println("step 3 for paging:-");

        List<Patient> results = new ArrayList<Patient>();


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                //System.out.println("step 4 for paging:-");
                Query query = session.createQuery("From Contacts where archivestatus=0 ORDER BY contactid ASC");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                //System.out.println("step 5 for paging:-");
               // System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
              //  System.out.println("All size mk is:-" + results.size());
            } else {
                transaction = session.beginTransaction();
              //  System.out.println("step 4 for paging:-");
                Query query = session.createQuery("From Contacts where  contactName like '" + alphabit + "%' and  archivestatus=0 ORDER BY contactid ASC");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
               // System.out.println("All size mk is:-" + results.size());
            }
//            if (results != null) {
//                System.out.println("All size is:-" + results.size());
//            }
//
//            for (Patient ndp : results) {
//                System.out.println("Id is:-" + ndp.getId() + "-:Name:-" + ndp.getName());
//            }
//
//
//            System.out.println("step 6 for paging:-");



            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    /**
     * Saves Patient Object.
     * @param patient  Object of com.model.patient.dto.Patient
     * @return patient Object of com.model.patient.dto.Patient with generated ID
     */
    public Patient create(Patient patient) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(patient);

            transaction.commit();
           // System.out.println("in add2");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return patient;
        }
    }

    /**
     *
     * @param patient
     * @return
     */
    public Patient update(Patient patient) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(patient);
            transaction.commit();
           // System.out.println("in add2");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return patient;
        }
    }

    /**
     *
     * @return List of com.model.patient.dto.Patient objects containing all patient information.
     */
    public List<Patient> readListOfObjects() {
       // System.out.println("here kk312:-");
        List<Patient> results = new ArrayList<Patient>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            results = (List<Patient>) session.createQuery("From Patient").list();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    /**
     *
     * @param id Patient id.
     * @return com.model.patient.dto.Patient object containing patient information w.r.t id.
     */
    public Patient readUniqueObject(long id) {
       // System.out.println("view details dao");
        Patient patient = new Patient();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Patient as patient where patient.id=" + id);
            patient = (Patient) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return patient;
    }

    /**
     *
     * @param ids
     */
    public void deleteMultiple(List<Long> ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("delete from Patient where id IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }

    /**public List<Patient> viewByAlphabit(String lower,String upper) {
    System.out.println("here kk312:-");
    String varlower=lower+"%";
    String varupper=upper+"%";
    System.out.println("alphabi in lower:="+varlower);
    System.out.println("alphabi in upper:="+varupper);
    List<Patient> results = new ArrayList<Patient>();
    try {
    //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
    transaction = session.beginTransaction();
    Query query = session.createQuery("From Patient  where name like :from or name like:to");
    query.setParameter("from",varlower);
    query.setParameter("to",varupper);
    // results = (List<Patient>) session.createQuery("From Patient").list();
    results=(List<Patient>)query.list();
    transaction.commit();
    } catch (HibernateException hibernateException) {
    transaction.rollback();
    hibernateException.printStackTrace();
    System.out.println("exception are :-"+hibernateException);
    } finally {
    //session.close();
    return results;
    }
    }**/
//for jump to page
    public List<Patient> readListOfObjectsPage(int pageNo, int noOfRecordsPerPage, String alphabit) {
       // System.out.println("step 3 for paging:-");

        List<Patient> results = new ArrayList<Patient>();
//        System.out.println("here kusum1");
//        System.out.println("gggggggggggggggggggggggggggggggggggggggggggg:-"+alphabit);


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
           // System.out.println("here kusum 2");
            if (alphabit.equalsIgnoreCase("null")) {
             //   System.out.println("here kusum 3");
                transaction = session.beginTransaction();
              //  System.out.println("step 4 for paging:-");
                Query query = session.createQuery("From Patient order by name asc");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
              //  System.out.println("All size mk is:-" + results.size());
            } else {
               // System.out.println("here kusum 4");
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                //System.out.println("step 4 for paging:-");
                Query query = session.createQuery("From Patient where  name like '" + alphabitlower + "%' or name like '" + alphabitupper + "%'");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
               // System.out.println("All size mk is:-" + results.size());
            }
            if (results != null) {
               // System.out.println("All size is:-" + results.size());
            }

//            System.out.println("here kusum 6");
//            System.out.println("step 6 for paging:-");



            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }
//end

    public int countRecord(String alphabit) {
        int totalnoofrecord = 0;
        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String query1 = (String) session.createQuery("SELECT count(*) FROM Patient ").uniqueResult().toString();
                totalnoofrecord = Integer.parseInt(query1);
//                System.out.println("Total no of Record is:-" + totalnoofrecord);
//                System.out.println("no issssssssssss:-" + query1);
                transaction.commit();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                String query1 = (String) session.createQuery("SELECT count(*) FROM Patient where  name like '" + alphabitlower + "%' or name like '" + alphabitupper + "%'").uniqueResult().toString();
                totalnoofrecord = Integer.parseInt(query1);
//                System.out.println("Total no of Record is:-" + totalnoofrecord);
//                System.out.println("no issssssssssss:-" + query1);
                transaction.commit();
            }
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public List<Patient> searchPatientByCardNo(long cardNo, int pageNo, int noOfRecordsPerPage, String alphabit) {
       // System.out.println("step 3 for paging:-");

        List<Patient> results = new ArrayList<Patient>();




        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            if (alphabit.equalsIgnoreCase("null")) {
               // System.out.println("alphabit is nulll");

                transaction = session.beginTransaction();
              //  System.out.println("step 4 for paging:-");
                Query query = session.createQuery("from Patient patientsearch  where patientsearch.cardno=:cardNo");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("cardNo", cardNo);
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());
                results = (List<Patient>) query.list();

            } else {
               // System.out.println("alphabit is not nulll:-" + alphabit);
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               // System.out.println("step 4 for paging:-");
                Query query = session.createQuery("from Patient patientsearch  where patientsearch.cardno=:cardNo and (patientsearch.name like :alphabitupper or patientsearch.name like :alphabitlower )");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("cardNo", cardNo);
                query.setParameter("alphabitlower",alphabitlower+"%");
                query.setParameter("alphabitupper",alphabitupper+"%");
                //System.out.println("step 5 for paging:-");
               // System.out.println("query size is:-" + query.toString());
                results = (List<Patient>) query.list();

            }


//            System.out.println("All size mk is:-" + results.size());
//            if (results != null) {
//                System.out.println("All size is:-" + results.size());
//            }
//
//
//
//
//            System.out.println("step 6 for paging:-");



            transaction.commit();
        } catch (HibernateException hibernateException) {
           // System.out.println("print exception is:-" + hibernateException.getMessage());
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public int countRecordSearchPatientCardNo(long searchValueType, String alphabit) {
        int totalnoofrecord = 0;
        List<Patient> results = new ArrayList<Patient>();

        try {
            transaction = session.beginTransaction();
            if (alphabit.equalsIgnoreCase("null")) {
               // System.out.println("alphabit is nulll");

                Query query = session.createQuery("from Patient patientsearch  where patientsearch.cardno=:cardNo");

                query.setParameter("cardNo", searchValueType);
                results = (List<Patient>) query.list();
                totalnoofrecord = results.size();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
               // System.out.println("alphabit is not nulll:-" + alphabit);
                Query query = session.createQuery("from Patient patientsearch  where patientsearch.cardno=:cardNo and (patientsearch.name like :alphabitupper or patientsearch.name like :alphabitlower )");

                query.setParameter("cardNo", searchValueType);
                 query.setParameter("alphabitlower",alphabitlower+"%");
                query.setParameter("alphabitupper",alphabitupper+"%");
               // System.out.println("step 5 for paging:-");
               // System.out.println("query size is:-" + query.toString());
                results = (List<Patient>) query.list();
                totalnoofrecord = results.size();
            }
           // System.out.println("Total no of Record is:-" + totalnoofrecord);


            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public List<Patient> searchByName(String searchValueType, int pageNo, int noOfRecordsPerPage, String alphabit) {
       // System.out.println("step 3 for paging:-");

        List<Patient> results = new ArrayList<Patient>();


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();//upperCaseAllFirst
               // System.out.println("step 4 for paging:-");
                Query query = session.createQuery("from Patient  where (name like :searchValueTypelower or name like :searchValueTypeupper)");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
               // System.out.println("All size mk is:-" + results.size());

            } else {
                transaction = session.beginTransaction();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
               // System.out.println("step 4 for paging:-");
                Query query = session.createSQLQuery("select * from Patient  where  (name like :searchValueTypelower or name like :searchValueTypeupper) and (name like :alphabitlower or name like :alphabitupper) ").addEntity(Patient.class); // Query query = session.createQuery("from Patient patient where  (patient.name like '%" + searchValueTypelower + "%' or patient.name like '%" + searchValueTypeupper + "%') and (patient.name like '%" + alphabitlower + "%' or patient.name like '%" + alphabitupper + "%') ");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
                query.setParameter("alphabitupper",alphabitupper+"%");
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
              //  System.out.println("All size mk is:-" + results.size());

            }

//            if (results != null) {
//                System.out.println("All size is:-" + results.size());
//            }
//
//
//            System.out.println("step 6 for paging:-");



            transaction.commit();
        } catch (HibernateException hibernateException) {
           // System.out.println("print exception is:-" + hibernateException.getMessage());
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public static String upperCaseAllFirst(String value) {

	char[] array = value.toCharArray();
	// Uppercase first letter.
	array[0] = Character.toUpperCase(array[0]);

	// Uppercase all letters that follow a whitespace character.
	for (int i = 1; i < array.length; i++) {
	    if (Character.isWhitespace(array[i - 1])) {
		array[i] = Character.toUpperCase(array[i]);
	    }
	}

	// Result.
	return new String(array);
    }


    public int countRecordSearchByPatientName(String searchValueType, String alphabit) {
        int totalnoofrecord = 0;
        List<Patient> results = new ArrayList<Patient>();

        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();

                Query query = session.createSQLQuery("select * from Patient  where (name like :searchValueTypelower or name like :searchValueTypeupper)").addEntity(Patient.class);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                results = (List<Patient>) query.list();
                totalnoofrecord = results.size();
//                System.out.println("Total no of Record is:-" + totalnoofrecord);
//                System.out.println("no issssssssssss:-" + query.toString());
                transaction.commit();

            } else {
                transaction = session.beginTransaction();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                Query query = session.createSQLQuery("select * from Patient  where  (name like :searchValueTypelower or name like :searchValueTypeupper) and (name like :alphabitlower or name like :alphabitupper) ").addEntity(Patient.class);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitlower", alphabitlower+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                results = (List<Patient>) query.list();
                totalnoofrecord = results.size();
               // System.out.println("Total no of Record is:-" + totalnoofrecord);
              //  System.out.println("no issssssssssss:-" + query.toString());
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
         List<Patient> results = new ArrayList<Patient>();

        try {
            transaction = session.beginTransaction();
            if (alphabit.equalsIgnoreCase("null")) {
               // System.out.println("alphabit is nulll");

                Query query = session.createQuery("from Patient patientsearch  where patientsearch.telephoneno=:searchValueType"); //  Query query = session.createQuery("from Patient patientsearch  where CAST(patientsearch.telephoneno AS TEXT) LIKE '"+mobileNo+"%'");

                query.setParameter("searchValueType", searchValueType);
               // System.out.println("step 5 for paging:-");
               // System.out.println("query size is:-" + query.toString());
                results = (List<Patient>) query.list();
                totalnoofrecord = results.size();
            } else {

                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
               // System.out.println("alphabit is not nulll:-" + alphabit);
                Query query = session.createQuery("from Patient patientsearch  where patientsearch.telephoneno = :searchValueType  and  (patientsearch.name like :alphabitupper or patientsearch.name like :alphabitlower )");// Query query = session.createQuery("from Patient patientsearch  where CAST(patientsearch.telephoneno AS TEXT) LIKE '"+mobileNo+"' and patientsearch.name like '"+alphabit+"%'");

                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("searchValueType", searchValueType);
                query.setParameter("alphabitlower", alphabitlower+"%");
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());
                results = (List<Patient>) query.list();
                totalnoofrecord = results.size();
            }
           // System.out.println("Total no of Record is:-" + totalnoofrecord);


            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public List<Patient> searchByMobileNo(long mobileNo, int pageNo, int noOfRecordsPerPage, String alphabit) {
      //  System.out.println("step 3 for paging:-");

        List<Patient> results = new ArrayList<Patient>();




        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            if (alphabit.equalsIgnoreCase("null")) {
              //  System.out.println("alphabit is nulll");

                transaction = session.beginTransaction();
              //  System.out.println("step 4 for paging:-");
                Query query = session.createQuery("from Patient patientsearch  where patientsearch.telephoneno=:mobileNo"); //  Query query = session.createQuery("from Patient patientsearch  where CAST(patientsearch.telephoneno AS TEXT) LIKE '"+mobileNo+"%'");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("mobileNo", mobileNo);
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());
                results = (List<Patient>) query.list();

            } else {
             //   System.out.println("alphabit is not nulll:-" + alphabit);

                transaction = session.beginTransaction();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
               // System.out.println("step 4 for paging:-");
                Query query = session.createQuery("from Patient patientsearch  where patientsearch.telephoneno = :mobileNo  and  (patientsearch.name like :alphabitupper or patientsearch.name like :alphabitlower )");// Query query = session.createQuery("from Patient patientsearch  where CAST(patientsearch.telephoneno AS TEXT) LIKE '"+mobileNo+"' and patientsearch.name like '"+alphabit+"%'");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("mobileNo", mobileNo);
                query.setParameter("alphabitlower", alphabitlower+"%");
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());
                results = (List<Patient>) query.list();

            }


           // System.out.println("All size mk is:-" + results.size());
            if (results != null) {
               // System.out.println("All size is:-" + results.size());
            }




           // System.out.println("step 6 for paging:-");



            transaction.commit();
        } catch (HibernateException hibernateException) {
           // System.out.println("print exception is:-" + hibernateException.getMessage());
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public List<Patient> searchPatientByText(String searchValueType, int pageNo, int noOfRecordsPerPage, String alphabit) {
      //  System.out.println("step 3 for paging:-");

        List<Patient> results = new ArrayList<Patient>();


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
             //   System.out.println("step 4 for paging:-");
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                Query query = session.createQuery("from Patient patient where patient.name like :searchValueTypeupper  or patient.name like :searchValueTypelower  or patient.nationality like :searchValueTypelower or patient.historyofpresentillness like :searchValueTypelower  or patient.pasthistory like :searchValueTypelower  or patient.familyhistory like :searchValueTypelower  or patient.personalhistory like :searchValueTypelower or patient.drugallergies like :searchValueTypelower  or patient.sex like :searchValueTypelower  or patient.chiefcomplaints like :searchValueTypelower  or patient.married like :searchValueTypelower  or patient.refferedby like :searchValueTypelower or patient.bloodgroup like :searchValueTypelower or patient.address like :searchValueTypelower or patient.nationality like :searchValueTypeupper or patient.historyofpresentillness like :searchValueTypeupper  or patient.pasthistory like :searchValueTypeupper  or patient.familyhistory like :searchValueTypeupper  or patient.personalhistory like :searchValueTypeupper  or patient.drugallergies like :searchValueTypeupper  or patient.sex like :searchValueTypeupper or patient.chiefcomplaints like :searchValueTypeupper  or patient.married like :searchValueTypeupper  or patient.refferedby like :searchValueTypeupper  or patient.bloodgroup like :searchValueTypeupper  or patient.address like :searchValueTypeupper ");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
            } else {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
              //  System.out.println("step 4 for paging:-");
                Query query = session.createQuery("from Patient patient where (patient.name like :alphabitupper  or patient.name like :alphabitlower ) and (patient.name like :searchValueTypeupper  or patient.name like :searchValueTypelower or patient.nationality like :searchValueTypelower or patient.historyofpresentillness like :searchValueTypelower  or patient.pasthistory like :searchValueTypelower  or patient.familyhistory like :searchValueTypelower  or patient.personalhistory like :searchValueTypelower or patient.drugallergies like :searchValueTypelower  or patient.sex like :searchValueTypelower  or patient.chiefcomplaints like :searchValueTypelower  or patient.married like :searchValueTypelower  or patient.refferedby like :searchValueTypelower or patient.bloodgroup like :searchValueTypelower or patient.address like :searchValueTypelower or patient.nationality like :searchValueTypeupper or patient.historyofpresentillness like :searchValueTypeupper  or patient.pasthistory like :searchValueTypeupper  or patient.familyhistory like :searchValueTypeupper  or patient.personalhistory like :searchValueTypeupper  or patient.drugallergies like :searchValueTypeupper  or patient.sex like :searchValueTypeupper or patient.chiefcomplaints like :searchValueTypeupper  or patient.married like :searchValueTypeupper  or patient.refferedby like :searchValueTypeupper  or patient.bloodgroup like :searchValueTypeupper  or patient.address like :searchValueTypeupper)");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
            }


          //  System.out.println("All size mk is:-" + results.size());
            if (results != null) {
                //System.out.println("All size is:-" + results.size());
            }

            for (Patient ndp : results) {
              //  System.out.println("Id is:-" + ndp.getId() + "-:Name:-" + ndp.getName());
            }


          //  System.out.println("step 6 for paging:-");



            transaction.commit();
        } catch (HibernateException hibernateException) {
          //  System.out.println("print exception is:-" + hibernateException.getMessage());
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public int countRecordsearchPatientByText(String searchValueType, String alphabit) {
        int totalnoofrecord = 0;
         List<Patient> results = new ArrayList<Patient>();

        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();

                Query query = session.createQuery("from Patient patient where patient.name like :searchValueTypeupper  or patient.name like :searchValueTypelower  or patient.nationality like :searchValueTypelower or patient.historyofpresentillness like :searchValueTypelower  or patient.pasthistory like :searchValueTypelower  or patient.familyhistory like :searchValueTypelower  or patient.personalhistory like :searchValueTypelower or patient.drugallergies like :searchValueTypelower  or patient.sex like :searchValueTypelower  or patient.chiefcomplaints like :searchValueTypelower  or patient.married like :searchValueTypelower  or patient.refferedby like :searchValueTypelower or patient.bloodgroup like :searchValueTypelower or patient.address like :searchValueTypelower or patient.nationality like :searchValueTypeupper or patient.historyofpresentillness like :searchValueTypeupper  or patient.pasthistory like :searchValueTypeupper  or patient.familyhistory like :searchValueTypeupper  or patient.personalhistory like :searchValueTypeupper  or patient.drugallergies like :searchValueTypeupper  or patient.sex like :searchValueTypeupper or patient.chiefcomplaints like :searchValueTypeupper  or patient.married like :searchValueTypeupper  or patient.refferedby like :searchValueTypeupper  or patient.bloodgroup like :searchValueTypeupper  or patient.address like :searchValueTypeupper ");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
                totalnoofrecord = results.size();
//                System.out.println("Total no of Record is:-" + totalnoofrecord);
//                System.out.println("no issssssssssss:-" + query.toString());
                transaction.commit();
            } else {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = searchValueType.toUpperCase();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();

                Query query = session.createQuery("from Patient patient where (patient.name like :alphabitupper  or patient.name like :alphabitlower ) and (patient.name like :searchValueTypeupper  or patient.name like :searchValueTypelower or patient.nationality like :searchValueTypelower or patient.historyofpresentillness like :searchValueTypelower  or patient.pasthistory like :searchValueTypelower  or patient.familyhistory like :searchValueTypelower  or patient.personalhistory like :searchValueTypelower or patient.drugallergies like :searchValueTypelower  or patient.sex like :searchValueTypelower  or patient.chiefcomplaints like :searchValueTypelower  or patient.married like :searchValueTypelower  or patient.refferedby like :searchValueTypelower or patient.bloodgroup like :searchValueTypelower or patient.address like :searchValueTypelower or patient.nationality like :searchValueTypeupper or patient.historyofpresentillness like :searchValueTypeupper  or patient.pasthistory like :searchValueTypeupper  or patient.familyhistory like :searchValueTypeupper  or patient.personalhistory like :searchValueTypeupper  or patient.drugallergies like :searchValueTypeupper  or patient.sex like :searchValueTypeupper or patient.chiefcomplaints like :searchValueTypeupper  or patient.married like :searchValueTypeupper  or patient.refferedby like :searchValueTypeupper  or patient.bloodgroup like :searchValueTypeupper  or patient.address like :searchValueTypeupper)");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
                totalnoofrecord = results.size();
//                System.out.println("Total no of Record is:-" + totalnoofrecord);
//                System.out.println("no issssssssssss:-" + query.toString());
                transaction.commit();
            }

        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }



     public List<Patient> viewAllPatientNoLimit(String alphabit) {
       // System.out.println("step 3 for paging:-");

        List<Patient> results = new ArrayList<Patient>();
       // System.out.println("here kusum1");


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
          //  System.out.println("here kusum 2");
            if (alphabit.equalsIgnoreCase("null")) {
               // System.out.println("here kusum 3");
                transaction = session.beginTransaction();
              //  System.out.println("step 4 for paging:-");
                Query query = session.createQuery("From Patient order by name asc");

//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
              //  System.out.println("All size mk is:-" + results.size());
            } else {
              //  System.out.println("here kusum 4");
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
              //  System.out.println("step 4 for paging:-");
                Query query = session.createQuery("From Patient where  name like '" + alphabitlower + "%' or name like '" + alphabitupper + "%'");

//                System.out.println("step 5 for paging:-");
//                System.out.println("query size is:-" + query.toString());

                results = (List<Patient>) query.list();
               // System.out.println("All size mk is:-" + results.size());
            }
            if (results != null) {
               // System.out.println("All size is:-" + results.size());
            }

//            System.out.println("here kusum 6");
//            System.out.println("step 6 for paging:-");



            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

     public List<Patient> viewPatientForPopupAlphabit(String alpha) {
      //  System.out.println("here kk312:-");
        List<Patient> results = new ArrayList<Patient>();
        String alphabitlower = alpha.toLowerCase();
        String alphabitupper = alpha.toUpperCase();
      //   System.out.println("alphabit are:-"+alphabitlower+":"+alphabitupper);
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            results = (List<Patient>) session.createQuery("From Patient where  name like '" + alphabitlower + "%' or name like '" + alphabitupper + "%'").list();
          //  System.out.println("sizeeeeeeeeeeee is:-"+results.size());
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
