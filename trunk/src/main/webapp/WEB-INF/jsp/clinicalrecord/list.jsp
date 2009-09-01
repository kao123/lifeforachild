<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="List all ClinicalRecords">
<c:if test="${not empty clinicalrecords}">
<table width="300px">
<tr>
<thead>
<th>Id</th>
<th>Blood Glucose Self Monitoring Per Week</th>
<th>Urine Glucose Self Monitoring Per Week</th>
<th>Adjust Insulin Dose If Needed</th>
<th>Insulin Units Per Day</th>
<th>Number Of Insulin Injections Per Day</th>
<th>Long Acting Human</th>
<th/>
<th/>
<th/>
</thead>
</tr>
<c:forEach items="${clinicalrecords}" var="clinicalrecord">
<tr>
<td>${clinicalrecord.id}</td>
<td>${fn:substring(clinicalrecord.bloodGlucoseSelfMonitoringPerWeek, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.urineGlucoseSelfMonitoringPerWeek, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.adjustInsulinDoseIfNeeded, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.insulinUnitsPerDay, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.numberOfInsulinInjectionsPerDay, 0, 10)}</td>
<td>${fn:substring(clinicalrecord.longActingHuman, 0, 10)}</td>
<td>
<form:form action="/LifeForAChild/clinicalrecord/${clinicalrecord.id}" method="GET">
<input alt="Show clinicalrecord" src="/LifeForAChild/static/images/show.png" title="Show clinicalrecord" type="image" value="Show clinicalrecord"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/clinicalrecord/${clinicalrecord.id}/form" method="GET">
<input alt="Update clinicalrecord" src="/LifeForAChild/static/images/update.png" title="Update clinicalrecord" type="image" value="Update clinicalrecord"/>
</form:form>
</td>
<td>
<form:form action="/LifeForAChild/clinicalrecord/${clinicalrecord.id}" method="DELETE">
<input alt="Delete clinicalrecord" src="/LifeForAChild/static/images/delete.png" title="Delete clinicalrecord" type="image" value="Delete clinicalrecord"/>
</form:form>
</td>
</tr>
</c:forEach>
</table>
</c:if>
<c:if test="${empty clinicalrecords}">No ClinicalRecords found.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>