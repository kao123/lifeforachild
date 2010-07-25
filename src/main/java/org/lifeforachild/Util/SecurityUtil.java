package org.lifeforachild.Util;

import org.lifeforachild.domain.AllUserDetails;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.UserGroup;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtil {
	
	private static SecurityUtil instance = null;
	
	protected SecurityUtil() {}
	
	public static SecurityUtil getInstance()
	{
		if (instance == null)
		{
			instance = new SecurityUtil();
		}
		return instance;
	}
	
	public AllUserDetails getCurrentUser()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null)
		{
			Object principal = auth.getPrincipal();
			if (principal != null && principal instanceof AllUserDetails)
				return (AllUserDetails)principal;
		}
		return null;
	}
	
	public User getApplicationUserForCurrentUser()
	{
		return getApplicationUser(getCurrentUser());
	}
	
	public User getApplicationUser(AllUserDetails user)
	{
		return User.findUser(user.getId());
	}
	
	public UserGroup getCurrentUserGroup()
	{
		AllUserDetails user = getCurrentUser();
		if (user == null)
			return null;
		UserGroup ug = new UserGroup();
		ug.setGroupName(user.getUserGroup());
		return ug;
	}
	
	public Integer getCountry()
	{
		AllUserDetails user = getCurrentUser();
		// if no user don't let them access anything
		if (user == null)
			return -1;
		return user.getCountry();
	}
	
	public Integer getCentre()
	{
		AllUserDetails user = getCurrentUser();
		// if no user don't let them access anything
		if (user == null)
			return -1;
		return user.getCentre();
	}	
}
