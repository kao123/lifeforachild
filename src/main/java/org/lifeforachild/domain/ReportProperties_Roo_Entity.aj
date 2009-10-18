package org.lifeforachild.domain;

privileged aspect ReportProperties_Roo_Entity {
    
    @javax.persistence.PersistenceContext    
    transient javax.persistence.EntityManager ReportProperties.entityManager;    
    
    @javax.persistence.Id    
    @javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.AUTO)    
    @javax.persistence.Column(name = "_id")    
    private java.lang.Long ReportProperties._id;    
    
    @javax.persistence.Version    
    @javax.persistence.Column(name = "version")    
    private java.lang.Integer ReportProperties.version;    
    
    public java.lang.Long ReportProperties.get_id() {    
        return this._id;        
    }    
    
    public void ReportProperties.set_id(java.lang.Long id) {    
        this._id = id;        
    }    
    
    public java.lang.Integer ReportProperties.getVersion() {    
        return this.version;        
    }    
    
    public void ReportProperties.setVersion(java.lang.Integer version) {    
        this.version = version;        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ReportProperties.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ReportProperties.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            ReportProperties attached = this.entityManager.find(ReportProperties.class, this._id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ReportProperties.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @org.springframework.transaction.annotation.Transactional    
    public void ReportProperties.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        ReportProperties merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this._id = merged.get_id();        
    }    
    
    public static javax.persistence.EntityManager ReportProperties.entityManager() {    
        javax.persistence.EntityManager em = new ReportProperties().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long ReportProperties.countReportPropertieses() {    
        return (Long) entityManager().createQuery("select count(o) from ReportProperties o").getSingleResult();        
    }    
    
    public static java.util.List<org.lifeforachild.domain.ReportProperties> ReportProperties.findAllReportPropertieses() {    
        return entityManager().createQuery("select o from ReportProperties o").getResultList();        
    }    
    
    public static org.lifeforachild.domain.ReportProperties ReportProperties.findReportProperties(java.lang.Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of ReportProperties");        
        return entityManager().find(ReportProperties.class, id);        
    }    
    
    public static java.util.List<org.lifeforachild.domain.ReportProperties> ReportProperties.findReportPropertiesEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from ReportProperties o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
