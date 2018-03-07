/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.stock.dao;

import com.model.medicine.dto.AvailableMedicine;
import com.model.stock.dto.Stock;
import com.util.DateUtil;
import com.util.HibernateUtil;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Mayur
 * @version 1.0
 * @since February 9th 2012
 */
public class StockDAO {

    Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    SessionFactory sessionFactory;

    /** * Hibernate SessionFactory Variable */
    /**
     * Constructor StockDAO
     * Initializes sessionFactory
     *
     */
    public StockDAO() {
        //sessionFactory = HibernateUtil.getSessionFactory();
        session = HibernateUtil.openSession();

    }

    /**
     *
     * @param stock
     * @return
     */
    public Stock create(Stock stock) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(stock);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return stock;
        }

    }

    /**
     *
     * @param id
     * @return
     */
    public Stock readUniqueObject(Long id) {
        Stock stock = new Stock();
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Stock as stock where stock.id=" + id);
            stock = (Stock) query.uniqueResult();
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            return stock;
        }
    }

    /**
     *
     * @param stock
     * @return
     */
    public Stock update(Stock stock) {
        Stock newStock = new Stock();
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Stock as stock where stock.id=" + stock.getId());
            newStock = (Stock) query.uniqueResult();
            newStock.setAvailablestock(stock.getAvailablestock());
            newStock.setCreationdate(stock.getCreationdate());
            newStock.setExpirydate(stock.getExpirydate());
            newStock.setManufacturedate(stock.getManufacturedate());
            newStock.setBatchno(stock.getBatchno());
            session.update(newStock);
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {

            return newStock;
        }
    }

    /**
     *
     * @param id
     */
    public void delete(long id) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("delete from Stock where id =:id");
            query.setParameter("id", id);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }
    }

    /**
     *
     * @return
     */
    public BigInteger countExpiringStock() {
      
        transaction = session.beginTransaction();
        Query query = session.createSQLQuery("select count(*) From Stock where ( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) )");
        //Query query=session.createSQLQuery("Select count(*) from Stock where (expirydate <= current_date) OR expirydate between current_date AND (current_date+ ( interval '3 months'))");
        java.math.BigInteger expiredStockCount = (java.math.BigInteger) query.uniqueResult();
        return expiredStockCount;
    }

    /**
     *
     * @return
     */
    public BigInteger countDepletingStock() {
       
        transaction = session.beginTransaction();
        Query query = session.createSQLQuery("Select count(*) from Stock where availablestock <= 10");
        java.math.BigInteger expiredStockCount = (java.math.BigInteger) query.uniqueResult();
        return expiredStockCount;
    }

    public BigInteger countRarePrescribedMedicineStock(Date d1) {
       
        transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT count(*)  FROM stock join medicine on medicine.id= stock.medicineid where medicine.lastaccessdate  < :from");
        query.setParameter("from", d1);
        java.math.BigInteger expiredStockCount = (java.math.BigInteger) query.uniqueResult();
        return expiredStockCount;
    }

    /**
     *
     * @return
     */
    public List<Stock> expiringStock() {
        transaction = session.beginTransaction();
        Query query = session.createSQLQuery("select *  From Stock where ( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) order by expirydate").addEntity(Stock.class);
//        Query query=session.createQuery("From Stock where (expirydate <= current_date) OR expirydate between current_date AND :to_date");
//        query.setParameter("to_date", DateUtil.forwardMonths(DateUtil.todaysDate(), 3));
        List<Stock> stocks = (List<Stock>) query.list();

        return stocks;
    }

    public int expiringStockCount() {
        int totalnoofrecord = 0;


        transaction = session.beginTransaction();
        String query1 = (String) session.createSQLQuery("select count(*)  From Stock where ( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) )").uniqueResult().toString();
        totalnoofrecord = Integer.parseInt(query1);

        return totalnoofrecord;
    }

    /**
     *
     * @return
     */
    public List<Stock> DepletingStock() {
        transaction = session.beginTransaction();
        Query query = session.createQuery("From Stock where availablestock <= 10");
        List<Stock> stocks = (List<Stock>) query.list();
        return stocks;
    }

    /**
     *
     * @param medicineId
     * @return
     */
    public List<Stock> getAvailableStock(Long medicineId) {
        transaction = session.beginTransaction();
        Query query = session.createSQLQuery("select * from public.stock stock0_ left outer join public.medicine medicine1_ on stock0_.medicineid=medicine1_.id where availablestock > 0 and medicineid=:medicineId and (( (date_part('month',  expirydate) >= date_part('month',  current_date)) and (date_part('year',  expirydate) = date_part('year',  current_date)) ) or ((date_part('year',  expirydate) > date_part('year',  current_date))))  order by expirydate").addEntity(Stock.class);
        //Query query=session.createSQLQuery("select * from public.stock stock0_ left outer join public.medicine medicine1_ on stock0_.medicineid=medicine1_.id where  (date_part('month',  expirydate) >= date_part('month',  current_date)) and (date_part('year',  expirydate) >= date_part('year',  current_date)) and availablestock > 0 and medicineid=:medicineId order by expirydate").addEntity(Stock.class);
//        Query query=session.createQuery("select stock From Stock stock left join stock.medicine where stock.medicine.id=:medicineId and availablestock > 0 and (expirydate > :from_date) order by expirydate,manufacturedate");
//        query.setParameter("from_date", DateUtil.forwardMonths(DateUtil.todaysDate(), 2));
        query.setParameter("medicineId", medicineId);
        List<Stock> stocks = (List<Stock>) query.list();
        return stocks;
    }
    //select stock From Stock stock left join stock.medicine where stock.medicine.id='394' and availablestock > 0 order by expirydate,manufacturedate

    public List<Stock> readAllStock(Date d1) {
       
        List<Stock> results = new ArrayList<Stock>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createSQLQuery(" SELECT *  FROM stock join medicine on medicine.id= stock.medicineid where medicine.lastaccessdate  < :from");
            //results = (List<Medicine>) session.createQuery("From Medicine where lastaccessdate < '2014-06-01' "); '2014-06-01'
            query.setParameter("from", d1);
            results = (List<Stock>) query.list();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public List<Stock> viewAllRareMedicine(Date d1) {
        
        transaction = session.beginTransaction();
        Query query = session.createSQLQuery("SELECT *  FROM stock join medicine on medicine.id= stock.medicineid where medicine.lastaccessdate  < :from").addEntity(Stock.class);
        query.setParameter("from", d1);
        List<Stock> stocks = (List<Stock>) query.list();
       
        transaction.commit();

        return stocks;
    }

    public List<Stock> readListOfObjects1(int pageNo, int noOfRecordsPerPage, String alphabit) {
        List<Stock> results = new ArrayList<Stock>();
        try {

            
            if (alphabit.equalsIgnoreCase("null")) {
                
                transaction = session.beginTransaction();
              
                Query query = session.createQuery("From Stock ");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
               
                results = (List<Stock>) query.list();
                
            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("FROM Stock st   where (st.medicine.name like :alphabitupper or st.medicine.name like :alphabitlower) ");
                query.setParameter("alphabitupper", alphabitupper + "%");
                query.setParameter("alphabitlower", alphabitlower + "%");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                

                results = (List<Stock>) query.list();
               
            }
            
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public int countRecord(String alphabit) {
        int totalnoofrecord = 0;
        List<Stock> results = new ArrayList<Stock>();
        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String query1 = (String) session.createQuery("SELECT count(*) FROM Stock ").uniqueResult().toString();
                totalnoofrecord = Integer.parseInt(query1);
                
                transaction.commit();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                Query query = session.createQuery("FROM Stock st   where (st.medicine.name like :alphabitupper or st.medicine.name like :alphabitlower) ");
                query.setParameter("alphabitupper", alphabitupper + "%");
                query.setParameter("alphabitlower", alphabitlower + "%");

                
                results = (List<Stock>) query.list();
                totalnoofrecord = results.size();
                
                transaction.commit();
            }
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

//    public List<Stock> getexpiringStock() {
//        transaction=session.beginTransaction();
//        Query query=session.createSQLQuery("select *  From Stock where ( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) order by expirydate").addEntity(Stock.class);
////        Query query=session.createQuery("From Stock where (expirydate <= current_date) OR expirydate between current_date AND :to_date");
////        query.setParameter("to_date", DateUtil.forwardMonths(DateUtil.todaysDate(), 3));
//        List<Stock> stocks= (List<Stock>)query.list();
//
//        return stocks;
//    }
    public List<Stock> getexpiringStock(int pageNo, int noOfRecordsPerPage, String alphabit) {
        System.out.println("step 3 for paging:-");

        List<Stock> results = new ArrayList<Stock>();
       


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
           
            if (alphabit.equalsIgnoreCase("null")) {
              
                transaction = session.beginTransaction();
                System.out.println("step 4 for paging:-");
                Query query = session.createSQLQuery("select * From Stock s left join medicine m on s.medicineid=m.id where ( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) order by expirydate").addEntity(Stock.class);
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
               
                results = (List<Stock>) query.list();
                
            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                
                Query query = session.createSQLQuery("select * From Stock s left join medicine m on s.medicineid=m.id where (m.name like '" + alphabitupper + "%' or m.name like '" + alphabitlower + "%') and (( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) ) order by expirydate").addEntity(Stock.class);
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
               
               

                results = (List<Stock>) query.list();
                
            }
            

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }
//end

    public int countgetexpiringStockRecord(String alphabit) {
        int totalnoofrecord = 0;
        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String query1 = (String) session.createSQLQuery("select count(*) From Stock s left join medicine m on s.medicineid=m.id where ( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) ").uniqueResult().toString();
                totalnoofrecord = Integer.parseInt(query1);
               
                transaction.commit();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                String query1 = (String) session.createSQLQuery("select count(*) From Stock s left join medicine m on s.medicineid=m.id where (m.name like '" + alphabitupper + "%' or m.name like '" + alphabitlower + "%') and (( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) ) ").uniqueResult().toString();
                totalnoofrecord = Integer.parseInt(query1);
               
                transaction.commit();
            }
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public List<Stock> getdepletingStock(int pageNo, int noOfRecordsPerPage, String alphabit) {
        
        List<Stock> results = new ArrayList<Stock>();
      
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
           
            if (alphabit.equalsIgnoreCase("null")) {
               
                transaction = session.beginTransaction();
                
                Query query = session.createQuery("From Stock where availablestock <= 10");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                
                results = (List<Stock>) query.list();
                
            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("From Stock where availablestock <= 10 and (medicine.name like :alphabitupper  or medicine.name like :alphabitlower) ");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("alphabitlower", alphabitlower + "%");
                query.setParameter("alphabitupper", alphabitupper + "%");
               
                results = (List<Stock>) query.list();
               
            }
           
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }
//end

    public int countgetdepletingStockRecord(String alphabit) {
        int totalnoofrecord = 0;
        List<Stock> results = new ArrayList<Stock>();
        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String query1 = (String) session.createSQLQuery("select count(*) From Stock where availablestock <= 10").uniqueResult().toString();
                totalnoofrecord = Integer.parseInt(query1);
               
                transaction.commit();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                Query query = session.createQuery("From Stock where availablestock <= 10 and (medicine.name like :alphabitupper  or medicine.name like :alphabitlower) ");
                query.setParameter("alphabitlower", alphabitlower + "%");
                query.setParameter("alphabitupper", alphabitupper + "%");
                
                results = (List<Stock>) query.list();
                totalnoofrecord = results.size();
                
                transaction.commit();
            }
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public List<Stock> getrareStock(int pageNo, int noOfRecordsPerPage, String alphabit, Date d1) {
        

        List<Stock> results = new ArrayList<Stock>();
      


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            
            if (alphabit.equalsIgnoreCase("null")) {
                
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("From Stock where medicine.lastaccessdate  < :from");
                query.setParameter("from", d1);
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                

                results = (List<Stock>) query.list();
                
            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                
                Query query = session.createQuery("From Stock where medicine.lastaccessdate  < :from and (medicine.name like :alphabitupper or medicine.name like :alphabitlower)");
                query.setParameter("from", d1);
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("alphabitlower", alphabitlower + "%");
                query.setParameter("alphabitupper", alphabitupper + "%");
                

                results = (List<Stock>) query.list();
                
            }
           

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }
//end

    public int countgetrareStockRecord(String alphabit, Date d1) {
        int totalnoofrecord = 0;
        List<Stock> results = new ArrayList<Stock>();
        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                Query query = session.createQuery("From Stock where medicine.lastaccessdate  < :from");
                query.setParameter("from", d1);

                results = (List<Stock>) query.list();
                totalnoofrecord = results.size();

                // totalnoofrecord = Integer.parseInt(query1);
               
                //System.out.println("no issssssssssss:-" + query1);
                transaction.commit();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                Query query = session.createQuery("From Stock where medicine.lastaccessdate  < :from and (medicine.name like :alphabitupper or medicine.name like :alphabitlower)");
                query.setParameter("from", d1);
                query.setParameter("alphabitlower", alphabitlower + "%");
                query.setParameter("alphabitupper", alphabitupper + "%");
                results = (List<Stock>) query.list();
                totalnoofrecord = results.size();
                

                transaction.commit();
            }
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return totalnoofrecord;
        }


    }

    public List<Stock> viewAllCurrentStockNoLimit(String alphabit) {
        List<Stock> results = new ArrayList<Stock>();
        try {

           
            if (alphabit.equalsIgnoreCase("null")) {
                
                transaction = session.beginTransaction();
                
                Query query = session.createQuery("From Stock ");

                
                results = (List<Stock>) query.list();
               
            } else {
                
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                
                Query query = session.createQuery("FROM Stock st   where st.medicine.name like '" + alphabitupper + "%' or st.medicine.name like '" + alphabitlower + "%' ");

                

                results = (List<Stock>) query.list();
                
            }
            
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public List<Stock> viewAllExpiringStockNoLimit(String alphabit) {
        

        List<Stock> results = new ArrayList<Stock>();
        
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
           
            if (alphabit.equalsIgnoreCase("null")) {
                
                transaction = session.beginTransaction();
               
                Query query = session.createSQLQuery("select *  From Stock where ( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) order by expirydate").addEntity(Stock.class);

                
                results = (List<Stock>) query.list();
                
            } else {
                
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("select *  From Stock where ( (date_part('month',  expirydate) <= date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) order by expirydate '" + alphabitlower + "%' or name like '" + alphabitupper + "%'");

                

                results = (List<Stock>) query.list();
                
            }
            

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public List<Stock> viewAllDepletingStockNoLimit(String alphabit) {
        

        List<Stock> results = new ArrayList<Stock>();
        
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            
            if (alphabit.equalsIgnoreCase("null")) {
               
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("From Stock where availablestock <= 10");

                
                results = (List<Stock>) query.list();
               
            } else {
                
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                System.out.println("step 4 for paging:-");
                Query query = session.createQuery("From Stock where availablestock <= 10 and medicine.name like '" + alphabitupper + "%' or medicine.name like '" + alphabitlower + "%'");

               
                results = (List<Stock>) query.list();
               
            }
            

            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public List<Stock> viewAllRareMedicineNoLimit(String alphabit, Date d1) {
       

        List<Stock> results = new ArrayList<Stock>();
        


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
           
            if (alphabit.equalsIgnoreCase("null")) {
              
                transaction = session.beginTransaction();
               
                Query query = session.createSQLQuery("SELECT *  FROM stock join medicine on medicine.id= stock.medicineid where medicine.lastaccessdate  < :from").addEntity(Stock.class);
                query.setParameter("from", d1);

               
                results = (List<Stock>) query.list();
               
            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createSQLQuery("SELECT *  FROM stock join medicine on medicine.id= stock.medicineid where medicine.lastaccessdate  < :from and medicine.name like '" + alphabitupper + "%' or medicine.name like '" + alphabitlower + "%'").addEntity(Stock.class);
                query.setParameter("from", d1);

                
                results = (List<Stock>) query.list();
                
            }
           
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public List<AvailableMedicine> viewAllMedicineForPopUp(int pageNo, int noOfRecordsPerPage, String alphabit) {
        List<AvailableMedicine> results = new ArrayList<AvailableMedicine>();
        try {

           
            if (alphabit.equalsIgnoreCase("null")) {
               
                transaction = session.beginTransaction();
               
                Query query = session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,medicine.batchno,medicine.vat,medicine.usable,stocks.expirydate,sum(stocks.availablestock) as total from public.stock stocks  left outer join public.medicine medicine on medicine.id=stocks.medicineid where stocks.id is not null and medicine.usable='true' and (( (date_part('month',  expirydate) >= date_part('month',  current_date))  and (date_part('year',  expirydate) = date_part('year',  current_date)) )   or ((date_part('year',  expirydate) > date_part('year',  current_date)))) group by  medicine.id,stocks.expirydate having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                List<AvailableMedicine> availableMedicines = (List<AvailableMedicine>) query.list();
                Iterator<AvailableMedicine> iteratorAvailableMedicines = availableMedicines.iterator();
                
                while (iteratorAvailableMedicines.hasNext()) {
                    AvailableMedicine availableMedicine = iteratorAvailableMedicines.next();
                    

                }
              

                results = (List<AvailableMedicine>) query.list();
               
            } else {
              
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,medicine.batchno,medicine.vat,medicine.usable,stocks.expirydate,sum(stocks.availablestock) as total from public.stock stocks  left outer join public.medicine medicine on medicine.id=stocks.medicineid where stocks.id is not null and medicine.usable='true' and (medicine.name like '"+alphabitlower+"%' or medicine.name like '"+alphabitupper+"%') and (( (date_part('month',  expirydate) >= date_part('month',  current_date))  and (date_part('year',  expirydate) = date_part('year',  current_date)) )   or ((date_part('year',  expirydate) > date_part('year',  current_date)))) group by  medicine.id,stocks.expirydate having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                List<AvailableMedicine> availableMedicines = (List<AvailableMedicine>) query.list();
                Iterator<AvailableMedicine> iteratorAvailableMedicines = availableMedicines.iterator();

                while (iteratorAvailableMedicines.hasNext()) {
                    AvailableMedicine availableMedicine = iteratorAvailableMedicines.next();
                   

                }
               

                results = (List<AvailableMedicine>) query.list();
                
            }
            
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }

    public int countRecordMedicineForPopUp(String alphabit) {
        int totalnoofrecord = 0;
        List<AvailableMedicine> results = new ArrayList<AvailableMedicine>();
        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                Query query = session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,medicine.batchno,medicine.vat,medicine.usable,stocks.expirydate,sum(stocks.availablestock) as total from public.stock stocks  left outer join public.medicine medicine on medicine.id=stocks.medicineid where stocks.id is not null and medicine.usable='true' and (( (date_part('month',  expirydate) >= date_part('month',  current_date))  and (date_part('year',  expirydate) = date_part('year',  current_date)) )   or ((date_part('year',  expirydate) > date_part('year',  current_date)))) group by  medicine.id,stocks.expirydate having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
                List<AvailableMedicine> availableMedicines = (List<AvailableMedicine>) query.list();
                Iterator<AvailableMedicine> iteratorAvailableMedicines = availableMedicines.iterator();

                while (iteratorAvailableMedicines.hasNext()) {
                    AvailableMedicine availableMedicine = iteratorAvailableMedicines.next();
                   

                }
               

                results = (List<AvailableMedicine>) query.list();
               
                transaction.commit();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                Query query = session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,medicine.batchno,medicine.vat,medicine.usable,stocks.expirydate,sum(stocks.availablestock) as total from public.stock stocks  left outer join public.medicine medicine on medicine.id=stocks.medicineid where stocks.id is not null and medicine.usable='true' and (medicine.name like '"+alphabitlower+"%' or medicine.name like '"+alphabitupper+"%') and (( (date_part('month',  expirydate) >= date_part('month',  current_date))  and (date_part('year',  expirydate) = date_part('year',  current_date)) )   or ((date_part('year',  expirydate) > date_part('year',  current_date)))) group by  medicine.id,stocks.expirydate having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
                List<AvailableMedicine> availableMedicines = (List<AvailableMedicine>) query.list();
                Iterator<AvailableMedicine> iteratorAvailableMedicines = availableMedicines.iterator();

                while (iteratorAvailableMedicines.hasNext()) {
                    AvailableMedicine availableMedicine = iteratorAvailableMedicines.next();
                    

                }
               

                results = (List<AvailableMedicine>) query.list();
               
                transaction.commit();
            }
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results.size();
        }


    }

    public List<Stock> getAvailableStockforReturn(long medicineId) {
         transaction = session.beginTransaction();
        Query query = session.createSQLQuery("select * from public.stock stock0_ left outer join public.medicine medicine1_ on stock0_.medicineid=medicine1_.id where medicineid=:medicineId order by expirydate").addEntity(Stock.class);
        //Query query=session.createSQLQuery("select * from public.stock stock0_ left outer join public.medicine medicine1_ on stock0_.medicineid=medicine1_.id where  (date_part('month',  expirydate) >= date_part('month',  current_date)) and (date_part('year',  expirydate) >= date_part('year',  current_date)) and availablestock > 0 and medicineid=:medicineId order by expirydate").addEntity(Stock.class);
//        Query query=session.createQuery("select stock From Stock stock left join stock.medicine where stock.medicine.id=:medicineId and availablestock > 0 and (expirydate > :from_date) order by expirydate,manufacturedate");
//        query.setParameter("from_date", DateUtil.forwardMonths(DateUtil.todaysDate(), 2));
        query.setParameter("medicineId", medicineId);
        List<Stock> stocks = (List<Stock>) query.list();
        return stocks;

    }
}




