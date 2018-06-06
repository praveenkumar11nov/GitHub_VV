<%@include file="/common/taglibs.jsp"%>
 
<!--   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
		
<%-- <c:url value="/prePaidPayment/getPropertyNamesUrl"
	var="getPropertyNamesUrl" />
<c:url value="/prePaidPayment/getMeterNumberUrl" var="getMeterNumberUrl" /> --%>


<kendo:grid name="grid" pageable="true" resizable="true" sortable="true"
	reorderable="true" selectable="false" scrollable="true"
	filterable="false" groupable="true">
	<kendo:grid-pageable pageSizes="true" buttonCount="5" pageSize="10"
		input="true" numeric="true" refresh="true" info="true"
		previousNext="true">
		<kendo:grid-pageable-messages itemsPerPage="Status items per page"
			empty="No status item to display"
			refresh="Refresh all the status items"
			display="{0} - {1} of {2} New Status Items"
			first="Go to the first page of status items"
			last="Go to the last page of status items"
			next="Go to the next page of status items"
			previous="Go to the previous page of status items" />
	</kendo:grid-pageable>
	<kendo:grid-filterable extra="false">
		<kendo:grid-filterable-operators>
			<kendo:grid-filterable-operators-string eq="Is equal to"
				contains="Contains" />
			<kendo:grid-filterable-operators-date gt="Is after" lt="Is before" />
		</kendo:grid-filterable-operators>
	</kendo:grid-filterable>
	<kendo:grid-editable mode="popup" />
	<kendo:grid-toolbar>
	</kendo:grid-toolbar>
	<kendo:grid-columns>
		<kendo:grid-column title="prePaid Id" field="prePaidId" width="100px"
			filterable="true" hidden="true" sortable="false" />
		<kendo:grid-column title="Meter Number" field="mtrSrNo" width="100px"
			filterable="true" sortable="false" />
		<kendo:grid-column title="Reading Date" field="readingDT"
			width="100px" filterable="false" sortable="false" />
		<kendo:grid-column title="Balance" field="balance" width="70px"
			filterable="true" sortable="false" />
		<kendo:grid-column title="Consumed Amount" field="daily_Cons_Amt"
			width="70px" filterable="false" sortable="false" />
		<kendo:grid-column title="Cum. Recharge Amount"
			field="cum_Recharge_Amount" width="150px" filterable="false"
			sortable="false" />
		<kendo:grid-column title="Cum. kWh" field="cum_Kwh_Main" width="80px"
			filterable="false" sortable="false" />
		<kendo:grid-column title="Cum.kWh(DG)" field="cum_Kwh_Dg"
			width="100px" filterable="false" sortable="false" />
		<kendo:grid-column title="Cum FixChgMain" field="cum_Fixed_Charg_Main"
			width="100px" filterable="false" sortable="false" />
		<kendo:grid-column title="Cum FixChgDg" field="cum_Fixed_Charg_Dg"
			width="100px" filterable="false" sortable="false" />

 
	</kendo:grid-columns>

	<kendo:dataSource pageSize="20">
		<kendo:dataSource-transport>
			<%-- <kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="GET" contentType="application/json" />
			<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
			<kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="GET" contentType="application/json" /> --%>
			<%-- <kendo:dataSource-transport-destroy url="${destroyUrl}/" dataType="json" type="GET" contentType="application/json" /> --%>
		</kendo:dataSource-transport>

		<kendo:dataSource-schema>
			<kendo:dataSource-schema-model id="prePaidId">
				<kendo:dataSource-schema-model-fields>
					<kendo:dataSource-schema-model-field name="prePaidId" type="number" />
					<kendo:dataSource-schema-model-field name="mtrSrNo" type="string" />
					<kendo:dataSource-schema-model-field name="readingDT" type="String" />
					<kendo:dataSource-schema-model-field name="daily_Cons_Amt"
						type="string" />
					<kendo:dataSource-schema-model-field name="cum_Recharge_Amount"
						type="string" />
					<kendo:dataSource-schema-model-field name="cum_Kwh_Main"
						type="string" />
					<kendo:dataSource-schema-model-field name="cum_Kwh_Dg"
						type="string" />
					<kendo:dataSource-schema-model-field name="cum_Fixed_Charg_Main"
						type="string" />
					<kendo:dataSource-schema-model-field name="balance" type="string" />
					<kendo:dataSource-schema-model-field name="cum_Fixed_Charg_Dg"
						type="string" />
				</kendo:dataSource-schema-model-fields>
			</kendo:dataSource-schema-model>
		</kendo:dataSource-schema>

	</kendo:dataSource>

</kendo:grid>

