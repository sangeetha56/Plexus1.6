
package com.model.patient.dto;
// Generated Mar 28, 2012 11:04:46 AM by Hibernate Tools 3.2.1.GA

import com.model.advance.dto.Advance;
import com.model.dispense.dto.Dispense;
import com.model.investigationbill.dto.Investigationbill;
import com.model.operationBill.dto.Operationbill;
import com.model.redispense.dto.Redispense;
import com.model.report.dto.Report;
import com.model.therapybill.dto.Therapybill;
import com.model.visit.dto.Visit;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Patient generated by hbm2java
 */
@Entity
@Table(name = "patient", schema = "public")
@SequenceGenerator(name = "patient_seq", sequenceName = "patient_seq")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Patient implements java.io.Serializable {

    private long id;
    private Short age;
    private String nationality;
    private String historyofpresentillness;
    private String pasthistory;
    private String familyhistory;
    private String personalhistory;
    private String drugallergies;
    private Long regno;
    private String name;

    private Long telephoneno;
    private String sex;
    private String chiefcomplaints;
    private String married;
    private String refferedby;
    private String bloodgroup;
    private String address;
    private Long cardno;
    private Long adharcardno;

    private String surname;
    private String sdwof;
    private String contactperson;
    private String village;
    private String tehsil;
    private String dist;
    private Long pincode;
    private Long mobilno;
    private Date regdate;
    private String sdw;
    private BigDecimal advancecharges;
    private BigDecimal duecharges;
   







    private Set<Dispense> dispenses = new HashSet<Dispense>(0);
    private Set<Redispense> redispenses = new HashSet<Redispense>(0);
    private Set<Visit> visits = new HashSet<Visit>(0);

    private Set<Report> reports = new HashSet<Report>(0);

    private Set<Therapybill> therapybills = new HashSet<Therapybill>(0);
    private Set<Investigationbill> investigationbills = new HashSet<Investigationbill>(0);
     private Set<Operationbill> operationbills = new HashSet<Operationbill>(0);
      private Set<Advance> advances = new HashSet<Advance>(0);

    /**
     *
     */
    public Patient() {
    }

    public Patient(long id, Short age, BigDecimal advancecharges, BigDecimal duecharges, String nationality, String historyofpresentillness, String pasthistory, String familyhistory, String personalhistory, String drugallergies, Long regno, String name, Long telephoneno, String sex, String chiefcomplaints, String married, String refferedby, String bloodgroup, String address, Long cardno, Long adharcardno, String sdwof, String village, String tehsil, String dist, Long pincode, String contactperson, Long mobilno, String surname, Date regdate, String sdw) {
       this.id = id;
       this.age = age;
       this.nationality = nationality;
       this.historyofpresentillness = historyofpresentillness;
       this.pasthistory = pasthistory;
       this.familyhistory = familyhistory;
       this.personalhistory = personalhistory;
       this.drugallergies = drugallergies;
       this.regno = regno;
       this.name = name;
       this.telephoneno = telephoneno;
       this.sex = sex;
       this.chiefcomplaints = chiefcomplaints;
       this.married = married;
       this.refferedby = refferedby;
       this.bloodgroup = bloodgroup;
       this.address = address;
       this.cardno = cardno;
       this.adharcardno = adharcardno;
       this.sdwof = sdwof;
       this.village = village;
       this.tehsil = tehsil;
       this.dist = dist;
       this.pincode = pincode;
       this.contactperson = contactperson;
       this.mobilno = mobilno;
       this.surname = surname;
       this.regdate = regdate;
       this.sdw = sdw;
       this.advancecharges = advancecharges;
       this.duecharges = duecharges;
       
    }

    /**
     *
     * @return
     */
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "patient_seq")
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
    @Column(name = "age")
    public Short getAge() {
        return this.age;
    }

    /**
     *
     * @param age
     */
    public void setAge(Short age) {
        this.age = age;
    }


    /**
     *
     * @return
     */
    @Column(name = "nationality", length = 50)
    public String getNationality() {
        return this.nationality;
    }

    /**
     *
     * @param nationality
     */
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    /**
     *
     * @return
     */
    @Column(name = "historyofpresentillness")
    public String getHistoryofpresentillness() {
        return this.historyofpresentillness;
    }

    /**
     *
     * @param historyofpresentillness
     */
    public void setHistoryofpresentillness(String historyofpresentillness) {
        this.historyofpresentillness = historyofpresentillness;
    }


    /**
     *
     * @return
     */
    @Column(name = "pasthistory")
    public String getPasthistory() {
        return this.pasthistory;
    }

    /**
     *
     * @param pasthistory
     */
    public void setPasthistory(String pasthistory) {
        this.pasthistory = pasthistory;
    }

    /**
     *
     * @return
     */
    @Column(name = "familyhistory")
    public String getFamilyhistory() {
        return this.familyhistory;
    }

    /**
     *
     * @param familyhistory
     */
    public void setFamilyhistory(String familyhistory) {
        this.familyhistory = familyhistory;
    }

    /**
     *
     * @return
     */
    @Column(name = "personalhistory")
    public String getPersonalhistory() {
        return this.personalhistory;
    }

    /**
     *
     * @param personalhistory
     */
    public void setPersonalhistory(String personalhistory) {
        this.personalhistory = personalhistory;
    }

    /**
     *
     * @return
     */
    @Column(name = "drugallergies")
    public String getDrugallergies() {
        return this.drugallergies;
    }

    /**
     *
     * @param drugallergies
     */
    public void setDrugallergies(String drugallergies) {
        this.drugallergies = drugallergies;
    }

    /**
     *
     * @return
     */
    @Column(name = "regno")
    public Long getRegno() {
        return this.regno;
    }

    /**
     *
     * @param regno
     */
    public void setRegno(Long regno) {
        this.regno = regno;
    }

    /**
     *
     * @return
     */
    @Column(name = "name", length = 50)
    public String getName() {
        return this.name;
    }

    /**
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "surname", length = 50)
    public String getSurname() {
        return this.surname;
    }

    /**
     *
     * @param name
     */
    public void setSurname(String surname) {
        this.surname = surname;
    }



    /**
     *
     * @return
     */
    @Column(name = "telephoneno")
    public Long getTelephoneno() {
        return this.telephoneno;
    }

    /**
     *
     * @param telephoneno
     */
    public void setTelephoneno(Long telephoneno) {
        this.telephoneno = telephoneno;
    }

    /**
     *
     * @return
     */
    @Column(name = "sex", length = 10)
    public String getSex() {
        return this.sex;
    }

    /**
     *
     * @param sex
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     *
     * @return
     */
    @Column(name = "chiefcomplaints")
    public String getChiefcomplaints() {
        return this.chiefcomplaints;
    }

    /**
     *
     * @param chiefcomplaints
     */
    public void setChiefcomplaints(String chiefcomplaints) {
        this.chiefcomplaints = chiefcomplaints;
    }

    /**
     *
     * @return
     */
    @Column(name = "married", length = 10)
    public String getMarried() {
        return this.married;
    }

    /**
     *
     * @param married
     */
    public void setMarried(String married) {
        this.married = married;
    }

    /**
     *
     * @return
     */
    @Column(name = "refferedby", length = 50)
    public String getRefferedby() {
        return this.refferedby;
    }

    /**
     *
     * @param refferedby
     */
    public void setRefferedby(String refferedby) {
        this.refferedby = refferedby;
    }

    /**
     *
     * @return
     */
    @Column(name = "bloodgroup", length = 30)
    public String getBloodgroup() {
        return this.bloodgroup;
    }

    /**
     *
     * @param bloodgroup
     */
    public void setBloodgroup(String bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    /**
     *
     * @return
     */
    @Column(name = "address", length = 200)
    public String getAddress() {
        return this.address;
    }

    /**
     *
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }
    /**
     *
     * @return
     */
    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="patient")
    public Set<Dispense> getDispenses() {
        return this.dispenses;
    }

    /**
     *
     * @param dispenses
     */
    public void setDispenses(Set<Dispense> dispenses) {
        this.dispenses = dispenses;
    }
     @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="patient")
    public Set<Redispense> getRedispenses() {
        return this.redispenses;
    }

    /**
     *
     * @param dispenses
     */
    public void setRedispenses(Set<Redispense> redispenses) {
        this.redispenses = redispenses;
    }

    /**
     *
     * @return
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "patient")
    @OrderBy("visittime")
    public Set<Visit> getVisits() {
        return this.visits;
    }

    /**
     *
     * @param visits
     */
    public void setVisits(Set<Visit> visits) {
        this.visits = visits;
    }

    /**
     * @return the cardno
     */
    @Column(name = "cardno")
    public Long getCardno() {
        return cardno;
    }

    /**
     * @param cardno the cardno to set
     */
    public void setCardno(Long cardno) {
        this.cardno = cardno;
    }

    @Column(name = "adharcardno")
    public Long getAdharcardno() {
        return adharcardno;
    }

    /**
     * @param cardno the cardno to set
     */
    public void setAdharcardno(Long adharcardno) {
        this.adharcardno = adharcardno;
    }


    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="patient")
    public Set<Report> getReports() {
        return this.reports;
    }

    public void setReports(Set<Report> reports) {
        this.reports = reports;
    }


    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="patient")
    public Set<Therapybill> getTherapybills() {
        return this.therapybills;
    }

    public void setTherapybills(Set<Therapybill> therapybills) {
        this.therapybills = therapybills;
    }
    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="patient")
    public Set<Investigationbill> getInvestigationbills() {
        return this.investigationbills;
    }

    public void setInvestigationbills(Set<Investigationbill> investigationbills) {
        this.investigationbills = investigationbills;
    }
     @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="patient")
    public Set<Advance> getAdvances() {
        return this.advances;
    }

    public void setAdvances(Set<Advance> advances) {
        this.advances = advances;
    }
     @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="patient")
    public Set<Operationbill> getOperationbills() {
        return this.operationbills;
    }

    public void setOperationbills(Set<Operationbill> operationbills) {
        this.operationbills = operationbills;
    }



    @Column(name = "sdwof", length = 150)
    public String getSdwof() {
        return this.sdwof;
    }

    /**
     *
     * @param name
     */
    public void setSdwof(String sdwof) {
        this.sdwof = sdwof;
    }

     @Column(name = "contactperson", length = 150)
    public String getContactperson() {
        return this.contactperson;
    }

    /**
     *
     * @param name
     */
    public void setContactperson(String contactperson) {
        this.contactperson = contactperson;
    }


    @Column(name = "village")
    public String getVillage() {
        return this.village;
    }

    /**
     *
     * @param chiefcomplaints
     */
    public void setVillage(String village) {
        this.village = village;
    }

    @Column(name = "tehsil")
    public String getTehsil() {
        return this.tehsil;
    }

    /**
     *
     * @param chiefcomplaints
     */
    public void setTehsil(String tehsil) {
        this.tehsil = tehsil;
    }

    @Column(name = "dist")
    public String getDist() {
        return this.dist;
    }

    /**
     *
     * @param chiefcomplaints
     */
    public void setDist(String dist) {
        this.dist = dist;
    }

@Column(name = "pincode")
    public Long getPincode() {
        return pincode;
    }

    /**
     * @param cardno the cardno to set
     */
    public void setPincode(Long pincode) {
        this.pincode = pincode;
    }

@Column(name = "mobilno")
    public Long getMobilno() {
        return mobilno;
    }

    /**
     * @param cardno the cardno to set
     */
    public void setMobilno(Long mobilno) {
        this.mobilno = mobilno;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "regdate", length=13)
    public Date getRegdate() {
        return this.regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

     @Column(name = "sdw", length = 150)
    public String getSdw() {
        return this.sdw;
    }

    /**
     *
     * @param name
     */
    public void setSdw(String sdw) {
        this.sdw = sdw;
    }
    @Column(name="advancecharges", precision=20)
    public BigDecimal getAdvancecharges() {
        return this.advancecharges;
    }

    public void setAdvancecharges(BigDecimal advancecharges) {
        this.advancecharges = advancecharges;
    }
    @Column(name="duecharges", precision=20)
    public BigDecimal getDuecharges() {
        return this.duecharges;
    }

    public void setDuecharges(BigDecimal duecharges) {
        this.duecharges = duecharges;
    }

  

}


