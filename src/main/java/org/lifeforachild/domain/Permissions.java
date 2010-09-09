package org.lifeforachild.domain;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Permissions {
	
	public static final String EDIT_CHILD = "EDIT_CHILD";
	public static final String CREATE_CHILD = "CREATE_CHILD";
	public static final String CREATE_RECORD = "CREATE_RECORD";
	public static final String EDIT_RECORD = "EDIT_RECORD";
	public static final String CREATE_COUNTRY = "CREATE_COUNTRY";	
	public static final String EDIT_COUNTRY = "EDIT_COUNTRY";
	public static final String CREATE_CENTRE = "CREATE_CENTRE";
	public static final String EDIT_CENTRE = "EDITEDIT_CENTRE_RECORD";
	public static final String VIEW_REPORT = "VIEW_REPORT";
	public static final String EDIT_REPORT = "EDIT_REPORT";
	public static final String CREATE_REPORT = "CREATE_REPORT";	
	
	@NotNull
	String name;
	String description;
}
