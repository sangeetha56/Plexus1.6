/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.detailInvestigationBill.dao;


import com.model.detailInvestigationBill.dto.Detailsinvestigationbill;
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
public class DetailsinvestigationbillDao {
    
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

    public DetailsinvestigationbillDao() {
         //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();

    }

    public Detailsinvestigationbill create(Detailsinvestigationbill detailinvestigationbill) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(detailinvestigationbill);

            transaction.commit();
            System.out.println("in create of Detailsinvestigationbill ");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return detailinvestigationbill;
        }
    }



}
