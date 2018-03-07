package com.model.doctorProcess.dto;
// Generated May 19, 2014 1:33:27 PM by Hibernate Tools 3.2.1.GA


import com.model.department.dto.Departmentname;
import com.model.operationBill.dto.Operationbill;
import com.model.investigationbill.dto.Investigationbill;
import com.model.therapybill.dto.Therapybill;
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
 * Doctorinfo generated by hbm2java
 */
@Entity
@Table(name="doctorinfo"
    ,schema="public"
)
        @SequenceGenerator(name = "doctorinfo_seq", sequenceName = "doctorinfo_seq")
@org.hibernate.annotations.Entity(dynamicUpdate = true)
public class Doctorinfo  implements java.io.Serializable {


     private long doctid;
     private Departmentname departmentname;
     private String doctname;
     private String doctdesignation;
     private String doctqualification;
     private String doctemailid;
     private Long doctmobno;
     private boolean usefull;
     private Set<Therapybill> therapybills = new HashSet<Therapybill>(0);
     private Set<Investigationbill> investigationbills = new HashSet<Investigationbill>(0);
      private Set<Operationbill> operationbills = new HashSet<Operationbill>(0);

    public Doctorinfo() {
    }

	
    public Doctorinfo(long doctid, Departmentname departmentname, String doctname) {
        this.doctid = doctid;
        this.departmentname = departmentname;
        this.doctname = doctname;
    }
    public Doctorinfo(long doctid, Departmentname departmentname, String doctname, String doctdesignation, String doctqualification, String doctemailid, Long doctmobno, Set<Therapybill> therapybills, Set<Investigationbill> investigationbills, Set<Operationbill> operationbills) {
       this.doctid = doctid;
       this.departmentname = departmentname;
       this.doctname = doctname;
       this.doctdesignation = doctdesignation;
       this.doctqualification = doctqualification;
       this.doctemailid = doctemailid;
       this.doctmobno = doctmobno;
       this.therapybills = therapybills;
       this.investigationbills = investigationbills;
       this.operationbills = operationbills;
    }
   
     @Id 
    
    @Column(name="doctid", unique=true, nullable=false)
     @GeneratedValue(generator = "doctorinfo_seq")
    public long getDoctid() {
        return this.doctid;
    }
    
    public void setDoctid(long doctid) {
        this.doctid = doctid;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="departmentnameid", nullable=false)
    public Departmentname getDepartmentname() {
        return this.departmentname;
    }
    
    public void setDepartmentname(Departmentname departmentname) {
        this.departmentname = departmentname;
    }
    
    @Column(name="doctname", nullable=false, length=500)
    public String getDoctname() {
        return this.doctname;
    }
    
    public void setDoctname(String doctname) {
        this.doctname = doctname;
    }
    
    @Column(name="doctdesignation", length=150)
    public String getDoctdesignation() {
        return this.doctdesignation;
    }
    
    public void setDoctdesignation(String doctdesignation) {
        this.doctdesignation = doctdesignation;
    }
    
    @Column(name="doctqualification", length=150)
    public String getDoctqualification() {
        return this.doctqualification;
    }
    
    public void setDoctqualification(String doctqualification) {
        this.doctqualification = doctqualification;
    }
    
    @Column(name="doctemailid", length=150)
    public String getDoctemailid() {
        return this.doctemailid;
    }
    
    public void setDoctemailid(String doctemailid) {
        this.doctemailid = doctemailid;
    }
    
    @Column(name="doctmobno")
    public Long getDoctmobno() {
        return this.doctmobno;
    }
    
    public void setDoctmobno(Long doctmobno) {
        this.doctmobno = doctmobno;
    }

    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="doctorinfo")
    public Set<Therapybill> getTherapybills() {
        return this.therapybills;
    }

    public void setTherapybills(Set<Therapybill> therapybills) {
        this.therapybills = therapybills;
    }

    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="doctorinfo")
    public Set<Investigationbill> getInvestigationbills() {
        return this.investigationbills;
    }

    public void setInvestigationbills(Set<Investigationbill> investigationbills) {
        this.investigationbills = investigationbills;
    }

    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="doctorinfo")
    public Set<Operationbill> getOperationbills() {
        return this.operationbills;
    }

    public void setOperationbills(Set<Operationbill> operationbills) {
        this.operationbills = operationbills;
    }

    @Column(name="usefull", nullable=false)
    public boolean isUsefull() {
        return this.usefull;
    }

    public void setUsefull(boolean usefull) {
        this.usefull = usefull;
    }




}


