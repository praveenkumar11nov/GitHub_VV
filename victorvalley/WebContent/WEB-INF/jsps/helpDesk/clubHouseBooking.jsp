


<%@include file="/common/taglibs.jsp"%>

<c:url value="/clubHouseBooking/Create" var="createUrl" />
<c:url value="/serviceBooking/Read" var="readUrl" />
<c:url value="/storemaster/Update" var="updateUrl" />
<c:url value="/storemaster/Destroy" var="destroyUrl" />
<c:url value="/clubHouse/ReadAllServices" var="helloReadServiceNames" />
<c:url value="/clubHouseDate/create" var="clubCreateUrl" />
<c:url value="/clubHousDate/read" var="ClubReadUrl" />


<%-- <c:url value="/storemaster/Filter" var="StoreNameFilterUrl" /> --%>


<kendo:grid name="storeGrid" pageable="true" resizable="true" sortable="true" reorderable="true" selectable="true" scrollable="true"  edit="StoreGridEvent"  change="onChangeProcess" dataBound="parentDataBound">
		<kendo:grid-pageable pageSizes="true" buttonCount="5" pageSize="10" input="true" numeric="true">
		<kendo:grid-pageable-messages itemsPerPage="Notification per page" empty="No Notification to display" refresh="Refresh all the Notification" 
			display="{0} - {1} of {2} Services" first="Go to the first page of Notification" last="Go to the last page of Notification" next="Go to the Notification"
			previous="Go to the previous page of Notification"/>
					</kendo:grid-pageable>
		<kendo:grid-filterable extra="false">
		 <kendo:grid-filterable-operators>
		  	<kendo:grid-filterable-operators-string eq="Is equal to" />
		 </kendo:grid-filterable-operators>
			
		</kendo:grid-filterable>
		  <kendo:grid-editable mode="popup"
			confirmation="Are you sure you want t o remove this Notification?" />
		<%-- <kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="Add Notification" />
		</kendo:grid-toolbar> --%>
		<kendo:grid-toolbarTemplate>
			<div class="toolbar">
		<!-- 	<a class="k-button k-button-icontext k-grid-add" href="#">
		            <span class="k-icon k-add"></span>
		            Add Booking Details	
	        	</a> -->
			 <a class='k-button' href='\\#' onclick="clearFilter()"><span class='k-icon k-i-funnel-clear'></span> Clear Filter</a>  
			</div>  	
    	</kendo:grid-toolbarTemplate>
    	<kendo:grid-columns>
    	
		<kendo:grid-column title="SId*" field="sId" width="120px" editor="serviceNameEditor" hidden="true">
		 <kendo:grid-column-filterable>
	    			<kendo:grid-column-filterable-ui>
    					<script> 
							function blockFilter(element) {								
								element.kendoAutoComplete({
									dataSource: {
										transport: {
											read: "${StoreNameFilterUrl}"
										}
									}
								});
					  		}
					  	</script>		
	    			</kendo:grid-column-filterable-ui>
	    		</kendo:grid-column-filterable>	
	    		</kendo:grid-column>
		
		
			<kendo:grid-column title="Service Name*" field="serviceName"   width="120px" >
		</kendo:grid-column>
		
		
		<kendo:grid-column title="Block Name*" field="blocks"   width="120px" >
		</kendo:grid-column>
		
	
	<kendo:grid-column title="Person Name*" field="personName"   width="120px" >
		</kendo:grid-column>
	
		
		<kendo:grid-column title=" property Name*" field="property"   width="120px" hidden="true" >
		</kendo:grid-column>
		
		<kendo:grid-column title=" property Name*" field="propertyName"   width="120px" >
		</kendo:grid-column>
		
		<kendo:grid-column title="Person Name*" field="name"   width="120px" >
		</kendo:grid-column>
		
		<kendo:grid-column title=" Date*" field="date"   width="120px" >
		</kendo:grid-column>
		<kendo:grid-column title="Start Time*" field="startTime"   width="120px" >
		</kendo:grid-column>
		
		<kendo:grid-column title="End Time*" field="endTime"   width="120px" >
		</kendo:grid-column>
		<kendo:grid-column title="Service Status*" field="serviceStatus" width="120px"  >
	</kendo:grid-column>
	
	<kendo:grid-column title="Service Status*" field="blockName" width="120px" hidden="true" >
	</kendo:grid-column>
	
		
	
	
	
		
		
		
			<kendo:grid-column title="created By*" field="createdBy"   width="120px" >
		</kendo:grid-column>
	
		<%-- 	<kendo:grid-column title="&nbsp;" width="220px">
			 <kendo:grid-column-command>
					<kendo:grid-column-commandItem name="edit" />
					<kendo:grid-column-commandItem name="destroy" />
				</kendo:grid-column-command> 
				</kendo:grid-column>
				 --%>
				 <kendo:grid-column title="Book Action*" field="bookaction" width="120px"  >
	</kendo:grid-column>
					<kendo:grid-column title=""
				template="<a href='\\\#' id='itemPID' class='k-button k-button-icontext btn-destroy k-grid-Activate#=data.sId#'>#= data.bookaction == 'Approved' ? 'Reject' : 'Approve' #</a>"
				width="100px" />
			
				<kendo:grid-column title="CallBack Action*" field="action" width="120px"  >
	</kendo:grid-column>
				
				<kendo:grid-column title=""
				template="<a href='\\\#' id='temPID' class='k-button k-button-icontext btn-destroy k-grid-Activate#=data.sId#'>#= data.action == 'Opened' ? 'Close' : 'Open' #</a>"
				width="100px" />
			<%--  <kendo:grid-column title="Store&nbspStatus&nbsp;*" field="storeStatus"  filterable="true" width="130px" />
			<kendo:grid-column title=""
				template="<a href='\\\#' id='temPID' class='k-button k-button-icontext btn-destroy k-grid-Activate#=data.sId#'>#= data.storeStatus == 'Active' ? 'De-activate' : 'Activate' #</a>"
				width="100px" />
				 --%>
				</kendo:grid-columns>
				
			<kendo:dataSource pageSize="5" requestEnd="onStoreRequestEnd" requestStart="onRequestStart">
			<kendo:dataSource-transport>
				<%-- <kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="GET" contentType="application/json"/> --%>
	<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/> 
	<%-- <kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/> --%>
	<%-- 	<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/>  --%>
		<%-- 	<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="GET" contentType="application/json"/>
			<kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="GET" contentType="application/json" />
		<kendo:dataSource-transport-destroy url="${destroyUrl}" dataType="json" type="GET" contentType="application/json"/>  --%>
				<%-- 	<kendo:dataSource-transport-parameterMap>
					<script>
						function parameterMap(options, type) {
							return JSON.stringify(options);
						}
					</script>
				</kendo:dataSource-transport-parameterMap>  --%>
			</kendo:dataSource-transport>
			
			 <kendo:dataSource-schema>
				<kendo:dataSource-schema-model id="bId">
					<kendo:dataSource-schema-model-fields>
							<kendo:dataSource-schema-model-field name="bId" type="number" />
					<kendo:dataSource-schema-model-field name="sId" type="number" />
						<kendo:dataSource-schema-model-field name="name" type="String"/>
							<kendo:dataSource-schema-model-field name="blocks" type="String"/>
								<kendo:dataSource-schema-model-field name="property" type="String"/>
									<kendo:dataSource-schema-model-field name="startTime" type="String"/>
										<kendo:dataSource-schema-model-field name="endTime" type="String"/>
											<kendo:dataSource-schema-model-field name="date" type="date"/>
												<kendo:dataSource-schema-model-field name="serviceStatus" type="String"/>
				<kendo:dataSource-schema-model-field name="action" type="String" defaultValue="Opened"/>
						
					<kendo:dataSource-schema-model-field name="bookaction" type="String" defaultValue="Rejected"/>
					<kendo:dataSource-schema-model-field name="blockName" type="String" />
					
						
						
						
					<%-- 	 <kendo:dataSource-schema-model-field name="storeStatus" type="string" defaultValue="Inactive"/> --%>
					
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
			</kendo:dataSource>				

</kendo:grid>



	

<div id="alertsBox" title="Alert"></div>
<script>
/* function onChangeItemTemplate(arg) {
	  
 	 var gview = $("#transactionGrid").data("kendoGrid");
 	 var selectedItem = gview.dataItem(gview.select());
 	 SelectedRowId = selectedItem.tId;
 	 level = selectedItem.level;
 	 tId=selectedItem.tId;
 	 //alert(tId);
 	 //alert(tId);
 	if(level == 0){
		$(".k-grid-add", "#transactionChild_" + SelectedRowId).hide();
	}
 	 this.collapseRow(this.tbody.find(":not(tr.k-state-selected)"));
 	 
		
 	
 } */
var serviceStatus="";
 /* function onChangeProcess(e) {
	  var data = this.dataSource.view();     
	     var grid = $("#storeGrid").data("kendoGrid");
	     for (var i = 0; i < data.length; i++) {
	      var currentUid = data[i].uid;
	         row = this.tbody.children("tr[data-uid='" + data[i].uid + "']");
	         
	         var status = data[i].serviceStatus;
	        /*  if (ticketStatus ==1) {
	    var currenRow = grid.table.find("tr[data-uid='" + currentUid+ "']");
	    var reOpenButton = $(currenRow).find(".k-grid-edit");
	    reOpenButton.hide();
	    $(currenRow).find(".k-grid-Activate"+data[i].id).hide();
	   } 
	         
	         if(data[i].status=="Book"){
	        	 alert(status);
	         }
	          var currenRow = grid.table.find("tr[data-uid='" + currentUid+ "']");
	    var reOpenButton = $(currenRow).find(".k-grid-Activate1 .k-icon");
	    reOpenButton.hide();
	         }
	         
	     } */
	     
	     function onRequestStart(e){
				$('.k-grid-update').hide();
				$('.k-edit-buttons')
						.append(
								'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please Wait....&nbsp;&nbsp;&nbsp;&nbsp;');
				$('.k-grid-cancel').hide();
		}
		 
		 
function onChangeProcess(arg) {
	var gview = $("#storeGrid").data("kendoGrid");
	var selectedItem = gview.dataItem(gview.select());
	//SelectedRowId = selectedItem.sbId;
	service=selectedItem.serviceStatus;
	// processStatus = selectedItem.processStatus;
	
	
	if(service=="Book")
		{
		$(".k-grid-add", "#transactionChild_").hide();
		
		
		}
} 
	     
	     function parentDataBound(e) {
	    	 
	    	 var data = this.dataSource.view(), row;
				var grid = $("#storeGrid").data("kendoGrid");
				for (var i = 0; i < data.length; i++) {
					
					row = this.tbody.children("tr[data-uid='" + data[i].bId + "']");
					var userStatus = data[i].serviceStatus;
					var urId = data[i].bId;

					if (userStatus === 'Book') {
						//alert(userStatus);
						
					
						$('a[id=itemPID' + urId+']').hide();
						
					} 
				}
	    	 }
function serviceNameEditor(container,options)
{
	  $('<input data-text-field="serviceName" name="clubHouseService" id="sId" required="true" data-value-field="sId" data-bind="value:' + options.field + '"/>').appendTo(container).kendoComboBox
		 ({
		   	 placeholder : "Select Componenet Names",
		     template : '<table><border><tr><td rowspan=2><span class="k-state-default"></span></td>'
				+ '<td padding="5px"><span class="k-state-default"><b>#: data.serviceName #</b></span><br></td></tr></border></table>',
				filter:"startswith",
     	
			    dataSource: {       
		           transport: {
		               read: "${helloReadServiceNames}"
		           }
		       },
		   });
		   $('<span class="k-invalid-msg" data-for="Component"></span>').appendTo(container);   
  } 

function ActionEditor(container, options) {
	   var data = ["CallBack" , "Book"];
	   $(
	     '<input data-text-field="" style="width:180px;" id="ownership" data-value-field="" data-bind="value:' + options.field + '" />')
	     .appendTo(container).kendoDropDownList({
	      optionLabel :"Select",
	    
	      dataSource :data            	                 	      
	   });
}      
function StoreGridEvent(e)
{
	
	 $('div[data-container-for="serviceName"]').remove();
	$('label[for="serviceName"]').closest('.k-edit-label').remove(); 
	
	/* $('div[data-container-for="blocks"]').remove();
	$('label[for="blocks"]').closest('.k-edit-label').remove(); 
	
	$('div[data-container-for="property"]').remove();
	$('label[for="property"]').closest('.k-edit-label').remove();  */
if (e.model.isNew()) 
{
	$(".k-window-title").text("Add Store Master Details");
	$(".k-grid-update").text("Save");		
}
else{
	$(".k-window-title").text("Edit Store Master Details");
}


$('label[for="storeStatus"]').parent().remove();
$('div[data-container-for="storeStatus"]').remove();
$('a[id="temPID"]').remove();
$('a[id="itemPID"]').remove();	
}

function onRecApprovalRequestEnd(e) 
{ 
  if (typeof e.response != 'undefined') {
   if (e.response.status == "FAIL") {
    errorInfo = "";
    for (var i = 0; i < e.response.result.length; i++) {
     errorInfo += (i + 1) + ". "
       + e.response.result[i].defaultMessage + "<br>";
    }
      if (e.type == "create") {
     $("#alertsBox").html("");
     $("#alertsBox").html(
       "Error: Creating the process details \n\n : "
         + errorInfo);
     $("#alertsBox").dialog({
      modal : true,
      buttons : {
       "Close" : function() {
        $(this).dialog("close");
       }
      }
     });
    }
    var grid = $("#BookingGrid_"+SelectedRowId).data("kendoGrid");
    grid.dataSource.read();
    grid.refresh();
   } 
   else if (e.type == "create") {
    $("#alertsBox").html("");
    $("#alertsBox").html(
      "Recoopment Approval is created successfully");
    $("#alertsBox").dialog({
     modal : true,
     buttons : {
      "Close" : function() {
       $(this).dialog("close");
      }
     }
    });

    var grid = $("#BookingGrid_"+SelectedRowId).data("kendoGrid");
   grid.dataSource.read();
    grid.refresh(); 
   } else if (e.type == "destroy") {
    $("#alertsBox").html("");
    $("#alertsBox").html(
      "Recoopment Approval is deleted successfully");
    $("#alertsBox").dialog({
     modal : true,
     buttons : {
      "Close" : function() {
       $(this).dialog("close");
      }
     }
    });

    var grid = $("#BookingGrid_"+SelectedRowId).data("kendoGrid");
    grid.dataSource.read();
    grid.refresh();
   } else if (e.type == "update") {
    $("#alertsBox").html("");
    $("#alertsBox").html(
      "Recoopment Appproval is updated successfully");
    $("#alertsBox").dialog({
     modal : true,
     buttons : {
      "Close" : function() {
       $(this).dialog("close");
      }
     }
    });
   var grid = $("#BookingGrid_"+SelectedRowId).data("kendoGrid");
     grid.dataSource.read();
    grid.refresh(); 
   }
 }
 }

function clearFilter()
{
   $("form.k-filter-menu button[type='reset']").slice().trigger("click");
   var gridStoreIssue = $("#storeGrid").data("kendoGrid");
   gridStoreIssue.dataSource.read();
   gridStoreIssue.refresh();
}

function DescriptionEditor(container,options)
{
	  $('<textarea name="Service Description" data-text-field="serviceDesc" data-value-field="serviceDesc" data-bind="value:' + options.field + '" style="width: 161px; height: 46px;" required="true"/>').appendTo(container);
	  $('<span class="k-invalid-msg" data-for="Service Description"></span>').appendTo(container); 
}
function onStoreRequestEnd(e) {
	if (typeof e.response != 'undefined') {
		if (e.response.status == "FAIL") {
			errorInfo = "";
			errorInfo = e.response.result.invalid;
			var i = 0;
			for (i = 0; i < e.response.result.length; i++) {
				errorInfo += (i + 1) + ". "
						+ e.response.result[i].defaultMessage + "\n";
			}
			if (e.type == "create") {
				alert("Error: Creating the Store Master Details\n\n"
						+ errorInfo);
			}
			if (e.type == "update") {
				alert("Error: Updating the Store Master Details\n\n"
						+ errorInfo);
			}
			var grid = $("#storeGrid").data("kendoGrid");
			grid.dataSource.read();
			grid.refresh();
			return false;
		}
		if (e.type == "update" && !e.response.Errors) {
			e.sender.read();
			$("#alertsBox").html("Alert");
			$("#alertsBox").html("Store Master Updated successfully");
			$("#alertsBox").dialog({
				modal : true,
				draggable : false,
				resizable : false,
				buttons : {
					"Close" : function() {
						$(this).dialog("close");
					}
				}
			});
		}
		if (e.type == "create" && !e.response.Errors) {
			e.sender.read();
			$("#alertsBox").html("Alert");
			$("#alertsBox").html("Store Master Created successfully");
			$("#alertsBox").dialog({
				modal : true,
				draggable : false,
				resizable : false,
				buttons : {
					"Close" : function() {
						$(this).dialog("close");
					}
				}
			});
		}
		if (e.type == "destroy" && !e.response.Errors) {
			$("#alertsBox").html("Alert");
			$("#alertsBox").html("Store Master Deleted successfully");
			$("#alertsBox").dialog({
				modal : true,
				draggable : false,
				resizable : false,
				buttons : {
					"Close" : function() {
						$(this).dialog("close");
					}
				}
			});
			var grid = $("#storeGrid").data("kendoGrid");
			grid.dataSource.read();
			grid.refresh();
		}
	}
}

/* $("#grid").on("click", "#temPID", function(e) {
		var button = $(this), enable = button.text() == "Activate";
		var widget = $("#storeGrid").data("kendoGrid");
		var dataItem = widget.dataItem($(e.currentTarget).closest("tr"));

		 var result="success";			
	    if(result=="success"){
			if (enable) {
				$.ajax({
					type : "POST",
					url : "./clubHouse/callback/" + dataItem.id + "/activate",
					dataType : 'text',
					success : function(response) {
						$("#alertsBox").html("");
						$("#alertsBox").html(response);
						$("#alertsBox").dialog({
							modal : true,
							draggable: false,
							resizable: false,
							buttons : {
								"Close" : function() {
									$(this).dialog("close");
								}
							}
						});
						button.text('Deactivate');
						$('#storeGrid').data('kendoGrid').dataSource.read();
					}
				});
			} else {
				$.ajax({
					type : "POST",
					url : "./clubHouse/callback/" + dataItem.id + "/deactivate",
					dataType : 'text',
					success : function(response) {
						$("#alertsBox").html("");
						$("#alertsBox").html(response);
						$("#alertsBox").dialog({
							modal : true,
							draggable: false,
							resizable: false,
							buttons : {
								"Close" : function() {
									$(this).dialog("close");
								}
							}
						});
						button.text('Activate');
						$('#storeGrid').data('kendoGrid').dataSource.read();
					}
				});
			}		
	  	 }  						
		
	});	
 */

 $("#storeGrid").on("click", "#temPID", function(e) 
		  {
			 var button = $(this),
			 enable = button.text() == "Open";
			 var widget = $("#storeGrid").data("kendoGrid");
			 var dataItem = widget.dataItem($(e.currentTarget).closest("tr"));		 
			 if (enable)
			 {
				$.ajax
				({
					type : "POST",
					url : "./clubHouse/callback/" + dataItem.id + "/Open",
					dataType : 'text',
					success : function(response) 
					{
						$("#alertsBox").html("");
						$("#alertsBox").html(response);
				  	    $("#alertsBox").dialog
						({
							modal : true,
							buttons : {
							   "Close" : function() {
						          $(this).dialog("close");
								}
							}
						});
						button.text('Close');
						$('#storeGrid').data('kendoGrid').dataSource.read();
					}
				});
			 }
			 else 
			 {
			      $.ajax
				  ({
					   type : "POST",
					   url : "./clubHouse/callback/" + dataItem.id + "/Close",
					   dataType : 'text',
					   success : function(response) 
					   {
						   $("#alertsBox").html("");
						   $("#alertsBox").html(response);
						   $("#alertsBox").dialog({
							   modal : true,
							   buttons : 
							   {
								   "Close" : function() {
										$(this).dialog("close");
									 }
									}
							   });
							  button.text('Open');
							  $('#storeGrid').data('kendoGrid').dataSource.read();
							 }
							});
			 }	
		   }); 
 
  $("#storeGrid").on("click", "#itemPID", function(e) 
		  {
			 var button = $(this),
			 enable = button.text() == "Approve";
			 var widget = $("#storeGrid").data("kendoGrid");
			 var dataItem = widget.dataItem($(e.currentTarget).closest("tr"));		 
			 if (enable)
			 {
				$.ajax
				({
					type : "POST",
					url : "./clubHouse/callbacks/" + dataItem.id + "/Approve",
					dataType : 'text',
					success : function(response) 
					{
						$("#alertsBox").html("");
						$("#alertsBox").html(response);
				  	    $("#alertsBox").dialog
						({
							modal : true,
							buttons : {
							   "Close" : function() {
						          $(this).dialog("close");
								}
							}
						});
						button.text('Reject');
						$('#storeGrid').data('kendoGrid').dataSource.read();
					}
				});
			 }
			 else 
			 {
			      $.ajax
				  ({
					   type : "POST",
					   url : "./clubHouse/callbacks/" + dataItem.id + "/Reject",
					   dataType : 'text',
					   success : function(response) 
					   {
						   $("#alertsBox").html("");
						   $("#alertsBox").html(response);
						   $("#alertsBox").dialog({
							   modal : true,
							   buttons : 
							   {
								   "Close" : function() {
										$(this).dialog("close");
									 }
									}
							   });
							  button.text('Approve');
							  $('#storeGrid').data('kendoGrid').dataSource.read();
							 }
							});
			 }	
		   });  
 
(function($, kendo) 
		  {
			 $.extend(true,kendo.ui.validator,
			 { 
				rules : { 
						  storeNamevalidation : function(input, params) 
			  		      { 
							 if (input.filter("[name='storeName']").length && input.val()) 
							 {
								return /^[a-zA-Z]+[ ._a-zA-Z0-9._]*[a-zA-Z0-9]$/.test(input.val());
							 }
							 return true;
						  },
					  storeNameNullValidator : function(input,params) 
  				  { 
  					  if (input.attr("name") == "storeName") 
  					  {
						     return $.trim(input.val()) !== "";
						  }
						  return true;
  		           },
  		           storeDescNullValidator : function(input,params) 
	    				  { 
	    					  if (input.attr("name") == "storeDesc") 
	    					  {
	  						     return $.trim(input.val()) !== "";
	  						  }
	  						  return true;
	    		           },
	    		        
		    		       
		    		           
	    		           
				},
				  messages : 
				  {
					  storeNameNullValidator:"please select amount",
					  storeDescNullValidator:"please select remarks",
					  storeNamevalidation:"should not alllow apecial characters",
				  }
			 });
	})(jQuery, kendo);


</script>




























<%-- <%@include file="/common/taglibs.jsp"%>

<c:url value="/clubHouseBooking/Create" var="createUrl" />
<c:url value="/clubHouseBooking/Read" var="readUrl" />
<c:url value="/storemaster/Update" var="updateUrl" />
<c:url value="/storemaster/Destroy" var="destroyUrl" />
<c:url value="/clubHouse/ReadAllServices" var="helloReadServiceNames" />
<c:url value="/clubHouseDate/create" var="clubCreateUrl" />
<c:url value="/clubHousDate/read" var="ClubReadUrl" />


<c:url value="/storemaster/Filter" var="StoreNameFilterUrl" />


<kendo:grid name="storeGrid" pageable="true" resizable="true" sortable="true" reorderable="true" selectable="true" scrollable="true"  edit="StoreGridEvent" detailTemplate="customerChild" change="onChangeProcess">
		<kendo:grid-pageable pageSizes="true" buttonCount="5" pageSize="10" input="true" numeric="true">
		<kendo:grid-pageable-messages itemsPerPage="Notification per page" empty="No Notification to display" refresh="Refresh all the Notification" 
			display="{0} - {1} of {2} Services" first="Go to the first page of Notification" last="Go to the last page of Notification" next="Go to the Notification"
			previous="Go to the previous page of Notification"/>
					</kendo:grid-pageable>
		<kendo:grid-filterable extra="false">
		 <kendo:grid-filterable-operators>
		  	<kendo:grid-filterable-operators-string eq="Is equal to" />
		 </kendo:grid-filterable-operators>
			
		</kendo:grid-filterable>
		  <kendo:grid-editable mode="popup"
			confirmation="Are you sure you want t o remove this Notification?" />
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="Add Notification" />
		</kendo:grid-toolbar>
		<kendo:grid-toolbarTemplate>
			<div class="toolbar">
			<a class="k-button k-button-icontext k-grid-add" href="#">
		            <span class="k-icon k-add"></span>
		            Add Booking Details	
	        	</a>
			 <a class='k-button' href='\\#' onclick="clearFilter()"><span class='k-icon k-i-funnel-clear'></span> Clear Filter</a>  
			</div>  	
    	</kendo:grid-toolbarTemplate>
    	<kendo:grid-columns>
    	
		<kendo:grid-column title="Service Name*" field="sId" width="120px" editor="serviceNameEditor" hidden="true">
		 <kendo:grid-column-filterable>
	    			<kendo:grid-column-filterable-ui>
    					<script> 
							function blockFilter(element) {								
								element.kendoAutoComplete({
									dataSource: {
										transport: {
											read: "${StoreNameFilterUrl}"
										}
									}
								});
					  		}
					  	</script>		
	    			</kendo:grid-column-filterable-ui>
	    		</kendo:grid-column-filterable>	
	    		</kendo:grid-column>
		
		
		
		
		
		<kendo:grid-column title="Service Description*" field="blocks"   width="120px" >
		</kendo:grid-column>
		
		<kendo:grid-column title="Service date*" field="date"   width="120px" >
		</kendo:grid-column>
		
	<kendo:grid-column title="Service Action*" field="action" width="120px"  >
	</kendo:grid-column>
		<kendo:grid-column title="Service Status*" field="serviceStatus" width="120px"  >
	</kendo:grid-column>
	
	<kendo:grid-column title="Service property*" field="property"   width="120px" >
		</kendo:grid-column>
	
		<kendo:grid-column title="Service name*" field="name"   width="120px" >
		</kendo:grid-column>
		
		<kendo:grid-column title="Start Time*" field="startTime"   width="120px" >
		</kendo:grid-column>
		
		<kendo:grid-column title="End Time*" field="endTime"   width="120px" >
		</kendo:grid-column>
		
			<kendo:grid-column title="created By*" field="createdBy"   width="120px" >
		</kendo:grid-column>
	
			<kendo:grid-column title="&nbsp;" width="220px">
				<kendo:grid-column-command>
					<kendo:grid-column-commandItem name="edit" />
					<kendo:grid-column-commandItem name="destroy" />
				</kendo:grid-column-command>
				</kendo:grid-column>
				
			 <kendo:grid-column title="Store&nbspStatus&nbsp;*" field="storeStatus"  filterable="true" width="130px" />
			<kendo:grid-column title=""
				template="<a href='\\\#' id='temPID' class='k-button k-button-icontext btn-destroy k-grid-Activate#=data.sId#'>#= data.storeStatus == 'Active' ? 'De-activate' : 'Activate' #</a>"
				width="100px" />
				
				</kendo:grid-columns>
				
			<kendo:dataSource pageSize="5" requestEnd="onStoreRequestEnd">
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="GET" contentType="application/json"/>
	<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/> 
	<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/>
		<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/> 
			<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="GET" contentType="application/json"/>
			<kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="GET" contentType="application/json" />
		<kendo:dataSource-transport-destroy url="${destroyUrl}" dataType="json" type="GET" contentType="application/json"/> 
					<kendo:dataSource-transport-parameterMap>
					<script>
						function parameterMap(options, type) {
							return JSON.stringify(options);
						}
					</script>
				</kendo:dataSource-transport-parameterMap> 
			</kendo:dataSource-transport>
			
			 <kendo:dataSource-schema>
				<kendo:dataSource-schema-model id="bId">
					<kendo:dataSource-schema-model-fields>
							<kendo:dataSource-schema-model-field name="bId" type="number" />
					<kendo:dataSource-schema-model-field name="sId" type="number" />
						<kendo:dataSource-schema-model-field name="name" type="String"/>
							<kendo:dataSource-schema-model-field name="blocks" type="String"/>
								<kendo:dataSource-schema-model-field name="property" type="String"/>
									<kendo:dataSource-schema-model-field name="startTime" type="String"/>
										<kendo:dataSource-schema-model-field name="endTime" type="String"/>
											<kendo:dataSource-schema-model-field name="date" type="date"/>
												<kendo:dataSource-schema-model-field name="serviceStatus" type="String"/>
				
						
					
						
						
						
						 <kendo:dataSource-schema-model-field name="storeStatus" type="string" defaultValue="Inactive"/>
					
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
			</kendo:dataSource>				

</kendo:grid>


	<kendo:grid-detailTemplate id="customerChild">
							
		
		<kendo:grid name="BookingGrid_#=sbId#" pageable="true" resizable="true"
			sortable="true" reorderable="true" selectable="true"
			scrollable="true" editable="true" edit="ChildEvent" >
			<kendo:grid-pageable pageSize="10"></kendo:grid-pageable>
			<kendo:grid-filterable extra="false">
				<kendo:grid-filterable-operators>
					<kendo:grid-filterable-operators-string eq="Is equal to" />
				</kendo:grid-filterable-operators>
			</kendo:grid-filterable>
			<kendo:grid-editable mode="popup"
				confirmation="Are sure you want to delete this item ?" />
			<kendo:grid-toolbar>
				<kendo:grid-toolbarItem name="create" text="Add Customer Items" />
			</kendo:grid-toolbar>
			<kendo:grid-columns>
			
			<kendo:grid-column title="Start Date*" field="startDate"  width="120px"  >
		</kendo:grid-column>
					
					<kendo:grid-column title="Start Date*" field="fromTime"  width="120px"  >
		</kendo:grid-column>
		
		<kendo:grid-column title="Till Date*" field="tillTime"  width="120px"  >
		</kendo:grid-column>
		
				<kendo:grid-column title="&nbsp;" width="220px">
					<kendo:grid-column-command>
						<kendo:grid-column-commandItem name="edit" />
					
					</kendo:grid-column-command>
				</kendo:grid-column>

			</kendo:grid-columns>
				<kendo:dataSource  requestEnd="onRecApprovalRequestEnd" >
				<kendo:dataSource-transport>
				<kendo:dataSource-transport-create url="${clubCreateUrl}/#=sbId#" dataType="json" type="GET" contentType="application/json" /> 
				<kendo:dataSource-transport-read url="${ClubReadUrl}/#=sbId#" dataType="json" type="GET" contentType="application/json" />
			<kendo:dataSource-transport-read url="${CustomerReadUrl}/#=sbd#" dataType="json" type="GET" contentType="application/json" />
					<kendo:dataSource-transport-create url="${CustomerCreateUrl}/#=cid#" dataType="json" type="GET" contentType="application/json" />
					<kendo:dataSource-transport-update url="${templateItemUpdateUrl}/#=rid#" dataType="json" type="GET" contentType="application/json" />
					<kendo:dataSource-transport-destroy url="${templateItemDestroyUrl}" dataType="json" type="GET" contentType="application/json" />
				</kendo:dataSource-transport>
				<kendo:dataSource-schema>
					<kendo:dataSource-schema-model id="srId">
						<kendo:dataSource-schema-model-fields>
<kendo:dataSource-schema-model-field name="srId" type="number"/>
<kendo:dataSource-schema-model-field name="sbId" type="number"/>
   												<kendo:dataSource-schema-model-field name="startDate" type="date"/>
												<kendo:dataSource-schema-model-field name="fromTime" type="String"/>
												<kendo:dataSource-schema-model-field name="tillTime" type="String"/>
						</kendo:dataSource-schema-model-fields>
					</kendo:dataSource-schema-model>
				</kendo:dataSource-schema>
			</kendo:dataSource>
		</kendo:grid>
	
	</kendo:grid-detailTemplate>
	

<div id="alertsBox" title="Alert"></div>
<script>
function ChildEvent(e){
	
	if (e.model.isNew()) 
    {
		$(".k-window-title").text("Add Booking Date");
		$(".k-grid-update").text("Save");		
    }
	else{
		$(".k-window-title").text("Edit  Booking Date");
	}

}
function onChangeProcess(arg) {
	var gview = $("#storeGrid").data("kendoGrid");
	var selectedItem = gview.dataItem(gview.select());
	SelectedRowId = selectedItem.sbId;
	
	// processStatus = selectedItem.processStatus;
}
function serviceNameEditor(container,options)
{
	  $('<input data-text-field="serviceName" name="clubHouseService" id="sId" required="true" data-value-field="sId" data-bind="value:' + options.field + '"/>').appendTo(container).kendoComboBox
		 ({
		   	 placeholder : "Select Componenet Names",
		     template : '<table><border><tr><td rowspan=2><span class="k-state-default"></span></td>'
				+ '<td padding="5px"><span class="k-state-default"><b>#: data.serviceName #</b></span><br></td></tr></border></table>',
				filter:"startswith",
     	
			    dataSource: {       
		           transport: {
		               read: "${helloReadServiceNames}"
		           }
		       },
		   });
		   $('<span class="k-invalid-msg" data-for="Component"></span>').appendTo(container);   
  } 

function ActionEditor(container, options) {
	   var data = ["CallBack" , "Book"];
	   $(
	     '<input data-text-field="" style="width:180px;" id="ownership" data-value-field="" data-bind="value:' + options.field + '" />')
	     .appendTo(container).kendoDropDownList({
	      optionLabel :"Select",
	    
	      dataSource :data            	                 	      
	   });
}      
function StoreGridEvent(e)
{
	
	 $('div[data-container-for="serviceName"]').remove();
	$('label[for="serviceName"]').closest('.k-edit-label').remove(); 
if (e.model.isNew()) 
{
	$(".k-window-title").text("Add Store Master Details");
	$(".k-grid-update").text("Save");		
}
else{
	$(".k-window-title").text("Edit Store Master Details");
}


$('label[for="storeStatus"]').parent().remove();
$('div[data-container-for="storeStatus"]').remove();
$('a[id="temPID"]').remove();	
}

function onRecApprovalRequestEnd(e) 
{ 
  if (typeof e.response != 'undefined') {
   if (e.response.status == "FAIL") {
    errorInfo = "";
    for (var i = 0; i < e.response.result.length; i++) {
     errorInfo += (i + 1) + ". "
       + e.response.result[i].defaultMessage + "<br>";
    }
      if (e.type == "create") {
     $("#alertsBox").html("");
     $("#alertsBox").html(
       "Error: Creating the process details \n\n : "
         + errorInfo);
     $("#alertsBox").dialog({
      modal : true,
      buttons : {
       "Close" : function() {
        $(this).dialog("close");
       }
      }
     });
    }
    var grid = $("#BookingGrid_"+SelectedRowId).data("kendoGrid");
    grid.dataSource.read();
    grid.refresh();
   } 
   else if (e.type == "create") {
    $("#alertsBox").html("");
    $("#alertsBox").html(
      "Recoopment Approval is created successfully");
    $("#alertsBox").dialog({
     modal : true,
     buttons : {
      "Close" : function() {
       $(this).dialog("close");
      }
     }
    });

    var grid = $("#BookingGrid_"+SelectedRowId).data("kendoGrid");
   grid.dataSource.read();
    grid.refresh(); 
   } else if (e.type == "destroy") {
    $("#alertsBox").html("");
    $("#alertsBox").html(
      "Recoopment Approval is deleted successfully");
    $("#alertsBox").dialog({
     modal : true,
     buttons : {
      "Close" : function() {
       $(this).dialog("close");
      }
     }
    });

    var grid = $("#BookingGrid_"+SelectedRowId).data("kendoGrid");
    grid.dataSource.read();
    grid.refresh();
   } else if (e.type == "update") {
    $("#alertsBox").html("");
    $("#alertsBox").html(
      "Recoopment Appproval is updated successfully");
    $("#alertsBox").dialog({
     modal : true,
     buttons : {
      "Close" : function() {
       $(this).dialog("close");
      }
     }
    });
   var grid = $("#BookingGrid_"+SelectedRowId).data("kendoGrid");
     grid.dataSource.read();
    grid.refresh(); 
   }
 }
 }

function clearFilter()
{
   $("form.k-filter-menu button[type='reset']").slice().trigger("click");
   var gridStoreIssue = $("#storeGrid").data("kendoGrid");
   gridStoreIssue.dataSource.read();
   gridStoreIssue.refresh();
}

function DescriptionEditor(container,options)
{
	  $('<textarea name="Service Description" data-text-field="serviceDesc" data-value-field="serviceDesc" data-bind="value:' + options.field + '" style="width: 161px; height: 46px;" required="true"/>').appendTo(container);
	  $('<span class="k-invalid-msg" data-for="Service Description"></span>').appendTo(container); 
}
function onStoreRequestEnd(e) {
	if (typeof e.response != 'undefined') {
		if (e.response.status == "FAIL") {
			errorInfo = "";
			errorInfo = e.response.result.invalid;
			var i = 0;
			for (i = 0; i < e.response.result.length; i++) {
				errorInfo += (i + 1) + ". "
						+ e.response.result[i].defaultMessage + "\n";
			}
			if (e.type == "create") {
				alert("Error: Creating the Store Master Details\n\n"
						+ errorInfo);
			}
			if (e.type == "update") {
				alert("Error: Updating the Store Master Details\n\n"
						+ errorInfo);
			}
			var grid = $("#storeGrid").data("kendoGrid");
			grid.dataSource.read();
			grid.refresh();
			return false;
		}
		if (e.type == "update" && !e.response.Errors) {
			e.sender.read();
			$("#alertsBox").html("Alert");
			$("#alertsBox").html("Store Master Updated successfully");
			$("#alertsBox").dialog({
				modal : true,
				draggable : false,
				resizable : false,
				buttons : {
					"Close" : function() {
						$(this).dialog("close");
					}
				}
			});
		}
		if (e.type == "create" && !e.response.Errors) {
			e.sender.read();
			$("#alertsBox").html("Alert");
			$("#alertsBox").html("Store Master Created successfully");
			$("#alertsBox").dialog({
				modal : true,
				draggable : false,
				resizable : false,
				buttons : {
					"Close" : function() {
						$(this).dialog("close");
					}
				}
			});
		}
		if (e.type == "destroy" && !e.response.Errors) {
			$("#alertsBox").html("Alert");
			$("#alertsBox").html("Store Master Deleted successfully");
			$("#alertsBox").dialog({
				modal : true,
				draggable : false,
				resizable : false,
				buttons : {
					"Close" : function() {
						$(this).dialog("close");
					}
				}
			});
			var grid = $("#storeGrid").data("kendoGrid");
			grid.dataSource.read();
			grid.refresh();
		}
	}
}

$("#grid").on("click", "#temPID", function(e) {
		var button = $(this), enable = button.text() == "Activate";
		var widget = $("#storeGrid").data("kendoGrid");
		var dataItem = widget.dataItem($(e.currentTarget).closest("tr"));

		var result=securityCheckForActionsForStatus("./parkingManagement/parkingslots/deleteButton");   
	    if(result=="success"){
			if (enable) {
				$.ajax({
					type : "POST",
					url : "./storeMaster/StoreMasterStatus/" + dataItem.id + "/activate",
					dataType : 'text',
					success : function(response) {
						$("#alertsBox").html("");
						$("#alertsBox").html(response);
						$("#alertsBox").dialog({
							modal : true,
							draggable: false,
							resizable: false,
							buttons : {
								"Close" : function() {
									$(this).dialog("close");
								}
							}
						});
						button.text('Deactivate');
						$('#storeGrid').data('kendoGrid').dataSource.read();
					}
				});
			} else {
				$.ajax({
					type : "POST",
					url : "./storeMaster/StoreMasterStatus/" + dataItem.id + "/deactivate",
					dataType : 'text',
					success : function(response) {
						$("#alertsBox").html("");
						$("#alertsBox").html(response);
						$("#alertsBox").dialog({
							modal : true,
							draggable: false,
							resizable: false,
							buttons : {
								"Close" : function() {
									$(this).dialog("close");
								}
							}
						});
						button.text('Activate');
						$('#storeGrid').data('kendoGrid').dataSource.read();
					}
				});
			}		
	  	 }  						
		
	});	


$("#storeGrid").on("click", "#temPID", function(e) 
		  {
			 var button = $(this),
			 enable = button.text() == "Activate";
			 var widget = $("#storeGrid").data("kendoGrid");
			 var dataItem = widget.dataItem($(e.currentTarget).closest("tr"));		 
			 if (enable)
			 {
				$.ajax
				({
					type : "POST",
					url : "./store/Status/" + dataItem.id + "/activate",
					dataType : 'text',
					success : function(response) 
					{
						$("#alertsBox").html("");
						$("#alertsBox").html(response);
				  	    $("#alertsBox").dialog
						({
							modal : true,
							buttons : {
							   "Close" : function() {
						          $(this).dialog("close");
								}
							}
						});
						button.text('Deactivate');
						$('#storeGrid').data('kendoGrid').dataSource.read();
					}
				});
			 }
			 else 
			 {
			      $.ajax
				  ({
					   type : "POST",
					   url : "./store/Status/" + dataItem.id + "/deactivate",
					   dataType : 'text',
					   success : function(response) 
					   {
						   $("#alertsBox").html("");
						   $("#alertsBox").html(response);
						   $("#alertsBox").dialog({
							   modal : true,
							   buttons : 
							   {
								   "Close" : function() {
										$(this).dialog("close");
									 }
									}
							   });
							  button.text('Activate');
							  $('#storeGrid').data('kendoGrid').dataSource.read();
							 }
							});
			 }	
		   });
(function($, kendo) 
		  {
			 $.extend(true,kendo.ui.validator,
			 { 
				rules : { 
						  storeNamevalidation : function(input, params) 
			  		      { 
							 if (input.filter("[name='storeName']").length && input.val()) 
							 {
								return /^[a-zA-Z]+[ ._a-zA-Z0-9._]*[a-zA-Z0-9]$/.test(input.val());
							 }
							 return true;
						  },
					  storeNameNullValidator : function(input,params) 
  				  { 
  					  if (input.attr("name") == "storeName") 
  					  {
						     return $.trim(input.val()) !== "";
						  }
						  return true;
  		           },
  		           storeDescNullValidator : function(input,params) 
	    				  { 
	    					  if (input.attr("name") == "storeDesc") 
	    					  {
	  						     return $.trim(input.val()) !== "";
	  						  }
	  						  return true;
	    		           },
	    		        
		    		       
		    		           
	    		           
				},
				  messages : 
				  {
					  storeNameNullValidator:"please select amount",
					  storeDescNullValidator:"please select remarks",
					  storeNamevalidation:"should not alllow apecial characters",
				  }
			 });
	})(jQuery, kendo);


</script> --%>