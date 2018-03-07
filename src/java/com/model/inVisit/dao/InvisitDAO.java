/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model.inVisit.dao;

import com.model.inVisit.dto.Invisit;
import com.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Administrator
 */
public class InvisitDAO {

      Session session = null;
    Transaction transaction = null;
    Transaction transaction1;
    SessionFactory sessionFactory;

      public InvisitDAO() {
       // sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();

    }

    public Invisit create(Invisit visit) {
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

    public Invisit update(Invisit visit) {


         try {
            //session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Invisit where id= :id");
            query.setParameter("id", visit.getId());
            //System.out.println("id " + visit.getId());
            Invisit newvisit = (Invisit) query.uniqueResult();
            //System.out.println("id " + newvisit.getId());
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
            newvisit.setManagementplan(visit.getManagementplan());
            newvisit.setTime(visit.getTime());
            newvisit.setCountid(visit.getCountid());

            session.update(newvisit);
            transaction.commit();

        } catch (HibernateException hibernateException) {
        } finally {
            return new Invisit();
        }
    }

    public void delete(long visitid) {
         try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Invisit where id =:id");
            query.setParameter("id",visitid);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }

    public Invisit delete(Invisit visit) {
         try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Invisit where id =:id");
           query.setParameter("id",visit.getId());
       
           query.executeUpdate();
          //  session.delete(visit);
            transaction.commit();

        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
finally {
            return new Invisit();
        }
    }

}
