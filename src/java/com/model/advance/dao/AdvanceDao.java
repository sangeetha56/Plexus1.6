/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.advance.dao;

import com.model.advance.dto.Advance;
import com.model.advance.dtochild.Advancechildbill;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
/**
 *
 * @author Admin
 */
public class AdvanceDao {
  Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;

    public AdvanceDao() {

        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }
    public Advance addAdvance(Advance advance) {
          try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(advance);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return advance;
        }
    }

    public List<Advance> showTodaysAdvanceBills(Date fromDate, Date toDate) {
List<Advance> advance = new ArrayList<Advance>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Advance where advancebilldate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            advance = (List<Advance>) query.list();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return advance;

        }
    }

    public Advance readUniqueObject(long id) {
        Advance advance = new Advance();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Advance where advancebillid= :id ");
            query.setParameter("id", id);
            advance = (Advance) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return advance;
        }
    }

    public List<Advance> showAdvanceBillsByDate(Date createddate) {
List<Advance> advance = new ArrayList<Advance>();
        try {
            transaction = session.beginTransaction();

            Query query = session.createQuery("From Advance where advancebilldate=:createddate");
            query.setParameter("createddate", createddate);

            advance = (List<Advance>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return advance;
        }
    }

    public List<Advance> showBetweendateAdvanceBill(Date advancefirstDate, Date advancesecondDate) {
 List<Advance> advance = new ArrayList<Advance>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Advance where advancebilldate Between  :from AND :to");
            query.setParameter("from", advancefirstDate);
            query.setParameter("to", advancesecondDate);
            advance = (List<Advance>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return advance;
        }
    }

    public List<Advance> showAdvanceThisMonthBill(Date advancefirstDate, Date advancesecondDate) {
 List<Advance> advance = new ArrayList<Advance>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Advance where advancebilldate Between  :from AND :to");
            query.setParameter("from", advancefirstDate);
            query.setParameter("to", advancesecondDate);
            advance = (List<Advance>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return advance;
        }
    }

    public List<Advance> readListOfObjects() {
         List<Advance> results = new ArrayList<Advance>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            results = (List<Advance>) session.createQuery("From Advance").list();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    
    }

    public Advancechildbill addAdvanceBillChild(Advancechildbill advancechildbill) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(advancechildbill);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return advancechildbill;
        }
    }

}
