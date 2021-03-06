package com.model.nationality.dto;
// Generated Feb 8, 2012 5:44:03 PM by Hibernate Tools 3.2.1.GA

 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Nationality generated by hbm2java
 */
@Entity
@Table(name="nationality"
    ,schema="public"
)
public class Nationality  implements java.io.Serializable {


     private long id;
     private String type;

     /**
      *
      */
     public Nationality() {
    }

     /**
      *
      * @param id
      * @param type
      */
     
   
    /**
     *
     * @return
     */
    @Id
    
    @Column(name="id", unique=true, nullable=false)
    public long getId() {
        return this.id;
    }
    
     /**
      *
      * @param id
      */
     public void setId(long id) {
        this.id = id;
    }
    
    /**
     *
     * @return
     */
    @Column(name="type", nullable=false, length=50)
    public String getType() {
        return this.type;
    }
    
    /**
     *
     * @param type
     */
    public void setType(String type) {
        this.type = type;
    }




}


