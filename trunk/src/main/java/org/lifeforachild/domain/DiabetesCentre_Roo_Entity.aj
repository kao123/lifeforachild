package org.lifeforachild.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DiabetesCentre_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager DiabetesCentre.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long DiabetesCentre.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer DiabetesCentre.version;    
    
    public Long DiabetesCentre.getId() {    
        return this.id;        
    }    
    
    public void DiabetesCentre.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer DiabetesCentre.getVersion() {    
        return this.version;        
    }    
    
    public void DiabetesCentre.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void DiabetesCentre.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void DiabetesCentre.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            DiabetesCentre attached = this.entityManager.find(DiabetesCentre.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void DiabetesCentre.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void DiabetesCentre.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        DiabetesCentre merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager DiabetesCentre.entityManager() {    
        EntityManager em = new DiabetesCentre().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long DiabetesCentre.countDiabetesCentres() {    
        return (Long) entityManager().createQuery("select count(o) from DiabetesCentre o").getSingleResult();        
    }    
    
    public static List<DiabetesCentre> DiabetesCentre.findAllDiabetesCentres() {    
        return entityManager().createQuery("select o from DiabetesCentre o").getResultList();        
    }    
    
    public static DiabetesCentre DiabetesCentre.findDiabetesCentre(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of DiabetesCentre");        
        return entityManager().find(DiabetesCentre.class, id);        
    }    
    
    public static List<DiabetesCentre> DiabetesCentre.findDiabetesCentreEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from DiabetesCentre o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
