/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.biochemistry.dao;

import com.model.biochemistry.dto.Biochemistry;
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



/**
 *
 * @author ADIL KHAN B A
 */
public class biochemistryDao {
        Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


    public biochemistryDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Biochemistry create(Biochemistry consultant) {
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

    public List<Biochemistry> readListOfObjects() {
        List<Biochemistry> results = new ArrayList<Biochemistry>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Biochemistry>) session.createQuery("From Biochemistry  order by id ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
    }

    }

    public Biochemistry readUniqueObject(long id) {
         Biochemistry consultant = new Biochemistry();
        try {
            sessionFactory = HibernateUtil.getSessionFactory();
        session = HibernateUtil.openSession();
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Biochemistry as cont where cont.id=" + id);
            consultant = (Biochemistry) query.uniqueResult();
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
