/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.company.dao;

import com.model.company.dto.Company;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Mayur
 * @version 1.0
 * @since February 9th 2012
 */
public class CompanyDAO {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    SessionFactory sessionFactory;

    /** * Hibernate SessionFactory Variable */
    /**
     * Constructor CompanyDAO
     * Initializes sessionFactory
     *
     */
    public CompanyDAO() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    /**
     *
     * @param company
     * @return
     */
    public Company create(Company company) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(company);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            return company;
        }

    }
    /**
     *
     * @return
     */
    public List<Company> readListofObjects(){
        List resList=new ArrayList();
        List<Company> results=new ArrayList<Company>();
        try {
            //this.session=sessionFactory.openCurrentSession();
            this.transaction=session.beginTransaction();
            results=(List<Company>)session.createQuery("From Company").list();
            
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
    public Company readUniqueObject(long id) {
        Company company=new Company();
        try {
            //this.session=sessionFactory.openCurrentSession();
            this.transaction=session.beginTransaction();
            company=(Company)session.createQuery("From Company as company where company.id=:id").setParameter("id", id).uniqueResult();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        }
        finally{
            return company;
        }
    }
    
}


