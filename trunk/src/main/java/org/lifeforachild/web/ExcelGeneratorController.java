package org.lifeforachild.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lifeforachild.domain.Report;
import org.lifeforachild.web.Report.ChildReportGenerator;
import org.lifeforachild.web.Report.ClinicalRecordReportGenerator;
import org.lifeforachild.web.Report.ReportGenerator;
import org.lifeforachild.web.Report.enums.ReportType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller that generates a Excel file of the report for a {@link Report}.
 * 
 * Called when /excelgenerator is called.
 * 
 * @author Serena Potts
 */
@Controller
public class ExcelGeneratorController {

	/**
	 * @param report Report object
	 * @param modelMap Map to hold servlet information
     * @param request HTTP servlet request
     * @param response HTTP servlet response
	 * @return the jsp page to display
	 */
    @RequestMapping(method = RequestMethod.GET, value = "/excelgenerator/{id}")
    public void get(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    	generateExcelReport(id, request, response);
    }   
    
    private void generateExcelReport(Long id, HttpServletRequest request, HttpServletResponse response)
    {
    	Report report = Report.findReport(id);
    	ReportGenerator repGen = ReportGeneratorController.getReportGenerator(report);  		
    	if (repGen != null)
    	{
    		repGen.generateExcelReport(report, request, response);    		
    	}
    }
    
}
