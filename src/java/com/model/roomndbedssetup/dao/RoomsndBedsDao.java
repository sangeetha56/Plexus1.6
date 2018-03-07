/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.roomndbedssetup.dao;

import com.model.roomndbedssetup.dto.Roomndbedsetup;
import com.util.HibernateUtil;
import java.util.ArrayList;
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
public class RoomsndBedsDao {
    
     Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;
    /** * Hibernate SessionFactory Variable */

    public RoomsndBedsDao() {

        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }




    public Roomndbedsetup addRoomndBedSetup(Roomndbedsetup roomndbedsetup) {

        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(roomndbedsetup);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return roomndbedsetup;
        }



    }

    public List<Roomndbedsetup> viewAllRoomndBeds() {

        List<Roomndbedsetup> results = new ArrayList<Roomndbedsetup>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Roomndbedsetup>) session.createQuery("From Roomndbedsetup  order by roomndbedsetupid ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }


    public Roomndbedsetup viewDetailsRoomndBeds(long id) {

         Roomndbedsetup roomndbeds = new Roomndbedsetup();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Roomndbedsetup as roombedset where roombedset.roomndbedsetupid=:id");
            query.setParameter("id", id);
            roomndbeds = (Roomndbedsetup) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return roomndbeds;
    }


    public void deleteMultiple(List<Long> ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("delete from Roomndbedsetup where roomndbedsetupid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }

    public void deleteRoomNdBed(long roomndBedeid) {
          try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Roomndbedsetup where roomndbedsetupid=:roomndBedeid");
            query.setParameter("roomndBedeid",roomndBedeid);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }

    public Roomndbedsetup updateRoomNdBedSetup(Roomndbedsetup roomndbedsetupold) {
        System.out.println("updateeeeeeee");

          try {

            transaction = session.beginTransaction();
            Query query=session.createQuery("From Roomndbedsetup  where roomndbedsetupid= :roomNdBedsetupoldid");//+domainid1.getDomainid()
            query.setParameter("roomNdBedsetupoldid", roomndbedsetupold.getRoomndbedsetupid());
            Roomndbedsetup roomndbedsetupnew=(Roomndbedsetup) query.uniqueResult();

            roomndbedsetupnew.setFloorno(roomndbedsetupold.getFloorno());
            roomndbedsetupnew.setRoomno(roomndbedsetupold.getRoomno());
            roomndbedsetupnew.setRoomtypevalue(roomndbedsetupold.getRoomtypevalue());
            roomndbedsetupnew.setNoofbeds(roomndbedsetupold.getNoofbeds());
            roomndbedsetupnew.setRoomcode(roomndbedsetupold.getRoomcode());
            roomndbedsetupnew.setRoomcharges(roomndbedsetupold.getRoomcharges());
            roomndbedsetupnew.setRoomtype(roomndbedsetupold.getRoomtype());
            roomndbedsetupnew.setRoomsetup(roomndbedsetupold.getRoomsetup());
            
            session.update(roomndbedsetupnew);
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return new Roomndbedsetup() ;
        }

    }

}
