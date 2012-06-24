// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.lifeforachild.domain;

import java.lang.Boolean;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.util.TestUtil;
import org.springframework.stereotype.Component;

privileged aspect DiabetesCentreDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DiabetesCentreDataOnDemand: @Component;
    
    private Random DiabetesCentreDataOnDemand.rnd = new SecureRandom();
    
    private List<DiabetesCentre> DiabetesCentreDataOnDemand.data;
    
    public DiabetesCentre DiabetesCentreDataOnDemand.getNewTransientDiabetesCentre(int index) {
        DiabetesCentre obj = new DiabetesCentre();
        setAddress(obj, index);
        setCountry(obj, index);
        setIsDeleted(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void DiabetesCentreDataOnDemand.setAddress(DiabetesCentre obj, int index) {
        String address = "address_" + index;
        if (address.length() > 200) {
            address = address.substring(0, 200);
        }
        obj.setAddress(address);
    }
    
    public void DiabetesCentreDataOnDemand.setCountry(DiabetesCentre obj, int index) {
        Country country = null;
        obj.setCountry(country);
    }
    
    public void DiabetesCentreDataOnDemand.setIsDeleted(DiabetesCentre obj, int index) {
        Boolean isDeleted = Boolean.TRUE;
        obj.setIsDeleted(isDeleted);
    }
    
    public void DiabetesCentreDataOnDemand.setName(DiabetesCentre obj, int index) {
        String name = "name_" + index;
        if (name.length() > 30) {
            name = name.substring(0, 30);
        }
        obj.setName(name);
    }
    
    public DiabetesCentre DiabetesCentreDataOnDemand.getSpecificDiabetesCentre(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        DiabetesCentre obj = data.get(index);
        return DiabetesCentre.findDiabetesCentre(obj.getId());
    }
    
    public DiabetesCentre DiabetesCentreDataOnDemand.getRandomDiabetesCentre() {
        init();
        DiabetesCentre obj = data.get(rnd.nextInt(data.size()));
        return DiabetesCentre.findDiabetesCentre(obj.getId());
    }
    
    public boolean DiabetesCentreDataOnDemand.modifyDiabetesCentre(DiabetesCentre obj) {
        return false;
    }
    
    public void DiabetesCentreDataOnDemand.init() {
    	TestUtil.createAndSetTestUser();
        data = DiabetesCentre.findDiabetesCentreEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'DiabetesCentre' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.lifeforachild.domain.DiabetesCentre>();
        for (int i = 0; i < 10; i++) {
            DiabetesCentre obj = getNewTransientDiabetesCentre(i);
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
