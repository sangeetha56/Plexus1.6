/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.unitdispensedose.dao;
import com.model.unitdispensedose.dto.Unitdispensedose;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
/**
 *
 * @author Administrator
 */
public class UnitdispensedoseDAO {
    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    /**
     *
     */
    public UnitdispensedoseDAO() {
        session=HibernateUtil.openSession();
    }
    /**
     *
     * @param unitdispensedose
     * @return
     */
    public Unitdispensedose create(Unitdispensedose unitdispensedose){
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
