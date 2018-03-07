/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.reunitdispensedose.dao;

import com.model.reunitdispensedose.dto.Reunitdispensedose;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Admin
 */
public class ReunitdispensedoseDao {
    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    public ReunitdispensedoseDao() {
        session=HibernateUtil.openSession();
    }

    public Reunitdispensedose create(Reunitdispensedose reunitdispensedose) {
        try {
            transaction = session.beginTransaction();
            session.save(reunitdispensedose);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        return reunitdispensedose;
    }

        
    }


