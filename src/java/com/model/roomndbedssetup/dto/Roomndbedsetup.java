package com.model.roomndbedssetup.dto;
// Generated Jul 14, 2016 1:15:18 PM by Hibernate Tools 3.2.1.GA


import com.model.RoomType.Dto.Roomtype;
import com.model.beddetail.dto.Beddetails;
import com.model.roomsetup.dto.Roomsetup;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Roomndbedsetup generated by hbm2java
 */
@Entity
@Table(name="roomndbedsetup"
    ,schema="public"
)
        @SequenceGenerator(name = "roomndbedsetup_seq", sequenceName = "roomndbedsetup_seq")
         @org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Roomndbedsetup  implements java.io.Serializable {


     private long roomndbedsetupid;
     private Roomtype roomtype;
     private Roomsetup roomsetup;
     private long floorno;
     private long roomno;
     private String roomtypevalue;
     private long noofbeds;
     private long roomcharges;
     private String roomcode;
     private Set<Beddetails> beddetailses = new HashSet<Beddetails>(0);

    public Roomndbedsetup() {
    }

    public Roomndbedsetup(long roomndbedsetupid, Roomtype roomtype, Roomsetup roomsetup, long floorno, long roomno, String roomtypevalue, long noofbeds,long roomcharges,String roomcode) {
       this.roomndbedsetupid = roomndbedsetupid;
       this.roomtype = roomtype;
       this.roomsetup = roomsetup;
       this.floorno = floorno;
       this.roomno = roomno;
       this.roomtypevalue = roomtypevalue;
       this.noofbeds = noofbeds;
       this.roomcharges = roomcharges;
       this.roomcode = roomcode;
    }

     public Roomndbedsetup(long roomndbedsetupid, Roomtype roomtype, Roomsetup roomsetup, long floorno, long roomno, String roomtypevalue, long noofbeds, long roomcharges, String roomcode, Set<Beddetails> beddetailses) {
       this.roomndbedsetupid = roomndbedsetupid;
       this.roomtype = roomtype;
       this.roomsetup = roomsetup;
       this.floorno = floorno;
       this.roomno = roomno;
       this.roomtypevalue = roomtypevalue;
       this.noofbeds = noofbeds;
       this.roomcharges = roomcharges;
       this.roomcode = roomcode;
       this.beddetailses = beddetailses;
    }
   
     @Id 
    
    @Column(name="roomndbedsetupid", unique=true, nullable=false)
      @GeneratedValue(generator = "roomndbedsetup_seq")
    public long getRoomndbedsetupid() {
        return this.roomndbedsetupid;
    }
    
    public void setRoomndbedsetupid(long roomndbedsetupid) {
        this.roomndbedsetupid = roomndbedsetupid;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="roomtypeid", nullable=false)
    public Roomtype getRoomtype() {
        return this.roomtype;
    }
    
    public void setRoomtype(Roomtype roomtype) {
        this.roomtype = roomtype;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="roomsetupid", nullable=false)
    public Roomsetup getRoomsetup() {
        return this.roomsetup;
    }
    
    public void setRoomsetup(Roomsetup roomsetup) {
        this.roomsetup = roomsetup;
    }
    
    @Column(name="floorno", nullable=false)
    public long getFloorno() {
        return this.floorno;
    }
    
    public void setFloorno(long floorno) {
        this.floorno = floorno;
    }
    
    @Column(name="roomno", nullable=false)
    public long getRoomno() {
        return this.roomno;
    }
    
    public void setRoomno(long roomno) {
        this.roomno = roomno;
    }
    
    @Column(name="roomtypevalue", nullable=false)
    public String getRoomtypevalue() {
        return roomtypevalue;
    }

    public void setRoomtypevalue(String roomtypevalue) {
        this.roomtypevalue = roomtypevalue;
    }
    
    @Column(name="noofbeds", nullable=false)
    public long getNoofbeds() {
        return this.noofbeds;
    }
    
    public void setNoofbeds(long noofbeds) {
        this.noofbeds = noofbeds;
    }

    @Column(name="roomcharges", nullable=false)
    public long getRoomcharges() {
        return roomcharges;
    }

    public void setRoomcharges(long roomcharges) {
        this.roomcharges = roomcharges;
    }

    @Column(name="roomcode", nullable=false)
    public String getRoomcode() {
        return roomcode;
    }

    public void setRoomcode(String roomcode) {
        this.roomcode = roomcode;
    }

    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="roomndbedsetup")
    public Set<Beddetails> getBeddetailses() {
        return this.beddetailses;
    }

    public void setBeddetailses(Set<Beddetails> beddetailses) {
        this.beddetailses = beddetailses;
    }






}


