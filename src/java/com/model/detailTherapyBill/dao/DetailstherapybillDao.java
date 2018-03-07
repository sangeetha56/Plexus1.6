/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.detailTherapyBill.dao;


import com.model.detailTherapyBill.dto.Detailstherapybill;
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
public class DetailstherapybillDao {

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

    public DetailstherapybillDao() {
         //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();

    }
    public Detailstherapybill create(Detailstherapybill detailtherapybill) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(detailtherapybill);

            transaction.commit();
            System.out.println("in create of Detailstherapybill ");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return detailtherapybill;
        }
    }




}
