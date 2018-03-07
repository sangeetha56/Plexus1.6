/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.indispense.dao;

import com.model.indispense.dto.Indispense;
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
public class InDispenseDAO {

      Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;


     public InDispenseDAO() {
        session = HibernateUtil.openSession();
    }

    public Indispense create(Indispense dispense) {
         try {
            transaction = session.beginTransaction();
            session.save(dispense);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        return dispense;
    }

    public Indispense readUniqueObject(long id) {
        transaction = session.beginTransaction();
        Query query = session.createQuery("From Indispense where id=:id");
        query.setParameter("id", id);
        Indispense dispense = (Indispense) query.uniqueResult();
        return dispense;
    }

    public List<Indispense> readListOfObjects() {
        
        List<Indispense> dispenses = new ArrayList<Indispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createSQLQuery("select * From indispense where dispensedate=current_date").addEntity(Indispense.class);
            //query.setParameter("from", fromDate);
            //query.setParameter("to", toDate);
            dispenses = (List<Indispense>) query.list();
            Iterator<Indispense> iterator = dispenses.iterator();
           
            while (iterator.hasNext()) {
                Indispense dispense = iterator.next();
               
            }
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return dispenses;
        }
    }

    public List<Indispense> readListOfObjects(Date dispenseDate) {
      
        List<Indispense> dispenses = new ArrayList<Indispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Indispense where dispensedate=:dispensedate");
            query.setParameter("dispensedate", dispenseDate);
            //query.setParameter("to", toDate);
            dispenses = (List<Indispense>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return dispenses;
        }
    }

    public List<Indispense> showBetweenTodaysDispensedBills(Date dispensefirstDate,Date dispensesecondDate) {
      
        List<Indispense> dispenses = new ArrayList<Indispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Indispense where dispensedate Between  :from AND :to");
            query.setParameter("from", dispensefirstDate);
            query.setParameter("to", dispensesecondDate);
            dispenses = (List<Indispense>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return dispenses;
        }
    }


     public List<Indispense> showDispensedBillsForThisMonth(Date dispensefirstDate,Date dispensesecondDate) {
       
        List<Indispense> dispenses = new ArrayList<Indispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Indispense where dispensedate Between  :from AND :to");
            query.setParameter("from", dispensefirstDate);
            query.setParameter("to", dispensesecondDate);
            dispenses = (List<Indispense>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return dispenses;
        }
    }

}
