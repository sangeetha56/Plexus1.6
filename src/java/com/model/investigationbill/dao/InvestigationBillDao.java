/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.investigationbill.dao;

import com.model.investigation.dto.Investigation;
import com.model.investigationbill.dto.Investigationbill;
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
 * @author sultan
 */
public class InvestigationBillDao {
     Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


    /** * Hibernate SessionFactory Variable */

    public InvestigationBillDao() {

        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Investigationbill addInvestigationBill(Investigationbill investigationbill) {

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(investigationbill);

            transaction.commit();
            
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return investigationbill;
        }

    }


    public List<Investigationbill> showTodaysInvestigationBills(Date fromDate, Date toDate) {
        List<Investigationbill> investigationbill = new ArrayList<Investigationbill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Investigationbill where investigationbilldate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            investigationbill = (List<Investigationbill>) query.list();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return investigationbill;

        }

    }
    /**
     *
     * @param id
     * @return
     */
    public Investigationbill readUniqueObject(long id) {
        Investigationbill investigation = new Investigationbill();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Investigationbill where investigationbillid= :id ");
            query.setParameter("id", id);
            investigation = (Investigationbill) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return investigation;
        }
    }

    public List<Investigationbill> showInvestigationBillsByDate(Date createddate) {
       
        List<Investigationbill> investigation = new ArrayList<Investigationbill>();
        try {
            transaction = session.beginTransaction();

            Query query = session.createQuery("From Investigationbill where investigationbilldate=:createddate");
            query.setParameter("createddate", createddate);

            investigation = (List<Investigationbill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return investigation;
        }
    }


    public List<Investigationbill> showBetweendateInvestigationBill(Date investigationfirstDate,Date investigationsecondDate) {
       
        List<Investigationbill> investigation = new ArrayList<Investigationbill>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Investigationbill where investigationbilldate Between  :from AND :to");
            query.setParameter("from", investigationfirstDate);
            query.setParameter("to", investigationsecondDate);
            investigation = (List<Investigationbill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return investigation;
        }
    }


     public List<Investigationbill> showInvestigationThisMonthBill(Date investigationfirstDate,Date investigationsecondDate) {
        
        List<Investigationbill> therapy = new ArrayList<Investigationbill>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Investigationbill where investigationbilldate Between  :from AND :to");
            query.setParameter("from", investigationfirstDate);
            query.setParameter("to", investigationsecondDate);
            therapy = (List<Investigationbill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return therapy;
        }
    }

     public List<Investigation> readListOfObjects() {
        
        List<Investigation> results = new ArrayList<Investigation>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            results = (List<Investigation>) session.createQuery("From Investigation").list();
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
