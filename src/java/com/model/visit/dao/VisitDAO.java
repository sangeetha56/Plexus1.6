/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.visit.dao;

import com.model.patient.dto.Patient;
import com.model.visit.dto.Visit;
import com.util.DateUtil;
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
 * @author Mayur Mahale
 * @version 1.0
 * @since February 9th 2012
 */
public class VisitDAO {

    Session session = null;
    Transaction transaction = null;
    Transaction transaction1;
    SessionFactory sessionFactory;

    /**
     * Constructor VisitDAO
     * Initializes sessionFactory
     *
     */
    public VisitDAO() {
       // sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();

    }

    /**
     *
     * Saves Visit object.
     * @param visit  Object of com.model.visit.dto.Visit
     * @return visit Object of com.model.visit.dto.Visit with generated ID
     */
    public Visit create(Visit visit) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(visit);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return visit;
        }

    }

    /**
     *
     * @param visit
     * @return
     */
    public Visit update(Visit visit) {
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Visit where id= :id");
            query.setParameter("id", visit.getId());
           
            Visit newvisit = (Visit) query.uniqueResult();
           
            newvisit.setRemarks(visit.getRemarks());
            newvisit.setBp(visit.getBp());
            newvisit.setDiagnosis(visit.getDiagnosis());
            newvisit.setInvestigation(visit.getInvestigation());
            newvisit.setPatientrating(visit.getPatientrating());
            newvisit.setPulse(visit.getPulse());
            newvisit.setRr(visit.getRr());
            newvisit.setStatus(visit.getStatus());
            newvisit.setTreatment(visit.getTreatment());
            newvisit.setFinaldiagnosis(visit.getFinaldiagnosis());
            
            session.update(newvisit);
            transaction.commit();

        } catch (HibernateException hibernateException) {
        } finally {
            return new Visit();
        }
    }
    /**
     *
     * @param visit
     * @param reschedule
     * @return
     */
    public Visit update(Visit visit,boolean reschedule) {
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Visit where id= :id");
            query.setParameter("id", visit.getId());
            
            Visit newvisit = (Visit) query.uniqueResult();
            
            newvisit.setRemarks(visit.getRemarks());
            newvisit.setBp(visit.getBp());
            newvisit.setDiagnosis(visit.getDiagnosis());
            newvisit.setInvestigation(visit.getInvestigation());
            newvisit.setPatientrating(visit.getPatientrating());
            newvisit.setPulse(visit.getPulse());
            newvisit.setRr(visit.getRr());
            newvisit.setStatus(visit.getStatus());
            newvisit.setTreatment(visit.getTreatment());
            newvisit.setVisittime(visit.getVisittime());
            newvisit.setRemindertime(visit.getRemindertime());
            session.update(newvisit);
            transaction.commit();

        } catch (HibernateException hibernateException) {
        } finally {
            return new Visit();
        }
    }

    /**
     *
     * @param date
     * @return List of com.model.visit.dto.Visit objects containing all visit information of particular date.
     */
    public List<Visit> readListOfObjects(Date date) {
        List<Visit> visits = new ArrayList<Visit>();
        Date tomorrowsDate = DateUtil.tomorrowsDate(date);
        visits = readListOfObjects(date, tomorrowsDate);
        return visits;
    }

    /**
     *
     * @param patient
     * @param status
     * @return
     */
    public Visit readObject(Patient patient, Boolean status) {
        Visit visit = new Visit();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Visit where patient= :patient AND status=:status");
            query.setParameter("patient", patient);
            query.setParameter("status", status);
            visit = (Visit) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();

            return visit;
        }
    }

    /**
     *
     * @param fromDate
     * @param toDate
     * @return List of com.model.visit.dto.Visit objects containing all visit information between date range.
     */
    public List<Visit> readListOfObjects(Date fromDate, Date toDate) {
        List<Visit> visits = new ArrayList<Visit>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Visit where visittime Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);
            
            visits = (List<Visit>) query.list();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return visits;

        }

    }

    /**
     *
     * @param visitid
     */
    public void delete(long visitid) {
        try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Visit where id =:id");
            query.setParameter("id",visitid);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }
}
