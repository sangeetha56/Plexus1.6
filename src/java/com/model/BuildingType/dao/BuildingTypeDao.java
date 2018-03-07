/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.BuildingType.dao;

import com.model.BuildingType.dto.Buildingtypesetup;
import com.model.roomsetup.dto.Roomsetup;
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
 * @author INTEL
 */
public class BuildingTypeDao {

 Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;
    /** * Hibernate SessionFactory Variable */

    public BuildingTypeDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Buildingtypesetup create(Buildingtypesetup consultant) {

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

    public Buildingtypesetup create1(Buildingtypesetup consultant) {

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

    public Buildingtypesetup updateBuilding(Buildingtypesetup consultant) {

          try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(consultant);
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return consultant;
        }

    }

    public void deleteBuilding(long buildingid) {
          try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Buildingtypesetup where id="+buildingid);
         //   query.setParameter("businesstypeId",businesstypeId);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }


    public List<Buildingtypesetup> readListOfObjects() {

        List<Buildingtypesetup> results = new ArrayList<Buildingtypesetup>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Buildingtypesetup>) session.createQuery("From Buildingtypesetup  order by buildingid ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }


    public Buildingtypesetup readUniqueObject(long id) {

         Buildingtypesetup consultcy = new Buildingtypesetup();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Buildingtypesetup as consult where consult.buildingid=" + id);
            consultcy = (Buildingtypesetup) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return consultcy;
    }
     public Roomsetup valuechangeforselectroomforoomNdBeds(long buildgid,long floorno) {

          System.out.println("building in dao:-");

         Buildingtypesetup building = new Buildingtypesetup();
         Roomsetup roomstp=new Roomsetup();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("from Roomsetup roomstp where roomstp.buildingtypesetup.buildingid="+buildgid+" and roomstp.floorno="+floorno+" ");
            roomstp = (Roomsetup) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return roomstp;
    }


    public void deleteMultiple(List<Long> ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("delete from Buildingtypesetup   where buildingid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }



}
