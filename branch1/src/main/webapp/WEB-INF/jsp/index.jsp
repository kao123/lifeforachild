<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN!-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");dojo.require("dijit.form.FilteringSelect");dojo.require("dijit.form.DateTextBox");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Search">
	<c:url value="/search" var="form_url"/>
    <form:form action="${form_url}" method="POST" modelAttribute="search">
        <div id="roo_search_reporttype">
            <label for="_reporttype">Report Type:</label>
            <form:select cssStyle="width:250px" id="_reporttype" items="${_reporttype}" path="reportType" itemLabel="label"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_reporttype', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
            <br/>
        </div>
        <br/>
        <div id="roo_search_id">
            <label for="_id">ID:</label>
            <form:input cssStyle="width:250px" id="_id" maxlength="30" path="id" size="0"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_id", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter ID", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_search_timePeriod">
            <label for="_timePeriod">Time Period:</label>
            <form:input cssStyle="width:50px" id="_timePeriod" maxlength="30" path="timePeriod"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_timePeriod", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Time Period", invalidMessage: "", required : false}})); </script>
            <form:select cssStyle="width:200px" id="_timeperiodunit" items="${_timeperiodunit}" path="timePeriodUnit" itemLabel="label"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_timeperiodunit', widgetType: 'dijit.form.FilteringSelect', widgetAttrs : {hasDownArrow : true}})); </script>
        </div>
        <br/>
        <div id="roo_search_dateRange">
            <label for="_fromDate">Date Range:</label>
            <form:input cssStyle="width:100px" id="_fromDate" maxlength="30" path="fromDate" size="0"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_fromDate', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
            <form:input cssStyle="width:100px" id="_toDate" maxlength="30" path="toDate" size="0"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : '_toDate', widgetType : 'dijit.form.DateTextBox', widgetAttrs : {constraints: {datePattern : 'd/MM/yyyy', required : false}, datePattern : 'd/MM/yyyy'}})); </script>
        </div>
        <br/>
        <div id="roo_search_centre">
            <label for="_centre">Centre:</label>
            <form:input cssStyle="width:250px" id="_centre" maxlength="30" path="centre" size="0"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_centre", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Centre", invalidMessage: "", required : false}})); </script>
        </div>
        <br/>
        <div id="roo_search_country">
            <label for="_country">Country:</label>
            <form:input cssStyle="width:250px" id="_country" maxlength="30" path="country" size="0"/>
            <script type="text/javascript">Spring.addDecoration(new Spring.ElementDecoration({elementId : "_country", widgetType : "dijit.form.ValidationTextBox", widgetAttrs : {promptMessage: "Enter Country", invalidMessage: "", required : false}})); </script>
        </div>
        <div class="submit" id="roo_search_submit">
            <script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
            <input id="proceed" type="submit" value="Search"/>
        </div>       
	</form:form>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
