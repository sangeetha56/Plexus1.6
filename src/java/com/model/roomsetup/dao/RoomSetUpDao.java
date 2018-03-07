/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.roomsetup.dao;

import com.model.roomsetup.dto.Roomsetup;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;

/**
 *
 * @author kamal
 */
public class RoomSetUpDao {
     Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;
    /** * Hibernate SessionFactory Variable */

    public RoomSetUpDao() {
         //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Roomsetup addRoomSetUp(Roomsetup roomsetup)
    {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(roomsetup);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return roomsetup;
        }
    }

    public List<Roomsetup> viewAllRoomSetup() {

        List<Roomsetup> results = new ArrayList<Roomsetup>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Roomsetup>) session.createQuery("From Roomsetup  order by roomsetupid ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }


    public Roomsetup viewDetailsRoomSetUpType(long id) {

         Roomsetup consultcy = new Roomsetup();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Roomsetup as roomset where roomset.roomsetupid=" + id);
            consultcy = (Roomsetup) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return consultcy;
    }


    public void deleteMultiple(List<Long> ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("delete from Roomsetup where roomsetupid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }

    public void deleteRoomSetUp(long roomseuptypeid) {
          try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Roomsetup where roomsetupid="+roomseuptypeid);
         //   query.setParameter("businesstypeId",businesstypeId);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }

    public Roomsetup updateRoomSetup(Roomsetup roomsetupold) {
        System.out.println("updateeeeeeee");

          try {

            transaction = session.beginTransaction();
            Query query=session.createQuery("From Roomsetup  where roomsetupid= :roomsetupoldid");//+domainid1.getDomainid()


            query.setParameter("roomsetupoldid", roomsetupold.getRoomsetupid());
            Roomsetup roomsetupnew=(Roomsetup) query.uniqueResult();

            roomsetupnew.setRoomsetupid(roomsetupold.getRoomsetupid());
            roomsetupnew.setFloorno(roomsetupold.getFloorno());
            roomsetupnew.setNoofrooms(roomsetupold.getNoofrooms());
            roomsetupnew.setBuildingtypesetup(roomsetupold.getBuildingtypesetup());



            session.update(roomsetupnew);
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return new Roomsetup() ;
        }

    }



}
