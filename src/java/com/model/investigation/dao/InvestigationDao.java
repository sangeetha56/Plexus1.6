/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.investigation.dao;

import com.model.investigation.dto.Investigation;
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
public class InvestigationDao {
   Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


    /** * Hibernate SessionFactory Variable */

    public InvestigationDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
          session=HibernateUtil.openSession();
    }


    public Investigation create(Investigation investname) {

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(investname);

            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return investname;
        }

    }

    public Investigation create1(Investigation investname1) {

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(investname1);

            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return investname1;
        }

    }

    public void deleteInvestigationName(long investid) {
        try {
            transaction=session.beginTransaction();
           
            Query query=session.createQuery("delete from Investigation where id="+investid);
           
            query.executeUpdate();
           
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }

    
    public Investigation updateInvestigationName(Investigation invest) {
       try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(invest);
            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return invest;
        }
    }

    public List<Investigation> viewAllInvestigationType() {
           
        List<Investigation> results = new ArrayList<Investigation>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Investigation>) session.createQuery("From Investigation where usefull is true  order by investigationid ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }


    public Investigation viewDetailsInvestigationType(long id) {

         Investigation investig = new Investigation();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Investigation as inves where inves.investigationid=" + id);
            investig = (Investigation) query.uniqueResult();
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
            Query query = session.createSQLQuery("update investigation SET  usefull=false where investigationid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }

}
