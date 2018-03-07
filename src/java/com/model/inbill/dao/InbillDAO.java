/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inbill.dao;

import com.model.inbill.dto.Inbill;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Administrator
 */
public class InbillDAO {
     Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

     public InbillDAO() {
        this.session = HibernateUtil.openSession();
    }

    public Inbill create(Inbill bill) {


         try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(bill);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return bill;
        }

    }

}
