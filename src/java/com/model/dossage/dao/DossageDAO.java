/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.dossage.dao;

import com.model.dossage.dto.Dossage;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
 
/**
 *
 * @author Administrator
 */
public class DossageDAO {
    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    /**
     *
     */
    public DossageDAO() {
        //this.sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }
    /**
     *
     * @param dossage
     * @return
     */
    public Dossage create(Dossage dossage){
        try {
            //this.session=sessionFactory.openCurrentSession();
            this.transaction=session.beginTransaction();
            session.save(dossage);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            return dossage;
        }
        
    }


}
