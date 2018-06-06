<%@include file="/common/taglibs.jsp"%>

<c:url value="/accountStatementDetail" var="readUrl" />

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
<%-- 	<kendo:grid-toolbar>
		<kendo:grid-toolbarItem name="exportDataPDF" text="Export To PDF"></kendo:grid-toolbarItem>	
	</kendo:grid-toolbar> --%>
	<kendo:grid-columns>
		<kendo:grid-column title="&nbsp;" width="110px">
			<kendo:grid-column-command >
				<kendo:grid-column-commandItem name="Get PDF" click="exportToPdf" />
			</kendo:grid-column-command>
		</kendo:grid-column>

		<kendo:grid-column title="prePaid Id" field="prePaidId" width="100px" filterable="true" hidden="true" sortable="false" />
		
		<kendo:grid-column title="MeterNo" field="meter_number" width="100px" filterable="false" />
		<kendo:grid-column title="PropertyNo" field="PROPERTY_NO" width="100px" filterable="false" />
		<kendo:grid-column title="ServiceDate" field="serviceDate" width="100px" filterable="false" />
		<kendo:grid-column title="ReadingDate" field="READING_DATE" width="100px" filterable="false" />
		
		<kendo:grid-column title="EBunitInitial" field="initial_Reading_EB" width="100px" filterable="false" />
		<kendo:grid-column title="EBunitFinal" field="final_Reading_EB" width="100px" filterable="false" />
		<kendo:grid-column title="EBconsumption" field="consumption_Unit_EB" width="100px" filterable="false" />
		
		<kendo:grid-column title="DGunitInitial" field="initial_Reading_DG" width="100px" filterable="false" />
		<kendo:grid-column title="DGunitFinal" field="final_Reading_DG" width="100px" filterable="false" />
		<kendo:grid-column title="DGconsumption" field="consumption_Unit_DG" width="100px" filterable="false" />
		
		<kendo:grid-column title="PreviousBalance" field="PREVIOUS_BALANCE" width="100px" filterable="false" />
		<kendo:grid-column title="RechargeAmt" field="RECHARGE_AMOUNT" width="100px" filterable="false" />
		<kendo:grid-column title="ClosingBalance" field="closingBalance" width="100px" filterable="false" />
		
	</kendo:grid-columns>

	<kendo:dataSource pageSize="20">
<kendo:dataSource-transport>
    <kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
    
		</kendo:dataSource-transport>

		<kendo:dataSource-schema>
			<kendo:dataSource-schema-model id="prePaidId">
				<kendo:dataSource-schema-model-fields>
					<kendo:dataSource-schema-model-field name="prePaidId" type="number" />
					
					<kendo:dataSource-schema-model-field name="meter_number" type="string" />
					<kendo:dataSource-schema-model-field name="PROPERTY_NO" type="string" />
					<kendo:dataSource-schema-model-field name="READING_DATE" type="String" />
					
					<kendo:dataSource-schema-model-field name="initial_Reading_EB" type="String" />
					<kendo:dataSource-schema-model-field name="final_Reading_EB" type="String" />
					<kendo:dataSource-schema-model-field name="consumption_Unit_EB" type="String" />
					
					<kendo:dataSource-schema-model-field name="initial_Reading_DG" type="String" />
					<kendo:dataSource-schema-model-field name="final_Reading_DG" type="String" />
					<kendo:dataSource-schema-model-field name="consumption_Unit_DG"	type="String" />
					
					<kendo:dataSource-schema-model-field name="PREVIOUS_BALANCE" type="String" />
					<kendo:dataSource-schema-model-field name="RECHARGE_AMOUNT" type="String" />
					<kendo:dataSource-schema-model-field name="closingBalance" type="String" />
					<kendo:dataSource-schema-model-field name="serviceDate" type="String" />
					
				</kendo:dataSource-schema-model-fields>
			</kendo:dataSource-schema-model>
		</kendo:dataSource-schema>

	</kendo:dataSource>

</kendo:grid>

<script>
function exportToPdf()
{
	var gridParameter = $("#grid").data("kendoGrid");
	var selectedAddressItem = gridParameter.dataItem(gridParameter.select());
	var prePaidId = selectedAddressItem.prePaidId;
	var meter_number = selectedAddressItem.meter_number;
	var PROPERTY_NO = selectedAddressItem.PROPERTY_NO;
	var READING_DATE = selectedAddressItem.READING_DATE;
	
	var initial_Reading_EB = selectedAddressItem.initial_Reading_EB;
	var final_Reading_EB = selectedAddressItem.final_Reading_EB;
	var consumption_Unit_EB = selectedAddressItem.consumption_Unit_EB;
	
	var initial_Reading_DG = selectedAddressItem.initial_Reading_DG;
	var final_Reading_DG = selectedAddressItem.final_Reading_DG;
	var consumption_Unit_DG = selectedAddressItem.consumption_Unit_DG;
	
	var PREVIOUS_BALANCE = selectedAddressItem.PREVIOUS_BALANCE;
	var RECHARGE_AMOUNT = selectedAddressItem.RECHARGE_AMOUNT;
    var closingBalance  = selectedAddressItem.closingBalance;
    var serviceDate  = selectedAddressItem.serviceDate;
	//alert(meter_number+"  "+READING_DATE+"  "+initial_Reading_EB+"  "+final_Reading_EB+"  "+consumption_Unit_EB+"  "+initial_Reading_DG+"  "+final_Reading_DG +"  "+consumption_Unit_EB+"  "+PREVIOUS_BALANCE+"  "+RECHARGE_AMOUNT+"  "+closingBalance);
	window.open("./accountStatement/getPdfReport?prePaidId="+prePaidId+"&meterNo="+meter_number+"&readingDateTime="+READING_DATE+"&initial_Reading_EB="+initial_Reading_EB+"&final_Reading_EB="+final_Reading_EB+"&consumption_Unit_EB="+consumption_Unit_EB+"&initial_Reading_DG="+initial_Reading_DG+"&final_Reading_DG="+final_Reading_DG+"&consumption_Unit_DG="+consumption_Unit_DG+"&PREVIOUS_BALANCE="+PREVIOUS_BALANCE+"&RECHARGE_AMOUNT="+RECHARGE_AMOUNT+"&closingBalance="+closingBalance+"&PROPERTY_NO="+PROPERTY_NO+"&serviceDate="+serviceDate); 
}

$("#exportPdfDatadivform").submit(function(e) {
	e.preventDefault();
});

$("#grid").on("click",".k-grid-exportDataPDF",function(e){

 var bbDialog = $("#exportPdfDatadiv");
	bbDialog.kendoWindow({
		width : "auto",
		height : "auto",
		modal : true,
		draggable : true,
		position : {
			top : 100
		},
		title : "Consumption History"
	}).data("kendoWindow").center().open();

	bbDialog.kendoWindow("open");
	var propID=$("#property").data("kendoComboBox");
	propID.value("");
	$("#fromMonth").val();
	
	   $("#consumerNumber").data("kendoComboBox").value("");

});

$("#fromMonthpicker").kendoDatePicker({
	value : new Date(),
	format : "dd/MM/yyyy"
});

$("#toMonthpicker").kendoDatePicker({
	value : new Date(),
	format : "dd/MM/yyyy"
});
</script>