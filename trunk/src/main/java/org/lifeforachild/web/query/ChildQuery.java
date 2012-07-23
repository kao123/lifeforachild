package org.lifeforachild.web.query;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;
import org.lifeforachild.Util.StringUtil;
import org.lifeforachild.domain.Child;
import org.lifeforachild.domain.ClinicalRecord;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.Search;
import org.lifeforachild.enums.ShowOptionType;
import org.lifeforachild.security.SimpleStringCipher;
import org.lifeforachild.web.Report.enums.StatusType;
import org.lifeforachild.web.Report.enums.TimePeriodUnit;

public class ChildQuery extends BaseQuery<Child> {

	public ChildQuery()
	{}
	
	public List<Child> getQuery(EntityManager entityManager, Search search)
	{		
		String id = search.getId();
		String name = search.getName();
		String lastName = search.getLastName();
		String timePeriod = search.getTimePeriod();
		TimePeriodUnit timePeriodUnit = search.getTimePeriodUnit();
		String from = search.getFromDate();
		String to = search.getToDate();		
		Date fromDate = null;
		Date toDate = null;
		if (!StringUtil.isEmpty(from) && !StringUtil.isEmpty(to))
		{
			try
			{
				fromDate = DATE_FORMAT.parse(from);
				toDate = DATE_FORMAT.parse(to);
			}
			catch (ParseException ex) {
				ex.printStackTrace();
			}	
		}
		// TODO convert these to objects in the Search class and in UI
		String centre = search.getCentre();
		String country = search.getCountry();
		Long centreId = StringUtil.isEmpty(centre) ? null : Long.valueOf(centre);
		Long countryId = StringUtil.isEmpty(country) ? null : Long.valueOf(country); 
		return getQuery(entityManager, id, name, lastName, timePeriod, timePeriodUnit, fromDate, toDate, centreId, countryId);
	}
	
	public List<Child> getQuery(EntityManager entityManager, Report report)
	{
		DiabetesCentre centre = report.getCentre();
		Country country = report.getCountry();
		Long centreId = centre == null ? null : Long.valueOf(centre.getId());
		Long countryId = country == null ? null : Long.valueOf(country.getId());		
		return getQuery(entityManager, report.getRecordNumber(), null, null, report.getTimePeriod(), report.getTimeperiodunit(), 
				report.getFromDate(), report.getToDate(), centreId, countryId,
				report.getStatustype(), report.getShowoptiontype(), 
				report.getAge(), report.getOrderBy(), report.getThenOrderBy());
	}
	
	private List<Child> getQuery(EntityManager entityManager, String id, String name, String lastName, String timePeriod, 
			TimePeriodUnit timePeriodUnit, Date from, Date to, Long diabetesCentre, Long country)
	{
		return getQuery(entityManager, id, name, lastName, timePeriod, timePeriodUnit, from, to, diabetesCentre, country, null,
				null, null, null, null);
	}
	
	private List<Child> getQuery(EntityManager entityManager, String id, String name, String lastName, String timePeriod, 
			TimePeriodUnit timePeriodUnit, Date from, Date to, Long diabetesCentre, Long country,
			StatusType statusType, ShowOptionType showOptionType, String age, String orderBy, String thenOrderBy)
	{
		// restrict to only what they have access to by default
		Criteria criteria = findByAccessCriteria(entityManager);
		searchByID(criteria, id);
		searchByName(criteria, name);
		searchByLastName(criteria, lastName);
		searchByDiabetesCentre(criteria, diabetesCentre);
		searchByCountry(criteria, country);	
		return criteria.list();
	}
	
	public List<Child> getNotSeenVisitClinicalRecordQuery(EntityManager entityManager, Report report)
	{		
		// do subquery to find child seen in that time period
		DetachedCriteria d = DetachedCriteria.forClass(ClinicalRecord.class, "cr");
		DetachedCriteria dChild = d.createCriteria("child", "ch");
		dChild.setProjection(Projections.distinct(Projections.property("id")));
		ClinicalRecordQuery.searchByTimePeriod(d, report.getTimeperiodunit(), true);
		searchByCountry(dChild, report.getCountry());
		searchByDiabetesCentre(dChild, report.getCentre());
				
		// find children not in that time period
		Criteria criteria = findByAccessCriteria(entityManager);
		criteria.add(Subqueries.propertyNotIn("id", d));
							
		return criteria.list();		
	}	
	
	private void searchByID(Criteria criteria, String id)
	{
		if (!StringUtil.isEmpty(id))
			criteria.add(Restrictions.eq("localMedicalNumber", id) );
	}
	
	private void searchByName(Criteria criteria, String name)
	{
		if (!StringUtil.isEmpty(name))
			criteria.add(Restrictions.like("name", SimpleStringCipher.encrypt(name)) );
	}	
	
	private void searchByLastName(Criteria criteria, String lastName)
	{
		if (!StringUtil.isEmpty(lastName))
			criteria.add(Restrictions.like("lastName", SimpleStringCipher.encrypt(lastName)) );
	}		

	private void searchByCountry(Criteria criteria, Long country) {
		if (country != null)
			criteria.add(Restrictions.eq("country.id", country) );
	}

	private void searchByDiabetesCentre(Criteria criteria,
			Long diabetesCentre) {
		if (diabetesCentre != null && diabetesCentre != 0)
			criteria.add(Restrictions.eq("centre.id", diabetesCentre) );
	}

	private void orderBy(Criteria criteria, String orderBy, String thenOrderBy) {
		//if (!StringUtil.isEmpty(orderBy))
			//builder.orderBy(orderBy);
		//if (!StringUtil.isEmpty(thenOrderBy))
			//builder.orderBy(thenOrderBy);			
	}
	
	public Criteria findByAccessCriteria(EntityManager entityManager)
	{		
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(Child.class);
		CountryQuery.findCountryByAccessCriteria(criteria);
    	DiabetesCentreQuery.findCentreByAccessCriteria(criteria);
    	return criteria;
	}	
	
	public long numberChildrenInCentre(EntityManager entityManager, Long countryId, Long centreId)
	{
		Criteria criteria = ((Session)entityManager.getDelegate()).createCriteria(Child.class);
		criteria.createCriteria("country").add(Restrictions.eq("id", new Long(countryId)));
		criteria.createCriteria("centre").add(Restrictions.eq("id", new Long(centreId)));
		return count(criteria);
	}
}
