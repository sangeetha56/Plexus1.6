/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.nationality.dao;

import com.model.nationality.dto.Nationality;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Mayur
 * @version 1.0
 * @since February 9th 2012
 */
public class NationalityDAO {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
     /** * Hibernate Transaction Variable */
    
    SessionFactory sessionFactory;
    /** * Hibernate SessionFactory Variable */

    /**
     * Constructor NationalityDAO
     * Initializes sessionFactory
     *
     */
    public NationalityDAO() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    /**
     *
     * @return List of com.model.nationality.dto.Nationality Objects containing all nationality names.
     */
    public List<Nationality> readListOfObjects() {
        List<Nationality> results = new ArrayList<Nationality>();
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            results = (List<Nationality>) session.createCriteria(Nationality.class).list();
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


