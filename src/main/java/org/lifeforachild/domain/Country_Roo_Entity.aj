package org.lifeforachild.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;

import org.hibernate.Criteria;
import org.lifeforachild.web.query.ChildQuery;
import org.lifeforachild.web.query.CountryQuery;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Country_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Country.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long Country.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer Country.version;    
    
    public Long Country.getId() {    
        return this.id;        
    }    
    
    public void Country.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer Country.getVersion() {    
        return this.version;        
    }    
    
    public void Country.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Country.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Country.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Country attached = this.entityManager.find(Country.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Country.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Country.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Country merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Country.entityManager() {    
        EntityManager em = new Country().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Country.countCountrys() {   
    	CountryQuery countryQuery = new CountryQuery();
    	Criteria criteria = countryQuery.findByAccessCriteria(entityManager());
        return countryQuery.count(criteria);        
    }    
    
    public static List<Country> Country.findAllCountrys() {   
    	CountryQuery countryQuery = new CountryQuery();
        return countryQuery.findByAccess(entityManager());        
    }    
    
    public static Country Country.findCountry(Long id) { 
    	CountryQuery countryQuery = new CountryQuery();
    	return (Country)countryQuery.findByAccess(entityManager(), id);       
    }    
    
    public static List<Country> Country.findCountryEntries(int firstResult, int maxResults) {  
    	CountryQuery countryQuery = new CountryQuery();
        return countryQuery.findEntries(entityManager(), firstResult, maxResults);        
    }    
    
}
