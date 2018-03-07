/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.rarelymedicine.dao;

import com.model.rarelymedicine.dto.Rarelyprescribedmedicine;
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
public class RarelyprescribedmedicineDao {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


    /** * Hibernate SessionFactory Variable */

    /**
     * Constructor PatientDAO
     * Initializes sessionFactory
     *
     */

    public RarelyprescribedmedicineDao() {

        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    /**
     * Saves Patient Object.
     * @param patient  Object of com.model.patient.dto.Patient
     * @return patient Object of com.model.patient.dto.Patient with generated ID
     */

    public List<Rarelyprescribedmedicine> loadallForeinkey() {
       // System.out.println("oh my god so much talking");
        List<Rarelyprescribedmedicine> results = new ArrayList<Rarelyprescribedmedicine>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            results = (List<Rarelyprescribedmedicine>) session.createQuery("From Rarelyprescribedmedicine").list();
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
