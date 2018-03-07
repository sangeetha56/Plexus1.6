/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.vendor.dao;
import com.model.vendor.dto.Vendor;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Administrator
 */
public class VendorDAO {
    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    /**
     *
     */
    public VendorDAO() {
        //this.sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();

    }
    /**
     *
     * @param vendor
     * @return
     */
    public Vendor create(Vendor vendor) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(vendor);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            return vendor;
        }

    }
    /**
     *
     * @return
     */
    public List<Vendor> readListOfObjects(){
        List<Vendor> results=new ArrayList<Vendor>();
        try {
            //this.session=sessionFactory.openCurrentSession();
            transaction=session.beginTransaction();
            results=(List<Vendor>)session.createQuery("From Vendor").list();
            transaction.commit();


        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            
            return results;

        }
        

    }
    /**
     *
     * @param id
     * @return
     */
    public Vendor readUniqueObject(long id){
        Vendor vendor=new Vendor();
        try {
            //this.session=sessionFactory.openCurrentSession();
            this.transaction=session.beginTransaction();
            vendor=(Vendor)session.createQuery("From Vendor as vendor where vendor.id=:id").setParameter("id", id).uniqueResult();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
            
        }
        finally{
            return vendor;
        }

    }
    /**
     *
     * @param vendor
     * @return
     */
    public Vendor update(Vendor vendor) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(vendor);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            return vendor;
        }

    }


}
