/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.bloodtransfucion.dao;

import com.model.bloodtransfucion.dto.Bloodtransfucion;


import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
/**
 *
 * @author ADIL KHAN B A
 */
public class bloodtransfucionDao {
    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;

    public bloodtransfucionDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Bloodtransfucion create(Bloodtransfucion consultant) {
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

    public List<Bloodtransfucion> readListOfObjects() {
        List<Bloodtransfucion> results = new ArrayList<Bloodtransfucion>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Bloodtransfucion>) session.createQuery("From Bloodtransfucion  order by id ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
    }

    }

    public Bloodtransfucion readUniqueObjectdetails(int id) {
        Bloodtransfucion consultant = new Bloodtransfucion();
        try {
            sessionFactory = HibernateUtil.getSessionFactory();
        session = HibernateUtil.openSession();
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Bloodtransfucion as cont where cont.id=" + id);
            consultant = (Bloodtransfucion) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return consultant;

    }

    public void deleteUser(int Id) {
        try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Bloodtransfucion where id="+ Id);
            //query.setParameterList("id",ids);
            //query.setParameter(id, id);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }

    }

    public List<Bloodtransfucion> contactListOfObjects() {
        List<Bloodtransfucion> results = new ArrayList<Bloodtransfucion>();

        try {
              sessionFactory = HibernateUtil.getSessionFactory();
               System.out.println("in kkkkk:-");
        session = HibernateUtil.openSession();
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Bloodtransfucion>) session.createQuery("From Bloodtransfucion").list();
 System.out.println("in mmmm:-");
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
