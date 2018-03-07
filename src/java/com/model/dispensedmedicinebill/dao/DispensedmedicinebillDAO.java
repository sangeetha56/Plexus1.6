/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.dispensedmedicinebill.dao;
import com.model.dispensedmedicinebill.dto.Dispensedmedicinebill;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
/**
 *
 * @author Administrator
 */
public class DispensedmedicinebillDAO {
    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    /**
     *
     */
    public DispensedmedicinebillDAO() {
        session=HibernateUtil.openSession();
    }
    /**
     *
     * @param dispensedmedicinebill
     * @return
     */
    public Dispensedmedicinebill create(Dispensedmedicinebill dispensedmedicinebill){
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
