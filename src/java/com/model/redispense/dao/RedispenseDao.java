/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.redispense.dao;

import com.model.redispense.dto.Redispense;
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
 * @author Admin
 */
public class RedispenseDao {
     Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    public RedispenseDao() {
        session = HibernateUtil.openSession();
    }


    public Redispense create(Redispense redispense) {
        try {
            transaction = session.beginTransaction();
            session.save(redispense);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        return redispense;

    }

    public Redispense readUniqueObject(long id) {
        transaction = session.beginTransaction();
        Query query = session.createQuery("From Redispense where id=:id");
        query.setParameter("id", id);
        Redispense redispense = (Redispense) query.uniqueResult();
        return redispense;

    }

    public List<Redispense> readListOfObjects() {
        List<Redispense> redispenses = new ArrayList<Redispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createSQLQuery("select * From Redispense where dispensedate=current_date").addEntity(Redispense.class);
            //query.setParameter("from", fromDate);
            //query.setParameter("to", toDate);
            redispenses = (List<Redispense>) query.list();
            Iterator<Redispense> iterator = redispenses.iterator();

            while (iterator.hasNext()) {
                Redispense redispense = iterator.next();

            }
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return redispenses;
        }

    }

    public List<Redispense> readListOfObjects(Date dispenseDate) {
         List<Redispense> redispenses = new ArrayList<Redispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Redispense where dispensedate=:dispensedate");
            query.setParameter("dispensedate", dispenseDate);
            //query.setParameter("to", toDate);
            redispenses = (List<Redispense>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return redispenses;
        }

    }

    public List<Redispense> showBetweenTodaysRedispensedBills(Date dispensefirstDate, Date dispensesecondDate) {
         List<Redispense> redispenses = new ArrayList<Redispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Redispense where dispensedate Between  :from AND :to");
            query.setParameter("from", dispensefirstDate);
            query.setParameter("to", dispensesecondDate);
            redispenses = (List<Redispense>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return redispenses;
        }

    }

    public List<Redispense> showRedispensedBillsForThisMonth(Date dispensefirstDate, Date dispensesecondDate) {
         List<Redispense> redispenses = new ArrayList<Redispense>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Redispense where dispensedate Between  :from AND :to");
            query.setParameter("from", dispensefirstDate);
            query.setParameter("to", dispensesecondDate);
            redispenses = (List<Redispense>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return redispenses;
        }

    }

   

}
