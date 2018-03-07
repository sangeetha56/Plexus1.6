/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.operationType.dao;

import com.model.operationType.dto.Operationtype;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
/**
 *
 * @author Admin
 */
public class OperationTypeDao {


         Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


    /** * Hibernate SessionFactory Variable */

     public OperationTypeDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
          session=HibernateUtil.openSession();
    }
    public Operationtype create(Operationtype operationname) {
         try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(operationname);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return operationname;
        }

    }

    public Operationtype create1(Operationtype operationname1) {

        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(operationname1);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return operationname1;
        }

    }

    public void deleteOperationTypeName(long operationtypeid) {

        try {
            transaction=session.beginTransaction();

            Query query=session.createQuery("delete from operationtype where id="+operationtypeid);

            query.executeUpdate();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }

    public Operationtype updateOperationTypeName(Operationtype operation) {

         try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(operation);
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return operation;
        }
    }

    public List<Operationtype> viewAllOperationType() {
         List<Operationtype> results = new ArrayList<Operationtype>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Operationtype>) session.createQuery("From Operationtype where usefull is true  order by operationtypeid ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }

    public Operationtype viewDetailsOperationType(long id) {

        Operationtype investig = new Operationtype();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Operationtype as inves where oper.operationtypeid=" + id);
            investig = (Operationtype) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return investig;
    }

    public void deleteMultiple(List<Long> ids) {
          try {
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("update operationtype SET  usefull=false where operationtypeid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }

    }

