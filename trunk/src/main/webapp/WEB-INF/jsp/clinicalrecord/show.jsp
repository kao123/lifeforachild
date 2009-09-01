<!--WARNING: This file is maintained by ROO! IT WILL BE OVERWRITTEN unless you specify null	@RooWebScaffold(automaticallyMaintainView = false) in the governing controller-->
<jsp:directive.include file="/WEB-INF/jsp/includes.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<script type="text/javascript">dojo.require("dijit.TitlePane");</script>
<div dojoType="dijit.TitlePane" style="width: 100%" title="Show ClinicalRecord">
<c:if test="${not empty clinicalrecord}">
<div id="roo_clinicalrecord_bloodGlucoseSelfMonitoringPerWeek">
<label for="_bloodGlucoseSelfMonitoringPerWeek">Blood Glucose Self Monitoring Per Week:</label>
<div class="box" id="_bloodGlucoseSelfMonitoringPerWeek">${clinicalrecord.bloodGlucoseSelfMonitoringPerWeek}</div>
</div>
<br/>
<div id="roo_clinicalrecord_urineGlucoseSelfMonitoringPerWeek">
<label for="_urineGlucoseSelfMonitoringPerWeek">Urine Glucose Self Monitoring Per Week:</label>
<div class="box" id="_urineGlucoseSelfMonitoringPerWeek">${clinicalrecord.urineGlucoseSelfMonitoringPerWeek}</div>
</div>
<br/>
<div id="roo_clinicalrecord_adjustInsulinDoseIfNeeded">
<label for="_adjustInsulinDoseIfNeeded">Adjust Insulin Dose If Needed:</label>
<div class="box" id="_adjustInsulinDoseIfNeeded">${clinicalrecord.adjustInsulinDoseIfNeeded}</div>
</div>
<br/>
<div id="roo_clinicalrecord_insulinUnitsPerDay">
<label for="_insulinUnitsPerDay">Insulin Units Per Day:</label>
<div class="box" id="_insulinUnitsPerDay">${clinicalrecord.insulinUnitsPerDay}</div>
</div>
<br/>
<div id="roo_clinicalrecord_numberOfInsulinInjectionsPerDay">
<label for="_numberOfInsulinInjectionsPerDay">Number Of Insulin Injections Per Day:</label>
<div class="box" id="_numberOfInsulinInjectionsPerDay">${clinicalrecord.numberOfInsulinInjectionsPerDay}</div>
</div>
<br/>
<div id="roo_clinicalrecord_longActingHuman">
<label for="_longActingHuman">Long Acting Human:</label>
<div class="box" id="_longActingHuman">${clinicalrecord.longActingHuman}</div>
</div>
<br/>
<div id="roo_clinicalrecord_shortActingHuman">
<label for="_shortActingHuman">Short Acting Human:</label>
<div class="box" id="_shortActingHuman">${clinicalrecord.shortActingHuman}</div>
</div>
<br/>
<div id="roo_clinicalrecord_analog">
<label for="_analog">Analog:</label>
<div class="box" id="_analog">${clinicalrecord.analog}</div>
</div>
<br/>
<div id="roo_clinicalrecord_oralAgents">
<label for="_oralAgents">Oral Agents:</label>
<div class="box" id="_oralAgents">${clinicalrecord.oralAgents}</div>
</div>
<br/>
<div id="roo_clinicalrecord_oralAgentsDescription">
<label for="_oralAgentsDescription">Oral Agents Description:</label>
<div class="box" id="_oralAgentsDescription">${clinicalrecord.oralAgentsDescription}</div>
</div>
<br/>
<div id="roo_clinicalrecord_routineClinicReviewsLastYear">
<label for="_routineClinicReviewsLastYear">Routine Clinic Reviews Last Year:</label>
<div class="box" id="_routineClinicReviewsLastYear">${clinicalrecord.routineClinicReviewsLastYear}</div>
</div>
<br/>
<div id="roo_clinicalrecord_bpMedications">
<label for="_bpMedications">Bp Medications:</label>
<div class="box" id="_bpMedications">${clinicalrecord.bpMedications}</div>
</div>
<br/>
<div id="roo_clinicalrecord_bpMedicationsOther">
<label for="_bpMedicationsOther">Bp Medications Other:</label>
<div class="box" id="_bpMedicationsOther">${clinicalrecord.bpMedicationsOther}</div>
</div>
<br/>
<div id="roo_clinicalrecord_otherTreatments">
<label for="_otherTreatments">Other Treatments:</label>
<div class="box" id="_otherTreatments">${clinicalrecord.otherTreatments}</div>
</div>
<br/>
<div id="roo_clinicalrecord_weightKG">
<label for="_weightKG">Weight K G:</label>
<div class="box" id="_weightKG">${clinicalrecord.weightKG}</div>
</div>
<br/>
<div id="roo_clinicalrecord_heightCM">
<label for="_heightCM">Height C M:</label>
<div class="box" id="_heightCM">${clinicalrecord.heightCM}</div>
</div>
<br/>
<div id="roo_clinicalrecord_bloodPressureSystolicMMHg">
<label for="_bloodPressureSystolicMMHg">Blood Pressure Systolic M M Hg:</label>
<div class="box" id="_bloodPressureSystolicMMHg">${clinicalrecord.bloodPressureSystolicMMHg}</div>
</div>
<br/>
<div id="roo_clinicalrecord_bloodPressureDiastolicMMHg">
<label for="_bloodPressureDiastolicMMHg">Blood Pressure Diastolic M M Hg:</label>
<div class="box" id="_bloodPressureDiastolicMMHg">${clinicalrecord.bloodPressureDiastolicMMHg}</div>
</div>
<br/>
<div id="roo_clinicalrecord_dateOfMeasurement">
<label for="_dateOfMeasurement">Date Of Measurement:</label>
<div class="box" id="_dateOfMeasurement">
<fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${clinicalrecord.dateOfMeasurement}"/>
</div>
</div>
<br/>
<div id="roo_clinicalrecord_age">
<label for="_age">Age:</label>
<div class="box" id="_age">${clinicalrecord.age}</div>
</div>
<br/>
<div id="roo_clinicalrecord_hasPersistentHypertension">
<label for="_hasPersistentHypertension">Has Persistent Hypertension:</label>
<div class="box" id="_hasPersistentHypertension">${clinicalrecord.hasPersistentHypertension}</div>
</div>
<br/>
<div id="roo_clinicalrecord_hasPubertyTannerB2_P2orGreater">
<label for="_hasPubertyTannerB2_P2orGreater">Has Puberty Tanner B2_ P2or Greater:</label>
<div class="box" id="_hasPubertyTannerB2_P2orGreater">${clinicalrecord.hasPubertyTannerB2_P2orGreater}</div>
</div>
<br/>
<div id="roo_clinicalrecord_menarche">
<label for="_menarche">Menarche:</label>
<div class="box" id="_menarche">${clinicalrecord.menarche}</div>
</div>
<br/>
<div id="roo_clinicalrecord_ifMenarcheAge">
<label for="_ifMenarcheAge">If Menarche Age:</label>
<div class="box" id="_ifMenarcheAge">
<fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${clinicalrecord.ifMenarcheAge}"/>
</div>
</div>
<br/>
<div id="roo_clinicalrecord_eyesExaminedInLastYear">
<label for="_eyesExaminedInLastYear">Eyes Examined In Last Year:</label>
<div class="box" id="_eyesExaminedInLastYear">${clinicalrecord.eyesExaminedInLastYear}</div>
</div>
<br/>
<div id="roo_clinicalrecord_cateract">
<label for="_cateract">Cateract:</label>
<div class="box" id="_cateract">${clinicalrecord.cateract}</div>
</div>
<br/>
<div id="roo_clinicalrecord_visualAcuityRight">
<label for="_visualAcuityRight">Visual Acuity Right:</label>
<div class="box" id="_visualAcuityRight">${clinicalrecord.visualAcuityRight}</div>
</div>
<br/>
<div id="roo_clinicalrecord_visualAcuityLeft">
<label for="_visualAcuityLeft">Visual Acuity Left:</label>
<div class="box" id="_visualAcuityLeft">${clinicalrecord.visualAcuityLeft}</div>
</div>
<br/>
<div id="roo_clinicalrecord_feetExaminedInLastYear">
<label for="_feetExaminedInLastYear">Feet Examined In Last Year:</label>
<div class="box" id="_feetExaminedInLastYear">${clinicalrecord.feetExaminedInLastYear}</div>
</div>
<br/>
<div id="roo_clinicalrecord_monofilamentTested">
<label for="_monofilamentTested">Monofilament Tested:</label>
<div class="box" id="_monofilamentTested">${clinicalrecord.monofilamentTested}</div>
</div>
<br/>
<div id="roo_clinicalrecord_monofilamentAbnormal">
<label for="_monofilamentAbnormal">Monofilament Abnormal:</label>
<div class="box" id="_monofilamentAbnormal">${clinicalrecord.monofilamentAbnormal}</div>
</div>
<br/>
<div id="roo_clinicalrecord_tuningForkTested">
<label for="_tuningForkTested">Tuning Fork Tested:</label>
<div class="box" id="_tuningForkTested">${clinicalrecord.tuningForkTested}</div>
</div>
<br/>
<div id="roo_clinicalrecord_tuningForkAbnormal">
<label for="_tuningForkAbnormal">Tuning Fork Abnormal:</label>
<div class="box" id="_tuningForkAbnormal">${clinicalrecord.tuningForkAbnormal}</div>
</div>
<br/>
<div id="roo_clinicalrecord_lastHbA1cInLast12Months">
<label for="_lastHbA1cInLast12Months">Last Hb A1c In Last12 Months:</label>
<div class="box" id="_lastHbA1cInLast12Months">${clinicalrecord.lastHbA1cInLast12Months}</div>
</div>
<br/>
<div id="roo_clinicalrecord_hbA1cMethod">
<label for="_hbA1cMethod">Hb A1c Method:</label>
<div class="box" id="_hbA1cMethod">${clinicalrecord.hbA1cMethod}</div>
</div>
<br/>
<div id="roo_clinicalrecord_hbA1cMethodOther">
<label for="_hbA1cMethodOther">Hb A1c Method Other:</label>
<div class="box" id="_hbA1cMethodOther">${clinicalrecord.hbA1cMethodOther}</div>
</div>
<br/>
<div id="roo_clinicalrecord_microalbuminuriaValue">
<label for="_microalbuminuriaValue">Microalbuminuria Value:</label>
<div class="box" id="_microalbuminuriaValue">${clinicalrecord.microalbuminuriaValue}</div>
</div>
<br/>
<div id="roo_clinicalrecord_microalbuminuriaUnitOfMeasure">
<label for="_microalbuminuriaUnitOfMeasure">Microalbuminuria Unit Of Measure:</label>
<div class="box" id="_microalbuminuriaUnitOfMeasure">${clinicalrecord.microalbuminuriaUnitOfMeasure}</div>
</div>
<br/>
<div id="roo_clinicalrecord_creatinineValue">
<label for="_creatinineValue">Creatinine Value:</label>
<div class="box" id="_creatinineValue">${clinicalrecord.creatinineValue}</div>
</div>
<br/>
<div id="roo_clinicalrecord_creatinineUnits">
<label for="_creatinineUnits">Creatinine Units:</label>
<div class="box" id="_creatinineUnits">${clinicalrecord.creatinineUnits}</div>
</div>
<br/>
<div id="roo_clinicalrecord_totalCholesterolValue">
<label for="_totalCholesterolValue">Total Cholesterol Value:</label>
<div class="box" id="_totalCholesterolValue">${clinicalrecord.totalCholesterolValue}</div>
</div>
<br/>
<div id="roo_clinicalrecord_cholesterolUnits">
<label for="_cholesterolUnits">Cholesterol Units:</label>
<div class="box" id="_cholesterolUnits">${clinicalrecord.cholesterolUnits}</div>
</div>
<br/>
<div id="roo_clinicalrecord_hDLCholesterolValue">
<label for="_hDLCholesterolValue">H D L Cholesterol Value:</label>
<div class="box" id="_hDLCholesterolValue">${clinicalrecord.hDLCholesterolValue}</div>
</div>
<br/>
<div id="roo_clinicalrecord_hDLUnits">
<label for="_hDLUnits">H D L Units:</label>
<div class="box" id="_hDLUnits">${clinicalrecord.hDLUnits}</div>
</div>
<br/>
<div id="roo_clinicalrecord_triglyceridesValue">
<label for="_triglyceridesValue">Triglycerides Value:</label>
<div class="box" id="_triglyceridesValue">${clinicalrecord.triglyceridesValue}</div>
</div>
<br/>
<div id="roo_clinicalrecord_triglyceridesUnits">
<label for="_triglyceridesUnits">Triglycerides Units:</label>
<div class="box" id="_triglyceridesUnits">${clinicalrecord.triglyceridesUnits}</div>
</div>
<br/>
<div id="roo_clinicalrecord_fasted">
<label for="_fasted">Fasted:</label>
<div class="box" id="_fasted">${clinicalrecord.fasted}</div>
</div>
<br/>
<div id="roo_clinicalrecord_attendingSchool">
<label for="_attendingSchool">Attending School:</label>
<div class="box" id="_attendingSchool">${clinicalrecord.attendingSchool}</div>
</div>
<br/>
<div id="roo_clinicalrecord_notAttendingSchoolWhy">
<label for="_notAttendingSchoolWhy">Not Attending School Why:</label>
<div class="box" id="_notAttendingSchoolWhy">${clinicalrecord.notAttendingSchoolWhy}</div>
</div>
<br/>
<div id="roo_clinicalrecord_diabetesLimitingAttendance">
<label for="_diabetesLimitingAttendance">Diabetes Limiting Attendance:</label>
<div class="box" id="_diabetesLimitingAttendance">${clinicalrecord.diabetesLimitingAttendance}</div>
</div>
<br/>
<div id="roo_clinicalrecord_appropriateGradeForAge">
<label for="_appropriateGradeForAge">Appropriate Grade For Age:</label>
<div class="box" id="_appropriateGradeForAge">${clinicalrecord.appropriateGradeForAge}</div>
</div>
<br/>
<div id="roo_clinicalrecord_diabetesCopingAbilities">
<label for="_diabetesCopingAbilities">Diabetes Coping Abilities:</label>
<div class="box" id="_diabetesCopingAbilities">${clinicalrecord.diabetesCopingAbilities}</div>
</div>
<br/>
<div id="roo_clinicalrecord_numberOfSevereHypoglycaemiaEpisodes">
<label for="_numberOfSevereHypoglycaemiaEpisodes">Number Of Severe Hypoglycaemia Episodes:</label>
<div class="box" id="_numberOfSevereHypoglycaemiaEpisodes">${clinicalrecord.numberOfSevereHypoglycaemiaEpisodes}</div>
</div>
<br/>
<div id="roo_clinicalrecord_numberKetoacidosisEpisodes">
<label for="_numberKetoacidosisEpisodes">Number Ketoacidosis Episodes:</label>
<div class="box" id="_numberKetoacidosisEpisodes">${clinicalrecord.numberKetoacidosisEpisodes}</div>
</div>
<br/>
<div id="roo_clinicalrecord_numberOfHospitalAdmissionsRelatedToDiabetes">
<label for="_numberOfHospitalAdmissionsRelatedToDiabetes">Number Of Hospital Admissions Related To Diabetes:</label>
<div class="box" id="_numberOfHospitalAdmissionsRelatedToDiabetes">${clinicalrecord.numberOfHospitalAdmissionsRelatedToDiabetes}</div>
</div>
<br/>
<div id="roo_clinicalrecord_additionalComment">
<label for="_additionalComment">Additional Comment:</label>
<div class="box" id="_additionalComment">${clinicalrecord.additionalComment}</div>
</div>
<br/>
<div id="roo_clinicalrecord_personCompletingForm">
<label for="_personCompletingForm">Person Completing Form:</label>
<div class="box" id="_personCompletingForm">${clinicalrecord.personCompletingForm}</div>
</div>
<br/>
<div id="roo_clinicalrecord_dateCompleted">
<label for="_dateCompleted">Date Completed:</label>
<div class="box" id="_dateCompleted">
<fmt:formatDate pattern="d/MM/yyyy" type="DATE" value="${clinicalrecord.dateCompleted}"/>
</div>
</div>
<br/>
<div id="roo_clinicalrecord_seniorPhysician">
<label for="_seniorPhysician">Senior Physician:</label>
<div class="box" id="_seniorPhysician">${clinicalrecord.seniorPhysician}</div>
</div>
<br/>
<div id="roo_clinicalrecord_child">
<label for="_child">Child:</label>
<div class="box" id="_child">${clinicalrecord.child}</div>
</div>
<br/>
</c:if>
<c:if test="${empty clinicalrecord}">No ClinicalRecord found with this id.</c:if>
</div>
<jsp:directive.include file="/WEB-INF/jsp/footer.jsp"/>