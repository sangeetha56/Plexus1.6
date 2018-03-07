/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.detailsOperationBill.dao;

import com.model.detailsOperationBill.dto.Detailsoperationbill;
import com.model.detailsOperationBill.dto.Detailsoperationbillchild;
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
public class DetailsOperationBillDao {

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



 public DetailsOperationBillDao() {
         //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();

    }

 

    public Detailsoperationbill create(Detailsoperationbill detailsoperationbill) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(detailsoperationbill);

            transaction.commit();
            System.out.println("in create of DetailsOperationbill ");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return detailsoperationbill;
        }
    }

    public Detailsoperationbillchild createchildBill(Detailsoperationbillchild detailsoperationbillchild) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(detailsoperationbillchild);

            transaction.commit();
            System.out.println("in create of detailsoperationbillchild ");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return detailsoperationbillchild;
        }
    }



}

