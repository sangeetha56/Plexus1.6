/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.lab.dao;
import com.model.lab.dto.Lab;
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
 * @author Admin
 */
public class LabDao {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


    public LabDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Lab create(Lab consultant) {
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

    public List<Lab> readListOfObjects() {
        List<Lab> results = new ArrayList<Lab>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Lab>) session.createQuery("From LAB  order by id ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
    }

    }

    public Lab readUniqueObject(long id) {
         Lab consultant = new Lab();
        try {
            sessionFactory = HibernateUtil.getSessionFactory();
            session = HibernateUtil.openSession();
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From LAB as cont where cont.id=" + id);
            consultant = (Lab) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {

            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return consultant;

    }
}
