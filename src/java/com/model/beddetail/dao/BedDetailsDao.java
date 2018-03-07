/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.beddetail.dao;

import com.model.beddetail.dto.Beddetails;
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
public class BedDetailsDao {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;
    SessionFactory sessionFactory;

    public BedDetailsDao() {

        //sessionFactory = HibernateUtil.getSessionFactory();
        session = HibernateUtil.openSession();
    }

    public Beddetails addBedSetup(Beddetails beddetails) {

        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(beddetails);

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return beddetails;
        }



    }

    public List<Beddetails> viewAllBeds() {

        List<Beddetails> results = new ArrayList<Beddetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Beddetails>) session.createQuery("From Beddetails  order by beddetailsid ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }

    public Beddetails viewDetailsofBed(long id) {

        Beddetails beddetail = new Beddetails();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Beddetails as bed where bed.beddetailsid=:id");
            query.setParameter("id", id);
            beddetail = (Beddetails) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return beddetail;
    }

    public void deleteMultiple(List<Long> ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("delete from Beddetails where beddetailsid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }

    public void deleteBedDetail(long bedeid) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("delete from Beddetails where beddetailsid=:bedeid");
            query.setParameter("bedeid", bedeid);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }

    public Beddetails updateBedSetup(Beddetails bedetailold) {
        System.out.println("updateeeeeeee");

        try {

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Beddetails  where beddetailsid= :beddetailsid");//+domainid1.getDomainid()
            query.setParameter("beddetailsid", bedetailold.getBeddetailsid());
            Beddetails bedetailnew = (Beddetails) query.uniqueResult();

            bedetailnew.setBuildingblock(bedetailold.getBuildingblock());
            bedetailnew.setFloorno(bedetailold.getFloorno());
            bedetailnew.setRoomno(bedetailold.getRoomno());
            bedetailnew.setRoomcode(bedetailold.getRoomcode());
            bedetailnew.setRoomtypevalue(bedetailold.getRoomtypevalue());
            bedetailnew.setRoomcharges(bedetailold.getRoomcharges());
            bedetailnew.setBedno(bedetailold.getBedno());
            bedetailnew.setBedcode(bedetailold.getBedcode());
            bedetailnew.setRoomndbedsetup(bedetailold.getRoomndbedsetup());

            session.update(bedetailnew);
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return new Beddetails();
        }

    }

    public List<Beddetails> searchByBedType(long id) {

        List<Beddetails> results = new ArrayList<Beddetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Beddetails bed  where bed.roomndbedsetup.roomtype.roomtypeid=:id");
            query.setParameter("id", id);
            results = (List<Beddetails>) query.list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }

    public List<Beddetails> searchByBedStatus(boolean status) {

        List<Beddetails> results = new ArrayList<Beddetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Beddetails bed  where bed.occupied=:status");
            query.setParameter("status", status);
            results = (List<Beddetails>) query.list();
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }
}
