/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.therapybill.dao;
import com.model.therapy.dto.Theraphy;
import com.model.therapybill.dto.Therapybill;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
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
public class TherapybillDao {
    
     Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;

    SessionFactory sessionFactory;


    /** * Hibernate SessionFactory Variable */

    public TherapybillDao() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }


    public Therapybill addTherapyBill(Therapybill therapybill) {

           try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(therapybill);

            transaction.commit();
           
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return therapybill;
        }

    }


    public List<Therapybill> showTodaysTherapyBills(Date fromDate, Date toDate) {
        List<Therapybill> therapybill = new ArrayList<Therapybill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Therapybill where therapybilldate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            therapybill = (List<Therapybill>) query.list();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return therapybill;

        }

    }
    /**
     *
     * @param id
     * @return
     */
    public Therapybill readUniqueObject(long id) {
        Therapybill therapy = new Therapybill();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Therapybill where therapybillid= :id ");
            query.setParameter("id", id);
            therapy = (Therapybill) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException e)
        {
            transaction.rollback();
        } finally {
            //session.close();
            return therapy;
        }
    }

    public List<Therapybill> showTherapyBillsByDate(Date createddate) {
       
        List<Therapybill> therapy = new ArrayList<Therapybill>();
        try {
            transaction = session.beginTransaction();

            Query query = session.createQuery("From Therapybill where therapybilldate=:createddate");
            query.setParameter("createddate", createddate);

            therapy = (List<Therapybill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException)
        {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return therapy;
        }
    }


    public List<Therapybill> showBetweenDateTherapyBills(Date consulntfirstDate,Date consulntsecondDate) {
      
        List<Therapybill> therapy = new ArrayList<Therapybill>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Therapybill where therapybilldate Between  :from AND :to");
            query.setParameter("from", consulntfirstDate);
            query.setParameter("to", consulntsecondDate);
            therapy = (List<Therapybill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return therapy;
        }
    }


     public List<Therapybill> showTherapyForThisMonth(Date consulntfirstDate,Date consulntsecondDate) {
     
        List<Therapybill> therapy = new ArrayList<Therapybill>();
        try {
            transaction = session.beginTransaction();
            //Query query = session.createQuery("From Dispense where dispensedate = :from ");
            Query query = session.createQuery("From Therapybill where therapybilldate Between  :from AND :to");
            query.setParameter("from", consulntfirstDate);
            query.setParameter("to", consulntsecondDate);
            therapy = (List<Therapybill>) query.list();

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return therapy;
        }
    }

     public List<Therapybill> dialySalesReportConsultationCharges(Date fromDate, Date toDate) {
        List<Therapybill> visits = new ArrayList<Therapybill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Therapybill where createddate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            visits = (List<Therapybill>) query.list();
            Iterator<Therapybill> iterator = visits.iterator();
           
            while (iterator.hasNext()) {
                Therapybill charges = iterator.next();
               
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return visits;

        }

    }

     public List<Therapybill> dialySalesReportConsultationChargesSum(Date fromDate, Date toDate) {
        List<Therapybill> visits = new ArrayList<Therapybill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("select sum(consultationcharges) From Therapybill where createddate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            visits = (List<Therapybill>) query.list();
            Iterator<Therapybill> iterator = visits.iterator();
           
            while (iterator.hasNext()) {
                Therapybill charges = iterator.next();
               
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
        } finally {
            //session.close();
            return visits;

        }

    }

     public List<Therapybill> readListOfObjectsAmount(Date fromDate, Date toDate) {
        List<Therapybill> visits = new ArrayList<Therapybill>();
        try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery("Select * From Therapybill where createddate Between  :from AND :to ");
            query.setParameter("from", fromDate);
            query.setParameter("to", toDate);

            visits = (List<Therapybill>) query.list();
            Iterator<Therapybill> iterator = visits.iterator();
            
            while (iterator.hasNext()) {
                Therapybill charges = iterator.next();
                
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            e.printStackTrace();
        } finally {
            //session.close();
            return visits;

        }

    }

     public List<Theraphy> readListOfObjects() {
       
        List<Theraphy> results = new ArrayList<Theraphy>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            results = (List<Theraphy>) session.createQuery("From Theraphy").list();
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
