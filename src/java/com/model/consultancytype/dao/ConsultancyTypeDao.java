/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.consultancytype.dao;

import com.model.consultancytype.dto.Consultancytype;
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
 * @author Admin
 */
public class ConsultancyTypeDao {
    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;
    /** * Hibernate SessionFactory Variable */
    
    public ConsultancyTypeDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Consultancytype create(Consultancytype consultant) {

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(consultant);

            transaction.commit();
          
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return consultant;
        }

    }

    public Consultancytype create1(Consultancytype consultant) {

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(consultant);

            transaction.commit();
          
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return consultant;
        }

    }

    public Consultancytype updateConsultancy(Consultancytype consultant) {
       
          try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(consultant);
            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return consultant;
        }

    }

    public void deleteConsultancy(long consultancytypeid) {
          try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Consultancytype where id="+consultancytypeid);
         //   query.setParameter("businesstypeId",businesstypeId);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }


    public List<Consultancytype> readListOfObjects() {
          
        List<Consultancytype> results = new ArrayList<Consultancytype>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Consultancytype>) session.createQuery("From Consultancytype where usefull is true  order by consultancyid ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }


    public Consultancytype readUniqueObject(long id) {

         Consultancytype consultcy = new Consultancytype();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Consultancytype as consult where consult.consultancyid=" + id);
            consultcy = (Consultancytype) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return consultcy;
    }


    public void deleteMultiple(List<Long> ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("update consultancytype SET  usefull=false where consultancyid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }



}
