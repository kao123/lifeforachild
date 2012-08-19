// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.lifeforachild.domain;

import java.lang.Boolean;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.lifeforachild.domain.ChildFields;
import org.lifeforachild.domain.ClinicalRecordFields;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.CountryDataOnDemand;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.Report;
import org.lifeforachild.domain.ReportType;
import org.lifeforachild.domain.StatusType;
import org.lifeforachild.domain.TimePeriodUnit;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.UserDataOnDemand;
import org.lifeforachild.enums.ShowOptionType;
import org.lifeforachild.util.TestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ReportDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ReportDataOnDemand: @Component;
    
    private Random ReportDataOnDemand.rnd = new SecureRandom();
    
    private List<Report> ReportDataOnDemand.data;
    
    @Autowired
    private CountryDataOnDemand ReportDataOnDemand.countryDataOnDemand;
    
    @Autowired
    private DiabetesCentreDataOnDemand ReportDataOnDemand.diabetesCentreDataOnDemand;
    
    @Autowired
    private UserDataOnDemand ReportDataOnDemand.userDataOnDemand;
    
    public Report ReportDataOnDemand.getNewTransientReport(int index) {
        Report obj = new Report();
        setAge(obj, index);
        setCentre(obj, index);
        setChildfields(obj, index);
        setClinicalrecordfields(obj, index);
        setCountry(obj, index);
        setFromDate(obj, index);
        setIsDeleted(obj, index);
        setName(obj, index);
        setOrderBy(obj, index);
        setRecordNumber(obj, index);
        setReporttype(obj, index);
        setShowoptiontype(obj, index);
        setStatustype(obj, index);
        setThenOrderBy(obj, index);
        setTimePeriod(obj, index);
        setTimeperiodunit(obj, index);
        setToDate(obj, index);
        setViewableBy(obj, index);
        return obj;
    }
    
    public void ReportDataOnDemand.setAge(Report obj, int index) {
        String age = "age_" + index;
        obj.setAge(age);
    }
    
    public void ReportDataOnDemand.setCentre(Report obj, int index) {
        DiabetesCentre centre = diabetesCentreDataOnDemand.getRandomDiabetesCentre();
        obj.setCentre(centre);
    }
    
    public void ReportDataOnDemand.setChildfields(Report obj, int index) {
        ChildFields[] childfields = ChildFields.values();
        obj.setChildfields(childfields);
    }
    
    public void ReportDataOnDemand.setClinicalrecordfields(Report obj, int index) {
        ClinicalRecordFields[] clinicalrecordfields = ClinicalRecordFields.values();
        obj.setClinicalrecordfields(clinicalrecordfields);
    }
    
    public void ReportDataOnDemand.setCountry(Report obj, int index) {
        Country country = countryDataOnDemand.getRandomCountry();
        obj.setCountry(country);
    }
    
    public void ReportDataOnDemand.setFromDate(Report obj, int index) {
        Date fromDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFromDate(fromDate);
    }
    
    public void ReportDataOnDemand.setIsDeleted(Report obj, int index) {
        Boolean isDeleted = Boolean.TRUE;
        obj.setIsDeleted(isDeleted);
    }
    
    public void ReportDataOnDemand.setName(Report obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void ReportDataOnDemand.setOrderBy(Report obj, int index) {
        String orderBy = "orderBy_" + index;
        obj.setOrderBy(orderBy);
    }
    
    public void ReportDataOnDemand.setRecordNumber(Report obj, int index) {
        String recordNumber = "recordNumber_" + index;
        obj.setRecordNumber(recordNumber);
    }
    
    public void ReportDataOnDemand.setReporttype(Report obj, int index) {
        ReportType reporttype = ReportType.class.getEnumConstants()[0];
        obj.setReporttype(reporttype);
    }
    
    public void ReportDataOnDemand.setShowoptiontype(Report obj, int index) {
        ShowOptionType showoptiontype = ShowOptionType.class.getEnumConstants()[0];
        obj.setShowoptiontype(showoptiontype);
    }
    
    public void ReportDataOnDemand.setStatustype(Report obj, int index) {
        StatusType statustype = StatusType.class.getEnumConstants()[0];
        obj.setStatustype(statustype);
    }
    
    public void ReportDataOnDemand.setThenOrderBy(Report obj, int index) {
        String thenOrderBy = "thenOrderBy_" + index;
        obj.setThenOrderBy(thenOrderBy);
    }
    
    public void ReportDataOnDemand.setTimePeriod(Report obj, int index) {
        String timePeriod = "timePeriod_" + index;
        obj.setTimePeriod(timePeriod);
    }
    
    public void ReportDataOnDemand.setTimeperiodunit(Report obj, int index) {
        TimePeriodUnit timeperiodunit = TimePeriodUnit.class.getEnumConstants()[0];
        obj.setTimeperiodunit(timeperiodunit);
    }
    
    public void ReportDataOnDemand.setToDate(Report obj, int index) {
        Date toDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setToDate(toDate);
    }
    
    public void ReportDataOnDemand.setViewableBy(Report obj, int index) {
        User viewableBy = userDataOnDemand.getRandomUser();
        obj.setViewableBy(viewableBy);
    }
    
    public Report ReportDataOnDemand.getSpecificReport(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Report obj = data.get(index);
        return Report.findReport(obj.getId());
    }
    
    public Report ReportDataOnDemand.getRandomReport() {
        init();
        Report obj = data.get(rnd.nextInt(data.size()));
        return Report.findReport(obj.getId());
    }
    
    public boolean ReportDataOnDemand.modifyReport(Report obj) {
        return false;
    }
    
    public void ReportDataOnDemand.init() {
    	TestUtil.createAndSetTestUser();
        data = Report.findReportEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Report' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.lifeforachild.domain.Report>();
        for (int i = 0; i < 10; i++) {
            Report obj = getNewTransientReport(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}