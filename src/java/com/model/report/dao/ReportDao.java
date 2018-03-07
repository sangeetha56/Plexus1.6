/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.report.dao;

import com.model.report.dto.Report;
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
public class ReportDao {

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

    public ReportDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();

    }
     /**
     * Saves Patient Object.
     * @param patient  Object of com.model.patient.dto.Patient
     * @return patient Object of com.model.patient.dto.Patient with generated ID
     */

    public Report create(Report report)
    {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(report);

            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return report;
        }
    }


     public Report readIndividualReport(long id) {
        
        Report report = new Report();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Report as report where report.reportid=" + id);
           
            report = (Report) query.uniqueResult();
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
            Query query=session.createQuery("delete from Report where reportid="+ id);
            //query.setParameterList("id",ids);
            //query.setParameter(id, id);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }

    }


     public Report updateReport(Report reportold)
    {


        try {

            transaction = session.beginTransaction();
            Query query=session.createQuery("From Report  where reportid= :reportold");//+domainid1.getDomainid()
            
            
            query.setParameter("reportold", reportold.getReportid());
            Report reportnew=(Report) query.uniqueResult();
            reportnew.setReportname(reportold.getReportname());
            reportnew.setReportdate(reportold.getReportdate());
            reportnew.setRemarks(reportold.getRemarks());
            reportnew.setObservation(reportold.getObservation());
            reportnew.setEpmty(reportold.getEpmty());
            reportnew.setPatient(reportold.getPatient());


            session.update(reportnew);
            transaction.commit();
            
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return new Report() ;
        }

    }





}
