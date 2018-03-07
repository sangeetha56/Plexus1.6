package com.model.company.dto;
// Generated Apr 9, 2012 3:37:52 PM by Hibernate Tools 3.2.1.GA
 
import com.model.medicine.dto.Medicine;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Company generated by hbm2java
 */
@Entity
@Table(name = "company", schema = "public")
@SequenceGenerator(name = "company_seq", sequenceName = "company_seq")
@org.hibernate.annotations.Entity(dynamicUpdate=true)
public class Company implements java.io.Serializable {

    private long id;
    private String name;
    private String address;
    private Set<Medicine> medicines = new HashSet<Medicine>(0);

    /**
     *
     */
    public Company() {
    }

    /**
     *
     * @return
     */
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "company_seq")
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
    @Column(name = "name", nullable = false, length = 50)
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

    /**
     *
     * @return
     */
    @Column(name = "address")
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
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "company")
    public Set<Medicine> getMedicines() {
        return this.medicines;
    }

    /**
     *
     * @param medicines
     */
    public void setMedicines(Set<Medicine> medicines) {
        this.medicines = medicines;
    }
}


