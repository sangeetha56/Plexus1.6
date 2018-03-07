/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.user.dao;

import com.model.user.dto.User;
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
 * @author Mayur Mahale
 * @version 1.0
 * @since February 9th 2012
 */
public class UserDAO {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    SessionFactory sessionFactory;

    /** * Hibernate SessionFactory Variable */
    /**
     * Constructor UserDAO
     * Initializes sessionFactory
     *
     */
    public UserDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
        session=HibernateUtil.openSession();
    }

    /**
     *
     * @param userName User Login Name
     * @param password User Password
     * @return com.model.user.dto.User object w.r.t userName and  password.
     */
    public User readUniqueObject(String userName, String password) {
        User user = null;
        try {
            this.session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("from User as user where user.loginname= :loginName and user.password=:password");
            query.setParameter("loginName", userName);
            query.setParameter("password", password);
            user = (User) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return user;
        }

    }
    /**
     *
     */
    public void sessionClose(){
        HibernateUtil.closeSession();
    }
     public User create(User user1) {
       // System.out.println("Add in UserDAO");
       try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(user1);


            transaction.commit();
            //System.out.println("Add in UserDAO after Save");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return user1;

    }


    }
     public List<User> readListOfObjects() {
        List<User> results = new ArrayList<User>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<User>) session.createQuery("From User").list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            //session.close();
            return results;
        }
    }


     public void deleteMultiple(List<Long> ids) {

          try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from User where id IN (:ids)");
            query.setParameterList("ids",ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }


     public User readUniqueObject(long id) {
         User user = new User();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From User as user where user.id=" + id);
            user = (User) query.uniqueResult();
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return user;
    }

    public User update(User user) {

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From User  where id=:userID");
            query.setParameter("userID", user.getId());
            User usernew = (User)query.uniqueResult();
            usernew.setLoginname(user.getLoginname());
            usernew.setPassword(user.getPassword());
            usernew.setType(user.getType());

            session.update(usernew);


            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }
        //session.close();
        return new User();

    }


     public void deleteUser(Long id) {



       try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from User where id="+ id);
            //query.setParameterList("id",ids);
            //query.setParameter(id, id);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }

    }

   
}
