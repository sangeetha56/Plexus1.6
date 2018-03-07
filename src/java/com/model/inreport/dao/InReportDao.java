/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inreport.dao;

import com.model.inreport.dto.Inreport;
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
 * @author sultan
 */
public class InReportDao {
    
    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


    /** * Hibernate SessionFactory Variable */

    /**
     * Constructor PatientDAO
     * Initializes sessionFactory
     *
     */

    public InReportDao() {
         //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();

    }

    /**
     * Saves Patient Object.
     * @param patient  Object of com.model.patient.dto.Patient
     * @return patient Object of com.model.patient.dto.Patient with generated ID
     */

    public Inreport create(Inreport inreport) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(inreport);

            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return inreport;
        }
    }


     public Inreport readIndividualReport(long id) {
       
        Inreport report = new Inreport();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Inreport as report where report.inreportid=" + id);
           
            report = (Inreport) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return report;
    }


     public void deleteReport(String id) {

       

       try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Inreport where inreportid="+ id);
            //query.setParameterList("id",ids);
            //query.setParameter(id, id);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }

    }


     public Inreport updateReport(Inreport inreportold)
    {


        try {

            transaction = session.beginTransaction();
            Query query=session.createQuery("From Inreport  where inreportid= :inreportold");
           
            query.setParameter("inreportold", inreportold.getInreportid());
            Inreport inreportnew=(Inreport) query.uniqueResult();
            inreportnew.setInreportname(inreportold.getInreportname());
            inreportnew.setInreportdate(inreportold.getInreportdate());
            inreportnew.setInremarks(inreportold.getInremarks());
            inreportnew.setInobservation(inreportold.getInobservation());
            inreportnew.setReportimage(inreportold.getReportimage());
            inreportnew.setInpatient(inreportold.getInpatient());


            session.update(inreportnew);
            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return new Inreport() ;
        }

    }




}
