/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dispense.dao;

import com.model.dispense.dto.Dispense;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Administrator
 */
public class DispenseDAO {

    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    /**
     *
     */
    public DispenseDAO() {
        session = HibernateUtil.openSession();
    }

    /**
     *
     * @param dispense
     * @return
     */
    public Dispense create(Dispense dispense) {
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

    /**
     *
     * @param id
     * @return
     */
    public Dispense readUniqueObject(long id) {
        transaction = session.beginTransaction();
        Query query = session.createQuery("From Dispense where id=:id");
        query.setParameter("id", id);
        Dispense dispense = (Dispense) query.uniqueResult();
        return dispense;
    }

    /**
     *
     * @return
     */
    public List<Dispense> readListOfObjects() {
        
        List<Dispense> dispenses = new ArrayList<Dispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createSQLQuery("select * From dispense where dispensedate=current_date").addEntity(Dispense.class);
            //query.setParameter("from", fromDate);
            //query.setParameter("to", toDate);
            dispenses = (List<Dispense>) query.list(); 
            Iterator<Dispense> iterator = dispenses.iterator();
           
            while (iterator.hasNext()) {
                Dispense dispense = iterator.next();
                
            }
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return dispenses;
        }
    }
    /**
     *
     * @param dispenseDate
     * @return
     */
    public List<Dispense> readListOfObjects(Date dispenseDate) {
       
        List<Dispense> dispenses = new ArrayList<Dispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Dispense where dispensedate=:dispensedate");
            query.setParameter("dispensedate", dispenseDate);
            //query.setParameter("to", toDate);
            dispenses = (List<Dispense>) query.list();
            
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return dispenses;
        }
    }

    public List<Dispense> showBetweenTodaysDispensedBills(Date dispensefirstDate,Date dispensesecondDate) {
        
        List<Dispense> dispenses = new ArrayList<Dispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Dispense where dispensedate Between  :from AND :to");
            query.setParameter("from", dispensefirstDate);
            query.setParameter("to", dispensesecondDate);
            dispenses = (List<Dispense>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return dispenses;
        }
    }


     public List<Dispense> showDispensedBillsForThisMonth(Date dispensefirstDate,Date dispensesecondDate) {
        
        List<Dispense> dispenses = new ArrayList<Dispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Dispense where dispensedate Between  :from AND :to");
            query.setParameter("from", dispensefirstDate);
            query.setParameter("to", dispensesecondDate);
            dispenses = (List<Dispense>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return dispenses;
        }
    }
}
