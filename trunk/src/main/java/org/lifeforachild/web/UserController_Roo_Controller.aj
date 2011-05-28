package org.lifeforachild.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.lifeforachild.Util.SecurityUtil;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.User;
import org.lifeforachild.domain.UserGroup;
import org.lifeforachild.web.Report.ReportGenerator;
import org.lifeforachild.web.Report.UserReportGenerator;
import org.lifeforachild.web.validation.UserValidator;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UserController_Roo_Controller {
    
    @RequestMapping(value = "/user", method = RequestMethod.POST)    
    public String UserController.create(@Valid User user, BindingResult result, ModelMap modelMap) {    
        if (user == null) throw new IllegalArgumentException("A user is required");  
        validate(result, user);        
        encryptPassword(user);
        if (result.hasErrors()) {        
            modelMap.addAttribute("user", user);            
            modelMap.addAttribute("countrys", Country.findAllCountrys(true));            
            Country country = user.getCountry();
            List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
            modelMap.addAttribute("diabetescentres", centres);           
            modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());            
            return "user/create";            
        }        
        user.persist();     
        return "redirect:/user/" + user.getId();        
    }    
    
    @RequestMapping(value = "/user/form", method = RequestMethod.GET)    
    public String UserController.createForm(ModelMap modelMap) {
    	User user = new User();
    	user.setIsDeleted(false);
    	user.setCreatedOn(new Date());
    	user.setUpdatedOn(new Date());    	
    	String username = SecurityUtil.getInstance().getCurrentUsername();
    	user.setCreatedBy(username);
    	user.setUpdatedBy(username);
    	user.setEnabled(true);
        modelMap.addAttribute("user", user);        
        modelMap.addAttribute("countrys", Country.findAllCountrys(true));        
        modelMap.addAttribute("diabetescentres", null);        
        modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());        
        return "user/create";        
    }    
    
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)    
    public String UserController.show(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        modelMap.addAttribute("user", User.findUser(id, true));        
        return "user/show";        
    }    
    
    @RequestMapping(value = "/user", method = RequestMethod.GET)    
    public String UserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {    
        if (page != null || size != null) {        
            int sizeNo = size == null ? 10 : size.intValue();            
            modelMap.addAttribute("users", User.findUserEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));            
            float nrOfPages = (float) User.countUsers() / sizeNo;            
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));            
        } else {        
            modelMap.addAttribute("users", User.findAllUsers());            
        }        
        return "user/list";        
    }    
    
    @RequestMapping(method = RequestMethod.PUT)    
    public String UserController.update(@Valid User user, BindingResult result, ModelMap modelMap) {    
        if (user == null) throw new IllegalArgumentException("A user is required");  
        validate(result, user);
        if (result.hasErrors()) {        
            modelMap.addAttribute("user", user);            
            modelMap.addAttribute("countrys", Country.findAllCountrys(true));            
            Country country = user.getCountry();
            List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
            modelMap.addAttribute("diabetescentres", centres);            
            modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups());            
            return "user/update";            
        }        
        if (!user.getOldPassword().equals(user.getPassword()))
        {
        	// user has changed password so encode and save
        	encryptPassword(user);
        }
        user.merge();        
        return "redirect:/user/" + user.getId();        
    }    
    
    @RequestMapping(value = "/user/{id}/form", method = RequestMethod.GET)    
    public String UserController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");    
        User user = User.findUser(id, true);
        user.setUpdatedOn(new Date());
        String username = SecurityUtil.getInstance().getCurrentUsername();
        user.setUpdatedBy(username);
        user.setOldPassword(user.getPassword());
        modelMap.addAttribute("user", user);        
        modelMap.addAttribute("countrys", Country.findAllCountrys(true));        
        Country country = user.getCountry();
        List<DiabetesCentre> centres = (country == null) ? null : DiabetesCentre.findAllDiabetesCentres(true, country.getId());
        modelMap.addAttribute("diabetescentres", centres);        
        modelMap.addAttribute("usergroups", UserGroup.findAllUserGroups()); 
        return "user/update";        
    }    
    
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)    
    public String UserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {    
        if (id == null) throw new IllegalArgumentException("An Identifier is required");        
        User user = User.findUser(id, true);
        user.setIsDeleted(true);
        user.persist();
        return "redirect:/user?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());        
    }    
    
    @RequestMapping(value = "/user/print", method = RequestMethod.GET)    
    public void UserController.printForm(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
	{
    	ReportGenerator repGen = new UserReportGenerator();
    	repGen.generateExcelReport("List Users'", User.findAllUsers(), null, request, response);
	}     
    
    public static void encryptPassword(User user)
    {
    	ShaPasswordEncoder passwordEncoder = new ShaPasswordEncoder();
        user.setPassword(passwordEncoder.encodePassword(user.getPassword(), null));
    }
    
	public void UserController.validate(BindingResult result, User user) {
		Errors errors = new BindException(result);
		UserValidator validator = new UserValidator();
		validator.validate(user, errors);
	}      
    
}
