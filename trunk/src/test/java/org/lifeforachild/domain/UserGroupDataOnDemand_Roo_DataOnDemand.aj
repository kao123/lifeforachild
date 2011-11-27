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

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.UserGroup;
import org.lifeforachild.util.TestUtil;
import org.springframework.stereotype.Component;

privileged aspect UserGroupDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UserGroupDataOnDemand: @Component;
    
    private Random UserGroupDataOnDemand.rnd = new SecureRandom();
    
    private List<UserGroup> UserGroupDataOnDemand.data;
    
    public UserGroup UserGroupDataOnDemand.getNewTransientUserGroup(int index) {
        UserGroup obj = new UserGroup();
        setGroupCode(obj, index);
        setGroupName(obj, index);
        setIsDeleted(obj, index);
        return obj;
    }
    
    public void UserGroupDataOnDemand.setGroupCode(UserGroup obj, int index) {
        String groupCode = "groupCode_" + index;
        obj.setGroupCode(groupCode);
    }
    
    public void UserGroupDataOnDemand.setGroupName(UserGroup obj, int index) {
        String groupName = "groupName_" + index;
        obj.setGroupName(groupName);
    }
    
    public void UserGroupDataOnDemand.setIsDeleted(UserGroup obj, int index) {
        Boolean isDeleted = Boolean.TRUE;
        obj.setIsDeleted(isDeleted);
    }
    
    public UserGroup UserGroupDataOnDemand.getSpecificUserGroup(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        UserGroup obj = data.get(index);
        return UserGroup.findUserGroup(obj.getId());
    }
    
    public UserGroup UserGroupDataOnDemand.getRandomUserGroup() {
        init();
        UserGroup obj = data.get(rnd.nextInt(data.size()));
        return UserGroup.findUserGroup(obj.getId());
    }
    
    public boolean UserGroupDataOnDemand.modifyUserGroup(UserGroup obj) {
        return false;
    }
    
    public void UserGroupDataOnDemand.init() {
    	TestUtil.createAndSetTestUser();
        data = UserGroup.findUserGroupEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'UserGroup' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.lifeforachild.domain.UserGroup>();
        for (int i = 0; i < 10; i++) {
            UserGroup obj = getNewTransientUserGroup(i);
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
