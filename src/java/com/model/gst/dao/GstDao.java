/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.gst.dao;

import com.model.gst.dto.Gst;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Admin
 */
public class GstDao {
  Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;

  public GstDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Gst create(Gst consultant) {
    try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(consultant);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return consultant;
        }



    }

}
