/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.therapy.dao;

import com.model.therapy.dto.Theraphy;
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
 * @author sultan
 */
public class TheraphyDao {
    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


    /** * Hibernate SessionFactory Variable */

    public TheraphyDao() {
         //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();

    }


    public Theraphy addTherapyType(Theraphy therapy) {

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(therapy);

            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return therapy;
        }

    }


    public Theraphy addTherapyType1(Theraphy therapy) {

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(therapy);

            transaction.commit();
            
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return therapy;
        }

    }

    public Theraphy updateTherapyType(Theraphy therapy) {
          try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(therapy);
            transaction.commit();
            
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return therapy;
        }

    }

    public void deleteTherapyType(long therapyid) {
          try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Theraphy where therphyid="+therapyid);
         //   query.setParameter("businesstypeId",businesstypeId);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }


    public List<Theraphy> viewAllTherapyType() {
          
        List<Theraphy> results = new ArrayList<Theraphy>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Theraphy>) session.createQuery("From Theraphy where usefull is true order by therphyid ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }


    public Theraphy viewDetailsTherapyType(long id) {

         Theraphy therapyt = new Theraphy();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Theraphy as therapy where therapy.therphyid=" + id);
            therapyt = (Theraphy) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return therapyt;
    }


    public void deleteMultiple(List<Long> ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("update theraphy SET  usefull=false where therphyid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }



}
