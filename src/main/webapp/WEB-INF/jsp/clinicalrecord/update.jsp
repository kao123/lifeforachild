<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Update ClinicalRecord">
<form:form action="/LifeForAChild/clinicalrecord/${clinicalrecord.id}" method="PUT" modelAttribute="clinicalrecord">
<div class="submit" id="roo_clinicalrecord_submit">
<script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
<input id="proceed" type="submit" value="Update"/>
</div>
<form:hidden id="_id" path="id"/>
<form:hidden id="_version" path="version"/>
</form:form>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>
