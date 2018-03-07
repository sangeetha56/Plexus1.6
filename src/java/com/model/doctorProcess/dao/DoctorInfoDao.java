/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.doctorProcess.dao;

import com.model.department.dto.Departmentname;
import com.model.doctorProcess.dto.Doctorinfo;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.Query;

/**
 *
 * @author Admin
 */
public class DoctorInfoDao {
    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;
    /** * Hibernate SessionFactory Variable */
    
    public DoctorInfoDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    public Doctorinfo create(Doctorinfo doctor) {
 try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(doctor);

            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return doctor;
        }
    }
    
    public List<Doctorinfo> readListOfObjects() {
           
        List<Doctorinfo> results = new ArrayList<Doctorinfo>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<Doctorinfo>) session.createQuery("From Doctorinfo where usefull is true order by doctid ASC").list();

            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }

    public Doctorinfo readUniqueObject(long id) {

         Doctorinfo doctor = new Doctorinfo();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From Doctorinfo as doctor where doctor.id=" + id);
            doctor = (Doctorinfo) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return doctor;
    }

    public Doctorinfo update(Doctorinfo doctor) {

          try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(doctor);
            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return doctor;
        }

    }

    public void deleteDoctor(String id) {

       try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Doctorinfo where doctid="+ id);
            //query.setParameterList("id",ids);
            //query.setParameter(id, id);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }

    }


    public void deleteMultiple(List<Long> ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("update doctorinfo SET  usefull=false where doctid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }


    public String readDoctorName(long id) {

        String dctname=null;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            dctname = (String)session.createSQLQuery("SELECT doctname  FROM  departmentname dpt join doctorinfo doc on dpt.departmentnameid=doc.departmentnameid   where doc.doctid=" + id).uniqueResult().toString();
          
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return dctname;
    }


    public String readDepartmentName(long id) {

        String dprtname=null;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            dprtname = (String)session.createSQLQuery("SELECT dptname  FROM  departmentname dpt join doctorinfo doc on dpt.departmentnameid=doc.departmentnameid   where doc.doctid=" + id).uniqueResult().toString();
           
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return dprtname;
    }

    



}
