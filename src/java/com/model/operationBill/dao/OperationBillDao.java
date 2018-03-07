/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.operationBill.dao;

import com.model.operationBill.dto.Operationbill;
import com.model.operationBill.dto.Operationbillchild;
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
public class OperationBillDao {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


     public OperationBillDao() {

        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Operationbill addOperationBill(Operationbill operationbill) {
          try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(operationbill);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return operationbill;
        }
    }

    public List<Operationbill> showTodaysOperationBills(Date fromDate, Date toDate) {
         List<Operationbill> operationbill = new ArrayList<Operationbill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Operationbill where operationbilldate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            operationbill = (List<Operationbill>) query.list();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return operationbill;

        }
    }

    public Operationbill readUniqueObject(long id) {
        Operationbill operation = new Operationbill();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Operationbill where operationbillid= :id ");
            query.setParameter("id", id);
            operation = (Operationbill) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return operation;
        }
    }

    public List<Operationbill> showOperationBillsByDate(Date createddate) {
        List<Operationbill> operation = new ArrayList<Operationbill>();
        try {
            transaction = session.beginTransaction();

            Query query = session.createQuery("From Operationbill where operationbilldate=:createddate");
            query.setParameter("createddate", createddate);

            operation = (List<Operationbill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return operation;
        }
    }

    public List<Operationbill> showBetweendateOperationBill(Date operationfirstDate, Date operationsecondDate) {
         List<Operationbill> operation = new ArrayList<Operationbill>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Operationbill where operationbilldate Between  :from AND :to");
            query.setParameter("from", operationfirstDate);
            query.setParameter("to", operationsecondDate);
            operation = (List<Operationbill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return operation;
        }
    }

    public List<Operationbill> showOperationThisMonthBill(Date operationfirstDate, Date operationsecondDate) {
        List<Operationbill> therapy = new ArrayList<Operationbill>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Operationbill where operationbilldate Between  :from AND :to");
            query.setParameter("from", operationfirstDate);
            query.setParameter("to", operationsecondDate);
            therapy = (List<Operationbill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return therapy;
        }
    }

    public List<Operationbill> readListOfObjects() {
        List<Operationbill> results = new ArrayList<Operationbill>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            results = (List<Operationbill>) session.createQuery("From Operationtype").list();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public Operationbillchild addOperationBillChild(Operationbillchild operationbillchild) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(operationbillchild);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return operationbillchild;
        }
    }

    public Operationbillchild readPreviousDueChilLastRecord(long operationbillid) {
        Operationbillchild operationbillchild = new Operationbillchild();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Operationbillchild as operationchildbill where operationchildbill.operationbill.operationbillid= :operationbillid order by operationbillidchild desc");
            query.setParameter("operationbillid", operationbillid);
            query.setMaxResults(1);
            operationbillchild = (Operationbillchild) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return operationbillchild;
        }
    }

    public List<Operationbillchild> showTodaysOperationChildsBills(Date fromDate, Date toDate, long operationbillid) {
        List<Operationbillchild> operationbillchild = new ArrayList<Operationbillchild>();
        System.out.println("hhhhhhhhhhhhhhhhhh---------------");
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Operationbillchild as opchild where operationbilldatechild Between  :from AND :to and opchild.operationbill.operationbillid=:operationbillid ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);
            query.setParameter("operationbillid", operationbillid);

            operationbillchild = (List<Operationbillchild>) query.list();
            transaction.commit();
        } catch (HibernateException e) {
            System.out.println("error is:-----"+e.toString());
            transaction.rollback();
        } finally {
            //session.close();
            return operationbillchild;

        }
    }

}
