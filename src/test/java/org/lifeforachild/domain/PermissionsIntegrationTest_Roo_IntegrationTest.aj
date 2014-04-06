// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.lifeforachild.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.lifeforachild.domain.PermissionsDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionsIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PermissionsIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PermissionsIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: PermissionsIntegrationTest: @Transactional;
    
    @Autowired
    private PermissionsDataOnDemand PermissionsIntegrationTest.dod;
    
    @Test
    public void PermissionsIntegrationTest.testCountPermissionses() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to initialize correctly", dod.getRandomPermissions());
        long count = org.lifeforachild.domain.Permissions.countPermissionses();
        org.junit.Assert.assertTrue("Counter for 'Permissions' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PermissionsIntegrationTest.testFindPermissions() {
        org.lifeforachild.domain.Permissions obj = dod.getRandomPermissions();
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to provide an identifier", id);
        obj = org.lifeforachild.domain.Permissions.findPermissions(id);
        org.junit.Assert.assertNotNull("Find method for 'Permissions' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Permissions' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PermissionsIntegrationTest.testFindAllPermissionses() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to initialize correctly", dod.getRandomPermissions());
        long count = org.lifeforachild.domain.Permissions.countPermissionses();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Permissions', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.lifeforachild.domain.Permissions> result = org.lifeforachild.domain.Permissions.findAllPermissionses();
        org.junit.Assert.assertNotNull("Find all method for 'Permissions' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Permissions' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PermissionsIntegrationTest.testFindPermissionsEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to initialize correctly", dod.getRandomPermissions());
        long count = org.lifeforachild.domain.Permissions.countPermissionses();
        if (count > 20) count = 20;
        java.util.List<org.lifeforachild.domain.Permissions> result = org.lifeforachild.domain.Permissions.findPermissionsEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Permissions' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Permissions' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PermissionsIntegrationTest.testFlush() {
        org.lifeforachild.domain.Permissions obj = dod.getRandomPermissions();
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to provide an identifier", id);
        obj = org.lifeforachild.domain.Permissions.findPermissions(id);
        org.junit.Assert.assertNotNull("Find method for 'Permissions' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermissions(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Permissions' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PermissionsIntegrationTest.testMerge() {
        org.lifeforachild.domain.Permissions obj = dod.getRandomPermissions();
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to provide an identifier", id);
        obj = org.lifeforachild.domain.Permissions.findPermissions(id);
        boolean modified =  dod.modifyPermissions(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.merge();
        obj.flush();
        //org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Permissions' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PermissionsIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to initialize correctly", dod.getRandomPermissions());
        org.lifeforachild.domain.Permissions obj = dod.getNewTransientPermissions(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Permissions' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Permissions' identifier to no longer be null", obj.getId());
    }
    
    //@Test
    public void PermissionsIntegrationTest.testRemove() {
        org.lifeforachild.domain.Permissions obj = dod.getRandomPermissions();
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Permissions' failed to provide an identifier", id);
        obj = org.lifeforachild.domain.Permissions.findPermissions(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Permissions' with identifier '" + id + "'", org.lifeforachild.domain.Permissions.findPermissions(id));
    }
    
}