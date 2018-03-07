/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.bill.dao;

import com.model.bill.dto.Bill;
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
public class BillDAO {
    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    /**
     *
     */
    public BillDAO() {
        this.session = HibernateUtil.openSession();
    }
    /**
     *
     * @param bill
     * @return
     */
    public   Bill create(Bill bill) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(bill);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return bill;
        }

    }
    /**
     *
     * @param fromDate
     * @param toDate
     * @return
     */
    public List<Bill> readListOfObjects(Date fromDate, Date toDate) {
        List<Bill> visits = new ArrayList<Bill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Bill where createddate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            visits = (List<Bill>) query.list();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return visits;

        }

    }
    /**
     *
     * @param id
     * @return
     */
    public Bill readUniqueObject(long id) {
        Bill bill = new Bill();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Bill where id= :id ");
            query.setParameter("id", id);            
            bill = (Bill) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return bill;
        }
    }

    public List<Bill> readListOfObjects(Date createddate) {
       
        List<Bill> bil = new ArrayList<Bill>();
        try {
            transaction = session.beginTransaction();
            
            Query query = session.createQuery("From Bill where createddate=:createddate");
            query.setParameter("createddate", createddate);
            
            bil = (List<Bill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return bil;
        }
    }


    public List<Bill> showConsultantBetweenDateBills(Date consulntfirstDate,Date consulntsecondDate) {
      
        List<Bill> bils = new ArrayList<Bill>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Bill where createddate Between  :from AND :to");
            query.setParameter("from", consulntfirstDate);
            query.setParameter("to", consulntsecondDate);
            bils = (List<Bill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return bils;
        }
    }


     public List<Bill> showConsultantForThisMonth(Date consulntfirstDate,Date consulntsecondDate) {
       
        List<Bill> bils = new ArrayList<Bill>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Bill where createddate Between  :from AND :to");
            query.setParameter("from", consulntfirstDate);
            query.setParameter("to", consulntsecondDate);
            bils = (List<Bill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return bils;
        }
    }

     public List<Bill> dialySalesReportConsultationCharges(Date fromDate, Date toDate) {
        List<Bill> visits = new ArrayList<Bill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Bill where createddate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            visits = (List<Bill>) query.list();
            Iterator<Bill> iterator = visits.iterator();
           
            while (iterator.hasNext()) {
                Bill charges = iterator.next();
               
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return visits;

        }

    }

     public List<Bill> dialySalesReportConsultationChargesSum(Date fromDate, Date toDate) {
        List<Bill> visits = new ArrayList<Bill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("select sum(consultationcharges) From Bill where createddate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            visits = (List<Bill>) query.list();
            Iterator<Bill> iterator = visits.iterator();
            
            while (iterator.hasNext()) {
                Bill charges = iterator.next();
                
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return visits;

        }

    }

     public List<Bill> readListOfObjectsAmount(Date fromDate, Date toDate) {
        List<Bill> visits = new ArrayList<Bill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("Select * From Bill where createddate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            visits = (List<Bill>) query.list();
            Iterator<Bill> iterator = visits.iterator();
           
            while (iterator.hasNext()) {
                Bill charges = iterator.next();
                
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            e.printStackTrace();
        } finally {
            //session.close();
            return visits;

        }

    }

}
