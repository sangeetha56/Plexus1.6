/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inunitdispensedose.dao;

import com.model.inunitdispensedose.dto.Inunitdispensedose;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Administrator
 */
public class InUnitdispensedoseDAO {
      Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

      public InUnitdispensedoseDAO() {
        session=HibernateUtil.openSession();
    }

    public Inunitdispensedose create(Inunitdispensedose unitdispensedose) {


          try {
            transaction = session.beginTransaction();
            session.save(unitdispensedose);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        return unitdispensedose;
        
    }

}
