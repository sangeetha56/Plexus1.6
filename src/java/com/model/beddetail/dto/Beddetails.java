package com.model.beddetail.dto;
// Generated Jul 17, 2016 4:57:51 AM by Hibernate Tools 3.2.1.GA

import com.model.roomndbedssetup.dto.Roomndbedsetup;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Beddetails generated by hbm2java
 */
@Entity
@Table(name = "beddetails", schema = "public")
@SequenceGenerator(name = "beddetails_seq", sequenceName = "beddetails_seq")
@org.hibernate.annotations.Entity(dynamicUpdate = true)
public class Beddetails implements java.io.Serializable {

    private long beddetailsid;
    private Roomndbedsetup roomndbedsetup;
    private long floorno;
    private long roomno;
    private String roomcode;
    private String roomtypevalue;
    private long roomcharges;
    private long bedno;
    private String bedcode;
    private String buildingblock;
    private Boolean occupied;

    public Beddetails() {
    }

    public Beddetails(long beddetailsid, Roomndbedsetup roomndbedsetup, long floorno, long roomno, String roomtypevalue, long roomcharges, long bedno) {
        this.beddetailsid = beddetailsid;
        this.roomndbedsetup = roomndbedsetup;
        this.floorno = floorno;
        this.roomno = roomno;
        this.roomtypevalue = roomtypevalue;
        this.roomcharges = roomcharges;
        this.bedno = bedno;
    }

    public Beddetails(long beddetailsid, Roomndbedsetup roomndbedsetup, long floorno, long roomno, String roomcode, String roomtypevalue, long roomcharges, long bedno, String bedcode) {
        this.beddetailsid = beddetailsid;
        this.roomndbedsetup = roomndbedsetup;
        this.floorno = floorno;
        this.roomno = roomno;
        this.roomcode = roomcode;
        this.roomtypevalue = roomtypevalue;
        this.roomcharges = roomcharges;
        this.bedno = bedno;
        this.bedcode = bedcode;
    }

    public Beddetails(long beddetailsid, Roomndbedsetup roomndbedsetup, long floorno, long roomno, String roomcode, String roomtypevalue, long roomcharges, long bedno, String bedcode, String buildingblock) {
        this.beddetailsid = beddetailsid;
        this.roomndbedsetup = roomndbedsetup;
        this.floorno = floorno;
        this.roomno = roomno;
        this.roomcode = roomcode;
        this.roomtypevalue = roomtypevalue;
        this.roomcharges = roomcharges;
        this.bedno = bedno;
        this.bedcode = bedcode;
        this.buildingblock = buildingblock;
    }
    public Beddetails(long beddetailsid, Roomndbedsetup roomndbedsetup, long floorno, long roomno, String roomcode, String roomtypevalue, long roomcharges, long bedno, String bedcode, String buildingblock,Boolean occupied) {
        this.beddetailsid = beddetailsid;
        this.roomndbedsetup = roomndbedsetup;
        this.floorno = floorno;
        this.roomno = roomno;
        this.roomcode = roomcode;
        this.roomtypevalue = roomtypevalue;
        this.roomcharges = roomcharges;
        this.bedno = bedno;
        this.bedcode = bedcode;
        this.buildingblock = buildingblock;
        this.occupied = occupied;
    }

    @Id
    @Column(name = "beddetailsid", unique = true, nullable = false)
    @GeneratedValue(generator = "beddetails_seq")
    public long getBeddetailsid() {
        return this.beddetailsid;
    }

    public void setBeddetailsid(long beddetailsid) {
        this.beddetailsid = beddetailsid;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "roomndbedsetupid", nullable = false)
    public Roomndbedsetup getRoomndbedsetup() {
        return this.roomndbedsetup;
    }

    public void setRoomndbedsetup(Roomndbedsetup roomndbedsetup) {
        this.roomndbedsetup = roomndbedsetup;
    }

    @Column(name = "floorno", nullable = false)
    public long getFloorno() {
        return this.floorno;
    }

    public void setFloorno(long floorno) {
        this.floorno = floorno;
    }

    @Column(name = "roomno", nullable = false)
    public long getRoomno() {
        return this.roomno;
    }

    public void setRoomno(long roomno) {
        this.roomno = roomno;
    }

    @Column(name = "roomcode")
    public String getRoomcode() {
        return this.roomcode;
    }

    public void setRoomcode(String roomcode) {
        this.roomcode = roomcode;
    }

    @Column(name = "roomtypevalue", nullable = false)
    public String getRoomtypevalue() {
        return this.roomtypevalue;
    }

    public void setRoomtypevalue(String roomtypevalue) {
        this.roomtypevalue = roomtypevalue;
    }

    @Column(name = "roomcharges", nullable = false)
    public long getRoomcharges() {
        return this.roomcharges;
    }

    public void setRoomcharges(long roomcharges) {
        this.roomcharges = roomcharges;
    }

    @Column(name = "bedno", nullable = false)
    public long getBedno() {
        return this.bedno;
    }

    public void setBedno(long bedno) {
        this.bedno = bedno;
    }

    @Column(name = "bedcode")
    public String getBedcode() {
        return this.bedcode;
    }

    public void setBedcode(String bedcode) {
        this.bedcode = bedcode;
    }

    @Column(name = "buildingblock")
    public String getBuildingblock() {
        return buildingblock;
    }

    public void setBuildingblock(String buildingblock) {
        this.buildingblock = buildingblock;
    }

    @Column(name="occupied")
    public Boolean getOccupied() {
        return occupied;
    }

    public void setOccupied(Boolean occupied) {
        this.occupied = occupied;
    }





}


