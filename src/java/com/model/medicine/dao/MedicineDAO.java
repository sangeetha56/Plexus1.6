/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.medicine.dao;

import com.model.medicine.dto.AvailableMedicine;
import com.model.medicine.dto.Medicine;
import com.util.DateUtil;
import com.util.HibernateUtil;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
 * @author Administrator
 */
public class MedicineDAO {

    Session session = null;
    Transaction transaction = null;
    SessionFactory sessionFactory;

    /**
     *
     */
    public MedicineDAO() {
        //this.sessionFactory = HibernateUtil.getSessionFactory();
        session = HibernateUtil.openSession();
    }

    /**
     *
     * @param medicine
     * @return
     */
    public Medicine create(Medicine medicine) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(medicine);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return medicine;
        }

    }

    /**
     *
     * @return
     */

    public List<Medicine> readListOfObjects() {
        List<Medicine> results = new ArrayList<Medicine>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            results = (List<Medicine>) session.createQuery("From Medicine").list();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }
    public List<Medicine> readListOfObjects1(int pageNo, int noOfRecordsPerPage, String alphabit) {
        List<Medicine> results = new ArrayList<Medicine>();
        try {

            
            if (alphabit.equalsIgnoreCase("null")) {
               
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("From Medicine where usable is true order by name asc");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
              

                results = (List<Medicine>) query.list();
              
            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("From Medicine where usable is true and ( name like :alphabitlower  or name like :alphabitupper )");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
               
                results = (List<Medicine>) query.list();
               
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
        List<Medicine> results = new ArrayList<Medicine>();
        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String query1 = (String) session.createQuery("SELECT count(*) FROM Medicine where usable is true ").uniqueResult().toString();
                totalnoofrecord = Integer.parseInt(query1);
               
                transaction.commit();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                Query query = session.createQuery("From Medicine where usable is true and ( name like :alphabitlower  or name like :alphabitupper )");
               
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
               
                results = (List<Medicine>) query.list();
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

    /**
     *
     * @param emptyStock
     * @return
     */
     public List<Medicine> viewAllMedicineWithoutStocks(int pageNo, int noOfRecordsPerPage, String alphabit) {
        List<Medicine> results = new ArrayList<Medicine>();
        try {

            
            if (alphabit.equalsIgnoreCase("null")) {
               
                transaction = session.beginTransaction();
              
                Query query = session.createQuery("select distinct  medicine From Medicine medicine left join medicine.stocks stock where stock.id is null order by medicine.name");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                
                results = (List<Medicine>) query.list();
               
            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("select distinct  medicine From Medicine medicine left join medicine.stocks stock where stock.id is null and (medicine.name like :alphabitupper or medicine.name like :alphabitlower) order by medicine.name  ");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
                
                results = (List<Medicine>) query.list();
               
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

    public int countRecordMedicineWithoutStocks(String alphabit) {
        int totalnoofrecord = 0;
        List<Medicine> results = new ArrayList<Medicine>();
        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String query1 = (String) session.createQuery("select count(*) From Medicine medicine left join medicine.stocks stock where stock.id is null  ").uniqueResult().toString();
                totalnoofrecord = Integer.parseInt(query1);
               
                transaction.commit();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                Query query = session.createQuery("select distinct  medicine From Medicine medicine left join medicine.stocks stock where stock.id is null and (medicine.name like :alphabitupper or medicine.name like :alphabitlower) order by medicine.name  ");
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
                
                results = (List<Medicine>) query.list();
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
    /**
     *
     * @param emptyStock
     * @param dispensable
     * @return
     */
    public List<Medicine> readListOfObjects(boolean emptyStock,boolean dispensable) {
        List<Medicine> results = new ArrayList<Medicine>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            if (emptyStock) {
                results = (List<Medicine>) session.createQuery("select distinct  medicine From Medicine medicine left join medicine.stocks stock where stock.id is null order by medicine.name ").list();
            } else {
                Query query=session.createQuery("select distinct  medicine From Medicine medicine left join medicine.stocks stock where stock.id  is not null  order by medicine.name ");
                //query.setParameter("from_date", DateUtil.forwardMonths(DateUtil.todaysDate(), 2));
                results = (List<Medicine>) query.list();
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

    /**
     *
     * @param id
     * @return
     */
    public Medicine readObject(Long id) {
        Medicine medicine = new Medicine();
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Medicine where id=:id");
            query.setParameter("id", id);
            medicine = (Medicine) query.uniqueResult();
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            return medicine;
        }

    }
    /**
     *
     * @return
     */
    public List<AvailableMedicine> readListOfAvailableMedicines(){
      
        transaction = session.beginTransaction();
        //Query query = session.createSQLQuery("select *  from stock where date_part('month',  expirydate) = :month  and date_part('year',  expirydate) = 2012").addEntity(Stock.class);
        //Query query=session.createSQLQuery("select *  From Stock where ( (date_part('month',  expirydate) < date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) order by expirydate").addEntity(Stock.class);;
        //query.setParameter("month", 9);
        //Query query=session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,sum(stocks.availablestock) as total  from public.medicine medicine left outer join public.stock stocks on medicine.id=stocks.medicineid where stocks.id is not null and (date_part('month',  expirydate) >= date_part('month',  current_date)) and (date_part('year',  expirydate) >= date_part('year',  current_date))  group by  medicine.id having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
       // Query query=session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,sum(stocks.availablestock) as total  from public.medicine medicine left outer join public.stock stocks on medicine.id=stocks.medicineid where stocks.id is not null and ( (date_part('month',  expirydate) >= date_part('month',  current_date)) and (date_part('year',  expirydate) = date_part('year',  current_date)) ) or ((date_part('year',  expirydate) > date_part('year',  current_date)))  group by  medicine.id having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
       // Query query=session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,medicine.batchno,medicine.vat,medicine.usable,stocks.expirydate,sum(stocks.availablestock) as total from public.stock stocks  left outer join public.medicine medicine on medicine.id=stocks.medicineid where medicine.usable='true' or ((date_part('year',  expirydate) > date_part('year',  current_date))) and ( (date_part('month',  expirydate) >= date_part('month',  current_date)) and (date_part('year',  expirydate) = date_part('year',  current_date)) ) group by  medicine.id,stocks.expirydate having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
        Query query=session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,medicine.batchno,medicine.vat,medicine.cgst,medicine.sgst,medicine.igst,medicine.gst,medicine.usable,stocks.expirydate,sum(stocks.availablestock) as total from public.stock stocks  left outer join public.medicine medicine on medicine.id=stocks.medicineid where stocks.id is not null and medicine.usable='true' and (( (date_part('month',  expirydate) >= date_part('month',  current_date))  and (date_part('year',  expirydate) = date_part('year',  current_date)) )   or ((date_part('year',  expirydate) > date_part('year',  current_date)))) group by  medicine.id,stocks.expirydate having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
        List<AvailableMedicine> availableMedicines=(List<AvailableMedicine>)query.list();
        Iterator<AvailableMedicine> iteratorAvailableMedicines =availableMedicines.iterator();
        while (iteratorAvailableMedicines.hasNext()) {
            AvailableMedicine availableMedicine = iteratorAvailableMedicines.next();
           

        }

       
        return availableMedicines;

    }
    /**
     *
     * @param medicine
     * @return
     */
    public Medicine update(Medicine medicine) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Medicine where id=:id");
            query.setParameter("id",medicine.getId());
            Medicine newMedicine = (Medicine) query.uniqueResult();
           
            
            newMedicine.setName(medicine.getName());
            newMedicine.setStrength(medicine.getStrength());
            newMedicine.setNature(medicine.getNature());
            newMedicine.setUnittype(medicine.getUnittype());
            newMedicine.setPrice(medicine.getPrice());
            newMedicine.setUnitprice(medicine.getUnitprice());
            newMedicine.setUnitquantity(medicine.getUnitquantity());
            newMedicine.setBatchno(medicine.getBatchno());
            newMedicine.setRemarks(medicine.getRemarks());
            newMedicine.setVat(medicine.getVat());
            newMedicine.setCgst(medicine.getCgst());
            newMedicine.setIgst(medicine.getIgst());
            newMedicine.setSgst(medicine.getSgst());
            newMedicine.setLastaccessdate(medicine.getLastaccessdate());
            newMedicine.setCompany(medicine.getCompany());
            newMedicine.setVendor(medicine.getVendor());
            session.update(newMedicine);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return medicine;
        }

    }
    /**
     *
     * @param ids
     */
    public void deleteMultiple(List<Long> ids) {
        try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from Medicine where id IN (:ids)");
            query.setParameterList("ids",ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }


    }

    public Medicine updateLastAccessDate(Medicine medicine) {
       
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Medicine where id=:id");
            query.setParameter("id",medicine.getId());
            Medicine newMedicine = (Medicine) query.uniqueResult();
           
            newMedicine.setExpirydatemedicine(medicine.getExpirydatemedicine());
            newMedicine.setLastaccessdate(medicine.getLastaccessdate());
            session.update(newMedicine);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return medicine;
        }

    }



    public List<Medicine> readRareMedicine(Date d1) {
        
        List<Medicine> results = new ArrayList<Medicine>();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Medicine where lastaccessdate < :from");
           // Query query =session.createSQLQuery("FROM stock join medicine on medicine.id= stock.medicineid where medicine.lastaccessdate  < :from");
            //Query query = session.createQuery("From Medicine where lastaccessdate < :from");
            
            query.setParameter("from", d1);
            results=(List<Medicine>)query.list();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return results;
        }
    }


    public BigInteger countRareMedicine(Date d1) {
       
        transaction=session.beginTransaction();
        Query query=session.createSQLQuery("select count(*) From Medicine where lastaccessdate < :from");
        
        query.setParameter("from", d1);
        java.math.BigInteger RareMedicineCount=(java.math.BigInteger) query.uniqueResult();
        return RareMedicineCount;
    }

    public Medicine updateMedicineUsableorNot(Medicine medicine) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("From Medicine where id=:id");
            query.setParameter("id",medicine.getId());
            Medicine newMedicine = (Medicine) query.uniqueResult();
            
            newMedicine.setUsable(medicine.getUsable());
            session.update(newMedicine);
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return medicine;
        }

    }

    public static String upperCaseAllFirst(String value) {

	char[] array = value.toCharArray();
	// Uppercase first letter.
	array[0] = Character.toUpperCase(array[0]);

	// Uppercase all letters that follow a whitespace character.
	for (int i = 1; i < array.length; i++) {
	    if (Character.isWhitespace(array[i - 1])) {
		array[i] = Character.toUpperCase(array[i]);
	    }
	}

	// Result.
	return new String(array);
    }
    public List<Medicine> searchMedicineByName(String searchValueType, int pageNo, int noOfRecordsPerPage, String alphabit) {
        
        List<Medicine> results = new ArrayList<Medicine>();


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = upperCaseAllFirst(searchValueType.toLowerCase());
                String searchValueTypeupper1 = searchValueType.toUpperCase();
               
                Query query = session.createQuery("from Medicine where usable is true and (name like :searchValueTypeupper  or name like :searchValueTypelower or name like:searchValueTypeupper1) ");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("searchValueTypeupper1", "%"+searchValueTypeupper1+"%");
                
                results = (List<Medicine>) query.list();
               // System.out.println("sssssssssssssssssssssssssss:-"+results.size());
                
            } else {
                transaction = session.beginTransaction();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = upperCaseAllFirst(searchValueType.toLowerCase());
                String searchValueTypeupper1 = searchValueType.toUpperCase();
               
                Query query = session.createQuery("from Medicine where usable is true and (name like :searchValueTypeupper  or name like :searchValueTypelower or name like:searchValueTypeupper1) and (name like :alphabitlower or name like :alphabitupper)");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("searchValueTypeupper1", "%"+searchValueTypeupper1+"%");
                query.setParameter("alphabitlower", alphabitlower+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                
                results = (List<Medicine>) query.list();
                
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

    public int countRecordSearchByMedicineName(String searchValueType, String alphabit) {
        int totalnoofrecord = 0;
         List<Medicine> results = new ArrayList<Medicine>();

        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = upperCaseAllFirst(searchValueType.toLowerCase());
                String searchValueTypeupper1 = searchValueType.toUpperCase();

                Query query = session.createQuery("from Medicine where usable is true and (name like :searchValueTypeupper  or name like :searchValueTypelower or name like:searchValueTypeupper1)");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("searchValueTypeupper1", "%"+searchValueTypeupper1+"%");
               
                results = (List<Medicine>) query.list();
                totalnoofrecord = results.size();
               transaction.commit();

            } else {
                transaction = session.beginTransaction();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = upperCaseAllFirst(searchValueType.toLowerCase());
                String searchValueTypeupper1 = searchValueType.toUpperCase();
                Query query = session.createQuery("from Medicine where usable is true and (name like :searchValueTypeupper  or name like :searchValueTypelower or name like:searchValueTypeupper1) and (name like :alphabitlower or name like :alphabitupper)");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("searchValueTypeupper1", "%"+searchValueTypeupper1+"%");
                query.setParameter("alphabitlower", alphabitlower+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                
                results = (List<Medicine>) query.list();
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
    public List<Medicine> searchMedicineByText(String searchValueType, int pageNo, int noOfRecordsPerPage, String alphabit) {
        
        List<Medicine> results = new ArrayList<Medicine>();


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = upperCaseAllFirst(searchValueType.toLowerCase());
                String searchValueTypeupper1 = searchValueType.toUpperCase();

//                System.out.println("1:-"+searchValueTypelower);
//                System.out.println("2:-"+searchValueTypeupper);
//                System.out.println("3:-"+searchValueTypeupper1);
               
                Query query = session.createQuery("from Medicine medicine where usable is true and (name like :searchValueTypelower  or name like :searchValueTypeupper1 or name like :searchValueTypeupper or strength like :searchValueTypelower  or strength like :searchValueTypeupper1 or strength like :searchValueTypeupper or nature like :searchValueTypelower  or nature like :searchValueTypeupper1 or nature like :searchValueTypeupper or batchno like :searchValueTypelower  or batchno like :searchValueTypeupper1 or batchno like :searchValueTypeupper or unittype like :searchValueTypelower  or unittype like :searchValueTypeupper1 or unittype like :searchValueTypeupper or remarks like :searchValueTypelower  or remarks like :searchValueTypeupper1 or remarks like :searchValueTypeupper) ");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("searchValueTypeupper1", "%"+searchValueTypeupper1+"%");
               

                results = (List<Medicine>) query.list();
            } else {
                transaction = session.beginTransaction();
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = upperCaseAllFirst(searchValueType.toLowerCase());
                String searchValueTypeupper1 = searchValueType.toUpperCase();
                
                Query query = session.createQuery("from Medicine medicine where usable is true and (name like :searchValueTypelower  or name like :searchValueTypeupper1 or name like :searchValueTypeupper or strength like :searchValueTypelower  or strength like :searchValueTypeupper1 or strength like :searchValueTypeupper or nature like :searchValueTypelower  or nature like :searchValueTypeupper1 or nature like :searchValueTypeupper or batchno like :searchValueTypelower  or batchno like :searchValueTypeupper1 or batchno like :searchValueTypeupper or unittype like :searchValueTypelower  or unittype like :searchValueTypeupper1 or unittype like :searchValueTypeupper or remarks like :searchValueTypelower  or remarks like :searchValueTypeupper1 or remarks like :searchValueTypeupper) and (name like :alphabitlower or name like :alphabitupper) ");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitlower", alphabitlower+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("searchValueTypeupper1", "%"+searchValueTypeupper1+"%");
               

                results = (List<Medicine>) query.list();
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

    public int countRecordsearchMedicineByText(String searchValueType, String alphabit) {
        int totalnoofrecord = 0;
        List<Medicine> results = new ArrayList<Medicine>();

        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();

                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = upperCaseAllFirst(searchValueType.toLowerCase());
                String searchValueTypeupper1 = searchValueType.toUpperCase();
                Query query = session.createQuery("from Medicine medicine where usable is true and (name like :searchValueTypelower  or name like :searchValueTypeupper1 or name like :searchValueTypeupper or strength like :searchValueTypelower  or strength like :searchValueTypeupper1 or strength like :searchValueTypeupper or nature like :searchValueTypelower  or nature like :searchValueTypeupper1 or nature like :searchValueTypeupper or batchno like :searchValueTypelower  or batchno like :searchValueTypeupper1 or batchno like :searchValueTypeupper or unittype like :searchValueTypelower  or unittype like :searchValueTypeupper1 or unittype like :searchValueTypeupper or remarks like :searchValueTypelower  or remarks like :searchValueTypeupper1 or remarks like :searchValueTypeupper) ");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("searchValueTypeupper1", "%"+searchValueTypeupper1+"%");
                

                results = (List<Medicine>) query.list();
                totalnoofrecord = results.size();
                
                transaction.commit();
            } else {
                transaction = session.beginTransaction();

                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                String searchValueTypelower = searchValueType.toLowerCase();
                String searchValueTypeupper = upperCaseAllFirst(searchValueType.toLowerCase());
                String searchValueTypeupper1 = searchValueType.toUpperCase();
                Query query = session.createQuery("from Medicine medicine where usable is true and (name like :searchValueTypelower  or name like :searchValueTypeupper1 or name like :searchValueTypeupper or strength like :searchValueTypelower  or strength like :searchValueTypeupper1 or strength like :searchValueTypeupper or nature like :searchValueTypelower  or nature like :searchValueTypeupper1 or nature like :searchValueTypeupper or batchno like :searchValueTypelower  or batchno like :searchValueTypeupper1 or batchno like :searchValueTypeupper or unittype like :searchValueTypelower  or unittype like :searchValueTypeupper1 or unittype like :searchValueTypeupper or remarks like :searchValueTypelower  or remarks like :searchValueTypeupper1 or remarks like :searchValueTypeupper) and (name like :alphabitlower or name like :alphabitupper) ");
                query.setParameter("searchValueTypelower", "%"+searchValueTypelower+"%");
                query.setParameter("searchValueTypeupper", "%"+searchValueTypeupper+"%");
                query.setParameter("alphabitlower", alphabitlower+"%");
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("searchValueTypeupper1", "%"+searchValueTypeupper1+"%");
               
                results = (List<Medicine>) query.list();
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


    public List<Medicine> viewAllMedicineNolimit(String alphabit) {
        List<Medicine> results = new ArrayList<Medicine>();
        try {

            
            if (alphabit.equalsIgnoreCase("null")) {
            
                transaction = session.beginTransaction();
              
                Query query = session.createQuery("From Medicine order by name asc");
               
                results = (List<Medicine>) query.list();
                System.out.println("All size mk is:-" + results.size());
            } else {
                
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                
                Query query = session.createQuery("From Medicine where  name like '" + alphabitlower + "%' or name like '" + alphabitupper + "%'");
                
                results = (List<Medicine>) query.list();
               
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


    public List<Medicine> viewAllMedicineWithEmptyStocksNoLimit(String alphabit) {
        List<Medicine> results = new ArrayList<Medicine>();
        try {

            
            if (alphabit.equalsIgnoreCase("null")) {
               
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("select distinct  medicine From Medicine medicine left join medicine.stocks stock where stock.id is null order by medicine.name");
                
                results = (List<Medicine>) query.list();
               
            } else {
                
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
               
                Query query = session.createQuery("select distinct  medicine From Medicine medicine left join medicine.stocks stock where stock.id is null and (medicine.name like '"+alphabitupper+"%' or medicine.name like '"+alphabitlower+"%')  order by medicine.name  ");
                
                
                results = (List<Medicine>) query.list();
                
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


     public List<Medicine> readListOfObjectsALL(int pageNo, int noOfRecordsPerPage, String alphabit) {
        List<Medicine> results = new ArrayList<Medicine>();
        try {

            
            if (alphabit.equalsIgnoreCase("null")) {
               
                transaction = session.beginTransaction();
                
                Query query = session.createQuery("From Medicine  order by name asc");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
               

                results = (List<Medicine>) query.list();
               
            } else {
               
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
              
                Query query = session.createQuery("From Medicine where   ( name like :alphabitlower  or name like :alphabitupper )");
                query.setFirstResult(noOfRecordsPerPage * (pageNo - 1));
                query.setMaxResults(noOfRecordsPerPage);
                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
                
                results = (List<Medicine>) query.list();
              
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

      public int countRecordALL(String alphabit) {
        int totalnoofrecord = 0;
        List<Medicine> results = new ArrayList<Medicine>();
        try {
            if (alphabit.equalsIgnoreCase("null")) {
                transaction = session.beginTransaction();
                String query1 = (String) session.createQuery("SELECT count(*) FROM Medicine  ").uniqueResult().toString();
                totalnoofrecord = Integer.parseInt(query1);
                
                transaction.commit();
            } else {
                String alphabitlower = alphabit.toLowerCase();
                String alphabitupper = alphabit.toUpperCase();
                transaction = session.beginTransaction();
                Query query = session.createQuery("From Medicine where  ( name like :alphabitlower  or name like :alphabitupper )");

                query.setParameter("alphabitupper", alphabitupper+"%");
                query.setParameter("alphabitlower",alphabitlower+"%");
                
                results = (List<Medicine>) query.list();
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

    public List<AvailableMedicine> viewDispensableMedicineForReturnBill() {
        transaction = session.beginTransaction();
        //Query query = session.createSQLQuery("select *  from stock where date_part('month',  expirydate) = :month  and date_part('year',  expirydate) = 2012").addEntity(Stock.class);
        //Query query=session.createSQLQuery("select *  From Stock where ( (date_part('month',  expirydate) < date_part('month',  current_date)) and (date_part('year',  expirydate) <= date_part('year',  current_date)) ) or ((date_part('month',  expirydate) between date_part('month',  current_date+INTERVAL '1 month') AND date_part('month',  current_date +INTERVAL '3 month')) and (date_part('year',  expirydate) between date_part('year',  current_date ) AND date_part('year',  current_date +INTERVAL '3 month')) ) order by expirydate").addEntity(Stock.class);;
        //query.setParameter("month", 9);
        //Query query=session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,sum(stocks.availablestock) as total  from public.medicine medicine left outer join public.stock stocks on medicine.id=stocks.medicineid where stocks.id is not null and (date_part('month',  expirydate) >= date_part('month',  current_date)) and (date_part('year',  expirydate) >= date_part('year',  current_date))  group by  medicine.id having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
       // Query query=session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,sum(stocks.availablestock) as total  from public.medicine medicine left outer join public.stock stocks on medicine.id=stocks.medicineid where stocks.id is not null and ( (date_part('month',  expirydate) >= date_part('month',  current_date)) and (date_part('year',  expirydate) = date_part('year',  current_date)) ) or ((date_part('year',  expirydate) > date_part('year',  current_date)))  group by  medicine.id having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
       // Query query=session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,medicine.batchno,medicine.vat,medicine.usable,stocks.expirydate,sum(stocks.availablestock) as total from public.stock stocks  left outer join public.medicine medicine on medicine.id=stocks.medicineid where medicine.usable='true' or ((date_part('year',  expirydate) > date_part('year',  current_date))) and ( (date_part('month',  expirydate) >= date_part('month',  current_date)) and (date_part('year',  expirydate) = date_part('year',  current_date)) ) group by  medicine.id,stocks.expirydate having sum(stocks.availablestock) > 0 order by  medicine.name ").addEntity(AvailableMedicine.class);
        Query query=session.createSQLQuery("select medicine.id,medicine.name,medicine.strength,medicine.nature,medicine.price,medicine.batchno,medicine.vat,medicine.cgst,medicine.sgst,medicine.igst,medicine.gst,medicine.usable,stocks.expirydate,sum(stocks.availablestock) as total from public.stock stocks  left outer join public.medicine medicine on medicine.id=stocks.medicineid where stocks.id is not null and medicine.usable='true' group by  medicine.id,stocks.expirydate  order by  medicine.name ").addEntity(AvailableMedicine.class);
        List<AvailableMedicine> availableMedicines=(List<AvailableMedicine>)query.list();
        Iterator<AvailableMedicine> iteratorAvailableMedicines =availableMedicines.iterator();
        while (iteratorAvailableMedicines.hasNext()) {
            AvailableMedicine availableMedicine = iteratorAvailableMedicines.next();


        }


        return availableMedicines;
    }
}



