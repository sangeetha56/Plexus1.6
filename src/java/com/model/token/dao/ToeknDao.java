/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.token.dao;

import com.model.token.dto.Tokenlist;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author kamal
 */
public class ToeknDao {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */


    SessionFactory sessionFactory;


    /** * Hibernate SessionFactory Variable */
    public ToeknDao() {
         //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public int readMaxTokenNo(Date tdate) {

        int maxtoken=0;

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            String stno =(String) session.createQuery("SELECT max(tokenno) FROM Tokenlist where tdate='"+tdate+"'").uniqueResult().toString();
            maxtoken = Integer.parseInt(stno);
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return maxtoken;
        }

    }

    public Tokenlist saveToken(Tokenlist token) {

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(token);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return token;
        }

    }


    public List<Tokenlist> issuedtokenListByDate(Date startDate,Date endDate) {

        List<Tokenlist> issuedtoken = new ArrayList<Tokenlist>();
        try {
            transaction = session.beginTransaction();

            Query query = session.createQuery("From Tokenlist where tdate Between  :from AND :to");
            query.setParameter("from", startDate);
            query.setParameter("to", endDate);

            issuedtoken = (List<Tokenlist>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return issuedtoken;
        }
    }





}
