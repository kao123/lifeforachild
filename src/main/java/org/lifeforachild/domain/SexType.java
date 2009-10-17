package org.lifeforachild.domain;

import java.util.Map;

import net.sf.jasperreports.engine.fill.JRFillField;

import ar.com.fdvs.dj.domain.CustomExpression;

public enum SexType {
	MALE("Male"),
	FEMALE("Female");
	
	SexType(String s) { label = s; }
    
    String label;
    
    public String getLabel() { return label; }

    /**
     * Custom Expression that formats a SexType enum in a report to display the label based
     * on the code.
     */
	public static CustomExpression getCustomExpression() {
	    return new CustomExpression() {
	            public Object evaluate(Map fields, Map variables, Map parameters) {
	            	String sex = (String)fields.get("sex");               
	                return values()[Integer.valueOf(sex)].getLabel();
	            }
	
	            public String getClassName() {
	                    return String.class.getName();
	            }
	    };
	}

}