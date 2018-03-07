/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.redispensedmedicinebill.dao;

import com.model.redispensedmedicinebill.dto.Redispensedmedicinebill;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
/**
 *
 * @author Admin
 */
public class RedispensedmedicinebillDao {
    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

     public RedispensedmedicinebillDao() {
        session=HibernateUtil.openSession();
    }

    public Redispensedmedicinebill create(Redispensedmedicinebill redispensedmedicinebill) {
        try {
            transaction = session.beginTransaction();
            session.save(redispensedmedicinebill);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        return redispensedmedicinebill;

    }

}
