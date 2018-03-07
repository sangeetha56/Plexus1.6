/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.licenceInfo.dao;

import com.model.licenceInfo.dto.Licenceinfo;
import com.util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.HibernateException;

/**
 *
 * @author Admin
 */
public class LicenceInfoDao {
    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;
    /** * Hibernate SessionFactory Variable */

    public LicenceInfoDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }
    public Licenceinfo addLicence(Licenceinfo licenceinfo) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(licenceinfo);


            transaction.commit();
          
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return licenceinfo;
        }
    }

    public List<Licenceinfo> viewLicence()
  {

        
        List<Licenceinfo> results = new ArrayList<Licenceinfo>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Licenceinfo>) session.createQuery("From Licenceinfo order by id ASC").list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }

    }
    public Licenceinfo viewLicenceDetails(long id) {
        Licenceinfo licence = new Licenceinfo();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Licenceinfo as licence where licence.id=" + id);
            licence = (Licenceinfo) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return licence;
    }

    public void deleteLicence(String id)
    {


       try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Licenceinfo where licenceid="+id);
            //query.setParameterList("id",ids);
            //query.setParameter(id, id);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }

    }

    public Licenceinfo updateLicence(Licenceinfo licence) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(licence);
            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return licence;
        }
    }



}
