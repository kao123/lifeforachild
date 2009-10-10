package org.lifeforachild.web;

import java.io.ByteArrayOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Date;
import java.util.HashMap;

import net.sf.jasperreports.engine.JRAbstractExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import org.lifeforachild.domain.OutputType;
import org.lifeforachild.domain.Report;

import ar.com.fdvs.dj.core.DJConstants;
import ar.com.fdvs.dj.core.DynamicJasperHelper;
import ar.com.fdvs.dj.core.layout.AbstractLayoutManager;
import ar.com.fdvs.dj.core.layout.ClassicLayoutManager;
import ar.com.fdvs.dj.core.layout.ListLayoutManager;
import ar.com.fdvs.dj.domain.CustomExpression;
import ar.com.fdvs.dj.domain.DynamicReport;
import ar.com.fdvs.dj.domain.builders.ColumnBuilder;
import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;
import ar.com.fdvs.dj.domain.entities.columns.AbstractColumn;

/**
 * Abstract class that generates a report using DynamicJasper.
 * 
 * A number of different of formats are supported including HTML and Excel.
 * 
 * @author Serena Potts
 *
 */
public abstract class ReportGenerator {

	// The format of dates in a report
	protected static String DATE_FORMAT = "dd/MM/yyyy";
	
	// Class to hold information about the output format
    private class OutputProcessed {
        public AbstractLayoutManager layoutManager;
        public JRAbstractExporter exporter;
        public String contentType;
    }

    /**
     * Create a HTML report based on the {@link Report} parameters.
     * @param report The report parameters
     * @return The HTML for the report as a String. 
     */
	public String generateHtmlReport(Report report)
	{
		// generate the sql query based on the report
    	String query = buildQuery(report);
    	// get the report as bytes
    	byte[] bytes = generateReport(OutputType.HTML, query);
    	// convert to string
        return new String(bytes);
	}
	
	/**
	 * Create a report in Excel file format.
	 * @param query The sql query
	 */
	public void generateExcelReport(String query)
	{
		byte[] bytes = generateReport(OutputType.EXCEL, query);
	}
	
	/**
	 * Generate a report based on the given {@link OutputType} and SQL query.
	 * @param outputType The output format for the report
	 * @param query The SQL query used to filter the results
	 * @return the report as an array of bytes.
	 */
	private byte[] generateReport(String outputType, String query)
	{
        try {
            //Create DynamicReport instance
            DynamicReport dr = buildDynamicReport(query);

            OutputProcessed outputProcessed = processOutput(OutputType.HTML); 
            JRAbstractExporter exporter = outputProcessed.exporter;
            Connection connection = createSQLConnection();
            HashMap params = new HashMap();
            JasperPrint jp = DynamicJasperHelper.generateJasperPrint(dr, outputProcessed.layoutManager, connection, params);
            
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
            exporter.exportReport();

            return baos.toByteArray();
        } catch (Exception e) {
            System.out.print("ERROR: " + e.getMessage());
        }
        return new byte[0];
	}
	
	/**
	 * Get the {@link OutputProcessed} based on the output format.
	 * @param output The output format of the report.
	 */
    private OutputProcessed processOutput(String output) {
        OutputProcessed result = new OutputProcessed();
        if (output.equals(OutputType.PDF)) {
            result.contentType = "application/pdf";
            result.exporter = new JRPdfExporter();
            result.layoutManager = new ClassicLayoutManager();
        } else if (output.equals(OutputType.HTML)) {
            result.contentType = "text/html";
            result.exporter = new JRHtmlExporter();
            result.exporter.setParameter(
                    JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
            result.layoutManager = new ClassicLayoutManager();
        } else if (output.equals(OutputType.EXCEL)) {
            result.contentType = "application/vnd.ms-excel";
            result.exporter = new JRXlsExporter();
            result.exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
            result.exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
            result.layoutManager = new ClassicLayoutManager();
        } else if (output.equals(OutputType.EXCEL_PLAIN)) {
            result.contentType = "application/vnd.ms-excel";
            result.exporter = new JRXlsExporter();
            result.exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
            result.exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
            result.layoutManager = new ListLayoutManager();
        } else {
            result.contentType = "application/rtf";
            result.exporter = new JRRtfExporter();
            result.layoutManager = new ClassicLayoutManager();
        }
        return result;
    }
	
    /**
     * Get the SQL connection.
     */
	public static Connection createSQLConnection() throws Exception 
	{
		// TODO remove hard coding - how to get this information??
		Connection con = null;
		     Class.forName("com.mysql.jdbc.Driver" );
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/life_for_a_child", "dev", "password");
		return con;
	}

	/**
	 * Build the {@link DynamicReport} which adds the appropriate columns.
	 * @param query The SQL query/
	 */
    private DynamicReport buildDynamicReport(String query) throws Exception 
    {       
        DynamicReportBuilder drb = new DynamicReportBuilder();
        Integer margin = new Integer(20);
        drb
        //.setTitle("My Title")
        //.setSubtitle("My Subtitle")         
        .setLeftMargin(margin)
        .setRightMargin(margin)
        .setTopMargin(margin)
        .setQuery(query, DJConstants.QUERY_LANGUAGE_SQL)
        .setBottomMargin(margin)
        .setPrintBackgroundOnOddRows(true);                      

        addColumns(drb);
        
        DynamicReport dr = drb.build();
        return dr;
    }

    /**
     * Add a date column to the report
     * @param drb The report builder.
     * @param name The name of the column in the database
     * @param title The title to display for the column on the report
     * @throws ColumnBuilderException
     */
    protected void addDateColumn(DynamicReportBuilder drb, String name, String title)
    throws ColumnBuilderException
    {
    	addColumn(drb, name, title, Date.class, 100, DATE_FORMAT, null);
    }
	
    /**
     * Add a column to the report
     * @param drb The report builder
     * @param name The name of the column in the database
     * @param title The title to display for the column on the report
     * @param columnClass The equivalent java class for the columns database type
     * @param width The width of the column in the report
     * @throws ColumnBuilderException
     */
    protected void addColumn(DynamicReportBuilder drb, String name, String title, Class columnClass, int width)
    throws ColumnBuilderException
    {
    	addColumn(drb, name, title, columnClass, width, null, null);
    }
    
    /**
     * 
     * Add a column to the report
     * @param drb The report builder
     * @param name The name of the column in the database
     * @param title The title to display for the column on the report
     * @param columnClass The equivalent java class for the columns database type
     * @param width The width of the column in the report
     * @param pattern string of pattern to apply
     * @param customExpression Custom Expression which provides more complicated formatting
     * @throws ColumnBuilderException
     */
    protected void addColumn(DynamicReportBuilder drb, String name, String title, Class columnClass, 
    		int width, String pattern, CustomExpression customExpression)
    throws ColumnBuilderException
    {
    	ColumnBuilder columnBuilder = ColumnBuilder.getInstance();
    	if (customExpression != null)
    		columnBuilder.setCustomExpression(customExpression);
    	else
    		columnBuilder.setColumnProperty(name, columnClass.getName());
        //defines the field of the data source that this column will show, also its type                             
        //the title for the column
        columnBuilder.setTitle(title);                                                                   
        //the width of the column
        columnBuilder.setWidth(width);    
        // set a formatting pattern to apply
        columnBuilder.setPattern(pattern);
    	//creates a new instance of a ColumnBuilder
        AbstractColumn column = columnBuilder.build();                                                                                                       //builds and return a new AbstractColumn
        drb.addColumn(column);
    }

    /**
     * Add columns specific to the report type.
     * @param drb The report builder.
     * @throws ColumnBuilderException
     */
	abstract void addColumns(DynamicReportBuilder drb) throws ColumnBuilderException;
	
	/**
	 * Build the SQL query based on the report parameters.
	 * @param report The report parameters.
	 * @return The SQL query.
	 */
	abstract String buildQuery(Report report);
}
