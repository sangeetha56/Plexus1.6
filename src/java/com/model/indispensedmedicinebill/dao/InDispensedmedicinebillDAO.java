/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.indispensedmedicinebill.dao;

import com.model.indispensedmedicinebill.dto.Indispensedmedicinebill;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Administrator
 */
public class InDispensedmedicinebillDAO {
      Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

     public InDispensedmedicinebillDAO() {
        session=HibernateUtil.openSession();
    }

    public Indispensedmedicinebill create(Indispensedmedicinebill dispensedmedicinebill) {

        try {
            transaction = session.beginTransaction();
            session.save(dispensedmedicinebill);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        return dispensedmedicinebill;
        
    }

}
