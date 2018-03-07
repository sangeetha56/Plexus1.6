/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.prescription.dao;

import com.model.prescription.dto.Prescription;
import com.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Administrator
 */
public class PrescriptionDAO {

    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    /**
     *
     */
    public PrescriptionDAO() {
        // this.sessionFactory = HibernateUtil.getSessionFactory();
        session = HibernateUtil.openSession();

    }

    /**
     *
     * @param prescription
     * @return
     */
    public Prescription create(Prescription prescription) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(prescription);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            return prescription;
        }

    }
    /**
     *
     * @return
     */
    public List<Prescription> readListofObjects(){
        List<Prescription> prescriptions = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Prescription");
            prescriptions = query.list();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        return prescriptions;

    }
}
