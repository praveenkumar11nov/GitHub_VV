<%@include file="/common/taglibs.jsp"%>

	<!-- Urls for Common controller  -->
	<c:url value="/common/getAllChecks" var="allChecksUrl" />
	<c:url value="/common/getFilterDropDownValues" var="filterDropDownUrl" />
	
	<!-- Urls for Owner  -->
	<c:url value="/person/read/" var="readPersonUrl" />
	<c:url value="/person/modify" var="modifyPersonUrl" />
	
	<c:url value="/person/categories" var="categoriesReadUrlOwner" />
	<c:url value="/comowner/status/readstatus" var="statusReadUrl" />
	
	<!-- Urls for Person  -->
	<c:url value="/person/getPersonList" var="personNamesAutoUrl" />
	<c:url value="/person/getFirstName" var="firstNameUrl" />
	<c:url value="/person/getMiddleName" var="middleNameUrl" />
	<c:url value="/person/getLastName" var="lastNameUrl" />
	<c:url value="/person/getFatherName" var="fatherNameUrl" />
	<c:url value="/person/getSpouseName" var="spouseNameUrl" />
	<c:url value="/person/getOccupation" var="occupationUrl" />
	
	
	<c:url value="/person/getAllAttributeValues" var="filterAutoCompleteUrl" />
	
	<c:url value="/person/upload/personImage" var="personImage" />
	<c:url value="/person/getPersonStyleChecks" var="personStyleChecksUrl" />
	
	<!-- Urls for Users  -->
	<c:url value="/users/getPersonFullNamesList" var="personFullNameFilterUrl" />

	<!-- Address Grid Access Url's -->
	<c:url value="/address/read" var="readAddressUrl" />
	<c:url value="/address/create" var="createAddressUrl" />
	<c:url value="/address/update" var="updateAddressUrl" />
	<c:url value="/owner/address/delete" var="deleteAddressUrl" />
	<c:url value="/address/addressLocationChecks" var="addressLocationUrl" />
	<c:url value="/address/addressPrimaryChecks" var="addressPrimaryUrl" />
	<c:url value="/address/getCountry" var="countryUrl" />
	<c:url value="/address/getState" var="stateUrl" />
	<c:url value="/address/getCity" var="cityUrl" />
	<c:url value="/address/addressSeasonChecks" var="addressSeasonUrl" />

	<!-- Contact Grid Access Urls -->
	<c:url value="/contact/read" var="readContactUrl" />
	<c:url value="/contact/create" var="createContactUrl" />
	<c:url value="/contact/update" var="updateContactUrl" />
	<c:url value="/owner/contact/delete" var="deleteContactUrl" />
	<c:url value="/contact/contactLocationChecks" var="contactLocationUrl" />
	<c:url value="/contact/addressforcontact" var="addressforcontactUrl" />
	<c:url value="/contact/contactTypeChecks" var="contactTypeUrl" />
	<c:url value="/contact/contactPrimaryChecks" var="contactPrimaryUrl" />
	
	<!-- Property Grid Access Urls -->
	<c:url value="/comowner/property/read" var="OwnerPropertyReadUrl" />
	<c:url value="/comowner/property/create" var="OwnerPropertyCreateUrl" />
	<c:url value="/comowner/property/update" var="OwnerPropertyUpdateUrl" />
	<c:url value="/comowner/property/delete" var="OwnerPropertyDeleteUrl" />
	<c:url value="/ownerProperty/visitorRegReqChecks" var="visitorRegReqChecksUrl" />
	<%-- <c:url value="/ownerProperty/readProperties" var="readPropertyUrl" />
	<c:url value="/comowner/property/readTowerNames" var="towerNames" /> --%>
	
	<c:url value="/person/getPropertyNo" var="getPropertyNoUrl" />
	<c:url value="/mailroom/readTowerNames" var="towerNames" />
	<c:url value="/ownerPersonAdderssContact/uploadExcelData" var="uploadDataOwner" />
	
	
	
	
	<c:url value="/Persons/languageFilter" var="readlanguageFilter" />

	<!-- Access card Grid Access Urls -->
<%-- 	<c:url value="/comowner/accesscards/read" var="AccessCardsReadUrl" />
	<c:url value="/comowner/accesscards/create" var="AccessCardsCreateUrl" />
	<c:url value="/comowner/accesscards/update" var="AccessCardsUpdateUrl" />
	<c:url value="/comowner/accesscards/delete" var="AccessCardsDeleteUrl" />
	<c:url value="/comowner/acccards/readAccessCardTypes" var="accessCardTypeUrl" />
	<c:url value="/comowner/acccards/readAccessCardTypes" var="accessCardTypeUrl" />
	<c:url value="/comowner/status/readstatus" var="statusReadUrl" /> --%>
	
	<!-- Access Cards Assinging New -->
	<c:url value="/comowner/accesscard/read" var="AccessCardReadUrl" />
	<c:url value="/comowner/accesscard/create" var="AccessCardCreateUrl" />
	<c:url value="/comowner/accesscard/update" var="AccessCardUpdateUrl" />
	<c:url value="/owner/accesscard/delete" var="AccessCardDeleteUrl" />
	<c:url value="/accesscards/getAllAccessCards" var="readAccessCards" />
		
	<!-- Access card permission Grid Access Urls -->
	<c:url value="/comowner/accesscardspermisions/read" var="AccessCardsPermissionsReadUrl" />
	<c:url value="/comowner/accesscardspermisions/create" var="AccessCardsPermissionCreateUrl" />
	<c:url value="/comowner/accesscardspermisions/update" var="AccessCardsPermissionUpdateUrl" />
	<c:url value="/owner/accesscardspermisions/delete" var="AccessCardsPermissionDeleteUrl" />
	<c:url value="/comowner/getAccessCardsBasedOnPersonId" var="getAccessCardsBasedOnPersonId" />
	<c:url value="/comowner/accessrepositoryread/read" var="readAccessRepositoryUrl" />
	
	<!-- Document Grid Access Urls -->
	<c:url value="/kycComplaints/upload/async/save" var="saveUrl" />
	<c:url value="/ownerDocument/read" var="OwnerPropertyDRReadUrl" />
	<c:url value="/ownerDocument/create" var="OwnerDocumentRepoCreateUrl" />
	<c:url value="/ownerDocument/update" var="OwnerDocumentRepoUpdateUrl" />
	<c:url value="/owner/ownerDocument/delete" var="OwnerDocumentRepoDeleteUrl" />
	<c:url value="/documentdefiner/getAllDocument" var="getDocumentType" />
	<c:url value="/documentDefiner/getDocumentFormat" var="getDocumentTypeFormat" />
	
	<!-- Medical Emergency Disability Grid Access Urls -->
	<c:url value="/medicalEmergencyDisability/read" var="readMedicalEmergencyDisabilityUrl" />
	<c:url value="/medicalEmergencyDisability/create" var="createMedicalEmergencyDisabilityUrl" />
	<c:url value="/medicalEmergencyDisability/update" var="updateMedicalEmergencyDisabilityUrl" />
	<c:url value="/owner/medicalEmergencyDisability/delete" var="deleteMedicalEmergencyDisabilityUrl" />

	<!-- Arms Grid Access Urls -->
	<c:url value="/arms/read" var="readArmsUrl" />
	<c:url value="/arms/create" var="createArmsUrl" />
	<c:url value="/arms/update" var="updateArmsUrl" />
	<c:url value="/owner/arms/delete" var="deleteArmsUrl" />

<c:url value="/person/getAllParkingSlotsBasedOnproperty" var="readParkingSlotsUrl" />
<c:url value="/comowner/accesscard/readAccessCardsForUniqe" var="readAccessCardsForUniqe" />
<!-- <script type="text/javascript">

$(".page-content").ready(function(){   
	$('li[class^=manu]').css("background","#5f5f5f");
	$('.manu'+count).css("background","#464651");

});


<!-- -------------------------------------------------- Grid data ------------------------------------------------------- -->
	
<kendo:grid name="gridPersonOwner" dataBound="dataBoundOwner"  edit="personEventOwner" change="onChangeOwner" pageable="true" resizable="true"  detailTemplate="personTemplateOwner"
	sortable="true" reorderable="true" selectable="true" scrollable="true" groupable="true" filterable="true" navigatable="true" >
		<kendo:grid-pageable pageSizes="true" buttonCount="5" pageSize="10" input="true" numeric="true" refresh="true" info="true" previousNext="true">
			<kendo:grid-pageable-messages itemsPerPage="Owners per page" empty="No Owner to display" refresh="Refresh all the Owners" 
			display="{0} - {1} of {2} Owners" first="Go to the first page of Owners" last="Go to the last page of Owners" next="Go to the next page of Owners"
			previous="Go to the previous page of Owners"/>
		</kendo:grid-pageable> 
		
		<kendo:grid-filterable extra="false">
			<kendo:grid-filterable-operators>
				<kendo:grid-filterable-operators-string eq="Is equal to" contains="Contains"/>
				<kendo:grid-filterable-operators-number eq="Is equal to" gt="Is greather than" gte="IS greather than and equal to" lt="Is less than" lte="Is less than and equal to" neq="Is not equal to"/>
			</kendo:grid-filterable-operators>
		</kendo:grid-filterable>
		<kendo:grid-editable mode="popup"/>
		<%-- <kendo:grid-toolbar>
				
			<kendo:grid-toolbarItem name="create" text="Add Owner" />
			<kendo:grid-toolbarItem text="Clear_Filter" /> 
		</kendo:grid-toolbar>--%>
		
		<kendo:grid-toolbarTemplate>
			<div class="toolbar">
    			<label class="category-label" for="categoriesOwner">&nbsp;&nbsp;Select&nbsp;the&nbsp;Category&nbsp;to&nbsp;Add&nbsp;Owner&nbsp;:&nbsp;&nbsp;</label>
	    		<kendo:dropDownList name="categoriesOwner" optionLabel="Select" dataTextField="personStyle" 
	    				dataValueField="personStyle" autoBind="false" change="categoriesChangeOwner">
	    			<kendo:dataSource>
		    			<kendo:dataSource-transport>            	
			                <kendo:dataSource-transport-read url="${categoriesReadUrlOwner}" />                
			            </kendo:dataSource-transport>
	    			</kendo:dataSource>    			   			    			
	    		</kendo:dropDownList>

				<a class="k-button k-button-icontext k-grid-add" href="#">
		            <span class="k-icon k-add"></span>
		            Add Owner
	        	</a>
	        	
	        	<a class="k-button k-button-icontext k-grid-ownerTemplatesDetailsExport" href="#">
                <span class=" "></span>
                 Export To Excel
                </a>
                
                <a class="k-button k-button-icontext k-grid-ownerPdfTemplatesDetailsExport" href="#">
                <span class=" "></span>
                 Export To PDF
                </a>
	        	
	        	<!-- <a class="k-button k-button-icontext k-grid-Clear_Filter" href="#">
					<span class=" "></span>
					Clear_Filter
				</a> -->
				
			
	
				<a class='k-button' href='\\#' onclick="clearFilterOwner()"><span class='k-icon k-i-funnel-clear'></span> Clear Filter</a>
				
	            <!-- <input type='file' name='files' id='files1' onclick="importFileClick()">  -->
	            
	            <a class='k-button' href='#' id="undo" type="file">Upload Owner Data</a>
	            
	              <select id='propertyFilters'></select>
	            
			</div>  	
			
    	</kendo:grid-toolbarTemplate>
    	
		<kendo:grid-columns>
			<%-- <kendo:grid-column title="&nbsp;" width="100px">
				<kendo:grid-column-command>
					<kendo:grid-column-commandItem name="edit" />

				</kendo:grid-column-command>
			</kendo:grid-column> --%>
			
				<kendo:grid-column title="Image" field="image" template ="<span onclick='clickToUploadImage()' title='Click to Upload Image' ><img src='./person/getpersonimage/#=personId#' id='myImages_#=personId#' alt='Click to Upload Image' width='80px' height='80px'/></span>"
				filterable="false" width="94px" sortable="false">
				</kendo:grid-column>

			<kendo:grid-column title="Category&nbsp;*" field="personStyle" width="100px" filterable="true" hidden="true">
   				<kendo:grid-column-values value="${personStyle}"/>
			</kendo:grid-column>

			<kendo:grid-column title="Title&nbsp;*"   field="title" width="60px">
				<kendo:grid-column-values value="${title}"/>
			</kendo:grid-column>

			<kendo:grid-column title="Name&nbsp;*" field="personName"
				filterable="true" width="140px" footerTemplate="Count : #= count#" >
				<kendo:grid-column-filterable>
					<kendo:grid-column-filterable-ui>
						<script type="text/javascript">
							function personNameFilter(element) {
								element.kendoAutoComplete({
									placeholder : "Enter first name",
									dataSource : {
										transport : {
											read : "${personFullNameFilterUrl}/Owner"
										}
									}
								});
							}
						</script>
					</kendo:grid-column-filterable-ui>
				</kendo:grid-column-filterable>
			</kendo:grid-column>
			
			<kendo:grid-column title="First&nbsp;Name&nbsp;*" field="firstName" editor="firstNameEditorOwner" width="0px" hidden="true"/>

			<kendo:grid-column title="Middle&nbsp;Name" field="middleName" width="0px"
				hidden="true"/>

			<kendo:grid-column title="Last&nbsp;Name&nbsp;" field="lastName" width="0px"
				hidden="true"/>

			<kendo:grid-column title="Father&nbsp;Name&nbsp;" field="fatherName"
				width="120px">
				<kendo:grid-column-filterable>
					<kendo:grid-column-filterable-ui>
						<script type="text/javascript">
							function fatherNameFilter(element) {
								element.kendoAutoComplete({
									placeholder : "Enter father name",
									dataSource : {
										transport : {
											read : "${filterAutoCompleteUrl}/Owner/fatherName"
										}
									}
								});
							}
						</script>
					</kendo:grid-column-filterable-ui>
				</kendo:grid-column-filterable>
			</kendo:grid-column>
			
			<kendo:grid-column title="Marital&nbsp;Status" field="maritalStatus" editor="maritalStatusDropdownEditorOwner" width="120px">
				<kendo:grid-column-values value="${maritalStatus}"/>
			</kendo:grid-column>
			
			<kendo:grid-column title="Spouse&nbsp;Name" field="spouseName" 
				filterable="true" width="120px">
				<kendo:grid-column-filterable>
					<kendo:grid-column-filterable-ui>
						<script type="text/javascript">
							function spouseNameFilter(element) {
								element.kendoAutoComplete({
									placeholder : "Enter spouse name",
									dataSource : {
										transport : {
											read : "${filterAutoCompleteUrl}/Owner/spouseName"
										}
									}
								});
							}
						</script>
					</kendo:grid-column-filterable-ui>
				</kendo:grid-column-filterable>
			</kendo:grid-column>
			
			<kendo:grid-column title="Sex" field="sex" width="60px" hidden="true">
				<kendo:grid-column-values value="${sex}"/>
			</kendo:grid-column>
			
		<%-- 	<kendo:grid-column title="Date&nbsp;of&nbsp;Birth&nbsp;*" field="dob"
				format="{0:dd/MM/yyyy}" template="#=dobDisplay(data)#" filterable="true"
				width="100px" /> --%>
				
			<kendo:grid-column title="Date&nbsp;of&nbsp;Birth&nbsp;" field="dob" format="{0:dd/MM/yyyy}" width="100px" hidden="true"/>
				
			 <kendo:grid-column title="Age&nbsp;*"  template="#=ageDisplay(data)#" field="age"
				width="60px" hidden="true"/>  
				
			<kendo:grid-column title="Nationality" field="nationality" width="95px">
				<kendo:grid-column-values value="${nationality}"/>
		    </kendo:grid-column>
		    		
			<kendo:grid-column title="Blood&nbsp;Group" field="bloodGroup" width="120px" hidden="true">
				<kendo:grid-column-values value="${bloodGroup}"/>
		    </kendo:grid-column>	
					
			<kendo:grid-column title="Occupation/Profession" field="occupation" editor="comboBoxChecksEditorOwner"
				filterable="true" width="150px" hidden="true">
				<kendo:grid-column-filterable>
					<kendo:grid-column-filterable-ui>
						<script type="text/javascript">
							function occupationFilter(element) {
								element.kendoAutoComplete({
									placeholder : "Enter occupation",
									dataSource : {
										transport : {
											read : "${filterAutoCompleteUrl}/Owner/occupation"
										}
									}
								});
							}
						</script>
					</kendo:grid-column-filterable-ui>
				</kendo:grid-column-filterable>
			</kendo:grid-column>
			
			<kendo:grid-column title="Nature&nbsp;of&nbsp;Work" field="workNature" width="120px" hidden="true">
				<kendo:grid-column-values value="${workNature}"/>
		    </kendo:grid-column>	
		    	
			<kendo:grid-column title="Languages" field="languagesKnown"
				editor="languagesEditorOwner" filterable="true" width="95px" >
			 <kendo:grid-column-filterable>
				<kendo:grid-column-filterable-ui>
					<script>
						function projectNameFilter(element) {
							element.kendoAutoComplete({
								placeholder : "Enter  Language",
								dataSource : {
									transport : {
										read : "${readlanguageFilter}"
									}
								}
							});
						}
					</script>
				</kendo:grid-column-filterable-ui>
			</kendo:grid-column-filterable>
				</kendo:grid-column>
				
			<kendo:grid-column title="Status" field="personStatus" width="85px" >
				 <kendo:grid-column-values value="${status}"/>
			</kendo:grid-column>

			<kendo:grid-column title="&nbsp;" width="100px">
				<kendo:grid-column-command>
					<kendo:grid-column-commandItem name="edit" />

				</kendo:grid-column-command>
			</kendo:grid-column>

		<kendo:grid-column title=""
				template="<a href='\\\#' id='temPID' class='k-button k-button-icontext btn-destroy k-grid-Activate#=data.personId#'>#= data.personStatus == 'Active' ? 'De-activate' : 'Activate' #</a>"
				width="100px" />
        </kendo:grid-columns>


		<kendo:dataSource requestStart="onRequestStartPersonOwner" requestEnd="onRequestEndPersonOwner">
			<%-- 
			  <kendo:dataSource-group>
		        	<kendo:dataSource-groupItem field="personName">
		        		<kendo:dataSource-groupItem-aggregates>       		        		      
			        		
			        		<kendo:dataSource-groupItem-aggregate aggregate="count" field="personName"/>
		        		</kendo:dataSource-groupItem-aggregates>
		        	</kendo:dataSource-groupItem>
	        	</kendo:dataSource-group> --%>
		        <kendo:dataSource-aggregate>               		        		      
			       
			        <kendo:dataSource-aggregateItem aggregate="count" field="personName"/>        		
		        </kendo:dataSource-aggregate>
			
			
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-read url="${readPersonUrl}/Owner" dataType="json" type="POST" contentType="application/json"/>
				<kendo:dataSource-transport-create url="${modifyPersonUrl}/create/Owner" dataType="json" type="GET" contentType="application/json" />
				<kendo:dataSource-transport-update url="${modifyPersonUrl}/update/Owner" dataType="json" type="GET" contentType="application/json" />
			</kendo:dataSource-transport>
			<kendo:dataSource-schema parse="parseOwner">
				<kendo:dataSource-schema-model id="personId">
					<kendo:dataSource-schema-model-fields>

						<kendo:dataSource-schema-model-field name="personName"
							type="string" />
						<kendo:dataSource-schema-model-field name="personId" type="number"
							editable="false" />
						<kendo:dataSource-schema-model-field name="personType" 
							type="string" defaultValue="Owner" editable="false"/>
						<kendo:dataSource-schema-model-field name="personStyle" defaultValue="Individual"/>
						<kendo:dataSource-schema-model-field name="title" defaultValue="Mr"/>
						<kendo:dataSource-schema-model-field name="firstName"
							type="string"/>
						<kendo:dataSource-schema-model-field name="middleName"
							type="string" />
						<kendo:dataSource-schema-model-field name="lastName" type="string"/>
						<kendo:dataSource-schema-model-field name="fatherName"
							type="string"/>
						<kendo:dataSource-schema-model-field name="maritalStatus" defaultValue="None"/>
						<kendo:dataSource-schema-model-field name="spouseName"
							type="string" />
						<kendo:dataSource-schema-model-field name="sex" defaultValue="None"/>
						<kendo:dataSource-schema-model-field name="dob" type="date" defaultValue=""/>
						<kendo:dataSource-schema-model-field name="age"
							type="number"/>
						<kendo:dataSource-schema-model-field name="nationality" defaultValue="None"/>
						<kendo:dataSource-schema-model-field name="bloodGroup" defaultValue="None"/>
						<kendo:dataSource-schema-model-field name="occupation"
							type="string" defaultValue="None"/>
						<kendo:dataSource-schema-model-field name="workNature" defaultValue="None"/>
						<kendo:dataSource-schema-model-field name="languagesKnown" defaultValue="None"  />
						<kendo:dataSource-schema-model-field name="drGroupId"
							type="number" />
						<kendo:dataSource-schema-model-field name="kycCompliant"
							type="string"/>
						
						<kendo:dataSource-schema-model-field name="personStatus" type="string" defaultValue="Inactive"/>

					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
		</kendo:dataSource>
	</kendo:grid>
	
<kendo:grid-detailTemplate id="personTemplateOwner">
		<kendo:tabStrip name="tabStrip_#=personId#">
			<kendo:tabStrip-items>
				<kendo:tabStrip-item text="Address" selected="true" >
					<kendo:tabStrip-item-content>
						<div class="wethear" >
							<kendo:grid name="gridAddress_#=personId#" pageable="true" edit="addressEvent" remove="removeAddress"
								resizable="true" sortable="true" reorderable="true"
								selectable="true" scrollable="true">
								<%--  <kendo:grid name="grid" pageable="true" resizable="true" sortable="true" reorderable="true" selectable="true" scrollable="true" > --%>
								<kendo:grid-pageable pageSize="10"></kendo:grid-pageable>
								<kendo:grid-editable mode="popup"
									confirmation="Are you sure you want to remove this Address?" />
								<kendo:grid-toolbar>
									<kendo:grid-toolbarItem name="create" text="Add Address" />
									 <%-- 	<kendo:grid-toolbarItem	template="<input type='file' name='files' id='files' onclick='importFileClick()' />" /> 	 --%>
								</kendo:grid-toolbar>
								<kendo:grid-columns>

									<kendo:grid-column title="&nbsp;" width="100px">
										<kendo:grid-column-command>
											<kendo:grid-column-commandItem name="Contacts" click="contactInfo"/>
										</kendo:grid-column-command>
									</kendo:grid-column>

									<kendo:grid-column title="Address&nbsp;Type&nbsp;*" field="addressLocation"
										editor="addressLocationEditor" width="100px" />
									<kendo:grid-column title="Primary *" field="addressPrimary"
										editor="addressPrimaryEditor" width="100px" />
									<kendo:grid-column title="Property No." format=""
										field="addressNo" width="0px" hidden="true" />

									<kendo:grid-column title="Address" field="address"
										width="100px" />

									<kendo:grid-column title="Address&nbsp;Line&nbsp;1&nbsp;*" field="address1"
										editor="address1Editor" width="0px" hidden="true" />
									<kendo:grid-column title="Address&nbsp;Line&nbsp;2" field="address2"
										editor="address2Editor" width="0px" hidden="true" />
									<kendo:grid-column title="Address&nbsp;Line&nbsp;3" field="address3"
										editor="address3Editor" width="0px" hidden="true" />
									
									
									<kendo:grid-column title="Country *" field="countryId"
										hidden="true" editor="countryEditor" width="120px" />
									<kendo:grid-column title="Other Country *" field="countryotherId"
										width="0px" hidden="true" />
									<kendo:grid-column title="Country *" field="countryName"
										width="100px" />
									<kendo:grid-column title="State/Province&nbsp;*" field="stateId"
										hidden="true" editor="stateEditor" width="120px" />
									<kendo:grid-column title="Other State *" field="stateotherId"
										width="0px" hidden="true" />
									<kendo:grid-column title="State/Province *" field="stateName"
										editor="stateEditor" width="120px" />
									<kendo:grid-column title="City *" field="cityId" hidden="true"
										editor="cityEditor" width="120px" />
									<kendo:grid-column title="Other City *" field="cityotherId"
										width="0px" hidden="true" />
									<kendo:grid-column title="City *" field="cityName"
										editor="cityEditor" width="120px" />



									<%-- <kendo:grid-column title="Type" field="contactType"
										editor="contactTypeEditor" width="100px" />
									
									<kendo:grid-column title="Contact Content"
										field="contactContent" width="120px" /> --%>
									<kendo:grid-column title="Pin/Zip&nbsp;Code&nbsp;" field="pincode"
										width="150px" format="" />
									<kendo:grid-column title="Email *" field="emailContent"
										hidden="true" width="100px" />
									<kendo:grid-column title="Mobile *" field="phoneContent" 
										hidden="true" width="100px" />
									<%--  <kendo:grid-column title="Contact Id" field="addressContactId"  width="100px"/>  --%>
									 <kendo:grid-column title="Seasonal" field="addressSeason"
										filterable="false" sortable="false" width="0px" hidden="true" />
									<kendo:grid-column title="Season From"
										field="addressSeasonFrom" format="{0:dd/MM/yyyy hh:mm tt}" editor="dateEditor" filterable="true" width="100px" >
										<kendo:grid-column-filterable ui="datetimepicker"></kendo:grid-column-filterable>
									</kendo:grid-column>
									<kendo:grid-column title="Season To" field="addressSeasonTo" format="{0:dd/MM/yyyy hh:mm tt}" editor="dateEditor" filterable="true" width="100px" >
										<kendo:grid-column-filterable ui="datetimepicker"></kendo:grid-column-filterable>
									</kendo:grid-column>

									<%--        <kendo:grid-column title="Created By" field="createdBy" filterable="true" width="120px"/>
					            <kendo:grid-column title="Last Updated By" field="lastUpdatedBy" filterable="true" width="120px" />
					           	<kendo:grid-column title="Last Updated Date" field="lastUpdatedDt"
									template="#= kendo.toString(lastUpdatedDt, 'dd/MM/yy')#"
									filterable="false" width="120px" /> --%>								

									<kendo:grid-column title="&nbsp;" width="100px">
										<kendo:grid-column-command>
											<kendo:grid-column-commandItem name="edit"
												 />
										</kendo:grid-column-command>
									</kendo:grid-column>
									<kendo:grid-column title="&nbsp;" width="100px">
										<kendo:grid-column-command>
											<kendo:grid-column-commandItem name="destroy" />
										</kendo:grid-column-command>
									</kendo:grid-column>
								</kendo:grid-columns>
								<kendo:dataSource requestEnd="onRequestEndAddress" requestStart="onRequestStartAddress">
									<kendo:dataSource-transport>
										<kendo:dataSource-transport-read
											url="${readAddressUrl}/#=personId#" dataType="json"
											type="POST" contentType="application/json" />
										<kendo:dataSource-transport-create
											url="${createAddressUrl}/#=personId#" dataType="json"
											type="POST" contentType="application/json" />
										<kendo:dataSource-transport-update
											url="${updateAddressUrl}/#=personId#" dataType="json"
											type="POST" contentType="application/json" />
										<kendo:dataSource-transport-destroy
											url="${deleteAddressUrl}" dataType="json"
											type="POST" contentType="application/json" />
										<kendo:dataSource-transport-parameterMap>
											<script type="text/javascript">
												function parameterMap(options,
														type) {
													return JSON
															.stringify(options);
												}
											</script>
										</kendo:dataSource-transport-parameterMap>
									</kendo:dataSource-transport>
									<kendo:dataSource-schema parse="parseAddress">
										<kendo:dataSource-schema-model id="addressId">
											<kendo:dataSource-schema-model-fields>
												<kendo:dataSource-schema-model-field name="addressId"
													editable="false" />
												<kendo:dataSource-schema-model-field name="personId"
													editable="false" />
												<kendo:dataSource-schema-model-field name="addressLocation"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="addressPrimary"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="addressNo"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>

												<%-- <kendo:dataSource-schema-model-field name="address"/> --%>


												<kendo:dataSource-schema-model-field name="address1"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="address2"
													type="string">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="address3"
													type="string">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="countryId">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="countryotherId"
													type="string">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="countryName"
													type="string">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="stateId">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="stateotherId"
													type="string">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="stateName"
													type="string">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="cityId">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>



												<kendo:dataSource-schema-model-field name="cityotherId"
													type="string">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="cityName"
													type="string">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												
												<kendo:dataSource-schema-model-field name="emailContent"
													type="email">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="phoneContent"
													type="tel">
													<kendo:dataSource-schema-model-field-validation
														required="true"/>
												</kendo:dataSource-schema-model-field>
												
												<%-- <kendo:dataSource-schema-model-field name="contactType"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												
												<kendo:dataSource-schema-model-field name="contactContent"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field> --%>
												
												<kendo:dataSource-schema-model-field name="pincode"
													 >
													<kendo:dataSource-schema-model-field-validation 
														required="false" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="addressContactId"
													type="number">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="addressSeason"
													type="boolean" defaultValue="false" />

												<kendo:dataSource-schema-model-field
													name="addressSeasonFrom" type="date" defaultValue="">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="addressSeasonTo"
													type="date" defaultValue="">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>

												<%-- 					                        <kendo:dataSource-schema-model-field name="createdBy" type="string" editable="false">
					                        	<kendo:dataSource-schema-model-field-validation required = "true" />
					                        </kendo:dataSource-schema-model-field>
					                        <kendo:dataSource-schema-model-field name="lastUpdatedBy" type="string" editable="false">
					                        	<kendo:dataSource-schema-model-field-validation required = "true" />
					                        </kendo:dataSource-schema-model-field>
					                        <kendo:dataSource-schema-model-field name="lastUpdatedDt" type="date" editable="false">
												<kendo:dataSource-schema-model-field-validation />
					                        </kendo:dataSource-schema-model-field> --%>

											</kendo:dataSource-schema-model-fields>
										</kendo:dataSource-schema-model>
									</kendo:dataSource-schema>
								</kendo:dataSource>
							</kendo:grid>
						</div>
					</kendo:tabStrip-item-content>
				</kendo:tabStrip-item>
				<kendo:tabStrip-item text="Contact">
					<kendo:tabStrip-item-content>
						<div class="wethear" >
							<kendo:grid name="gridContact_#=personId#" pageable="true" edit="contactEvent" remove="removeContact"
								resizable="true" sortable="true" reorderable="true"
								selectable="true" scrollable="true">
								<kendo:grid-pageable pageSize="10"></kendo:grid-pageable>
								<kendo:grid-editable mode="popup"
									confirmation="Are you sure you want to remove this Contact?" />
								<kendo:grid-toolbar>
									<kendo:grid-toolbarItem name="create" text="Add Contact" />
								</kendo:grid-toolbar>
								<kendo:grid-columns>

									<%-- <kendo:grid-column title="Contact ID" field="contactId" filterable="false" width="100px"/> 
					        	<kendo:grid-column title="Person Id" field="personId" filterable="true" width="100px" /> --%>

									<kendo:grid-column title="Address" field="addressId"
										editor="addressforcontactEditor" width="0px" hidden="true" />

									<kendo:grid-column title="Address&nbsp;Type&nbsp;*" field="contactLocation"
										editor="contactLocationEditor" width="100px" />
									<kendo:grid-column title="Type *" field="contactType"
										editor="contactTypeEditor" width="100px" />
									<kendo:grid-column title="Primary *" field="contactPrimary"
										editor="contactPrimaryEditor" width="120px" />

									<kendo:grid-column title="Contact&nbsp;Content&nbsp;*"
										field="contactContent" width="120px" />
									<kendo:grid-column title="Preferred Time"
										field="contactPrefferedTime" format="{0:HH:mm}"
										editor="contactPreferredTimeEditor" width="120px" />
									<kendo:grid-column title="Seasonal" field="contactSeason"
										filterable="false" sortable="false" width="1px"/>
									<kendo:grid-column title="Season From"
										field="contactSeasonFrom" format="{0:dd/MM/yyyy hh:mm tt}" editor="dateEditor" filterable="true" width="100px" >
										<kendo:grid-column-filterable ui="datetimepicker"></kendo:grid-column-filterable>
									</kendo:grid-column>
									<kendo:grid-column title="Season To" field="contactSeasonTo" format="{0:dd/MM/yyyy hh:mm tt}" editor="dateEditor" filterable="true" width="100px" >
										<kendo:grid-column-filterable ui="datetimepicker"></kendo:grid-column-filterable>
									</kendo:grid-column>
									
									<kendo:grid-column title="&nbsp;" width="100px">
										<kendo:grid-column-command>
											<kendo:grid-column-commandItem name="edit" />
										</kendo:grid-column-command>
									</kendo:grid-column>
									<kendo:grid-column title="&nbsp;" width="100px">
										<kendo:grid-column-command>
											<kendo:grid-column-commandItem name="destroy" />
										</kendo:grid-column-command>
									</kendo:grid-column>

								</kendo:grid-columns>
								<kendo:dataSource requestEnd="onRequestEndContact" requestStart="onRequestStartContact">
									<kendo:dataSource-transport>
										<kendo:dataSource-transport-read
											url="${readContactUrl}/#=personId#" dataType="json"
											type="POST" contentType="application/json" />
										<kendo:dataSource-transport-create
											url="${createContactUrl}/#=personId#" dataType="json"
											type="POST" contentType="application/json" />
										<kendo:dataSource-transport-update
											url="${updateContactUrl}/#=personId#" dataType="json"
											type="POST" contentType="application/json" />
										<kendo:dataSource-transport-destroy
											url="${deleteContactUrl}" dataType="json"
											type="POST" contentType="application/json" />
										<kendo:dataSource-transport-parameterMap>
											<script type="text/javascript">
												function parameterMap(options,
														type) {
													return JSON
															.stringify(options);
												}
											</script>
										</kendo:dataSource-transport-parameterMap>
									</kendo:dataSource-transport>
									<kendo:dataSource-schema parse="parseContact">
										<kendo:dataSource-schema-model id="contactId">
											<kendo:dataSource-schema-model-fields>
												<kendo:dataSource-schema-model-field name="contactId"
													editable="false" />
												<kendo:dataSource-schema-model-field name="personId"
													editable="false" />

												<kendo:dataSource-schema-model-field name="addressId"
													type="number" defaultValue=""/>
												<kendo:dataSource-schema-model-field name="contactLocation"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="contactType"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="contactPrimary"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="contactContent"
													type="string">
													<kendo:dataSource-schema-model-field-validation
														required="true" pattern="^.{1,40}$" />
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field
													name="contactPrefferedTime" type="string">
													<kendo:dataSource-schema-model-field-validation />
												</kendo:dataSource-schema-model-field>
												 <kendo:dataSource-schema-model-field name="contactSeason"
													type="boolean" defaultValue="false" />

												<kendo:dataSource-schema-model-field
													name="contactSeasonFrom" type="date" defaultValue="">
													<kendo:dataSource-schema-model-field-validation/>
												</kendo:dataSource-schema-model-field>
												<kendo:dataSource-schema-model-field name="contactSeasonTo"
													type="date" defaultValue="">
													<kendo:dataSource-schema-model-field-validation/>
												</kendo:dataSource-schema-model-field>
											</kendo:dataSource-schema-model-fields>
										</kendo:dataSource-schema-model>
									</kendo:dataSource-schema>
								</kendo:dataSource>
							</kendo:grid>
						</div>
					</kendo:tabStrip-item-content>
				</kendo:tabStrip-item>

				<kendo:tabStrip-item text="Property">
                <kendo:tabStrip-item-content>
                 	<div class="wethear">
 						
 				<kendo:grid name="propertyGrid_#=personId#" pageable="true" resizable="true" sortable="true" reorderable="true" edit="propertyEvent" change="propertyChangeEvent" remove="removeProperty"
								selectable="true" scrollable="true">
							<%--  <kendo:grid name="grid" pageable="true" resizable="true" sortable="true" reorderable="true" selectable="true" scrollable="true" > --%>
								<kendo:grid-pageable pageSize="10"></kendo:grid-pageable>
								<kendo:grid-editable mode="popup" confirmation="Are you sure you want to remove this item?" />
						        <kendo:grid-toolbar >
						            <kendo:grid-toolbarItem name="create" text="Assign Property" />
						        </kendo:grid-toolbar>
        						<kendo:grid-columns>
        								<%-- <kendo:grid-column title="&nbsp;" width="100px" >
							             	<kendo:grid-column-command>
							            		<kendo:grid-column-commandItem name="edit"/>
							            	</kendo:grid-column-command>
							             </kendo:grid-column> --%>
									     <%-- <kendo:grid-column title="Owner Property ID" field="ownerPropertyId" filterable="false" width="120px"/> --%>
									     <%-- <kendo:grid-column title="Owner Id" field="owner" ></kendo:grid-column> --%>
									     <%-- <kendo:grid-column title="Tower Name" field="towerName" editor="TowerNames" hidden="true" width="100px" />
									     <kendo:grid-column title="Property Id" editor="PropertyNumbers" field="propertyId"></kendo:grid-column> --%>
									     
									     <kendo:grid-column title="Tower/Block Name&nbsp;*" field="blockId" editor="TowerNames" hidden="true" width="120px" />
									     <kendo:grid-column title="Tower/Block Name&nbsp;*" field="blockName" width="130px" />
										 <kendo:grid-column title="Property Number&nbsp;*" field="propertyId" hidden="true" editor="propertyNoEditor" width="140px"/>
										 <kendo:grid-column title="Property Number&nbsp;*" field="propertyNo" width="120px"/>
									     <kendo:grid-column title="Primary Owner&nbsp;*" field="primaryOwner" editor="primaryOwnerEditor" width="110px"></kendo:grid-column>
									     <kendo:grid-column title="Occupied&nbsp;*" field="residential" editor="residentialOwnerEditor" width="85px"></kendo:grid-column>
									     <kendo:grid-column title="Property&nbsp;Possession&nbsp;Date"  format= "{0:dd/MM/yyyy}" field="propertyPossessionDate" width="155px"></kendo:grid-column>
        								<%--  <kendo:grid-column title="Property Status" field="status" editor="statusEditor"></kendo:grid-column> --%>
        								 <kendo:grid-column title="Property Acquired Date&nbsp;*"  format= "{0:dd/MM/yyyy}" field="propertyAquiredDate" width="145px"></kendo:grid-column>	
        								 <%-- <kendo:grid-column title="Property Relieving Date"  format= "{0:dd/MM/yyyy}"  field="propertyRelingDate"></kendo:grid-column> --%>
        								 <kendo:grid-column title="Visitor Registration Required&nbsp;*" field="visitorRegReq" editor="visitorRegReqEditor"></kendo:grid-column>
        								 <%-- <kendo:grid-column title="&nbsp;" width="100px" >
							            	<kendo:grid-column-command>
							            		<kendo:grid-column-commandItem name="edit"/>
							            	</kendo:grid-column-command>
							            </kendo:grid-column>
							            <kendo:grid-column title="&nbsp;" width="100px" >
							            	<kendo:grid-column-command>
							            		<kendo:grid-column-commandItem name="destroy" />
							            	</kendo:grid-column-command>
							            </kendo:grid-column> --%>
							            <kendo:grid-column title="&nbsp;" width="160px" >
            								<kendo:grid-column-command>
            									<kendo:grid-column-commandItem name="edit" />
            									<kendo:grid-column-commandItem name="destroy" />
							            	</kendo:grid-column-command>
							            </kendo:grid-column>
        						</kendo:grid-columns>
        						 <kendo:dataSource requestEnd="PropertyRequestEnd" requestStart="onRequestStart">
						            <kendo:dataSource-transport>
						                <kendo:dataSource-transport-read url="${OwnerPropertyReadUrl}/#=personId#" dataType="json" type="POST" contentType="application/json"/>
						                <kendo:dataSource-transport-create url="${OwnerPropertyCreateUrl}/#=personId#" dataType="json" type="POST" contentType="application/json" />
						                <kendo:dataSource-transport-update url="${OwnerPropertyUpdateUrl}/#=personId#" dataType="json" type="POST" contentType="application/json" />
						                <kendo:dataSource-transport-destroy url="${OwnerPropertyDeleteUrl}/#=personId#" dataType="json" type="POST" contentType="application/json" />
						               <kendo:dataSource-transport-parameterMap>
						                	<script type="text/javascript">
							                	function parameterMap(options,type) 
							                	{
							                		return JSON.stringify(options);	                		
							                	}
						                	</script>
						                 </kendo:dataSource-transport-parameterMap>
						            </kendo:dataSource-transport>
						            <kendo:dataSource-schema parse="ownerPropertyParse">
						                <kendo:dataSource-schema-model id="ownerPropertyId">
						                    <kendo:dataSource-schema-model-fields>
							                    <kendo:dataSource-schema-model-field name="ownerPropertyId" editable="false" />
							                    <kendo:dataSource-schema-model-field name="owner" >
							                        	<kendo:dataSource-schema-model-field-validation required = "true"/>
							                     </kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="propertyId" type="number">
													<kendo:dataSource-schema-model-field-validation/>
												</kendo:dataSource-schema-model-field> 
												<kendo:dataSource-schema-model-field name="propertyNo" type="string">
													<kendo:dataSource-schema-model-field-validation/>
												</kendo:dataSource-schema-model-field>     
						                    	<kendo:dataSource-schema-model-field name="status" type="string" defaultValue="Active">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="primaryOwner" type="string">
						                    	</kendo:dataSource-schema-model-field>     
						                    	<kendo:dataSource-schema-model-field name="residential" type="string">
						                    	</kendo:dataSource-schema-model-field> 
						                    	<kendo:dataSource-schema-model-field name="propertyAquiredDate" type="date" defaultValue="">
						                    		<kendo:dataSource-schema-model-field-validation/>
						                    	</kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="propertyPossessionDate" type="date" defaultValue=""/>
						                    	<%-- <kendo:dataSource-schema-model-field name="propertyRelingDate" type="date" defaultValue="">
						                    		<kendo:dataSource-schema-model-field-validation/>
						                    	</kendo:dataSource-schema-model-field>   --%>
						                    	<kendo:dataSource-schema-model-field name="visitorRegReq" type="string">
						                    	</kendo:dataSource-schema-model-field>      
						                    </kendo:dataSource-schema-model-fields>
						                 </kendo:dataSource-schema-model>
						             </kendo:dataSource-schema>
						          </kendo:dataSource>
        				</kendo:grid>
 					</div>
 			    </kendo:tabStrip-item-content>
 			</kendo:tabStrip-item>
 			
			<kendo:tabStrip-item text="Access Cards">
                <kendo:tabStrip-item-content>
                    <div class='wethear'>
							
							<kendo:grid name="gridAccessCard_#=personId#"   pageable="true" edit="accessCardEvent" remove="removeAccessCard"
								resizable="true" sortable="true" reorderable="true"
								selectable="true" scrollable="true" dataBound="accessCardDataBound">
								<kendo:grid-pageable pageSize="10"></kendo:grid-pageable>							
								<kendo:grid-editable mode="popup" confirmation="Are you sure you want to remove this item?" />
						        <kendo:grid-toolbar>
						            <kendo:grid-toolbarItem name="create" text="Assign Card" />
						        </kendo:grid-toolbar>
        						<kendo:grid-columns>
        								<%-- <kendo:grid-column title="&nbsp;" width="100px" >
							             	<kendo:grid-column-command>
							            		<kendo:grid-column-commandItem name="edit"/>
							            	</kendo:grid-column-command>
							             </kendo:grid-column> --%>
									     <%-- <kendo:grid-column title="Access Card Id" field="acId" filterable="false" width="120px"/> --%>
									     <%-- <kendo:grid-column title="Person Id="personId" ></kendo:grid-column> --%>
									     
									    <%--  <kendo:grid-column title="Person Name" editor="PersonNames" field="personId"></kendo:grid-column> --%>
									     <kendo:grid-column title="Access Card&nbsp;*" field="acId" hidden="true" editor="accessCardsEditor"></kendo:grid-column>
									     <kendo:grid-column title="Access Card&nbsp;*" field="acNo" width="100px" ></kendo:grid-column>
							             <kendo:grid-column title="&nbsp;" width="172px">
							            	<kendo:grid-column-command>
							            		<kendo:grid-column-commandItem name="edit" />
							            		<kendo:grid-column-commandItem name="destroy" />
							            	</kendo:grid-column-command>
							            </kendo:grid-column>
        						</kendo:grid-columns>
        						 <kendo:dataSource requestEnd="AccessCardsRequestEnd" requestStart="AccessCardsResquestStart">
						            <kendo:dataSource-transport>
						                <kendo:dataSource-transport-read url="${AccessCardReadUrl}/#=personId#" dataType="json" type="POST" contentType="application/json"/>
						                <kendo:dataSource-transport-create url="${AccessCardCreateUrl}/#=personId#" dataType="json" type="POST" contentType="application/json" />
						                <kendo:dataSource-transport-update url="${AccessCardUpdateUrl}/#=personId#" dataType="json" type="POST" contentType="application/json" />
						                <kendo:dataSource-transport-destroy url="${AccessCardDeleteUrl}" dataType="json" type="POST" contentType="application/json" />
						                <kendo:dataSource-transport-parameterMap>
						                	<script type="text/javascript">
							                	function parameterMap(options,type) 
							                	{
							                		return JSON.stringify(options);	                		
							                	}
						                	</script>
						                 </kendo:dataSource-transport-parameterMap>
						            </kendo:dataSource-transport>
						            <kendo:dataSource-schema>
						                <kendo:dataSource-schema-model id="personacId">
						                    <kendo:dataSource-schema-model-fields>
							                    <kendo:dataSource-schema-model-field name="personacId" editable="false" type="number"/>
						                    	<%-- <kendo:dataSource-schema-model-field name="personId" type="number"></kendo:dataSource-schema-model-field>   --%> 
						                    	<kendo:dataSource-schema-model-field name="acId">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
						                    	<%-- <kendo:dataSource-schema-model-field name="acNo" type="string">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field> --%>
						                    	<%-- <kendo:dataSource-schema-model-field name="acNo" type="string">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="acStartDate" type="date" defaultValue="">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="acEndDate" type="date" defaultValue="">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="status" type="string">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field> --%>
						                    </kendo:dataSource-schema-model-fields>
						                 </kendo:dataSource-schema-model>
						             </kendo:dataSource-schema>
						          </kendo:dataSource>
        				</kendo:grid>
                    </div>
             	</kendo:tabStrip-item-content>
            </kendo:tabStrip-item>
			
			<kendo:tabStrip-item text="Access Cards Permissions">
                <kendo:tabStrip-item-content>
                    <div class='wethear'>
                    
                    	 <%-- <kendo:dropDownList name="size_#=personId#" dataTextField="name" dataValueField="value" select="handleChange">
					        <kendo:dataSource data="${sizes}" ></kendo:dataSource>
					    </kendo:dropDownList>   --%>
					    <br/>
					    
					    <kendo:dropDownList  name="accessCardAssigned_#=personId#" dataBound="setFirstSelected" optionLabel="Select Card" select="handleChange" dataTextField="acNo" dataValueField="acId" style="width:250px">
				            <kendo:dataSource>
				                <kendo:dataSource-transport>
				                   <kendo:dataSource-transport-read url="${getAccessCardsBasedOnPersonId}/#=personId#" type="POST" contentType="application/json"/>
				                   <kendo:dataSource-transport-parameterMap>
					                	<script type="text/javascript">
						                	function parameterMap(options) {
						                		return JSON.stringify(options);
						                	}
					                	</script>
					                </kendo:dataSource-transport-parameterMap>
				                </kendo:dataSource-transport>
				            </kendo:dataSource>
        				</kendo:dropDownList>
					    <br/>
                    	<!-- <input type="text" id="testId" name="testId" value="#=personId#" /> -->
                    	<br/>
                     		<kendo:grid name="gridAccessCardPermission_#=personId#"  pageable="true" edit="accessCardPermissionEvent" remove="removeAccessCardPermission"
								resizable="true" sortable="true" reorderable="true"
								selectable="true" scrollable="true">
								<kendo:grid-pageable pageSize="10"></kendo:grid-pageable>
								<kendo:grid-editable mode="popup" confirmation="Are you sure you want to remove this item?" />
						        <kendo:grid-toolbar >
						            <%-- <kendo:grid-toolbarItem name="create" text="Assign Permissions" /> --%>
						        </kendo:grid-toolbar>
        						<kendo:grid-columns>
        								<%-- <kendo:grid-column title="&nbsp;" width="100px" >
							             	<kendo:grid-column-command>
							            		<kendo:grid-column-commandItem name="edit"/>
							            	</kendo:grid-column-command>
							             </kendo:grid-column> --%>
									     <%-- <kendo:grid-column title="Access Permission Id" field="acpId" filterable="false" width="120px"/> --%>
									     <%-- <kendo:grid-column title="Access Card Id="acId" ></kendo:grid-column> --%>
									     
									    <%--  <kendo:grid-column title="Person Name" editor="PersonNames" field="personId"></kendo:grid-column> --%>
									     <%-- <kendo:grid-column title="Access Type" field="acpId"></kendo:grid-column> --%>
									    <%--  <kendo:grid-column title="Access Card"  field="acId"></kendo:grid-column> --%>
									     <kendo:grid-column title="Access Repository&nbsp;*" editor="accessRepoEditor" hidden="true" width="0px" field="arId"></kendo:grid-column>
									    	<kendo:grid-column title="Access Repository&nbsp;*"  field="acPointName"></kendo:grid-column>
									     <kendo:grid-column title="Start Date&nbsp;*" field="acpStartDate" format= "{0:dd/MM/yyyy}"   filterable="true" width="100px" />
									     <kendo:grid-column title="End Date&nbsp;*" field="acpEndDate" format= "{0:dd/MM/yyyy}"   filterable="true" width="100px" />
									     <kendo:grid-column title="Status&nbsp;*"  field="status" editor="statusEditor"></kendo:grid-column>
									    
        								 <kendo:grid-column title="&nbsp;" width="172px" >
							            	<kendo:grid-column-command>
							            		<%-- <kendo:grid-column-commandItem name="edit"/>
							            		<kendo:grid-column-commandItem name="destroy"/> --%>
							            	</kendo:grid-column-command>
							            </kendo:grid-column>s
        						</kendo:grid-columns>
        						 <kendo:dataSource requestEnd="AccessCardsPermissionRequestEnd" requestStart="AccessCardsPermissionsRequestStart">
						            <kendo:dataSource-transport>
						                <kendo:dataSource-transport-read  url="${AccessCardsPermissionsReadUrl}" dataType="json"  type="GET" contentType="application/json"/>
						                <kendo:dataSource-transport-create url="${AccessCardsPermissionCreateUrl}" dataType="json" type="GET"  contentType="application/json" />
						                <kendo:dataSource-transport-update url="${AccessCardsPermissionUpdateUrl}" dataType="json" type="GET" contentType="application/json" />
						                <kendo:dataSource-transport-destroy url="${AccessCardsPermissionDeleteUrl}/" dataType="json" type="GET" contentType="application/json" />
						               <%-- <kendo:dataSource-transport-parameterMap>
						                	<script type="text/javascript">
							                	function parameterMap(options,type) 
							                	{
							                		return JSON.stringify(options);	                		
							                	}
						                	</script>
						                 </kendo:dataSource-transport-parameterMap> --%>
						            </kendo:dataSource-transport>
						            <kendo:dataSource-schema  parse="accessCardPemissionParse">
						                <kendo:dataSource-schema-model id="acpId">
						                    <kendo:dataSource-schema-model-fields>
							                    <kendo:dataSource-schema-model-field name="acpId" type="number" />
						                    	<%-- <kendo:dataSource-schema-model-field name="personId" type="number"></kendo:dataSource-schema-model-field>   --%> 
						                    	<kendo:dataSource-schema-model-field name="arId" type="number">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="acpStartDate" type="date" defaultValue="">
						                    		<%-- 	<kendo:dataSource-schema-model-field-validation required = "true"/> --%>
						                    	</kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="acpEndDate" type="date" defaultValue="">
						                    			<%-- <kendo:dataSource-schema-model-field-validation required = "true"/> --%>
						                    	</kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="status" type="string">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
						                    	
						                    	<kendo:dataSource-schema-model-field name="acId" type="number">
						                    	</kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="arName" type="string">
						                    		<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
						                    </kendo:dataSource-schema-model-fields>
						                 </kendo:dataSource-schema-model>
						             </kendo:dataSource-schema>
						          </kendo:dataSource>
        				</kendo:grid>	
                    </div>
             	</kendo:tabStrip-item-content>
            </kendo:tabStrip-item>

				
 			
 			<kendo:tabStrip-item text="Documents">
                <kendo:tabStrip-item-content>
                    <div class='wethear'>
                    		<br/>
                    			<a class="k-button k-button-icontext" id="approveDocuments_#=personId#" onclick="approveDocuments()" ><span class="k-icon k-add"></span>Approve Document</a>
						    <br/>
						    <br/>
							<kendo:grid name="documentsUpload_#=personId#" pageable="true" edit="documentEvent" dataBound="UploadFileBound" change="documentChangeEvent" remove="removeDocument"
								resizable="true" sortable="true" reorderable="true"
								selectable="true" scrollable="true">
								<kendo:grid-pageable pageSize="10"></kendo:grid-pageable>
								<kendo:grid-editable mode="popup"  confirmation="Are sure you want to delete this item ?"/>
						       <kendo:grid-toolbar >
						            <kendo:grid-toolbarItem name="create" text="Add Document" />
						        </kendo:grid-toolbar> 
        						<kendo:grid-columns>
        								<kendo:grid-column title="&nbsp;" width="250px" >
							             	<!-- File Upload Button Purpose -->
							             </kendo:grid-column>
									     <%-- <kendo:grid-column title="Document Repo Id" field="drId" filterable="false" width="120px"/> --%>
									     <%-- <kendo:grid-column title="Dr Group Id" field="drGroupId" ></kendo:grid-column> --%>
									     
									     <kendo:grid-column title="Document Name&nbsp;*"  field="documentName" editor="documentNameEditor" width="100px"></kendo:grid-column>
									     <kendo:grid-column title="Document Format" field="documentFormat" editor="documentFormatEditor" width="100px"></kendo:grid-column>
									     <kendo:grid-column title="Document Number" field="documentNumber" width="100px"></kendo:grid-column>
									     <kendo:grid-column title="Document Description&nbsp;*" field="documentDescription" editor="documentDecriptionEditor" width="100px"></kendo:grid-column>
									     <%-- <kendo:grid-column title="Approved Status"  field="approved"></kendo:grid-column> --%>
        								 <kendo:grid-column title="&nbsp;" width="175px" >
							            	<kendo:grid-column-command>
							            		<kendo:grid-column-commandItem name="edit"/>
							            		<kendo:grid-column-commandItem name="View" click="downloadFile"/>
							            		<%-- <kendo:grid-column-commandItem name="Upload" click="uploadNotice" /> --%>
							            		<kendo:grid-column-commandItem name="destroy" />
							            	</kendo:grid-column-command>
							            </kendo:grid-column>
		
        								 <%-- <kendo:grid-column title="&nbsp;" width="100px" >
							            	<kendo:grid-column-command>
							            		<kendo:grid-column-commandItem name="edit"/>
							            	</kendo:grid-column-command>
							            </kendo:grid-column> --%>
        						</kendo:grid-columns>
        						 <kendo:dataSource requestEnd="DocumentOnRequestEnd" requestStart="DocumentsRequestStart">
						            <kendo:dataSource-transport>
						                <kendo:dataSource-transport-read url="${OwnerPropertyDRReadUrl}/#=drGroupId#/Owner" dataType="json" type="POST" contentType="application/json"/>
						                <kendo:dataSource-transport-create url="${OwnerDocumentRepoCreateUrl}/#=drGroupId#/Owner" dataType="json" type="POST" contentType="application/json" />
						                <kendo:dataSource-transport-update url="${OwnerDocumentRepoUpdateUrl}/#=drGroupId#/Owner" dataType="json" type="POST" contentType="application/json" />
						                <kendo:dataSource-transport-destroy url="${OwnerDocumentRepoDeleteUrl}" dataType="json" type="POST" contentType="application/json" />
						               <kendo:dataSource-transport-parameterMap>
						                	<script type="text/javascript">
							                	function parameterMap(options,type) 
							                	{
							                		return JSON.stringify(options);	                		
							                	}
						                	</script>
						                 </kendo:dataSource-transport-parameterMap>
						            </kendo:dataSource-transport>
						            <kendo:dataSource-schema>
						                <kendo:dataSource-schema-model id="drId">
						                    <kendo:dataSource-schema-model-fields>
							                    <kendo:dataSource-schema-model-field name="drId"  editable="false" />
						                    	<kendo:dataSource-schema-model-field name="documentFormat" type="string"></kendo:dataSource-schema-model-field>   
						                    	<kendo:dataSource-schema-model-field name="documentName" type="string"></kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="documentNumber" type="string"></kendo:dataSource-schema-model-field>
						                    	<kendo:dataSource-schema-model-field name="documentDescription" type="string">
						                    		<kendo:dataSource-schema-model-field-validation required="true"/>
						                    	</kendo:dataSource-schema-model-field>
						                    </kendo:dataSource-schema-model-fields>
						                 </kendo:dataSource-schema-model>
						             </kendo:dataSource-schema>
						          </kendo:dataSource>
        				</kendo:grid>		
                    </div>
                </kendo:tabStrip-item-content>
            </kendo:tabStrip-item>
            
             <kendo:tabStrip-item text="Medical Emergency">
                <kendo:tabStrip-item-content>
                 <div class="wethear" >
                       <kendo:grid remove="deleteAccessCheckMedicalEmergencyOwner" name="gridMedicalEmergencyOwner_#=personId#" pageable="true" edit="medicalEmergencyEventOwner" resizable="true" sortable="true" reorderable="true" selectable="true" scrollable="true" >
						<kendo:grid-pageable pageSize="5"  >
							<kendo:grid-pageable-messages itemsPerPage="Medical Emergency Details per page" empty="No Medical Emergency Detail to display" refresh="Refresh all the Medical Emergency Details" 
									display="{0} - {1} of {2} Medical Emergency Details" first="Go to the first page of Medical Emergency Details" last="Go to the last page of Medical Emergency Details" next="Go to the next page of Medical Emergency Details"
									previous="Go to the previous page of Medical Emergency Details"/>
						</kendo:grid-pageable>
							<kendo:grid-editable mode="popup" confirmation="Are you sure you want to remove this Medical Emergency detail?" />
					        <kendo:grid-toolbar >
					            <kendo:grid-toolbarItem name="create"  text="Add Medical Emergency Detail" />				       
					        </kendo:grid-toolbar>
					        <kendo:grid-columns>	
					       		<%-- <kendo:grid-column title="Medical Emergency ID" field="meId" filterable="false" width="100px"/> 
					        	<kendo:grid-column title="Person Id" field="personId" filterable="true" width="100px" /> --%>
					        	<kendo:grid-column title="Category&nbsp;*" field="meCategory" width="100px">
					        		<kendo:grid-column-values value="${meCategory}"/>
					        	</kendo:grid-column>
					            <kendo:grid-column title="Emergency / Disability Type&nbsp;*" field="disabilityType" width="100px"/>
					            <kendo:grid-column title="Description" field="description"  editor="textAreaEditor" width="100px"/>
					            <kendo:grid-column title="Hospital Name" field="meHospitalName"  width="100px"/>
					            <kendo:grid-column title="Hospital Contact No" field="meHospitalContact"  width="100px"/>
					            <kendo:grid-column title="Hospital Address" field="meHospitalAddress" editor="textAreaEditor" width="100px"/>
					
					<%--        <kendo:grid-column title="Created By" field="createdBy" filterable="true" width="120px"/>
					            <kendo:grid-column title="Last Updated By" field="lastUpdatedBy" filterable="true" width="120px" />
					           	<kendo:grid-column title="Last Updated Date" field="lastUpdatedDt"
									template="#= kendo.toString(lastUpdatedDt, 'dd/MM/yy')#"
									filterable="false" width="120px" /> --%>
					           
					            <kendo:grid-column title="&nbsp;" width="100px" >
					            	<kendo:grid-column-command>
					            		<kendo:grid-column-commandItem name="edit"/>
					            	</kendo:grid-column-command>
					            </kendo:grid-column>
					            <kendo:grid-column title="&nbsp;" width="100px" >
					            	<kendo:grid-column-command>
					            		<kendo:grid-column-commandItem name="destroy"/>
					            	</kendo:grid-column-command>
					            </kendo:grid-column>
					        </kendo:grid-columns>
					        <kendo:dataSource requestStart="onRequestStartMedicalEmergencyOwner" requestEnd="onRequestEndMedicalEmergencyOwner">
					            <kendo:dataSource-transport>
					                <kendo:dataSource-transport-read url="${readMedicalEmergencyDisabilityUrl}/#=personId#" dataType="json" type="POST" contentType="application/json"/>
					                <kendo:dataSource-transport-create url="${createMedicalEmergencyDisabilityUrl}/#=personId#" dataType="json" type="POST" contentType="application/json" />
					                <kendo:dataSource-transport-update url="${updateMedicalEmergencyDisabilityUrl}/#=personId#" dataType="json" type="POST" contentType="application/json" />
					                <kendo:dataSource-transport-destroy url="${deleteMedicalEmergencyDisabilityUrl}" dataType="json" type="POST" contentType="application/json" />
					               <kendo:dataSource-transport-parameterMap>
					                	<script type="text/javascript">
						                	function parameterMap(options,type) 
						                	{
						                		return JSON.stringify(options);	                		
						                	}
					                	</script>
					                 </kendo:dataSource-transport-parameterMap>
					            </kendo:dataSource-transport>
					            <kendo:dataSource-schema>
					                <kendo:dataSource-schema-model id="meId">
					                    <kendo:dataSource-schema-model-fields>
					                    <kendo:dataSource-schema-model-field name="meId" editable="false" />
					                    <kendo:dataSource-schema-model-field name="personId" editable="false" />					                    
					                        <kendo:dataSource-schema-model-field name="meCategory" defaultValue="Emergency" />
					                        <kendo:dataSource-schema-model-field name="disabilityType" type="string">
					                          	<%-- <kendo:dataSource-schema-model-field-validation required = "true"/> --%>
						                    </kendo:dataSource-schema-model-field>
					                        <kendo:dataSource-schema-model-field name="description" type="string" />
					                        <kendo:dataSource-schema-model-field name="meHospitalName" type="string" />
					                        <kendo:dataSource-schema-model-field name="meHospitalContact" type="string" />
					                        <kendo:dataSource-schema-model-field name="meHospitalAddress" type="string" />

<%-- 					                    <kendo:dataSource-schema-model-field name="createdBy" type="string" editable="false">
					                        	<kendo:dataSource-schema-model-field-validation required = "true" />
					                        </kendo:dataSource-schema-model-field>
					                        <kendo:dataSource-schema-model-field name="lastUpdatedBy" type="string" editable="false">
					                        	<kendo:dataSource-schema-model-field-validation required = "true" />
					                        </kendo:dataSource-schema-model-field>
					                        <kendo:dataSource-schema-model-field name="lastUpdatedDt" type="date" editable="false">
												<kendo:dataSource-schema-model-field-validation />
					                        </kendo:dataSource-schema-model-field> --%>
					                    </kendo:dataSource-schema-model-fields>
					                </kendo:dataSource-schema-model>
					            </kendo:dataSource-schema>
					        </kendo:dataSource>
					 </kendo:grid> 
					 </div>
                </kendo:tabStrip-item-content>
            </kendo:tabStrip-item>
            
			<kendo:tabStrip-item text="Arms">
                <kendo:tabStrip-item-content>
                    <div class="wethear" >
                       <kendo:grid remove="deleteAccessCheckArmsOwner"  name="gridArmsOwner_#=personId#" pageable="true" resizable="true" edit="armsEventOwner" sortable="true" reorderable="true" selectable="true" scrollable="true" >
						<kendo:grid-pageable pageSize="5"  >
								<kendo:grid-pageable-messages itemsPerPage="Arms per page" empty="No Arms to display" refresh="Refresh all the Arms" 
									display="{0} - {1} of {2} Arms" first="Go to the first page of Arms" last="Go to the last page of Arms" next="Go to the next page of Arms"
									previous="Go to the previous page of Arms"/>
						</kendo:grid-pageable>
							<kendo:grid-editable mode="popup" confirmation="Are you sure you want to remove this Arms?" />
					        <kendo:grid-toolbar >
					            <kendo:grid-toolbarItem name="create"  text="Add Arms" />				       
					        </kendo:grid-toolbar>
					        <kendo:grid-columns>					       
					       		<%-- <kendo:grid-column title="Arm ID" field="armsId" filterable="false" width="100px"/> 
					        	<kendo:grid-column title="Person Id" field="personId" filterable="true" width="100px" /> --%>
					        	<kendo:grid-column title="Type&nbsp;*" field="typeOfArm" editor="comboBoxChecksEditorOwner" width="100px" />
					            <kendo:grid-column title="Make" field="armMake" width="100px"/>
					            <kendo:grid-column title="Licence No" field="licenceNo" width="120px"/>

					            <kendo:grid-column title="Licence Validity" field="licenceValidity"  format= "{0:dd/MM/yyyy}" width="120px"/>
					            <%-- <kendo:grid-column title="Dr Group Id" field="drGroupId"  width="120px" /> --%>
					            <kendo:grid-column title="Issuing Authority Name" field="issuingAuthority" width="120px"/>
					            <kendo:grid-column title="No Of Rounds" field="noOfRounds" format="" width="100px" />
					
					<%--        <kendo:grid-column title="Created By" field="createdBy" filterable="true" width="120px"/>
					            <kendo:grid-column title="Last Updated By" field="lastUpdatedBy" filterable="true" width="120px" />
					           	<kendo:grid-column title="Last Updated Date" field="lastUpdatedDt"
									template="#= kendo.toString(lastUpdatedDt, 'dd/MM/yy')#"
									filterable="false" width="120px" /> --%>
					           
					            <kendo:grid-column title="&nbsp;" width="100px" >
					            	<kendo:grid-column-command>
					            		<kendo:grid-column-commandItem name="edit"/>
					            	</kendo:grid-column-command>
					            </kendo:grid-column>
					            <kendo:grid-column title="&nbsp;" width="100px" >
					            	<kendo:grid-column-command>
					            		<kendo:grid-column-commandItem name="destroy"/>
					            	</kendo:grid-column-command>
					            </kendo:grid-column>
					        </kendo:grid-columns>
					        <kendo:dataSource requestStart="onRequestStartArmsOwner" requestEnd="onRequestEndArmsOwner">
					            <kendo:dataSource-transport>
					                <kendo:dataSource-transport-read url="${readArmsUrl}/#=personId#" dataType="json" type="POST" contentType="application/json"/>
					                <kendo:dataSource-transport-create url="${createArmsUrl}/#=personId#" dataType="json" type="POST" contentType="application/json" />
					                <kendo:dataSource-transport-update url="${updateArmsUrl}/#=personId#" dataType="json" type="POST" contentType="application/json" />
					                <kendo:dataSource-transport-destroy url="${deleteArmsUrl}" dataType="json" type="POST" contentType="application/json" />
					               <kendo:dataSource-transport-parameterMap>
					                	<script type="text/javascript">
						                	function parameterMap(options,type) 
						                	{
						                		return JSON.stringify(options);	                		
						                	}
					                	</script>
					                 </kendo:dataSource-transport-parameterMap>
					            </kendo:dataSource-transport>
					            <kendo:dataSource-schema>
					                <kendo:dataSource-schema-model id="armsId">
					                    <kendo:dataSource-schema-model-fields>
					                    <kendo:dataSource-schema-model-field name="armsId" />
					                    <kendo:dataSource-schema-model-field name="personId" />					                    
					                        <kendo:dataSource-schema-model-field name="typeOfArm" type="string" defaultValue="Revolver" />
					                        <kendo:dataSource-schema-model-field name="armMake" type="string" />
					                        <kendo:dataSource-schema-model-field name="licenceNo" type="string">
					                        	<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
					                        <kendo:dataSource-schema-model-field name="licenceValidity" type="date" defaultValue="">
					                        	<kendo:dataSource-schema-model-field-validation required = "true"/>
						                    	</kendo:dataSource-schema-model-field>
					                        <kendo:dataSource-schema-model-field name="drGroupId" type="number" />
					                        <kendo:dataSource-schema-model-field name="issuingAuthority" type="string"  />
					                        <kendo:dataSource-schema-model-field name="noOfRounds" defaultValue="" type="number">
					                        	<kendo:dataSource-schema-model-field-validation min = "0"/>
					                        </kendo:dataSource-schema-model-field>
	
<%-- 					                        <kendo:dataSource-schema-model-field name="createdBy" type="string" editable="false">
					                        	<kendo:dataSource-schema-model-field-validation required = "true" />
					                        </kendo:dataSource-schema-model-field>
					                        <kendo:dataSource-schema-model-field name="lastUpdatedBy" type="string" editable="false">
					                        	<kendo:dataSource-schema-model-field-validation required = "true" />
					                        </kendo:dataSource-schema-model-field>
					                        <kendo:dataSource-schema-model-field name="lastUpdatedDt" type="date" editable="false">
												<kendo:dataSource-schema-model-field-validation />
					                        </kendo:dataSource-schema-model-field> --%>
					                    </kendo:dataSource-schema-model-fields>
					                </kendo:dataSource-schema-model>
					            </kendo:dataSource-schema>
					        </kendo:dataSource>
					 </kendo:grid> 
					 </div>
                </kendo:tabStrip-item-content>
            </kendo:tabStrip-item>



				<kendo:tabStrip-item text="Parking Slots">
				<kendo:tabStrip-item-content>
					<div id="wethear">
						<kendo:grid name="parkingSlots_#=personId#" pageable="true"
							sortable="true" resizable="true" groupable="true"
							filterable="true" scrollable="true">
							<kendo:grid-pageable pageSizes="true" buttonCount="5"
								pageSize="10" input="true" numeric="true"></kendo:grid-pageable>
					
						
							<kendo:grid-columns>
							
								
						<kendo:grid-column title="Property No" field="propertyNo"
									width="130px" filterable="false">
									
									</kendo:grid-column>
								<kendo:grid-column title="Slot No"
									field="slotNumber" width="130px" filterable="false"/>
						
								<kendo:grid-column title="OwnerShip" field="ownerShipType"
									width="130px" filterable=""/>

								<kendo:grid-column title="Parking Method" field="parkingMethod"
									width="100px" filterable="false"/>
									
									
								<kendo:grid-column title="Activation Date" field="activationDate"
									width="100px" filterable="false" format="{0:dd/MM/yyyy}"/>
								
								
							</kendo:grid-columns>
							<kendo:dataSource pageSize="20">
								<kendo:dataSource-transport>
									<kendo:dataSource-transport-read
										url="${readParkingSlotsUrl}/#=personId#" dataType="json"
										type="GET" contentType="application/json" />
								
								</kendo:dataSource-transport>

								<kendo:dataSource-schema parse="parse">
									<kendo:dataSource-schema-model>
										<kendo:dataSource-schema-model-fields>
											<kendo:dataSource-schema-model-field name="slotNumber" />
											<kendo:dataSource-schema-model-field name="ownerShipType" />
											<kendo:dataSource-schema-model-field name="parkingMethod" />
											<kendo:dataSource-schema-model-field name="propertyNo" type="string"/>
											<kendo:dataSource-schema-model-field name="activationDate" type="date"/>
										</kendo:dataSource-schema-model-fields>
									</kendo:dataSource-schema-model>
								</kendo:dataSource-schema>
							</kendo:dataSource>
						</kendo:grid>
					</div>
				</kendo:tabStrip-item-content>
			</kendo:tabStrip-item>
			
			

			<kendo:tabStrip-item text="Owner Other Information">
					<kendo:tabStrip-item-content>
						<div class='employee-details'>
							<table>
								<tr>
									
									<td style="vertical-align: top;">
									 <br>
									<h2>Owner Name: #= personName #</h2> 
										<dl>
											<br>
											<table>
												<tr>
													<td><b>Category</b></td>
													<td>#= personStyle#</td>
													<td><b>Father Name</b></td>
													<td>#= fatherName#</td>
												</tr>
												<tr>
													<td><b>Marital Status</b></td>
													<td>#= maritalStatus#</td>
													<td><b>Spouse Name</b></td>
													<td>#= spouseName#</td>
												</tr>
												<tr>
												<td><b>Sex</b></td>
													<td> #= sex #</td>
													<td><b>Date Of Birth</b></td>
													<td>#= kendo.toString(dob,'MM/dd/yyyy') #</td>
												</tr>

												<tr>													
													<td><b>Age</b></td>
													<td>#=age#</td>
													<td><b>Blood Group</b></td>
													<td>#= bloodGroup #</td>
												</tr>
												
												<tr>													
													<td><b>Nature Of Work</b></td>
													<td>#=workNature#</td>
													<td><b>Occupation</b></td>
													<td>#= occupation #</td>
												</tr>											
											</table>									
										</dl> 
									</td>
								</tr>
							</table>
						</div>
					</kendo:tabStrip-item-content>
				</kendo:tabStrip-item>
				
				<%-- <kendo:tabStrip-item text="Photo Upload">
					<kendo:tabStrip-item-content>

						<div class="demo-section"
							style="width: 98%; height: 300px; vertical-align: middle;">


							<div class="wrappers">
								<img id="myImage"
									src="<c:url value='/person/getpersonimage/#=personId#'/>"
									alt="" width="250px;" height="270px;" />
							</div>
							<div class="wrappers" style="padding-left: 20px">
								<kendo:upload complete="oncomplete" name="files1" select="photoSelectedtoUpload"
									multiple="false">
									<kendo:upload-async autoUpload="true"
										saveUrl="${personImage}/#=personId#" />
								</kendo:upload>

							</div>

						</div>

					</kendo:tabStrip-item-content>
				</kendo:tabStrip-item> --%>


			</kendo:tabStrip-items>
		</kendo:tabStrip>
	</kendo:grid-detailTemplate>
	
 <%-- <kendo:window name="details" modal="true" draggable="true" visible="false" /> --%>
 <div id="personPopUp" title="Is this the person you want to add ?"></div>
 <div id="alertsBox" title="Alert"></div>
 <div id="uploadDialog" title="Upload Image" style="display: none;">
	<kendo:upload complete="oncomplete" name="files" upload="onpersonImageUpload" multiple="false" success="onImageSuccess">
				<kendo:upload-async autoUpload="true" saveUrl="${personImage}" />
	</kendo:upload>
</div>
<div id="uploadDialog" title="Upload Document" hidden="true"></div>

 <div id="fileupload" title="Upload Excel" hidden="true">
	<kendo:upload  name="files"  id="files1" select="onSelectupload" multiple="false" success="onExcelDocSuccess" error="errorRegardingUploadExcel" template="<span class='k-progress'></span><div class='file-wrapper'> <span class='file-icon #=addExtensionClass(files[0].extension)#'></span><h6 class='file-heading file-name-heading'>Name: #=name#</h6><h6 class='file-heading file-size-heading'>Size: #=size# bytes</h6><button type='button' class='k-upload-action'></button></div>">
				<kendo:upload-async autoUpload="false" saveUrl="${uploadDataOwner}"/>
	</kendo:upload>
</div>

<script>

var res1 = new Array();


$("#gridPersonOwner").on("click",".k-grid-ownerTemplatesDetailsExport", function(e) {
	  window.open("./ownerTemplate/ownerTemplatesDetailsExport");
});	  

$("#gridPersonOwner").on("click",".k-grid-ownerPdfTemplatesDetailsExport", function(e) {
	  window.open("./ownerPdfTemplate/ownerPdfTemplatesDetailsExport");
});	  

function parse (response) {
    $.each(response, function (idx, elem) {   
    	   if(elem.activationDate=== null){
    		   elem.activationDate = "";
    	   }else{
    		   elem.activationDate = kendo.parseDate(new Date(elem.activationDate),'dd/MM/yyyy');
    	   }
       });
       
       return response;
}
var kycCompliant = "";
var SelectedRowId = "";
var SelectedGroupId = "";
var statusOwner="";
function onChangeOwner(arg) {
	 var gview = $("#gridPersonOwner").data("kendoGrid");
 	 var selectedItem = gview.dataItem(gview.select());
 	 SelectedRowId = selectedItem.personId;
 	 SelectedGroupId = selectedItem.drGroupId;
 	 statusOwner=selectedItem.personStatus;
 	 kycCompliant = selectedItem.kycCompliant;
 	 this.collapseRow(this.tbody.find(":not(tr.k-state-selected)"));
     //alert("Selected: " + SelectedRowId);
}

 function onExcelDocSuccess(e){
       var windowOwner = $("#fileupload").data("kendoWindow");
      	    windowOwner.close();
	 if (e.response.status == "cannotImport") {
			errorInfo = "";
			errorInfo = e.response.result.cannotImport;
			for (var i = 0; i < e.response.result.length; i++) {
				errorInfo += (i + 1) + ". "
						+ e.response.result[i].defaultMessage;
			}

			$("#alertsBox").html("");
			$("#alertsBox").html(errorInfo);
			$("#alertsBox").dialog({
				modal : true,
				draggable: false,
				resizable: false,
				buttons : {
					"Close" : function() {
						$(this).dialog("close");
					 	window.location.reload();
					}
				}
			});	
			
		  

		}
}
function errorRegardingUploadExcel(e){
	var windowOwner = $("#fileupload").data("kendoWindow");
	    windowOwner.close();

	
			var errorInfo="Uploaded file does not contain valid data";
			$("#alertsBox").html("");
			$("#alertsBox").html(errorInfo);
			$("#alertsBox").dialog({
				modal : true,
				draggable: false,
				resizable: false,
				buttons : {
					"Close" : function() {
						$(this).dialog("close");
					 	window.location.reload();
					}
				}
			});	
		 
} 

	
function onSelectupload(e){
	
	$.each(e.files, function (index, value) {			
        var ok = (value.extension == ".xlsx" || value.extension == ".xls") ;
        if (!ok) {
            e.preventDefault();
            alert("Please upload XL (.xlsx OR .xls) files");
        }
    });

}



    </script>
 <script type="text/javascript">
 
 $("#grid").on("click", ".k-grid-Import", function() 
		 {
				$('#uploadDialog').dialog({
					modal : true,
				}); 
		 });
			
 var flag = "";
 
 function clearList()
	{
		 $("#alertsBox").html("");
			$("#alertsBox").html("Uploaded Successfully");
			$("#alertsBox").dialog
			({
				modal : true,
				buttons : 
				{
					"Close" : function() 
					{
						$(this).dialog("close");
					}
				}
			});
		 $(".k-upload-status").remove();
	     $(".k-upload-files.k-reset").find("li").remove();
	     $(".k-upload-status k-upload-status-total").text("");
 }
   </script>

<%-- <div id="uploadDialog2" title="Upload Image" style="display: none;">
	<kendo:upload complete="oncomplete" name="files" upload="onpersonImageUpload"
									multiple="false">
				<kendo:upload-async autoUpload="true" saveUrl="${personImage}" />
	</kendo:upload>
</div>
 --%>
 
 <div id="dialogBoxforContacts" title="Associated Contacts"></div>
<!-- ------------------------------------------ Person Script  ------------------------------------------ -->

	<script type="text/javascript">
	
	var SelectedPersonStyleOwner = "Select";
	var dobArray = [];
	var resContact = [];
	
	$( document ).ready(function() {
		$('.k-grid-add').hide();

		$("#propertyFilters").kendoComboBox({
			autoBind : false,
			dataTextField : "property_No",
			dataValueField : "personName",
			placeholder : "Search by Property No",
			dataSource : {
				transport : {
					read : {
						url : "./property/getAllproperty",
					}
				}
			}
		});
		
		

		$("#propertyFilters").change(function() {
		
			applyFilter("personName", $(this).val());
		});
		

	});
	
	
	
	

	
	

	function applyFilter(filterField, filterValue) {

		
		var gridData = $("#gridPersonOwner").data("kendoGrid");
		var currFilterObj = gridData.dataSource.filter();
		var currentFilters = currFilterObj ? currFilterObj.filters
				: [];
		if (currentFilters && currentFilters.length > 0) {
			for (var i = 0; i < currentFilters.length; i++) {
				if (currentFilters[i].field == filterField) {
					currentFilters.splice(i, 1);
					break;
				}
			}
		}
		if (filterValue != "0") {
			currentFilters.push({
				field : filterField,
				operator : "contains",
				value : filterValue
			});
		}
		gridData.dataSource.filter({
			logic : "and",
			filters : currentFilters
		});

	}






  	$(".k-grid-toolbar").delegate(".k-grid-add", "click", function(e) {
	    e.preventDefault();
	    grid.addRow();
	}); 
 
	/* $("#gridPersonOwner").on("click", ".k-grid-Clear_Filter", function() {
		$("form.k-filter-menu button[type='reset']").slice().trigger("click");
		var gridPerson = $("#gridPersonOwner").data("kendoGrid");
		gridPerson.dataSource.read();
		gridPerson.refresh();
	}); */
	
	function clearFilterOwner()
	{

		$("#propertyFilters").data("kendoComboBox").value("");
				applyFilter("personName","");
		  $("form.k-filter-menu button[type='reset']").slice().trigger("click");
		  var gridPersonOwner = $("#gridPersonOwner").data("kendoGrid");
		  gridPersonOwner.dataSource.read();
		  gridPersonOwner.refresh();
	}
	
	
	function addExtensionClass(extension) {
		switch (extension) {
		case '.jpg':
		case '.img':
		case '.png':
		case '.gif':
			return "img-file";
		case '.doc':
		case '.docx':
			return "doc-file";
		case '.xls':
		case '.xlsx':
			return "xls-file";
		case '.pdf':
			return "pdf-file";
		case '.zip':
		case '.rar':
			return "zip-file";
		default:
			return "default-file";
		}
	}
	
	
	 $("#gridPersonOwner").on("click", ".k-grid-add", function(e) { 
	     	
	/* 	 if($("#gridPersonOwner").data("kendoGrid").dataSource.filter()){
				
	    		$("form.k-filter-menu button[type='reset']").slice().trigger("click");
	 			var grid = $("#gridPersonOwner").data("kendoGrid");
	 			grid.dataSource.read();
	 			grid.refresh();
	        }    */
	 });
	
	 function categoriesChangeOwner() {	
		 var value = this.value();

		 if (value != "Select") {
	    	 $('.k-grid-add').show();
	     } else {
	    	$('.k-grid-add').hide();
	     }
		 SelectedPersonStyleOwner = value;
	}
	 
	 function onRequestStart(e){
			$('.k-grid-update').hide();
			$('.k-edit-buttons')
					.append(
							'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please Wait....&nbsp;&nbsp;&nbsp;&nbsp;');
			$('.k-grid-cancel').hide();
	}
	 
	 
	 function onRequestStartAddress(e){
			$('.k-grid-update').hide();
			$('.k-edit-buttons')
					.append(
							'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please Wait....&nbsp;&nbsp;&nbsp;&nbsp;');
			$('.k-grid-cancel').hide();
	}
	 function onRequestStartContact(e){
			$('.k-grid-update').hide();
			$('.k-edit-buttons')
					.append(
							'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please Wait....&nbsp;&nbsp;&nbsp;&nbsp;');
			$('.k-grid-cancel').hide();
	}
	 function AccessCardsResquestStart(e){
			$('.k-grid-update').hide();
			$('.k-edit-buttons')
					.append(
							'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please Wait....&nbsp;&nbsp;&nbsp;&nbsp;');
			$('.k-grid-cancel').hide();
	}
	 function AccessCardsPermissionsRequestStart(e){
			$('.k-grid-update').hide();
			$('.k-edit-buttons')
					.append(
							'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please Wait....&nbsp;&nbsp;&nbsp;&nbsp;');
			$('.k-grid-cancel').hide();
	}
	 function DocumentsRequestStart(e){
			$('.k-grid-update').hide();
			$('.k-edit-buttons')
					.append(
							'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please Wait....&nbsp;&nbsp;&nbsp;&nbsp;');
			$('.k-grid-cancel').hide();
	}
	 
	function personEventOwner(e)
	{
		var style = "";
		
		$('label[for="image"]').parent().remove();
		$('div[data-container-for="image"]').remove();
		$('label[for="personName"]').parent().remove();
		$('div[data-container-for="personName"]').remove();
		$('label[for="age"]').parent().remove();
		$('div[data-container-for="age"]').remove();
		
		$('div[data-container-for="personStatus"]').remove();
		$('label[for="personStatus"]').parent().remove();
		
		if (e.model.isNew()) 
	    {
			/* var addUrl = "./commanagement/owner/createButton";
			var gridName = "#gridPersonOwner";
			addAccess(addUrl, gridName); */
			
			securityCheckForActions("./commanagement/owner/createButton");
			
			
			
			style = SelectedPersonStyleOwner;
			
			$(".k-grid-update").text("Save");
			
			if(SelectedPersonStyleOwner == "Individual")
			{
				$(".k-window-title").text("Add New Owner Record as an "+SelectedPersonStyleOwner);
				
 				$(".k-edit-form-container").css({"width" : "750px"});
				$(".k-window").css({"left": "275px", "top" : "150px"});
				$('.k-edit-label:nth-child(16n+1)').each(function(e) {
							$(this).nextAll(':lt(15)').addBack().wrapAll(
									'<div class="wrappers"/>');
						}); 
				$('label[for="firstName"]').text("First Name *");

				/* $(".k-window").css({"position" : "fixed"}); */

			/* 	$(".k-window").css({"position" : "fixed"}); */

				$(".wrappers").css({"display":"inline","float":"left","width":"350px","padding-top":"10px"}); 
				
			}
			else
			{
				$(".k-window-title").text("Add New Owner Record as a "+SelectedPersonStyleOwner);
				
				$('label[for="firstName"]').text(SelectedPersonStyleOwner+" Name *");
				loadFieldsBasedOnPersonStyle(SelectedPersonStyleOwner);
				
				var grid = $("#gridPersonOwner").data().kendoGrid.dataSource.data()[0];
			    grid.set('personStyle', SelectedPersonStyleOwner);
				
			}	
			
			$('label[for="spouseName"]').hide();
			$('div[data-container-for="spouseName"]').hide();
			
			
	    }
		else
		{
			/* var editUrl = "./commanagement/owner/updateButton";
			var gridName = "#gridPersonOwner";
			editAccess(editUrl, gridName); */
			
			securityCheckForActions("./commanagement/owner/updateButton");
			
			var personStyle =  $("select[name=personStyle] :selected").val();
			
			style = personStyle;
			
			$(".k-window-title").text("Edit "+personStyle+" details of the Owner");
			
			if(personStyle == "Individual")
			{
				$(".k-edit-form-container").css({"width" : "750px"});
				$(".k-window").css({"left": "275px", "top" : "150px"});
				$('.k-edit-label:nth-child(16n+1)').each(function(e) {
							$(this).nextAll(':lt(15)').addBack().wrapAll(
									'<div class="wrappers"/>');
						}); 

				/* $(".k-window").css({

			/* 	$(".k-window").css({

					"position" : "fixed"
				}); */
				$(".wrappers").css({"display":"inline","float":"left","width":"350px","padding-top":"10px"}); 
				$('label[for="firstName"]').text("First Name *");
			}
			else
			{
				$('label[for="firstName"]').text(personStyle+" Name *");
				loadFieldsBasedOnPersonStyle(personStyle);
			}	
			
		 	if((e.model.maritalStatus == "Single") || (e.model.maritalStatus == "None"))
		 	{
		 		$('label[for="spouseName"]').hide();
				$('div[data-container-for="spouseName"]').hide();
		 	}	
		 	else
		 	{
		 		$('label[for="spouseName"]').show();
				$('div[data-container-for="spouseName"]').show();
		 	}	
		}
		
		$('label[for="personStyle"]').parent().remove();
		$('div[data-container-for="personStyle"]').remove();
		
		$(".k-edit-field").each(function () {
			$(this).find("#temPID").parent().remove();
	   	});
		
		$('.k-edit-field .k-input').first().focus();
		
		/* var grid = this;
		e.container.on("keydown", function(e) {        
	        if (e.keyCode == kendo.keys.ENTER) {
	          $(document.activeElement).blur();
	          grid.saveRow();
	        }
	      }); */
		
		//CLIENT SIDE VALIDATION 
		
 		$(".k-grid-update").click(function () 
		{
			//var field = $('#gridPersonOwner').data().kendoGrid.dataSource.data()[0];
			
			var firstName = $("#firstName").val();
			
			if(style == "Individual")
			{
				var lastName = $('input[name="lastName"]').val();
				var fatherName = $('input[name="fatherName"]').val();
				var dob = $('input[name="dob"]').val();
				
				var maritalStatus = $("select[data-bind='value:maritalStatus'] :selected").val();
				
				var occupation = $("select[data-bind='value:occupation'] :selected").val();
				
				   if((firstName == null) || (firstName == ""))
			       {
			    	   alert("First name cannot be empty");
			     	   return false;
			       } 
				   var firstNameReg = /^[a-zA-Z ]{0,100}$/;
			       if(!firstNameReg.test(firstName)) {
			    	   alert("Only alphabets and maximum 100 letters are allowed for First name");
			    	   return false;
			       }
			       
			      if((lastName == null) || (lastName == ""))
			       {
			    	   alert("Last name cannot be empty");
			    	   return false;
			       } 
	
			   if((fatherName == null) || (fatherName == ""))
			       {
			    	   alert("Father name cannot be empty");
			    	   return false;
			       }
			      /*  if((dob == null) || (dob == "") )
			       {
			            alert("Date of birth is not selected");
			            return false;        
			       }  	 */		       
			       
			       if((maritalStatus == "None") || (maritalStatus == "Single"))
			       {
			    	   $('input[name="spouseName"]').val("").change();
			       }	   
			       
					var occupationReg = /^[a-zA-Z ]{0,45}$/;
				    if(!occupationReg.test(occupation)) {
				    	alert("Only characters and maximum 45 letters are allowed for Occupation");
				    	return false;
				    }
			}
			else
			{
				   if((firstName == null) || (firstName == ""))
			       {
			     		alert(style+" name cannot be empty");
				    	return false;
			       }
			       
			       else if((firstName.trim()) == "")
			       {
			    	   alert(style+" name cannot contain only spaces");
				       return false;
			       }
			       
			       else if(firstName.length > 150) 
			       {
			    		alert("Maximum 150 letters are allowed for "+style+" name");
			    	    return false;
			       }
			}	
		}); 
		
 		
	}
	
	function loadFieldsBasedOnPersonStyle(personStyleCheck)
	{	
			
		if (personStyleCheck != "Individual") 
		{			
			$('label[for="title"]').parent().remove();
			$('div[data-container-for="title"]').remove();
			$('label[for="middleName"]').parent().remove();
			$('div[data-container-for="middleName"]').remove();
			$('label[for="lastName"]').parent().remove();
			$('div[data-container-for="lastName"]').remove();
			$('label[for="fatherName"]').parent().remove();
			$('div[data-container-for="fatherName"]').remove();
			$('label[for="spouseName"]').parent().remove();
			$('div[data-container-for="spouseName"]').remove();
			$('label[for="dob"]').parent().remove();
			$('div[data-container-for="dob"]').remove();
			$('label[for="occupation"]').parent().remove();
			$('div[data-container-for="occupation"]').remove();
			$('label[for="languagesKnown"]').parent().remove();
			$('div[data-container-for="languagesKnown"]').remove();
			
			$('label[for="maritalStatus"]').parent().remove();
			$('div[data-container-for="maritalStatus"]').remove();
			$('label[for="sex"]').parent().remove();
			$('div[data-container-for="sex"]').remove();
			$('label[for="age"]').parent().remove();
			$('div[data-container-for="age"]').remove();
			$('label[for="nationality"]').parent().remove();
			$('div[data-container-for="nationality"]').remove();
			$('label[for="bloodGroup"]').parent().remove();
			$('div[data-container-for="bloodGroup"]').remove();
			$('label[for="workNature"]').parent().remove();
			$('div[data-container-for="workNature"]').remove();
			
			/* $('input[name="lastName"]').prop('required',false);
			$('input[name="fatherName"]').prop('required',false);
			$('input[name="dob"]').prop('required',false); */
				
		}	
	}
	
/* 	$("#gridPersonOwner").on("click", ".k-grid-add", function() {

		if($("#gridPersonOwner").data("kendoGrid").dataSource.filter()){
		      //$("#grid").data("kendoGrid").dataSource.filter({});
			$("form.k-filter-menu button[type='reset']").slice().trigger("click");
			var gridPerson = $("#gridPersonOwner").data("kendoGrid");
			gridPerson.dataSource.read();
			gridPerson.refresh();
		}
		
	}); */
 
		//register custom validation rules
		(function($, kendo) {
			$
					.extend(
							true,
							kendo.ui.validator,
							{
								rules : { // custom rules          	
									middleNamevalidation : function(input,
											params) {
										if (input.filter("[name='middleName']").length
												&& input.val()) {
											return /^[a-zA-Z ]{0,45}$/
													.test(input.val());
										}
										return true;
									},
									middleNameSpacesvalidation : function(input,
											params) {
										if (input.filter("[name='middleName']").length
												&& input.val()) {
											if(input.val().trim() == "")
											{
												return false;
											}	
										}
										return true;
									},
									lastNamevalidation : function(input, params) {
										if (input.filter("[name='lastName']").length
												&& input.val()) {
											return /^[a-zA-Z ]{0,45}$/
													.test(input.val());
										}
										return true;
									},
									lastNameSpacesvalidation : function(input,
											params) {
										if (input.filter("[name='lastName']").length
												&& input.val()) {
											if(input.val().trim() == "")
											{
												return false;
											}	
										}
										return true;
									},
									fatherNamevalidation : function(input,
											params) {
										if (input.filter("[name='fatherName']").length
												&& input.val()) {
											return /^[a-zA-Z ]{0,45}$/
													.test(input.val());
										}
										return true;
									},
									fatherNameSpacesvalidation : function(input,
											params) {
										if (input.filter("[name='fatherName']").length
												&& input.val()) {
											if(input.val().trim() == "")
											{
												return false;
											}	
										}
										return true;
									},
									spouseNamevalidation : function(input,
											params) {
										if (input.filter("[name='spouseName']").length
												&& input.val()) {
											return /^[a-zA-Z ]{0,45}$/
													.test(input.val());
										}
										return true;
									},
									spouseNameSpacesvalidation : function(input,
											params) {
										if (input.filter("[name='spouseName']").length
												&& input.val()) {
											if(input.val().trim() == "")
											{
												return false;
											}	
										}
										return true;
									},
									dob: function (input, params) 
						             {
					                     if (input.filter("[name = 'dob']").length && input.val()) 
					                     {                          
					                         var selectedDate = input.val();
					                         var todaysDate = $.datepicker.formatDate('dd/mm/yy', new Date());
					                         var flagDate = false;

					                         if ($.datepicker.parseDate('dd/mm/yy', selectedDate) < $.datepicker.parseDate('dd/mm/yy', todaysDate)) 
					                         {
					                                flagDate = true;
					                         }
					                         return flagDate;
					                     }
					                     return true;
					                 }        
								},
								messages : {
									//custom rules messages
									middleNamevalidation : "Only characters and maximum 45 letters are allowed",
									middleNameSpacesvalidation : "Middle name cannot contain only spaces",
									lastNamevalidation : "Only characters and maximum 45 letters are allowed",
									lastNameSpacesvalidation : "Last name cannot contain only spaces",
									fatherNamevalidation : "Only characters and maximum 45 letters are allowed",
									fatherNameSpacesvalidation : "Father name cannot contain only spaces",
									spouseNamevalidation : "Only characters and maximum 45 letters are allowed",
									spouseNameSpacesvalidation : "Spouse name cannot contain only spaces",
									dob:"Date of birth must be selected from the past"
								}
							});

		})(jQuery, kendo);
		//End Of Validation
		var kycCompliant = "";
		var SelectedRowId = "";
		var SelectedGroupId = "";
		function onChangeOwner(arg) {
			 var gview = $("#gridPersonOwner").data("kendoGrid");
		 	 var selectedItem = gview.dataItem(gview.select());
		 	 SelectedRowId = selectedItem.personId;
		 	SelectedGroupId = selectedItem.drGroupId;
		 	statusOwner=selectedItem.personStatus;
		 	 kycCompliant = selectedItem.kycCompliant;
		 	 this.collapseRow(this.tbody.find(":not(tr.k-state-selected)"));
		     //alert("Selected: " + SelectedRowId);
		}
		
		
/* 		function detailInitOwner(e) {
			alert("----------");
			
			var detailRow = e.detailRow;

		    detailRow.find(".tabstrip").kendoTabStrip({
		        animation: {
		            open: {
		                effects: "fadeIn"
		            }
		        }
		    });

		    //hook up to the click event of the tabs
		    detailRow.find(".k-item").click(function() {
		        alert("click");
		        $("#gridArmsOwner_111111111 .k-grid-header-wrap").css("overflow", "hidden");
		        $("#gridArmsOwner_111111111 .k-grid-content").css("overflow-y", "auto").css("overflow-x", "scroll").scroll(function() {
			 	    var left = $(this).scrollLeft();
			 	    var wrap = $("#gridArmsOwner_111111111 > .k-grid-header-wrap");
			 	    if (wrap.scrollLeft() != left) wrap.scrollLeft(left);
			 	
				});
		    });
			
			
		} */
		
		function firstNameEditorOwner(container, options) 
		{
			if (options.model.firstName == '') 
			{	
				var	autoCompleteDS = new kendo.data.DataSource({
			        transport: {
			            read: {
			                url     : "${personNamesAutoUrl}/"+SelectedPersonStyleOwner, // url to remote data source 
			                dataType: "json",
			                type    : 'GET'
			            }
			        },
			    });

					$('<input data-text-field="value" id="firstName" data-value-field="name" data-bind="value:' + options.field + '"/>')
							.appendTo(container)
							.kendoAutoComplete(
							{
								autoBind : false,
								dataTextField : "name",
								select : UserSelectedAuto,
								animation: {
									   close: {
									     effects: "fadeOut zoom:out",
									     duration: 300
									   }
						     	},
								placeholder : "Enter or select",
								headerTemplate : '<div class="dropdown-header">'
										+ '<span class="k-widget k-header">Photo</span>'
										+ '<span class="k-widget k-header">Contact info</span>'
										+ '</div>',
								template : '<table><tr><td rowspan=2><span class="k-state-default"><img src=\"<c:url value='/person/getpersonimage/#=data.personId#'/>" width=40 height=55 alt=\"No Image to Display\" /></span></td>'
										+ '<td align="center"><span class="k-state-default"><b>#: data.name #</b></span><br>'
										+ '<span class="k-state-default"><i>#: data.personStyle #</i></span><br>'
										+ '<span class="k-state-default"><i>#: data.personType #</i></span></td></tr></table>',
								dataSource    : autoCompleteDS	
							});
			}
			else
			{
				 $('<input type="text" class="k-input k-textbox"  id ="firstName" name=' + options.field + ' data-bind="value:' + options.field + '"/>')
			      .appendTo(container);
			}	
			
		 }

		function UserSelectedAuto(e) 
		{
			var dataItem = this.dataItem(e.item.index());
			var personId = dataItem.personId;
			var personStyle = dataItem.personStyle;
		
			var grid = $("#gridPersonOwner").data("kendoGrid");
			grid.cancelRow();
			$.ajax({
				type : "POST",
				url : "./person/getPersonDetails/"+personId+"/"+personStyle,
				success : function(response) {
					
					$("#personPopUp").html("");
					$("#personPopUp").html(response);
					$("#personPopUp").dialog
					({
						modal : true,
						width : 540,
						height: 375,
						
						buttons: [{ 
					          text: "Cancel", 
					          click: function() { 
					             $( this ).dialog( "close" ); 
					          }
					       }]
					});
				}
			});
		}
		
		function maritalStatusDropdownEditorOwner(container, options) 
		{
			$("<select data-bind='value:" + options.field + "'/>")
			.appendTo(container).kendoDropDownList({
				dataTextField : "text",
				dataValueField : "value",
				change : function (e) {
		            if((this.value() == "Single") || (this.value() == "None"))
		            {
		            	$('label[for="spouseName"]').hide();
						$('div[data-container-for="spouseName"]').hide();
		            }	
		            else
		            {
		            	$('label[for="spouseName"]').show();
						$('div[data-container-for="spouseName"]').show();
		            }	
			    }, 
				dataSource : {
					transport : {
						read : "${allChecksUrl}/"+options.field,
					}
				}
			});
			
		 }
		
		function saveExistingId(personId)
		 {
			 $('.ui-dialog').remove(); 
			 $.ajax({
					type : "POST",
					url : "./person/updateExistingPerson",
					data :
						{
						 personId : personId,
						 personType : "Owner",		
						},
						dataType:"text",
					success : function(response)
					{
						var text = response.search( 'already' );
					      if(parseInt(text) <= 0)
					      {
					       $('#gridPersonOwner').data().kendoGrid.dataSource.read();
					       
					      }
						
						$("#alertsBox").html("");
						$("#alertsBox").html(response);
						$("#alertsBox").dialog(
						{
							modal : true,
							buttons : 
							{
								"Close" : function() 
								{
									$(this).dialog("close");
								}
							}
						});
					}
				 });
		 }

		function dobDisplay(data) {
			if((data.dob == null) || (data.dob == ""))
			{
				return "";
			}	
			else
			{
				return kendo.toString(data.dob, 'dd/MM/yyyy');
			}	
		}
		
		function ageDisplay(data) {
			if((data.dob == null) || (data.dob == ""))
			{
				return "";
			}	
			else
			{
				return kendo.toString(new Date(), 'yyyy') - kendo.toString(data.dob, 'yyyy');
			}	
		}

		function parseOwner (response) { 
		    var data = response; //<--data might be in response.data!!!

			 for (var idx = 0, len = data.length; idx < len; idx ++) {
				/* var res1 = [];
				$.each(data[idx].languagesKnown, function(idx1, elem1) 
				{
					res1.push(elem1.text);
				});
				res1.join(",");
				data[idx].languagesKnown = res1.sort().toString(); */
				
				var res3 = [];
				//alert(data[idx].languagesKnown);
				var res4 =(data[idx].languagesKnown).split(',');
				if(res4.length > 1)
				{
					$.each(res4, function(idx1, elem1) 
							{
								res3.push(elem1);
							});
					data[idx].languagesKnown = res3.sort().toString();
				}	
				
				if((data[idx].dob) != null)
				{
					dobArray.push(data[idx].dob); 
				}	
			 }
			 return response;
		}
		
		/* function languagesEditorOwner(container, options) 
		{
			var model = options.model;
			model.languagesKnown = model.languagesKnownDummy;
			
			$("<select multiple='multiple' data-bind='value : "+options.field+"' style='width:150px; float:right'/> ")
					.appendTo(container).kendoMultiSelect({
						dataTextField : "text",
						dataValueField : "value",
						placeholder : "Select",
						dataSource : {
							transport : {
								read : "${allChecksUrl}/"+options.field,
							}
						}
					});
			
		} */
		
		function languagesEditorOwner(container, options) {
			
			var res = (container.selector).split("=");
			var attribute = res[1].substring(0,res[1].length-1);
			
			$("<input name='languagesKnown' data-bind='value : "+attribute+"'/>")
					.appendTo(container).kendoAutoComplete({
						dataTextField : "text",
						dataValueField : "value",
						filter: "startswith",
						separator: ",",
						dataSource : {
							transport : {
								read : "${allChecksUrl}/"+attribute,
							}
					
						}
					});
			
		}
		
		/* function languageDisplay(data) {
			var res = [];
			$.each(data, function(idx, elem) {
				if (idx == 'languagesKnown') {
					if (elem == '[object Object]') {
						$.each(elem, function(itr, getVal) {
							res.push(getVal.text);
						});
					} else {
						res.push(elem);
					}
				}
			});
			return res.join(", ");
		} */
		
		function comboBoxChecksEditorOwner(container, options) 
		{
			var res = (container.selector).split("=");
			var attribute = res[1].substring(0,res[1].length-1);
			
			$("<select data-bind='value:" + attribute + "'/>")
			        .appendTo(container).kendoComboBox({
			        		dataTextField : "text",
							dataValueField : "value",
							placeholder: "Enter or Select",
		                    dataSource: {  
		                        transport:{
		                            read: "${allChecksUrl}/"+attribute,
		                        }
		                    }
		                });
		}
		
		$("#gridPersonOwner").on("click", "#temPID", function(e) {
			var button = $(this), enable = button.text() == "Activate";
			var widget = $("#gridPersonOwner").data("kendoGrid");
			var dataItem = widget.dataItem($(e.currentTarget).closest("tr"));
			securityCheckForActions("./commanagement/owner/deleteButton");
			 {
						
						if (enable) 
						{
						
							$.ajax
							({
								type : "POST",
								url : "./person/personStatus/" + dataItem.id + "/activate/Owner",
								success : function(response) 
								{
									$("#alertsBox").html("");
									$("#alertsBox").html(response);
									$("#alertsBox").dialog
									({
										modal : true,
										buttons : 
										{
											"Close" : function() 
											{
												$(this).dialog("close");
											}
										}
									});
									button.text('Deactivate');
									$('#gridPersonOwner').data('kendoGrid').dataSource.read();
								}
							});
						} 
						else 
						{
							$.ajax
							({
								type : "POST",
								url : "./person/personStatus/" + dataItem.id + "/deactivate/Owner",
								success : function(response) 
								{
									$("#alertsBox").html("");
									$("#alertsBox").html(response);
									$("#alertsBox").dialog
									({
										modal : true,
										buttons : 
										{
											"Close" : function() 
											{
												$(this).dialog("close");
											}
										}
									});
									button.text('Activate');
									$('#gridPersonOwner').data('kendoGrid').dataSource.read();
								}
							});
						}
					 
				}

			});
		 
		
		function onRequestStartPersonOwner(e) 
		{
			
			
			
		/* 	$('.k-grid-update').hide();
			$('.k-edit-buttons')
					.append(
							'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please wait..&nbsp;&nbsp;&nbsp;&nbsp;');
			$('.k-grid-cancel').hide(); */
			var gridPerson = $("#gridPersonOwner").data("kendoGrid");
			if(gridPerson != null)
			{
				gridPerson.cancelRow();
			}	 
		}	
		
		function onRequestEndPersonOwner(e) 
		{
			displayMessage(e, "gridPersonOwner", "Owner");
			
			if (typeof e.response != 'undefined')
			{
		   		if (e.response.status == "cannotImport") {
					errorInfo = "";
					errorInfo = e.response.result.cannotImport;
					for (var i = 0; i < e.response.result.length; i++) {
						errorInfo += (i + 1) + ". "
								+ e.response.result[i].defaultMessage;
					}

					$("#alertsBox").html("");
					$("#alertsBox").html(errorInfo);
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
					var grid = $("#gridPersonOwner").data("kendoGrid");
					grid.dataSource.read();
					grid.refresh();
					return false;
				}
			}
			
		}	
		
	</script>
	
	<!-- ---------------------------------------------- Address script -------------------------------------- -->
	<script type="text/javascript">

		var seasonFromAddress = "";
		
		//register custom validation rules
		(function($, kendo) {
			$
					.extend(
							true,
							kendo.ui.validator,
							{
								rules : { // custom rules          	
									addressSeasonFrom: function (input, params) 
						             {
					                     if (input.filter("[name = 'addressSeasonFrom']").length && input.val() != "") 
					                     {                          
					                         var selectedDate = input.val();
					                         var todaysDate = $.datepicker.formatDate('dd/mm/yy', new Date());
					                         var flagDate = false;

					                         if ($.datepicker.parseDate('dd/mm/yy', selectedDate) > $.datepicker.parseDate('dd/mm/yy', todaysDate)) 
					                         {
					                        	 	seasonFromAddress = selectedDate;
					                                flagDate = true;
					                         }
					                         return flagDate;
					                     }
					                     return true;
					                 },
					                 addressSeasonTo1: function (input, params) 
						             {
					                     if (input.filter("[name = 'addressSeasonTo']").length && input.val() != "") 
					                     {                          
					                         var flagDate = false;

					                         if (seasonFromAddress != "") 
					                         {
					                                flagDate = true;
					                         }
					                         return flagDate;
					                     }
					                     return true;
					                 },
					                 addressSeasonTo2: function (input, params) 
						             {
					                     if (input.filter("[name = 'addressSeasonTo']").length && input.val() != "") 
					                     {                          
					                         var selectedDate = input.val();
					                         var flagDate = false;

					                         if ($.datepicker.parseDate('dd/mm/yy', selectedDate) > $.datepicker.parseDate('dd/mm/yy', seasonFromAddress)) 
					                         {
					                                flagDate = true;
					                         }
					                         return flagDate;
					                     }
					                     return true;
					                 },
					                 pincodeValidation : function(input,
												params) {
											if (input.filter("[name='pincode']").length
													&& input.val()) {
												return /^(\s*\d{6}\s*)$/
														.test(input.val());
											}
											return true;
										},
									statevalidation : function(input,
												params) {
											if (input.filter("[name='stateotherId']").length
													&& input.val()) {
												return /^[a-zA-Z ]{1,45}$/
														.test(input.val());
											}
											return true;
										},
									cityvalidation : function(input,
												params) {
											if (input.filter("[name='cityotherId']").length
													&& input.val()) {
												return /^[a-zA-Z ]{1,45}$/
														.test(input.val());
											}
											return true;
										},
										phoneContentValidation : function(input,
												params) {
											if (input.filter("[name='phoneContent']").length
													&& input.val()) {
												return /^[0-9]{1,45}$/
												.test(input.val());
											}
											return true;
										},
									phoneContentValidation : function(input,
													params) {
												if (input.filter("[name='phoneContent']").length
														&& input.val()) {
													return /^(\d{10})$/
													.test(input.val());
												}
												return true;
											}  , 
									mobileValidation : function(input,
													params) {
												//check for the name attribute 
												if (input
														.filter("[name='phoneContent']").length
														&& input.val()) {
													mobileNumber = input.val();
													$
															.each(
																	resContact,
																	function(ind, val) {
																		
																		if ((mobileNumber == val)
																				&& (mobileNumber.length == val.length)) {
																			flag = mobileNumber;
																		}
																	});
													return /^(\d{10})$/
															.test(input.val());
												}
												return true;
											},

									mobileUniqueness : function(input) {
												if (input
														.filter("[name='phoneContent']").length
														&& input.val() && flag != "") {
													flag = "";
													return false;
												}
												return true;
											},
									emailValidation : function(input,
													params) {
												//check for the name attribute 
												if (input
														.filter("[name='emailContent']").length
														&& input.val()) {
													emailId = input.val();
													$.each(resContact,
																	function(ind, val) {
																		if ((emailId == val)
																				&& (emailId.length == val.length)) {
																			flag = emailId;
																		}
																	});
													return /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/
															.test(input.val());
												}
												return true;
											},

									emailUniqueness : function(input) {
												if (input
														.filter("[name='emailContent']").length
														&& input.val() && flag != "") {
													flag = "";
													return false;
												}
												return true;
											} 
								},
								messages : {
									//custom rules messages
									addressSeasonFrom:"From must be selected in the future",
									addressSeasonTo1:"Select From date first before selecting To date and change To date accordingly",
									addressSeasonTo2:"To date should be after From date",
									/* pincodeValidation:"Invalid Pincode : Accepts Only 6 digit format", */
									phoneContentValidation:"Invalid mobile number, please enter numbers only",
									statevalidation:"Invalid state name, accepts only alphabets",
									cityvalidation:"Invalid city name, accepts only alphabets",
									mobileValidation : "Invalid mobile number, please enter 10 digit number",
									mobileUniqueness : "Mobile Number Already Exists",
									emailValidation : "Invalid Email Format",
									emailUniqueness : "Email Address Already Exists"
								}
							});

		})(jQuery, kendo);
		//End Of Validation
		
		function contactInfo()
		{
			var aId="";
			var gaddressview = $("#gridAddress_"+SelectedRowId).data("kendoGrid");
			var selectedAddressItem = gaddressview.dataItem(gaddressview.select());
			aId = selectedAddressItem.addressId;
			
			$.ajax({
				type : "POST",
				url : "./manpower/getContacts",
				dataType : "json",
				data : {
					addressId : aId,
				},
				success : function(response) {
			
         		 var contactList = "<table frame=box bgcolor=white width=450px><tr bgcolor=#0A7AC2>";
         		contactList = contactList +"<th><font color=white>Contact Type</font></th><th><font color=white>Contact Content</font></th><th><font color=white>Primary Contact?</font></th></tr>";
         		 
         		if(response.length>0)
         			{
         		 for ( var s = 0, len = response.length; s < len; ++s) {
                 	var contact = response[s];
                 	contactList += "<tr><td align=center>"+contact.contactType +"</td><td align=center>"+contact.contactContent+ "</td><td align=center>"+contact.contactPrimary+"</td></tr>";
             }
         			}
         		else{
         			contactList += "<tr><td>&nbsp;&nbsp;No items to display </td><td></td><td></td></tr>";
                    		
         		}
         		contactList = contactList +"</table>";
				 
				 //$("#contactDialogContent").text(contactList);
				 $('#dialogBoxforContacts').html("");
				 $('#dialogBoxforContacts').html(contactList);
				 $('#dialogBoxforContacts').dialog({
		             	width: 475,
		             	position: 'center',
						modal : true,
					}); 
				 
				
				}
			});
			return false;
		}
		
		function addressLocationEditor(container, options) {
			$('<input name="Address Location" data-bind="value:' + options.field + '" required="true"/>').appendTo(
					container).kendoDropDownList({
				dataTextField : "value",
				dataValueField : "name",
				dataSource : {
					transport : {
						read : "${addressLocationUrl}"
					}
				},
				optionLabel : {
					value : "Select",
					name : "",
				}
			});
			$('<span class="k-invalid-msg" data-for="Address Location"></span>').appendTo(container); 
		}

		function addressPrimaryEditor(container, options) {
			$('<input name="Address Primary" id="addressPrimary" data-bind="value:' + options.field + '" required="true"/>').appendTo(
					container).kendoDropDownList({
				dataTextField : "value",
				dataValueField : "name",
				dataSource : {
					transport : {
						read : "${addressPrimaryUrl}"
					}
				},
				optionLabel : {
					value : "Select",
					name : "",
				}
			});
			$('<span class="k-invalid-msg" data-for="Address Primary"></span>').appendTo(container); 
		}

		function countryEditor(container, options) {
			$(
					'<select name="Country Name" data-text-field="countryName" class="country" data-value-field="countryId" id="countryId" data-bind="value:' + options.field + '" requitred="true"/>')
					.appendTo(container).kendoDropDownList({
						autoBind : false,
						optionLabel : "Select",
						dataSource : {
							transport : {
								read : "${countryUrl}"
							}
						}
					});
			$('<span class="k-invalid-msg" data-for="Country Name"></span>').appendTo(container); 
		}

		$(document).on('change', 'select[class="country"]', function() {

			//alert($('.country:selected').text());

			var sal = $('.country option:selected').eq(0).text();

			if (sal == 'Other') {
				$('label[for="stateId"]').hide();
				$('div[data-container-for="stateId"]').hide();

				$('label[for="cityId"]').hide();
				$('div[data-container-for="cityId"]').hide();

				$('label[for="countryotherId"]').show();
				$('div[data-container-for="countryotherId"]').show();
				$('label[for="stateotherId"]').show();
				$('div[data-container-for="stateotherId"]').show();
				$('label[for="cityotherId"]').show();
				$('div[data-container-for="cityotherId"]').show();
			} else {
				$('label[for="stateId"]').show();
				$('div[data-container-for="stateId"]').show();

				$('label[for="cityId"]').show();
				$('div[data-container-for="cityId"]').show();

				$('label[for="countryotherId"]').hide();
				$('div[data-container-for="countryotherId"]').hide();
				$('label[for="stateotherId"]').hide();
				$('div[data-container-for="stateotherId"]').hide();
				$('label[for="cityotherId"]').hide();
				$('div[data-container-for="cityotherId"]').hide();
			}

		});

		function stateEditor(container, options) {
			$(
					'<select data-text-field="stateName" class = "state" id = "stateId" data-value-field="stateId" data-bind="value:' + options.field + '"/>')
					.appendTo(container).kendoDropDownList({
						cascadeFrom : "countryId",
						optionLabel : "Select",
						autoBind : false,
						dataSource : {
							transport : {
								read : "${stateUrl}"
							}
						}
					});
		}

		$(document).on('change', 'select[class="state"]', function() {

			//alert($('.country:selected').text());

			var sal = $('.state option:selected').eq(0).text();
			//alert(sal);
			if (sal == 'Other') {
				
				$('label[for="cityId"]').hide();
				$('div[data-container-for="cityId"]').hide();

				$('label[for="stateotherId"]').show();
				$('div[data-container-for="stateotherId"]').show();
				$('label[for="cityotherId"]').show();
				$('div[data-container-for="cityotherId"]').show();
				$('input[name="stateotherId"]').prop('required',true);
				$('input[name="cityotherId"]').prop('required',true);
			} else {
				$('label[for="cityId"]').show();
				$('div[data-container-for="cityId"]').show();
				$('input[name="stateotherId"]').prop('required',false);
				$('input[name="cityotherId"]').prop('required',false);
				$('label[for="stateotherId"]').hide();
				$('div[data-container-for="stateotherId"]').hide();
				$('label[for="cityotherId"]').hide();
				$('div[data-container-for="cityotherId"]').hide();
			}

		});

		function cityEditor(container, options) {

			$(
					'<select data-text-field="cityName" class = "city" data-value-field="cityId" data-bind="value:' + options.field + '"/>')
					.appendTo(container).kendoDropDownList({
						cascadeFrom : "stateId",
						optionLabel : "Select",
						autoBind : false,
						dataSource : {

							transport : {
								read : "${cityUrl}"
							},
						}
					});
		}

		$(document).on('change', 'select[class="city"]', function() {

			var sal = $('.city option:selected').eq(0).text();

			if (sal == 'Other') {

				$('label[for="cityotherId"]').show();
				$('div[data-container-for="cityotherId"]').show();
				$('input[name="cityotherId"]').prop('required',true);
			} else {
				$('input[name="cityotherId"]').prop('required',false);
				$('label[for="cityotherId"]').hide();
				$('div[data-container-for="cityotherId"]').hide();
			}

		});

		function addressSeasonEditor(container, options) {
			$('<input data-bind="value:' + options.field + '"/>').appendTo(
					container).kendoDropDownList({
				dataTextField : "value",
				dataValueField : "name",
				dataSource : {
					transport : {
						read : "${addressSeasonUrl}"
					}
				},
				optionLabel : {
					value : "Select",
					name : "",
				}
			});
		}

		function address1Editor(container, options) {
			$(
					'<textarea maxlength="500" name="Address" data-text-field="address1" data-value-field="address1" data-bind="value:' + options.field + '" style="width: 148px; height: 61px;" required="true"/>')
					.appendTo(container);
			$('<span class="k-invalid-msg" data-for="Address"></span>').appendTo(container); 
		}

		function address2Editor(container, options) {
			$(
					'<textarea  data-text-field="address2" data-value-field="address2" data-bind="value:' + options.field + '" style="width: 148px; height: 61px;"/>')
					.appendTo(container);
		}

		function address3Editor(container, options) {
			$(
					'<textarea data-text-field="address3" data-value-field="address3" data-bind="value:' + options.field + '" style="width: 148px; height: 61px;"/>')
					.appendTo(container);
		}

		$(document)
				.on(
						'change',
						'input[name="addressSeason"]',
						function() {

							var test = $('input:checked').length ? $(
									'input:checked').val() : '';

							if (test == "") {
								$('input[name="addressSeasonTo"]').prop('required',false);
								$('input[name="addressSeasonFrom"]').prop('required',false);
								$('label[for="addressSeasonFrom"]').hide();
								$('div[data-container-for="addressSeasonFrom"]')
										.hide();

								$('label[for="addressSeasonTo"]').hide();
								$('div[data-container-for="addressSeasonTo"]')
										.hide();
							}
							if (test == "on") {
								$('label[for="addressSeasonFrom"]').show();
								$('div[data-container-for="addressSeasonFrom"]')
										.show();

								$('label[for="addressSeasonTo"]').show();
								$('div[data-container-for="addressSeasonTo"]')
										.show();
								$('input[name="addressSeasonTo"]').prop('required',true);
								$('input[name="addressSeasonFrom"]').prop('required',true);
							}

						});


		function onRequestEndAddress(e) {
			/* debugger; */

			if (typeof e.response != 'undefined') {
				if (e.response.status == "FAIL") {

					errorInfo = "";
					var s;
					for (s = 0; s < e.response.result.length; s++) {
						errorInfo += (s + 1) + ". "
								+ e.response.result[s].defaultMessage + "<br>";

					}

					if (e.type == "create") {
						$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});

						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Creating the Staff record<br>"
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

					if (e.type == "update") {
						$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Updating the Staff record<br>"
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

					return false;
				}

				else if (e.response.status == "INVALID") {

					errorInfo = "";

					errorInfo = e.response.result.invalid;

					if (e.type == "create") {
						$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Creating the Staff record<br>"
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

					return false;
				}

				else if (e.response.status == "EXCEPTION") {

					errorInfo = "";

					errorInfo = e.response.result.exception;

					if (e.type == "create") {
						$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Creating the Staff record<br>"
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

					if (e.type == "update") {
						$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Updating the Staff record<br>"
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

					return false;
				}
				else if (e.response.status == "PRIMARY") {

					errorInfo = "";
					var s;
					for (s = 0; s < e.response.result.length; s++) {
						errorInfo += (s + 1) + ". "
								+ e.response.result[s].defaultMessage + "<br>";

					}

					if (e.type == "create") {
						$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});

						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Primary address is already exists<br>"
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

					if (e.type == "update") {
						$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Primary Address is already exists<br>"
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

					return false;
				}

				else if (e.type == "create") {

					$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
							.read({
								personId : SelectedRowId
							});
					$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
					.read({
						personId : SelectedRowId
					});
					$("#alertsBox").html("");
					$("#alertsBox").html("Address Record created successfully");
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});
				}

				else if (e.type == "update") {
					$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
							.read({
								personId : SelectedRowId
							});
					$("#alertsBox").html("");
					$("#alertsBox").html("Address Record updated successfully");
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});

				}
				else if (e.type == "destroy") {
					$('#gridAddress_' + SelectedRowId).data().kendoGrid.dataSource
							.read({
								personId : SelectedRowId
							});
					$("#alertsBox").html("");
					$("#alertsBox").html("Address Record deleted successfully");
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});
					
					

				}
				else if (e.response.status == "DELETE") {
					$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
					.read({
						personId : SelectedRowId
					});
				}

			}

		}

		function addressEvent(e)
		{

			//$("#mobile-number").intlTelInput();
			$('div[data-container-for="addressSeasonTo"]').css("padding-top","30px");
			$('label[for="addressSeasonTo"]').closest('div').css("padding-top","30px");
			if (e.model.isNew()) 
		    {
				/* var addUrl="./commanagement/owneraddress/createButton";
				var gridName ="#gridAddress_"+SelectedRowId;
				addAccess(addUrl,gridName); */
				
				securityCheckForActions("./commanagement/owneraddress/createButton");
				
				$(".k-window-title").text("Add New Address");
				$(".k-grid-update").text("Save");	
				$('label[for="countryName"]').closest('.k-edit-label').remove();
				$('div[data-container-for="countryName"]').remove();

				$('label[for="countryName"]').closest('.k-edit-label').remove();
				$('div[data-container-for="countryName"]').remove();
				
				$('label[for="stateName"]').closest('.k-edit-label').remove();
				$('div[data-container-for="stateName"]').remove();

				$('label[for="cityName"]').closest('.k-edit-label').remove();
				$('div[data-container-for="cityName"]').remove();

				$('label[for="address"]').closest('.k-edit-label').remove();
				$('div[data-container-for="address"]').remove();
				
				$('label[for="addressSeasonFrom"]').hide();
				$('div[data-container-for="addressSeasonFrom"]').hide();

				
				$('label[for="addressSeasonTo"]').hide();
				$('div[data-container-for="addressSeasonTo"]').hide();
				$('label[for="countryotherId"]').hide();
				$('div[data-container-for="countryotherId"]')
						.hide();
				$('label[for="stateotherId"]').hide();
				$('div[data-container-for="stateotherId"]').hide();
				$('label[for="cityotherId"]').hide();
				$('div[data-container-for="cityotherId"]').hide();
				
				$(".k-edit-form-container").css({
					"width" : "570px"
				});
				 $(".k-window").css({
					"top" : "150px" 
				}); 
				$('.k-edit-label:nth-child(12n+1)').each(
						function(e) {
							$(this).nextAll(':lt(11)').addBack().wrapAll(
									'<div class="wrappers"/>');
						});
				 /* $(".k-window").css({"position" : "fixed"});  */
				
				$(".wrappers").css({"display":"inline","float":"left","width":"250px","padding-top":"10px","position":"relative"}); 
				
				

				$.ajax({
					type : "GET",
					url : './contact/getAllContactContent',
					dataType : "JSON",
					success : function(response) {
						$.each(response, function(index, value) {
							resContact.push(value);
						});
					}
				}); 
			 	
				/* $.ajax({
					type : "GET",
					url : '/contact/getAllContactContent',
					dataType : "JSON",
					success : function(response) {
						$.each(response, function(index, value) {
							resEmail.push(value);
						});
					}
				});  */
				
				var addressGrid = $("#gridAddress_"+SelectedRowId).data("kendoGrid");
				var addressGriddata = addressGrid.dataSource.data();
				for (var i = 0; i < addressGriddata.length; i++)
				{
					//alert(addressGriddata[i].addressPrimary);
					if (addressGriddata[i].addressPrimary == "Yes") 
					{
						YesExists = 1;
						alert("Primary Address is already Exists, this address will be your secondary address");
						var dropdownlist = $("#addressPrimary").data("kendoDropDownList");
						dropdownlist.search('Yes');
						dropdownlist.readonly();
						var addressPrimary = $("#gridAddress_"+SelectedRowId).data().kendoGrid.dataSource.data()[0];
						addressPrimary.set('addressPrimary', 'No');
					} 
				}
				
				
			} else {
				
				/* var editUrl="./commanagement/owneraddress/updateButton";
				var gridName ="#gridAddress_"+SelectedRowId;
				editAccess(editUrl,gridName); */
				
				securityCheckForActions("./commanagement/owneraddress/updateButton");
				
				
				$(".k-window-title").text("Edit Address Details");
				$('.k-edit-field .k-input').first().focus();
				$('label[for="countryName"]').closest('.k-edit-label').remove();
				$('div[data-container-for="countryName"]').remove();
				
				$('label[for="emailContent"]').closest('.k-edit-label').remove();
				$('div[data-container-for="emailContent"]').remove();
				
				$('label[for="phoneContent"]').closest('.k-edit-label').remove();
				$('div[data-container-for="phoneContent"]').remove();

				$('label[for="stateName"]').closest('.k-edit-label').remove();
				$('div[data-container-for="stateName"]').remove();

				$('label[for="cityName"]').closest('.k-edit-label').remove();
				$('div[data-container-for="cityName"]').remove();

				$('label[for="address"]').closest('.k-edit-label').remove();
				$('div[data-container-for="address"]').remove();

				$('label[for="countryotherId"]').hide();
				$('div[data-container-for="countryotherId"]').hide();
				$('label[for="stateotherId"]').hide();
				$('div[data-container-for="stateotherId"]').hide();
				$('label[for="cityotherId"]').hide();
				$('div[data-container-for="cityotherId"]').hide();
				$(".k-edit-form-container").css({
					"width" : "570px"
				});
				$(".k-window").css({
					"top" : "150px"
				});
				$('.k-edit-label:nth-child(12n+1)').each(
						function(e) {
							$(this).nextAll(':lt(11)').addBack().wrapAll(
									'<div class="wrappers"/>');
						});
				/*  $(".k-window").css({"position" : "fixed"});  */
				$(".wrappers").css({"display":"inline","float":"left","width":"250px","padding-top":"10px","position":"relative"}); 
				
				var test = $('input:checked').length ? $(
				'input:checked').val() : '';

		if (test == "") {
			$('input[name="addressSeasonTo"]').prop('required',false);
			$('input[name="addressSeasonFrom"]').prop('required',false);
			$('label[for="addressSeasonFrom"]').hide();
			$('div[data-container-for="addressSeasonFrom"]')
					.hide();

			$('label[for="addressSeasonTo"]').hide();
			$('div[data-container-for="addressSeasonTo"]')
					.hide();
		}
		if (test == "on") {
			$('label[for="addressSeasonFrom"]').show();
			$('div[data-container-for="addressSeasonFrom"]')
					.show();

			$('label[for="addressSeasonTo"]').show();
			$('div[data-container-for="addressSeasonTo"]')
					.show();
			$('input[name="addressSeasonTo"]').prop('required',true);
			$('input[name="addressSeasonFrom"]').prop('required',true);
		}
				
				
			}
			
			$(".k-grid-update").click(function () 
					{
						var countrySelect = $('select[data-text-field="countryName"] :selected').text();
						var stateSelect = $('select[data-text-field="stateName"] :selected').text();	
						var citySelect = $('select[data-text-field="cityName"] :selected').text();
						
							
						var cityText = $('input[name="cityotherId"]').val();
						
						var str = "Please Select \n";
						
						 if(countrySelect === "" || countrySelect === "Select"){
							str = str + "    - Country\n";
						 }
						 
						 if(stateSelect === "" || stateSelect === "Select"){
							str = str + "    - State\n";
						  }
						
						if((citySelect === "" || citySelect === "Select") && cityText == ""){
							str = str + "    - City"	;
							alert(str);
								  return false;
							  }
						}); 
			
		}
		
		function removeAddress(){
			securityCheckForActions("./commanagement/owneraddress/deleteButton");
		}
		function removeContact(){
			securityCheckForActions("./commanagement/ownercontact/deleteButton");
		}
		
		function removeProperty(){
			securityCheckForActions("./commanagement/ownerproperty/deleteButton");
		}
	</script>

	<!-- --------------------------------------- Contact script ---------------------------------------- -->
	<script type="text/javascript">

		var contactCont = "";
		function contactEvent(e) {
			$('div[data-container-for="contactSeasonTo"]').css("padding-top","30px");
			$('label[for="contactSeasonTo"]').closest('div').css("padding-top","30px");
			var addOrEdit = 0;
			$.ajax({
				type : "GET",
				url : './contact/getAllContactContent',
				dataType : "JSON",
				success : function(response) {
					$.each(response, function(index, value) {
						resContact.push(value);
					});
				}
			}); 
			if (e.model.isNew()) {
				
				addOrEdit = 1;
				
				/* var addUrl = "./commanagement/ownercontact/createButton";
				var gridName = "#gridContact_" + SelectedRowId;
				addAccess(addUrl, gridName); */
				
				securityCheckForActions("./commanagement/ownercontact/createButton");

				$(".k-window-title").text("Add New Contact");
				$(".k-grid-update").text("Save");
				$('.k-edit-field .k-input').first().focus();
				$('label[for="contactSeasonFrom"]').hide();
				$('div[data-container-for="contactSeasonFrom"]').hide();

				$('label[for="contactSeasonTo"]').hide();
				$('div[data-container-for="contactSeasonTo"]').hide();

				$('label[for="address"]').closest('.k-edit-label').remove();
				$('div[data-container-for="address"]').remove();
						
				
				

			} else {

				
						
			if(statusOwner=="Active"){
			  alert("You can't edit Contact Content once the Owner is activated");
			  $('input[name="contactContent"]').prop('readonly',true); 
		     }

					
				addOrEdit = 0;
				contactCont = $('input[name="contactContent"]').val();

				/* var editUrl = "./commanagement/ownercontact/updateButton";
				var gridName = "#gridContact_" + SelectedRowId;
				editAccess(editUrl, gridName); */
				
				securityCheckForActions("./commanagement/ownercontact/updateButton");
				
				$(".k-window-title").text("Edit Contact Details");
				$('.k-edit-field .k-input').first().focus();

				var test = $('input:checked').length ? $('input:checked').val()
						: '';

				if (test == "") {

					$('input[name="contactSeasonTo"]').prop('required', false);
					$('input[name="contactSeasonFrom"]')
							.prop('required', false);

					$('label[for="contactSeasonFrom"]').hide();
					$('div[data-container-for="contactSeasonFrom"]').hide();

					$('label[for="contactSeasonTo"]').hide();
					$('div[data-container-for="contactSeasonTo"]').hide();
				}
				if (test == "on") {
					$('label[for="contactSeasonFrom"]').show();
					$('div[data-container-for="contactSeasonFrom"]').show();

					$('label[for="contactSeasonTo"]').show();
					$('div[data-container-for="contactSeasonTo"]').show();

					$('input[name="contactSeasonTo"]').prop('required', true);
					$('input[name="contactSeasonFrom"]').prop('required', true);
				}

			}
			
			$(".k-grid-update").click(function () 
					{
						var contactType = $('select[class="contactType"] :selected').text();
						var contactContent = $('input[name="contactContent"]').val();
						var contactPrimaryStatus = $('select[id="contactPrimary"] :selected').text();
						if(addOrEdit === 1){
						var contactGrid = $("#gridContact_"+SelectedRowId).data("kendoGrid");
						var contactGriddata = contactGrid.dataSource.data();
						for (var i = 1; i < contactGriddata.length; i++)
						{
							if (contactGriddata[i].contactPrimary == "Yes" && contactGriddata[i].contactType == contactType && contactPrimaryStatus == 'Yes') 
							{
								YesExists = 1;
								alert("  Primary Contact is already Exists for "+contactType+"\n\nThis "+contactType+" contact will be your secondary contact");
								var dropdownlist = $("#contactPrimary").data("kendoDropDownList");
								dropdownlist.search('Yes');
								//dropdownlist.readonly();
								var contactPrimary = $("#gridContact_"+SelectedRowId).data().kendoGrid.dataSource.data()[0];
								contactPrimary.set('contactPrimary', 'No');
							} 
						}
						}
					
						if(!$.isNumeric(contactContent) && ((contactType ==='Mobile') ||(contactType ==='HomePhone') ||(contactType ==='Intercom'))){
								alert("Please enter valid "+contactType+" Number");
								return false;
						}
							  
						if($.isNumeric(contactContent) && (contactType ==='Mobile') && contactContent.length != 10 ){
								alert("Please enter valid 10 digit "+contactType+" Number");
								return false;
						}
							  
						var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
						if( !emailReg.test(contactContent) && contactType ==='Email') {
							    alert("Please enter valid Email Address");
								return false;
						} 
					}); 
			
			$('input[name="contactPrefferedTime"]').keyup(function() {
				$('input[name="contactPrefferedTime"]').val("");
			});
				}

		$(document).on('change', 'select[class="contactType"]', function() {
			var content = $('.contactType option:selected').eq(0).text();
			$('label[for="contactContent"]').text(content);

			/* if(content == 'Mobile'){
				$('input[name="contactContent"]').prop('type','tel');
				$('input[name="contactContent"]').prop('id','mobile-number');
				$('input[name="contactContent"]').prop('placeholder','e.g. +1 702 123 4567');
				$("#mobile-number").intlTelInput();
			}
			else{
				$('input[name="contactContent"]').prop('type','text');
				$('input[name="contactContent"]').prop('id','dummy');
				$('input[name="contactContent"]').prop('placeholder','');
				$('.intl-tel-input').removeClass('intl-tel-input').addClass('new_class');
				$('input[name="contactContent"]').val(' ');
				$('.flag-dropdown').remove();
			} */
		});

		var seasonFromContact = "";

		//register custom validation rules
		(function($, kendo) {
			$
					.extend(
							true,
							kendo.ui.validator,
							{
								rules : { // custom rules          	
									contactSeasonFrom : function(input, params) {
										if (input
												.filter("[name = 'contactSeasonFrom']").length
												&& input.val() != "") {
											var selectedDate = input.val();
											var todaysDate = $.datepicker
													.formatDate('dd/mm/yy',
															new Date());
											var flagDate = false;

											if ($.datepicker.parseDate(
													'dd/mm/yy', selectedDate) > $.datepicker
													.parseDate('dd/mm/yy',
															todaysDate)) {
												seasonFromContact = selectedDate;
												flagDate = true;
											}
											return flagDate;
										}
										return true;
									},
									contactSeasonTo1 : function(input, params) {
										if (input
												.filter("[name = 'contactSeasonTo']").length
												&& input.val() != "") {
											var flagDate = false;

											if (seasonFromContact != "") {
												flagDate = true;
											}
											return flagDate;
										}
										return true;
									},
									contactSeasonTo2 : function(input, params) {
										if (input
												.filter("[name = 'contactSeasonTo']").length
												&& input.val() != "") {
											var selectedDate = input.val();
											var flagDate = false;

											if ($.datepicker.parseDate(
													'dd/mm/yy', selectedDate) > $.datepicker
													.parseDate('dd/mm/yy',
															seasonFromContact)) {
												flagDate = true;
											}
											return flagDate;
										}
										return true;
									},
									contactContentValidation : function(input,
											params) {
										//check for the name attribute 
										if (input
												.filter("[name='contactContent']").length
												&& input.val()) {
											contactContents = input.val();
											$
													.each(
															resContact,
															function(ind, val) {

																if (contactCont == contactContents) {
																	
																	contactCont = "";
																	return false;
																} else {

																	if ((contactContents == val)
																			&& (contactContents.length == val.length)) {
																		flag = contactContents;
																		return false;
																	}
																}
															});
										}
										return true;
									},

									contactContentUniqueness : function(input) {
										if (input
												.filter("[name='contactContent']").length
												&& input.val() && flag != "") {
											flag = "";
											return false;
										}
										return true;
									} 
								},
								messages : {
									//custom rules messages
									contactSeasonFrom : "From must be selected in the future",
									contactSeasonTo1 : "Select From date first before selecting To date and change To date accordingly",
									contactSeasonTo2 : "To date should be after From date",
									contactContentUniqueness : "Contact details already exists"
								}
							});

		})(jQuery, kendo);
		//End Of Validation

		function addressforcontactEditor(container, options) {
			$('<input id="addrcontact" data-bind="value:' + options.field + '"/>')
					.appendTo(container)
					.kendoComboBox(
							{
								dataTextField : "addressLocation",
								dataValueField : "addressId",
								template : ''
										+ '<span class="k-state-default"><b>#: data.addressLocation#&nbsp;Address</b></span><br>'
										+ '<span class="k-state-default">Primary? - #: data.addressPrimary#</span><br>'
										+ '<span class="k-state-default"><i> #: data.address#</i></span>',

								dataSource : {
									transport : {
										read : "${addressforcontactUrl}/"
												+ SelectedRowId
									}
								},
								change : function (e) {
						            if (this.value() && this.selectedIndex == -1) {                    
										alert("Address doesn't exist!");
						                $("#addrcontact").data("kendoComboBox").value("");
						        	}
							    },
								placeholder : "Select ...",
							});
		}
		function contactLocationEditor(container, options) {
			$(
					'<input name="Contact Location" data-bind="value:' + options.field + '" required="true"/>')
					.appendTo(container).kendoDropDownList({
						dataTextField : "value",
						dataValueField : "name",
						dataSource : {
							transport : {
								read : "${contactLocationUrl}"
							}
						},
						optionLabel : {
							value : "Select",
							name : "",
						}
					});
			$('<span class="k-invalid-msg" data-for="Contact Location"></span>')
					.appendTo(container);
		}

		function contactTypeEditor(container, options) {
			$(
					'<select class="contactType" name="Contact Type" data-bind="value:' + options.field + '" required="true"/>')
					.appendTo(container).kendoDropDownList({
						dataTextField : "value",
						dataValueField : "name",
						dataSource : {
							transport : {
								read : "${contactTypeUrl}"
							}
						},
						optionLabel : {
							value : "Select",
							name : "",
						}
					});
			$('<span class="k-invalid-msg" data-for="Contact Type"></span>')
					.appendTo(container);
		}

		function contactPrimaryEditor(container, options) {
			$(
					'<select name="Contact Primary" id="contactPrimary" data-bind="value:' + options.field + '" required="true"/>')
					.appendTo(container).kendoDropDownList({
						dataTextField : "value",
						dataValueField : "name",
						dataSource : {
							transport : {
								read : "${contactPrimaryUrl}"
							}
						},
						optionLabel : {
							value : "Select",
							name : "",
						}
					});
			$('<span class="k-invalid-msg" data-for="Contact Primary"></span>')
					.appendTo(container);
		}

		function contactPreferredTimeEditor(container, options) {
			$(
					'<input name="contactPrefferedTime" data-text-field="' + options.field + '" id="timepicker" data-value-field="' + options.field + '" data-bind="value:' + 
						    		options.field + '" data-format="' + ["HH:mm:ss"] + '"/>')
					.appendTo(container).kendoTimePicker({
						name : ("contactPrefferedTime"),
						Value : ("$now")

					});
		}

		$(document)
				.on(
						'change',
						'input[name="contactSeason"]',
						function() {

							var test = $('input:checked').length ? $(
									'input:checked').val() : '';

							if (test == "") {

								$('input[name="contactSeasonTo"]').prop(
										'required', false);
								$('input[name="contactSeasonFrom"]').prop(
										'required', false);

								$('label[for="contactSeasonFrom"]').hide();
								$('div[data-container-for="contactSeasonFrom"]')
										.hide();

								$('label[for="contactSeasonTo"]').hide();
								$('div[data-container-for="contactSeasonTo"]')
										.hide();
							}
							if (test == "on") {
								$('label[for="contactSeasonFrom"]').show();
								$('div[data-container-for="contactSeasonFrom"]')
										.show();

								$('label[for="contactSeasonTo"]').show();
								$('div[data-container-for="contactSeasonTo"]')
										.show();

								$('input[name="contactSeasonTo"]').prop(
										'required', true);
								$('input[name="contactSeasonFrom"]').prop(
										'required', true);
							}

						});

		function onRequestEndContact(e) {
			/* debugger; */

			if (typeof e.response != 'undefined') {
				if (e.response.status == "FAIL") {

					errorInfo = "";
					var s;
					for (s = 0; s < e.response.result.length; s++) {
						errorInfo += (s + 1) + ". "
								+ e.response.result[s].defaultMessage + "<br>";

					}

					if (e.type == "create") {
						$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});

						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Creating the Contact record<br>"
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

					if (e.type == "update") {
						$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Updating the Contact record<br>"
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

					return false;
				}

				else if (e.response.status == "INVALID") {

					errorInfo = "";

					errorInfo = e.response.result.invalid;

					if (e.type == "create") {
						$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Creating the Contact record<br>"
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

					return false;
				}

				else if (e.response.status == "EXCEPTION") {

					errorInfo = "";

					errorInfo = e.response.result.exception;

					if (e.type == "create") {
						$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Creating the Contact record<br>"
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

					if (e.type == "update") {
						$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Updating the Contact record<br>"
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

					return false;
				}

				else if (e.response.status == "PRIMARY") {

					errorInfo = "";
					var s;
					for (s = 0; s < e.response.result.length; s++) {
						errorInfo += (s + 1) + ". "
								+ e.response.result[s].defaultMessage + "<br>";

					}

					if (e.type == "create") {
						$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});

						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Primary Contact for Respective Type Already Exists<br>"
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

					if (e.type == "update") {
						$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
								.read({
									personId : SelectedRowId
								});
						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Primary Contact for Respective Type Already Exists<br>"
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

					return false;
				} else if (e.type == "create") {

					$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
							.read({
								personId : SelectedRowId
							});
					$("#alertsBox").html("");
					$("#alertsBox").html("Contact Record created successfully");
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});
				}

				else if (e.type == "update") {
					$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
							.read({
								personId : SelectedRowId
							});
					$("#alertsBox").html("");
					$("#alertsBox").html("Contact Record updated successfully");
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});

				}
				
				else if (e.type == "destroy") {
					$('#gridContact_' + SelectedRowId).data().kendoGrid.dataSource
							.read({
								personId : SelectedRowId
							});
					$("#alertsBox").html("");
					$("#alertsBox").html("Contact Record Deleted successfully");
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});
					
					 

				}
				

			}
		}
		
	</script>


<!-- -------------------------------------------------- Property script ----------------------------------- -->
<script type="text/javascript">

var blockId = "";
var propertyId = "";
var propertyIdsArray = [];
function propertyEvent(e)
{
	$('div[data-container-for="propertyNo"]').remove();
	$('label[for="propertyNo"]').closest('.k-edit-label').remove();
	$('div[data-container-for="blockName"]').remove();
	$('label[for="blockName"]').closest('.k-edit-label').remove();
	$('div[data-container-for="propertyPossessionDate"]').hide();
	$('label[for="propertyPossessionDate"]').closest('.k-edit-label').hide();
	
    var billUniqueParamName=[];
	$(".k-grid-update").click(function () {
			
		 	var propId =$("#propertyId").val();
		 	var propertyAquiredDate = $('input[name="propertyAquiredDate"]').data("kendoDatePicker").value();
		 	
			$.ajax({
			     url:'./owner/getPossesionDate/'+propId,
			     async: false,
			     success: function (response) {
			    	 
			    	 for(var i = 0; i<response.length; i++) {
			    		 billUniqueParamName[i] = response[i];
					} 
			    }
			     
			});
		 	
		 	if((propertyAquiredDate)!=null || (propertyAquiredDate)!=""){
		 	   for(var i = 0; i<billUniqueParamName.length; i++){
					var padate=new Date(billUniqueParamName[i]);
					
		 		   if(propertyAquiredDate<padate){
						  alert("Property Acquired Date cannot be less than Property Possession Date ["+billUniqueParamName[i]+"]");
						   return false;

					}
					}
			   } 
		 	
		}); 
    
	
	if (e.model.isNew()) 
    {
		securityCheckForActions("./commanagement/ownerproperty/createButton");
		propertyselectedRowIndex = 0;
		
		$(".k-window-title").text("Add New Property Record");
		$(".k-grid-update").text("Save");
		$('.k-edit-field .k-input').first().focus();
    }
	else
	{
		securityCheckForActions("./commanagement/ownerproperty/updateButton");
		blockId = e.model.blockId;
		propertyId = e.model.propertyId;
		//alert(blockId+"----"+propertyId);
		/* var propertyGridDs = $('#propertyGrid_'+SelectedRowId).data("kendoGrid");       
	    var data = propertyGridDs.dataSource.data();
	    var totalNumber = data.length;
	    for(var i = 0; i<totalNumber; i++) 
		{
	        //alert(data[i].propertyId);
	        propertyIdsArray[i] = data[i].propertyId;
	    } */
	    
	   
	    
		$(".k-window-title").text("Edit Property Details");
		$(".k-grid-update").text("Update");
		$('.k-edit-field .k-input').first().focus();
		propertyIdsArray.splice(propertyIdsArray.indexOf(e.model.propertyId),1);
	}
}

function ownerPropertyParse(response)
{
	var data = response; //<--data might be in response.data!!!
	propertyIdsArray = [];
     
	 for (var idx = 0, len = data.length; idx < len; idx ++)
	 {
		 propertyIdsArray.push(data[idx].propertyId);
	 }
	// alert(projectNames);
	 return response;
}

var propertyselectedRowIndex = "";
function propertyChangeEvent(args)
{
	var grid = $("#propertyGrid_"+SelectedRowId).data("kendoGrid");
	var selectedRow = grid.select();
	propertyselectedRowIndex = selectedRow.index();
}

/* function statusEditor(container,options)
{
	 $('<input data-text-field="name" data-value-field="value" data-bind="value:' + options.field + '"/>')
    .appendTo(container)
        .kendoDropDownList({
       	 optionLabel: "Select Status",		
        dataSource: {  
            transport:{
                read: "${statusReadUrl}"
            }
        },
        placeholder :"Select",
    });

} */
/* function TowerNames(container, options) 
{
		$('<input data-text-field="towerName" data-value-field="propertyId"  id="propertyId" data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoComboBox
            ({
           	 placeholder:"Select Tower",
               
                dataSource: {  
                    transport:{
                        read: "${towerNames}"
                    }
                }
            });
}
function propertyNoEditor(container, options) 
{
		$('<input data-text-field="propertyNo" data-value-field="propertyId" data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoComboBox({
      	placeholder:"Select PropertyNo", 
           	 cascadeFrom: "propertyId",
           	
                dataSource: {  
                    transport:{
                        read: "${getPropertyNoUrl}"
                    }
                }
            });
} */

function TowerNames(container, options) {
	$('<input  data-text-field="blockName" requiered="true" name="TowerNameEE" validationmessage="Tower/Block is required"  data-value-field="blockId" id="blockId" data-bind="value:' + options.field + '"required="true" />')
			.appendTo(container).kendoDropDownList({
				optionLabel : "Select",
				dataSource : {
					transport : {
						read : "${towerNames}"
					}
				}
			});
	 $('<span class="k-invalid-msg" data-for="TowerNameEE"></span>').appendTo(container);
}


function propertyNoEditor(container, options) {
	$('<select data-text-field="propertyNo" name="propertyNumber" data-value-field="propertyId"  id="propertyId" data-bind="value:' + options.field + '"required="true"/>')
			.appendTo(container).kendoDropDownList({
				optionLabel : "Select",
				cascadeFrom : "blockId",
				select: onPrimaryOwnerSelect,
				dataSource : {
					transport : {

						read : "${getPropertyNoUrl}"

					}
				}

			});
	$('<span class="k-invalid-msg" data-for="propertyNumber"></span>').appendTo(container);
}

$(document).ready(function() {
    var window = $("#fileupload"),
        undo = $("#undo")
                .bind("click", function() {
                    window.data("kendoWindow").open().center();
                    undo.hide();
                });

    var onClose = function() {
    	undo.show();
    };

    if (!window.data("kendoWindow")) {
        window.kendoWindow({
            width: "600px",
            title: "Upload Owner Data",
            actions: [
                "Pin",
                "Minimize",
                "Maximize",
                "Close"
            ],
            close: onClose
        });
    }
});	


function PropertyRequestEnd(e)
{
    

	  if (typeof e.response != 'undefined')
		{
			/* alert(e.type+"-----"+e.response.status); */

			if (e.response.status == "FAIL") 
			{
				errorInfo = "";

				for (var k = 0; k < e.response.result.length; k++) 
				{
					errorInfo += (k + 1) + ". "
							+ e.response.result[k].defaultMessage + "<br>";

				}

				if (e.type == "create") {
					$("#alertsBox").html("");
					$("#alertsBox").html(
							"Error: Assigning the Property<br>" + errorInfo);
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});

				}

				 else if (e.type == "update") {
					$("#alertsBox").html("");
					$("#alertsBox").html(
							"Error: Updating the Owner record<br>" + errorInfo);
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});
				} 

				$('#propertyGrid_'+SelectedRowId).data().kendoGrid.dataSource.read();
				/* var grid = $("#propertyGrid_"+SelectedRowId).data("kendoGrid");
				grid.dataSource.read();
				grid.refresh(); */
				return false;
			}
			else if (e.response.status == "AlreadyAssigned") 
			{
				if (e.type == "create") {
					$("#alertsBox").html("");
					$("#alertsBox").html(
							"Error: Assigning the Property<br>" + e.response.result);
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});
				}
				if (e.type == "update") {
					$("#alertsBox").html("");
					$("#alertsBox").html(
							"Error: Assigning the Property<br>" + e.response.result);
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});
				}
				$('#propertyGrid_'+SelectedRowId).data().kendoGrid.dataSource.read();
			}
			 
			else if (e.type == "create") 
			{
				$("#alertsBox").html("");
				$("#alertsBox").html("Property Assigned Successfully");
				$("#alertsBox").dialog
				({
					modal : true,
					buttons : 
					{
						"Close" : function() 
						{
							$(this).dialog("close");
						}
					}
				});
				$('#propertyGrid_'+SelectedRowId).data().kendoGrid.dataSource.read();
			}

			else if (e.type == "update") 
			{
				$("#alertsBox").html("");
				$("#alertsBox").html("Property Assigning updated successfully");
				$("#alertsBox").dialog
				({
					modal : true,
					buttons : 
					{
						"Close" : function() 
						{
							$(this).dialog("close");
						}
					}
				});
				$('#propertyGrid_'+SelectedRowId).data().kendoGrid.dataSource.read();
			}

			else if (e.type == "destroy") 
			{
				$("#alertsBox").html("");
				$("#alertsBox").html("Property deleted successfully");
				$("#alertsBox").dialog
				({
					modal : true,
					buttons : 
					{
						"Close" : function() 
						{
							$(this).dialog("close");
						}
					}
				});
				$('#propertyGrid_'+SelectedRowId).data().kendoGrid.dataSource.read();
			}

			
		}
}

/* function PropertyNumbers(container, options) 
{
	var gview = $("#gridPersonOwner").data("kendoGrid");
	//Getting selected item
	var selectedItem = gview.dataItem(gview.select());
		$('<input data-text-field="property_No" id="test" data-value-field="propertyId" data-bind="value:' + options.field + '"/>')
             .appendTo(container)
             .kendoComboBox
             ({
            	 cascadeFrom: "propertyId",
                 autoBind: false,
                 select: onPrimaryOwnerSelect,
 				 //change: onPrimaryOwnerChange,
                 dataSource: {  
                     transport:{
                         read: "${readPropertyUrl}/"+selectedItem.personId
                     }
                 }
             });
} */

function visitorRegReqEditor(container, options) {
	$('<input name="Visitor Required" required="true" data-text-field="name" data-value-field="value" data-bind="value:' + options.field + '"/>')
			.appendTo(container).kendoDropDownList({	
				optionLabel : {
					name : "Select",
					value : "",
				},
				defaultValue : false,
				sortable : true,
				dataSource : {
					transport : {
						read : "${visitorRegReqChecksUrl}"
					}
				}
			});
	$('<span class="k-invalid-msg" data-for="Visitor Required"></span>').appendTo(container);
}

function primaryOwnerEditor(container, options) {
	$('<select name="PrimaryOwner" required="true" id="primaryOwnerId" data-text-field="name" data-value-field="value" data-bind="value:' + options.field + '" />')
			.appendTo(container).kendoDropDownList({	
				optionLabel : {
					name : "Select",
					value : "",
				},
				defaultValue : false,
				sortable : true,
				dataSource : {
					transport : {
						read : "${visitorRegReqChecksUrl}"
					}
				}

			});
	 $('<span class="k-invalid-msg" data-for="PrimaryOwner"></span>').appendTo(container);
}


function residentialOwnerEditor(container, options) {
	$('<select name="Residential" required="true" id="residentialId" data-text-field="name" data-value-field="value" data-bind="value:' + options.field + '" />')
			.appendTo(container).kendoDropDownList({	
				optionLabel : {
					name : "Select",
					value : "",
				},
				defaultValue : false,
				sortable : true,
				dataSource : {
					transport : {
						read : "${visitorRegReqChecksUrl}"
					}
				}

			});
	 $('<span class="k-invalid-msg" data-for="Residential"></span>').appendTo(container);
}
/* function onPrimaryOwnerChange() 
{
       alert("event :: change");
} */

function onPrimaryOwnerSelect(e) 
{
        var dataItem = this.dataItem(e.item.index());
        if(dataItem.propertyId != "")
        {
			$.ajax({
				type : "POST",
				url : "./getPropertyOwnerShipStatus/"+dataItem.propertyId,
				dataType:"text",
				success : function(response)
				{
					var dropdownlist = $("#primaryOwnerId").data("kendoDropDownList");
					if(response > 0)
					{
						window.alert("You will be CO-Owner for this property.");
						dropdownlist.search('No');
						dropdownlist.readonly();
						var primaryOwner = $('#propertyGrid_'+SelectedRowId).data().kendoGrid.dataSource
					      .data()[propertyselectedRowIndex];
						primaryOwner.set('primaryOwner', 'No');
					}
					else
					{
						dropdownlist.search('Yes');
						var primaryOwner = $('#propertyGrid_'+SelectedRowId).data().kendoGrid.dataSource
					      .data()[propertyselectedRowIndex];
						primaryOwner.set('primaryOwner', 'Yes');
						dropdownlist.enable();
					}

				}
				});
        }    
     
}

var propertyAquiredDateFrom = "";

//register custom validation rules
(function($, kendo) {
	$
			.extend(
					true,
					kendo.ui.validator,
					{
						rules : { // custom rules          	
							/* propertyAquiredDate: function (input, params) 
				             {
			                     if (input.filter("[name = 'propertyAquiredDate']").length && input.val() != "") 
			                     {                          
			                         var selectedDate = input.val();
			                         var todaysDate = $.datepicker.formatDate('dd/mm/yy', new Date());
			                         var flagDate = false;

			                         if ($.datepicker.parseDate('dd/mm/yy', selectedDate) >= $.datepicker.parseDate('dd/mm/yy', todaysDate)) 
			                         {
			                        	 propertyAquiredDateFrom = selectedDate;
			                                flagDate = true;
			                         }
			                         return flagDate;
			                     }
			                     return true;
			                 },
			                 propertyRelingDate1: function (input, params) 
				             {
			                     if (input.filter("[name = 'propertyRelingDate']").length && input.val() != "") 
			                     {                          
			                         var flagDate = false;

			                         if (propertyAquiredDateFrom != "") 
			                         {
			                                flagDate = true;
			                         }
			                         return flagDate;
			                     }
			                     return true;
			                 },
			                 propertyRelingDate2: function (input, params) 
				             {
			                     if (input.filter("[name = 'propertyRelingDate']").length && input.val() != "") 
			                     {                          
			                         var selectedDate = input.val();
			                         var flagDate = false;

			                         if ($.datepicker.parseDate('dd/mm/yy', selectedDate) > $.datepicker.parseDate('dd/mm/yy', propertyAquiredDateFrom)) 
			                         {
			                                flagDate = true;
			                         }
			                         return flagDate;
			                     }
			                     return true;
			                 }, */
			                 /* propertyNumberValidation : function(input,params) {
									//check for the name attribute 
									if ((input.filter("[name='propertyId']")) && ($('#propertyId option:selected').val())) {
										var selectedPropertyId = $('#propertyId option:selected').val();
										//alert(">>>>>>"+selectedPropertyId);
										//alert("Old Property Id>>"+propertyId);
										$.each(propertyIdsArray,function(ind, val) 
										{
											if (propertyId == selectedPropertyId) 
											{
												propertyId = "";
												return false;
											} 
											 
											else if ((selectedPropertyId == val)) 
												{
													$('#propertyId').attr("data-required-msg","Select start time");
													return false;
												}
											 
										});
									}
									return true;
								},    */
								
							PropertyUniqueness : function(input, params){
								if (input.filter("[name='propertyNumber']").length && input.val()) 
								{
									var flag = true;
									$.each(propertyIdsArray, function(idx1, elem1) {
										//alert(elem1+"----"+input.val());
										if(elem1 == input.val())
										{
											flag = false;
										}	
									});
									return flag;
								}
								return true;
							},
							PropertyNumber_blank : function(input, params){
									if (input.attr("name") == "propertyNumber")
								{
									return $.trim(input.val()) !== "";
								}
								return true;
							},

			                 propertyAquiredDate_blank :function (input, params) {
			                     //check for the name attribute 
			                     if (input.attr("name") == "propertyAquiredDate") {
			                      return $.trim(input.val()) !== "";
			                     }
			                     return true;
			                 },
			                 /* propertyRelingDate_blank :function (input, params) {
			                     //check for the name attribute 
			                     if (input.attr("name") == "propertyRelingDate") {
			                      return $.trim(input.val()) !== "";
			                     }
			                     return true;
			                 },  */              
						},
						messages : {
							//custom rules messages
							propertyAquiredDate:"Start must be selected in the future",
							//propertyRelingDate1:"Select Start date first before selecting End date and change End date accordingly",
							//propertyRelingDate2:"End date should be after Start date",
							//propertyRelingDate_blank : "Property Relieving date is required",
							propertyAquiredDate_blank : "Property Acquired date is required",
							//propertyNumberValidation :"Property Already Assigned"
							PropertyUniqueness : "Property already assigned",
							PropertyNumber_blank : "Property Number is required"
						}
					});

})(jQuery, kendo);
//End Of Validation
 
</script>
	
<!-- --------------------------------Access Card script ------------------------------------------------------------------ -->

<script type="text/javascript">
/* function accessCardsEditor(container, options) 
{
    $('<input data-text-field="acNo" id="accessCardsId" required="true" validationmessage="Select Access Card" data-value-field="acId" data-bind="value:' + options.field + '"/>')
         .appendTo(container)
        .kendoComboBox
         ({
             autoBind: false,
             change: function (e) 
             {
            	 if(this.select() == -1)
                	 {
						alert("Invalid Access Card");
						this.text("");
						return false;
                	 }
             },
             dataSource: 
             {                
                 transport: 
                 {
                     read: "${readAccessCards}"
                 }
             }
         });

    $('<span class="k-invalid-msg" data-for="acNo"></span>').appendTo(container);
 }  */
 
function accessCardsEditor(container, options) 
	{
	$('<input name="Access Card" id="accessCardsId" data-text-field="fslsName" data-value-field="acId" data-bind="value:' + options.field + '" required="true"/>')
	.appendTo(container).kendoComboBox({
		autoBind : false,
		placeholder : "Select Card",
		headerTemplate : '<div class="dropdown-header">'
			+ '<span class="k-widget k-header">Photo</span>'
			+ '<span class="k-widget k-header">Contact info</span>'
			+ '</div>',
		template : '<table><tr>'
				+ '<td align="left"><span class="k-state-default"><b>Name:#: data.fslsName #</b></span><br>'
				+ '<span class="k-state-default"><b>Card No:&nbsp;</b><i>#: data.acNo #</i></span><br>'
				+ '</td></tr></table>',
		dataSource : {
			transport : {		
				read :  "${readAccessCards}"
			}
		},
		change : function (e) {
            if (this.value() && this.selectedIndex == -1) {                    
				alert("Access Card doesn't exist!");
                $("#accessCardsId").data("kendoComboBox").value("");
        	}
            
	    } 
	});
	
	$('<span class="k-invalid-msg" data-for="Access Card"></span>').appendTo(container);
	}
 
 
	function accessCardDataBound(e) {
		var data = this.dataSource.view();
		/* if (data.length == 1) {
			
			var grid = $("#gridAccessCard_"+SelectedRowId).data("kendoGrid");
		    for (var i = 0; i < data.length; i++) {
		    	var currentUid = data[i].uid;
		        row = this.tbody.children("tr[data-uid='" + data[i].uid + "']");
					var currenRow = grid.table.find("tr[data-uid='" + currentUid+ "']");
					var addButton = $(currenRow).find(".k-grid-add");
					addButton.hide();
		    }
		} */

	}

	function accessCardEvent(e) {
		$('div[data-container-for="acNo"]').remove();
		$('label[for="acNo"]').closest('.k-edit-label').remove();

		if (e.model.isNew()) {
			securityCheckForActions("./commanagement/owneracesscards/createButton");

			res1 = [];
			$.ajax({
				type : "GET",
				dataType : "text",
				url : '${readAccessCardsForUniqe}',
				dataType : "JSON",
				success : function(response) {
					for (var i = 0; i < response.length; i++) {
						res1[i] = response[i];
					}
				}
			});

			$(".k-window-title").text("Add New Access Card Record");
			$(".k-grid-update").text("Save");
			$('.k-edit-field .k-input').first().focus();
		} else {

			securityCheckForActions("./commanagement/owneracesscards/updateButton");

			//For setting the access card to combobox in edit mode
			var gridView = $("#gridAccessCard_" + SelectedRowId).data(
					"kendoGrid");
			var selectedRow = gridView.dataItem(gridView.select());
			var selectedAcId = selectedRow.acId;
			var selectAcNo = selectedRow.acNo;

			var cardNumber = "";

			res1 = [];
			$.ajax({
				type : "GET",
				dataType : "text",
				url : '${readAccessCardsForUniqe}',
				dataType : "JSON",
				success : function(response) {
					var j = 0;
					for (var i = 0; i < response.length; i++) {
						if (response[i] != selectAcNo) {

							res1[j] = response[i];
							j++;
						}
					}
				}
			});

			$(".k-window-title").text("Edit Access Card Details");
			$(".k-grid-update").text("Update");
			$('.k-edit-field .k-input').first().focus();

			/* $(".k-grid-update").click(function () {
				var slot = $("#acNo").data("kendoComboBox");
				if (slot.select() == -1) 
				{
			         alert("Please Select Proper Slot");
						return false;	
				   }
			}); */

			$.ajax({
				type : "GET",
				url : "./accesscards/getCardNumberOnId/" + selectedAcId,
				success : function(response) {
					cardNumber = response;

					var comboBoxDataSource = new kendo.data.DataSource({
						transport : {
							read : {
								url : "./accesscards/getAllAccessCards", // url to remote data source 
								dataType : "json",
								type : 'GET'
							}
						},
						schema : {
							data : function(result) {
								//Manually add an item
								result.push({
									acId : selectedAcId,
									acNo : cardNumber
								});
								return result;
							}
						}
					});
					//Initialize Combobox

					$("#accessCardsId").kendoComboBox({
						dataSource : comboBoxDataSource,
						dataTextField : "acNo",
						dataValueField : "acId",
						autoBind : true,
						change : function(e) {
							if (this.select() == -1) {
								alert("Invalid Access Card");
								this.text("");
								return false;
							}
						},
					});
				}
			});

		}

		$(".k-grid-update").click(function() {

			var accessId = $("#accessCardsId").val();

			if ((accessId) != null || (accessId) != "") {
				for (var i = 0; i < res1.length; i++) {
					if (accessId == res1[i]) {
						alert("This Access Card Already Assigned");
						return false;

					}
				}
			}
		});
	}

	var seasonFromAccessCard = "";

	//register custom validation rules
	(function($, kendo) {
		$
				.extend(
						true,
						kendo.ui.validator,
						{
							rules : { // custom rules          	
								acStartDate : function(input, params) {
									if (input.filter("[name = 'acStartDate']").length
											&& input.val() != "") {
										var selectedDate = input.val();
										var todaysDate = $.datepicker
												.formatDate('dd/mm/yy',
														new Date());
										var flagDate = false;

										if ($.datepicker.parseDate('dd/mm/yy',
												selectedDate) >= $.datepicker
												.parseDate('dd/mm/yy',
														todaysDate)) {
											seasonFromAccessCard = selectedDate;
											flagDate = true;
										}
										return flagDate;
									}
									return true;
								},
								acNo : function(input, params) {
									if (input.filter("[name='acNo']").length
											&& input.val()) {
										return /^[a-zA-Z0-9]{0,15}$/.test(input
												.val());
									}
									return true;

								},
								accessCardNoUniqueness : function(input, params) {
									if (input.filter("[name='acId']").length
											&& input.val()) {
										enterdService = input.val()
												.toUpperCase();

										for (var i = 0; i < res1.length; i++) {
											if ((enterdService == res1[i]
													.toUpperCase())
													&& (enterdService.length == res1[i].length)) {
												return false;
											}
										}
									}
									return true;
								},

								acEndDate1 : function(input, params) {
									if (input.filter("[name = 'acEndDate']").length
											&& input.val() != "") {
										var flagDate = false;

										if (seasonFromAccessCard != "") {
											flagDate = true;
										}
										return flagDate;
									}
									return true;
								},
								acEndDate2 : function(input, params) {
									if (input.filter("[name = 'acEndDate']").length
											&& input.val() != "") {
										var selectedDate = input.val();
										var flagDate = false;

										if ($.datepicker.parseDate('dd/mm/yy',
												selectedDate) > $.datepicker
												.parseDate('dd/mm/yy',
														seasonFromAccessCard)) {
											flagDate = true;
										}
										return flagDate;
									}
									return true;
								}
							},
							messages : {
								//custom rules messages
								acStartDate : "Start must be selected in the future",
								acEndDate1 : "Select Start date first before selecting End date and change End date accordingly",
								acEndDate2 : "End date should be after Start date",
								acNo : "Only alphanumeric is allowed",
								accessCardNoUniqueness : "This Card Already assigned",
							}
						});

	})(jQuery, kendo);
	//End Of Validation

	var SelectedAccessCardId = "";
	function handleChange(e) {
		//alert("Changed>>"+SelectedRowId);
		var dataItem = this.dataItem(e.item.index());
		SelectedAccessCardId = dataItem.acId;
		//alert("event :: select (" + dataItem.name + " : " + dataItem.value + ")" );
		//alert(dataItem.acId);
		if (dataItem.acId != "") {
			$('#gridAccessCardPermission_' + SelectedRowId).data().kendoGrid.dataSource
					.read({
						personId : dataItem.acId
					});
		}

	}

	function accessCardTypeEditor(container, options) {
		$(
				'<input data-text-field="name" name="Card Type" required="true" data-value-field="value" data-bind="value:' + options.field + '"/>')
				.appendTo(container).kendoDropDownList({
					optionLabel : "Select CardType",
					dataSource : {
						transport : {
							read : "${accessCardTypeUrl}"
						}
					},
					placeholder : "Select",
				});

		$('<span class="k-invalid-msg" data-for="Card Type"></span>').appendTo(
				container);

	}

	function AccessCardsRequestEnd(e) {
		if (typeof e.response != 'undefined') {

			if (e.response.status == "FAIL") {
				errorInfo = "";

				for (var k = 0; k < e.response.result.length; k++) {
					errorInfo += (k + 1) + ". "
							+ e.response.result[k].defaultMessage + "<br>";

				}

				if (e.type == "create") {
					$("#alertsBox").html("");
					$("#alertsBox").html(
							"Error: Assigning the AccessCard<br>" + errorInfo);
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});

				}

				else if (e.type == "update") {
					$("#alertsBox").html("");
					$("#alertsBox").html(
							"Error: Updating the AccessCard<br>" + errorInfo);
					$("#alertsBox").dialog({
						modal : true,
						buttons : {
							"Close" : function() {
								$(this).dialog("close");
							}
						}
					});
				}

				$('#gridAccessCard_' + SelectedRowId).data().kendoGrid.dataSource
						.read();
				/* var grid = $("#propertyGrid_"+SelectedRowId).data("kendoGrid");
				grid.dataSource.read();
				grid.refresh(); */
				return false;
			}

			else if (e.type == "create") {
				$("#alertsBox").html("");
				$("#alertsBox").html("Assigned AccessCard Successfully");
				$("#alertsBox").dialog({
					modal : true,
					buttons : {
						"Close" : function() {
							$(this).dialog("close");
						}
					}
				});
				$('#gridAccessCard_' + SelectedRowId).data().kendoGrid.dataSource
						.read();
				$('#accessCardAssigned_' + SelectedRowId).data().kendoDropDownList.dataSource
						.read();
			}

			else if (e.type == "update") {
				$("#alertsBox").html("");
				$("#alertsBox").html("AccessCard updated successfully");
				$("#alertsBox").dialog({
					modal : true,
					buttons : {
						"Close" : function() {
							$(this).dialog("close");
						}
					}
				});
				$('#gridAccessCard_' + SelectedRowId).data().kendoGrid.dataSource
						.read();
				$('#accessCardAssigned_' + SelectedRowId).data().kendoDropDownList.dataSource
						.read();
			}

			else if (e.type == "destroy") {
				$("#alertsBox").html("");
				$("#alertsBox").html("AccessCard deleted successfully");
				$("#alertsBox").dialog({
					modal : true,
					buttons : {
						"Close" : function() {
							$(this).dialog("close");
						}
					}
				});
				$('#gridAccessCard_' + SelectedRowId).data().kendoGrid.dataSource
						.read();
				$('#accessCardAssigned_' + SelectedRowId).data().kendoDropDownList.dataSource
						.read();
			}

		}
	}
</script>

<!-- -------------------------------- Access Card Permission script ------------------------------------------------------------------ -->

<script type="text/javascript">




function setFirstSelected(e)
{
        this.select(0);
}
		var seasonFromAccessCardPermission = "";
		
		//register custom validation rules
		(function($, kendo) {
			$
					.extend(
							true,
							kendo.ui.validator,
							{
								rules : { // custom rules          	
									acpStartDate: function (input, params) 
						             {
					                     if (input.filter("[name = 'acpStartDate']").length && input.val() != "") 
					                     {                          
					                         var selectedDate = input.val();
					                         var todaysDate = $.datepicker.formatDate('dd/mm/yy', new Date());
					                         var flagDate = false;
		
					                         if ($.datepicker.parseDate('dd/mm/yy', selectedDate) >= $.datepicker.parseDate('dd/mm/yy', todaysDate)) 
					                         {
					                        	 	seasonFromAccessCardPermission = selectedDate;
					                                flagDate = true;
					                         }
					                         return flagDate;
					                     }
					                     return true;
					                 },
					                 acpEndDate1: function (input, params) 
						             {
					                     if (input.filter("[name = 'acpEndDate']").length && input.val() != "") 
					                     {                          
					                         var flagDate = false;
		
					                         if (seasonFromAccessCardPermission != "") 
					                         {
					                                flagDate = true;
					                         }
					                         return flagDate;
					                     }
					                     return true;
					                 },
					                 acpEndDate2: function (input, params) 
						             {
					                     if (input.filter("[name = 'acpEndDate']").length && input.val() != "") 
					                     {                          
					                         var selectedDate = input.val();
					                         var flagDate = false;
		
					                         if ($.datepicker.parseDate('dd/mm/yy', selectedDate) > $.datepicker.parseDate('dd/mm/yy', seasonFromAccessCardPermission)) 
					                         {
					                                flagDate = true;
					                         }
					                         return flagDate;
					                     }
					                     return true;
					                 },
					                 AccessPoint_blank : function(input, params){
											if (input.attr("name") == "AccessRepository")
										{
											return $.trim(input.val()) !== "";
										}
										return true;
									},
									
									   accessStartDate : function(input,params) { 
						                     
								             if (input.attr("name") == "acpStartDate")  {
								               return $.trim(input.val()) !== "";
								            }
								           return true;
								            },
								            

											   accessEndDate : function(input,params) { 
								                     
										             if (input.attr("name") == "acpEndDate")  {
										               return $.trim(input.val()) !== "";
										            }
										           return true;
										            },
										            
								            
								            
					                 AccessPointUniqueness : function(input, params){
											if (input.filter("[name='AccessRepository']").length && input.val()) 
											{
												var flag = true;
												$.each(accessPointsId, function(idx1, elem1) {
													//alert(elem1+"----"+input.val());
													if(elem1 == input.val())
													{
														flag = false;
													}	
												});
												return flag;
											}
											return true;
										}
								},
								messages : {
									//custom rules messages
									acpStartDate:"Start must be selected in the future",
									accessStartDate:"Start Date is Required",
									accessEndDate:"End Date is Required",
									acpEndDate1:"Select Start date first before selecting End date and change End date accordingly",
									acpEndDate2:"End date should be after Start date",
									AccessPointUniqueness : "Access Point is already assigned",
									AccessPoint_blank : "Access Point is required"
								}
							});
		
		})(jQuery, kendo);
		//End Of Validation
		
		var accessPointsId = [];
		function accessCardPermissionEvent(e)
		{
			  //alert(JSON.stringify(e.model));
			  $('div[data-container-for="acPointName"]').remove();
  			  $('label[for="acPointName"]').closest('.k-edit-label').remove();
			  if (e.model.isNew()) 
			    {
				  
				  securityCheckForActions("./commanagement/owneracesscardspermission/createButton");
				  $(".k-window-title").text("Add New Acess Card Permission");
				  $(".k-grid-update").text("Save");
			        //set the default value for StateID
			        //alert("Coming to new Script>>"+SelectedAccessCardId);
			        if((SelectedAccessCardId == "")||(SelectedAccessCardId == ' '))
				    {
				        var grid = $("#gridAccessCardPermission_"+SelectedRowId).data("kendoGrid");
						grid.cancelRow();
						$("#alertsBox").html("");
						$("#alertsBox").html("Please Select Access Card");
						$("#alertsBox").dialog({
							modal : true,
							buttons : {
								"Close" : function() {
									$(this).dialog("close");
								}
							}
						});
						return false;
				    }
			        $(".k-window-title").text("Add New Acess Card Permission");
			        e.model.set("acId", SelectedAccessCardId );
			        /* else
				    {
			        	$(".k-window-title").text("Edit Acess Card Permission Details");
			        	e.model.set("acId", SelectedAccessCardId );
				    } */
			    }
			  else
			  {
				  securityCheckForActions("./commanagement/owneracesscardspermission/updateButton");
				  
				  $(".k-window-title").text("Edit Acess Card Permission Details");
				  $(".k-grid-update").text("Update");
				  accessPointsId.splice(accessPointsId.indexOf(e.model.arId),1);
				  //alert(accessPointsId);
			  }
			  
			  e.container.find(".k-grid-cancel").bind("click", function () {
			        //your code here
			   var gridAccessCardPermission = $("#gridAccessCardPermission_"+SelectedRowId).data("kendoGrid");
			   gridAccessCardPermission.cancelRow();
			   accessCardPemissionParse(gridAccessCardPermission._data);
			     }); 
		
		}
		
		function accessCardPemissionParse(response)
		{
			
			var data = response; //<--data might be in response.data!!!
			accessPointsId = [];
		     
			 for (var idx = 0, len = data.length; idx < len; idx ++)
			 {
				 accessPointsId.push(data[idx].arId);
			 }
			 //alert(accessPointsId);
			 return response;
			
		}
		
		  function accessRepoEditor(container, options)
		  {	
			  $('<input name="AccessRepository" data-text-field="name" data-value-field="value" data-bind="value:' + options.field + '"/>')
				.appendTo(container).kendoDropDownList({	
					optionLabel : {
						name : "Select",
						value : "",
					},
					defaultValue : false,
					sortable : true,
					dataSource : {
						transport : {
							read : "${readAccessRepositoryUrl}"
						}
					}

				});

			  $('<span class="k-invalid-msg" data-for="AccessRepository"></span>').appendTo(container);

		  }
		  
		  function AccessCardsPermissionRequestEnd(e)
		  {
			  if (typeof e.response != 'undefined')
				{
					//alert("Response is Undefined");

					if (e.response.status == "FAIL") 
					{
						errorInfo = "";

						for (var k = 0; k < e.response.result.length; k++) 
						{
							errorInfo += (k + 1) + ". "
									+ e.response.result[k].defaultMessage + "<br>";

						}

						if (e.type == "create") {
							$("#alertsBox").html("");
							$("#alertsBox").html(
									"Error: Assigning Permission to AccessCard<br>" + errorInfo);
							$("#alertsBox").dialog({
								modal : true,
								buttons : {
									"Close" : function() {
										$(this).dialog("close");
									}
								}
							});

						}

						else if (e.type == "update") {
							$("#alertsBox").html("");
							$("#alertsBox").html(
									"Error: Updating the Permission to AccessCard<br>" + errorInfo);
							$("#alertsBox").dialog({
								modal : true,
								buttons : {
									"Close" : function() {
										$(this).dialog("close");
									}
								}
							});
						}

						$('#gridAccessCardPermission_'+SelectedRowId).data().kendoGrid.dataSource.read({personId:SelectedAccessCardId});
						/* var grid = $("#propertyGrid_"+SelectedRowId).data("kendoGrid");
						grid.dataSource.read();
						grid.refresh(); */
						return false;
					}

					else  if (e.response.status == "ACP_ALREADY_ASSIGNED") 
					{
						errorInfo = "";
						errorInfo = e.response.result.accessPointAlreadyAssigned;

						$("#alertsBox").html("");
						$("#alertsBox").html(
								"Error: Assigning AccessPoint<br>" + errorInfo);
						$("#alertsBox").dialog
						({
							modal : true,
							buttons : 
							{
								"Close" : function() 
								{
									$(this).dialog("close");
								}
							}
						});
						$('#gridAccessCardPermission_'+SelectedRowId).data().kendoGrid.dataSource.read({personId:SelectedAccessCardId});
						return false;
					}
					

			  else if (e.type == "create") 
				{
					$("#alertsBox").html("");
					$("#alertsBox").html("Assigned Permission Successfully");
					$("#alertsBox").dialog
					({
						modal : true,
						buttons : 
						{
							"Close" : function() 
							{
								$(this).dialog("close");
							}
						}
					});
					$('#gridAccessCardPermission_'+SelectedRowId).data().kendoGrid.dataSource.read({personId:SelectedAccessCardId});
				}

				else if (e.type == "update") 
				{
					$("#alertsBox").html("");
					$("#alertsBox").html("Assigning Permission updated successfully");
					$("#alertsBox").dialog
					({
						modal : true,
						buttons : 
						{
							"Close" : function() 
							{
								$(this).dialog("close");
							}
						}
					});
					$('#gridAccessCardPermission_'+SelectedRowId).data().kendoGrid.dataSource.read({personId:SelectedAccessCardId});
				}
				else if (e.type == "destroy") 
				{
					$("#alertsBox").html("");
					$("#alertsBox").html("Access Point Unassigned Successfully");
					$("#alertsBox").dialog
					({
						modal : true,
						buttons : 
						{
							"Close" : function() 
							{
								$(this).dialog("close");
							}
						}
					});
					$('#gridAccessCardPermission_'+SelectedRowId).data().kendoGrid.dataSource.read({personId:SelectedAccessCardId});
					
					
					
				}
				}

		  }

</script>

<!-- -------------------------------- Document script ------------------------------------------------------------------ -->

<script type="text/javascript">

function UploadFileBound(e) {
	var tempArray = "";
	if(kycCompliant !=null)
	{
		tempArray = kycCompliant.split(","); 
	}
 	var found = $.inArray('Owner', tempArray) > -1;
 	if(found)
 		{
 			$("#approveDocuments_"+SelectedRowId).hide();
 		}
 	else if(kycCompliant == null || found == false)
 		{
 			$("#approveDocuments_"+SelectedRowId).show();
 		}
	
    this.tbody.find("tr td:first-child").each(function (e) 
    {
        $("<input type='file' name='files'  />").appendTo(this).kendoUpload({
            async: {
                saveUrl: "${saveUrl}",
                removeUrl: "remove",
                autoUpload: false,
            },
        	multiple : false,
            upload : uploadExtraDataAlongWithFile, 
            select : filesSelectedtoUpload,
            success: clearList
        });
    });
}

var selectedRowIndex = "";
function documentChangeEvent(args)
{
	var grid = $("#documentsUpload_"+SelectedRowId).data("kendoGrid");
	var selectedRow = grid.select();
	selectedRowIndex = selectedRow.index();
}

		var documentTypeSelected = "";
		function handleSelect(e)
		{
			//alert("Changed>>"+SelectedRowId);
			var dataItem = this.dataItem(e.item.index());
		  //alert("event :: select (" + dataItem.name + " : " + dataItem.value + ")" );
			documentTypeSelected = dataItem.name;
			$.ajax({
				type : "POST",
				url : "./documentDefiner/getDocumentFormat",
				dataType:"text",
				data : {
					documentTypeSelected : dataItem.ddId,
					personType : "Owner",
					},
					success : function(response)
					{
						$("#docFormat_"+SelectedRowId).val(response);
					}
				
				});
		}

		function documentNameEditor(container, options)
		  {	
			  $('<input name="Document Name" required="true" validationMessage="Document Name is Required" data-text-field="name" data-value-field="value" data-bind="value:' + options.field + '"/>')
				.appendTo(container).kendoDropDownList({	
					optionLabel : {
						name : "Select",
						value : "",
					},
					defaultValue : false,
					select: onDocumentSelect,
					sortable : true,
					dataSource : {
						transport : {
							read : "${getDocumentType}/Owner"
						}
					}
				});

		  }
		
		function documentDecriptionEditor(container, options) 
		{
			$('<textarea data-text-field="documentDescription" name="documentDescription" data-value-field="documentDescription" data-bind="value:' + options.field + '" style="width: 148px; height: 40px;"/>')
					.appendTo(container);
		}

		function onDocumentSelect(e) 
		{
		        var dataItem = this.dataItem(e.item.index());
		        $.ajax({
					type : "POST",
					url : "./documentDefiner/getDocumentFormat",
					dataType: "text", 
					data : {
						documentTypeSelected : dataItem.ddId,
						personType : "Owner",
						},
						dataType:"text",
						success : function(response)
						{
							$("#docFormatId").val(response);
							var documentFormat = $("#documentsUpload_"+SelectedRowId).data().kendoGrid.dataSource
						      .data()[selectedRowIndex];
							documentFormat.set('documentFormat', response);
						}
					
					});

		}        

		  function documentFormatEditor(container, options)
		  {	
			  $('<input type="text" readonly="true" class="k-input k-textbox" id="docFormatId" name="documentFormat" data-bind="value:' + options.field + '"/>')
				.appendTo(container);
		  }
		 var drId = "";
		 var documentFormatToUpload = "";
		  function uploadNotice()
			{
			    var gview = $("#documentsUpload_"+SelectedRowId).data("kendoGrid");
				//Getting selected item
				
				
				var selectedItem = gview.dataItem(gview.select());
				  if (selectedItem != null) 
				  {
					  drId = selectedItem.drId;
					  documentFormatToUpload = selectedItem.documentFormat;
				  } 
				$('#uploadDialog').dialog({
					modal : true,
				});
				return false;
			}
		
		function uploadExtraData(e)
		{
			  //alert(JSON.stringify(e));
			  //alert(SelectedRowId);
			  var docNumber = $("#docNumber_"+SelectedRowId).val();
			  e.data = { ddType: documentTypeSelected,documentNumber : docNumber,personId : SelectedRowId  };
		} 
		function uploadExtraDataAlongWithFile(e)
		{	
			e.data = { drId:drId};
	    }
		function downloadFile()
		 {
			/* var result=securityCheckForActionsForStatus("./commanagement/owneraddressdocuments/viewButton");
			if(result=="success")
			{ */
			 var gview = $("#documentsUpload_"+SelectedRowId).data("kendoGrid");
				//Getting selected item
				var selectedItem = gview.dataItem(gview.select());
				window.open("./download/"+selectedItem.drId);
				/* $.ajax({
					 type : "POST",
					 url :"./download/"+selectedItem.drId,
					 success : function(response)
					 {
						 alert(response);
					 }
					}); */
			/* } */
		 }

		 var selectedType = "";
		  
		 function getUpload() 
		 {
		     return $("#files").data("kendoUpload");
		 }
		 
		 function onSelect(e) 
		 {
		      
		         var dataItem = this.dataItem(e.item.index());
		         selectedType =  dataItem.value;
		         if((selectedType != '') ||(selectedType != null))
		         {
		             $("#hiddenField").val(selectedType);
		        	 getUpload().enable();
		         }
		       // alert("event :: select (" + dataItem.text + " : " + dataItem.value + ")" );
		     
		 }
		
		 function filesSelectedtoUpload(e)
		  {
			/*  var result=securityCheckForActionsForStatus("./manpower/staffMasterDocuments/selectFileButton");
				if(result=="success")
				{ */
					var gview = $("#documentsUpload_"+SelectedRowId).data("kendoGrid");
					//Getting selected item
				
				
					var selectedItem = gview.dataItem(gview.select());
					if (selectedItem != null) 
					{
						  drId = selectedItem.drId;
						  documentFormatToUpload = selectedItem.documentFormat;
					} 
				  var files = e.files;
				  var requiredFormat = $("#docFormat_"+SelectedRowId).val();
				  requiredFormat = "."+documentFormatToUpload.toLowerCase();//requiredFormat.toLowerCase();
				 // alert(requiredFormat);
				 // alert(files.length);
				 if(requiredFormat == '')
					 {
						alert("Please select Document Type");
						return false;
					 }
					if( files.length  > 10 ) {
						alert("Maximum 10 files can be uploaded at a time.");
						e.preventDefault();
						return false;
					}
				 
					for(var fileCntr = 0; fileCntr < files.length; fileCntr ++) {
						if( files[fileCntr].size > 10485760 ) {
							alert("File size more than 10MB can not be uploaded.");
							e.preventDefault();
							return false;
						}
						
						if(documentFormatToUpload == "Image")
						{
						
							//alert(documentFormatToUpload+"----"+files[fileCntr].extension.toLowerCase());
							if( files[fileCntr].extension.toLowerCase() == '.png' || files[fileCntr].extension.toLowerCase() == '.jpg' || files[fileCntr].extension.toLowerCase() == '.jpeg' ) 
							{
								 
							}
							else
							{
								alert("Only Images can be uploaded\nAcceptable formats are png, jpg and jpeg");
								e.preventDefault();
								return false;
							}
						
						}
					else
						{
							if( files[fileCntr].extension.toLowerCase() != requiredFormat ) {
								alert("Please Upload "+documentFormatToUpload+" Format");
								e.preventDefault();
								return false;
							}	
						
						}
				 
						/* if( files[fileCntr].extension.toLowerCase() != requiredFormat ) {
							alert("Please Upload "+documentFormatToUpload+" Format");
							e.preventDefault();
							return false;
						} */
					}
			  /* } */

		  }

		
		
		function photoSelectedtoUpload(e)
		  {
			  var files = e.files;
			
				if( files.length  > 10 ) {
					alert("Maximum 10 files can be uploaded at a time.");
					e.preventDefault();
					return false;
				}
			 
				for(var fileCntr = 0; fileCntr < files.length; fileCntr ++) {
					if( files[fileCntr].size > 10485760 ) {
						alert("File size more than 10MB can not be uploaded.");
						e.preventDefault();
						return false;
					}
			 
					/* if( files[fileCntr].extension.toLowerCase() != '.png' || files[fileCntr].extension.toLowerCase() != '.jpg') {
						alert("Executable files can not be uploaded.");
						e.preventDefault();
						return false;
					} */
				}

		  }
		
		
		 function ajaxFormSubmit()
		 {
			 if((selectedType == '') ||(selectedType == null))
		     {
			     alert("Select Document Type");
			     return false;
		     }
			 else
				 {
					$.ajax({

						type : "POST",
						url : "/owner/document/upload",
						data :
							{
								selectedType : selectedType,
							},
						success : function(response)
						{
							alert(response);
						}
						

							
						});

				 }
		 }

		 function DocumentOnRequestEnd(e)
		  {
			  if (typeof e.response != 'undefined')
				{
					//alert("Response is Undefined");

					if (e.response.status == "FAIL") 
					{
						errorInfo = "";

						for (var k = 0; k < e.response.result.length; k++) 
						{
							errorInfo += (k + 1) + ". "
									+ e.response.result[k].defaultMessage + "<br>";

						}

						if (e.type == "create") {
							$("#alertsBox").html("");
							$("#alertsBox").html(
									"Error: Assigning Permission to AccessCard<br>" + errorInfo);
							$("#alertsBox").dialog({
								modal : true,
								buttons : {
									"Close" : function() {
										$(this).dialog("close");
									}
								}
							});

						}

						else if (e.type == "update") {
							$("#alertsBox").html("");
							$("#alertsBox").html(
									"Error: Updating the Permission to AccessCard<br>" + errorInfo);
							$("#alertsBox").dialog({
								modal : true,
								buttons : {
									"Close" : function() {
										$(this).dialog("close");
									}
								}
							});
						}

						$('#gridAccessCardPermission_'+SelectedRowId).data().kendoGrid.dataSource.read({personId:SelectedAccessCardId});
						/* var grid = $("#propertyGrid_"+SelectedRowId).data("kendoGrid");
						grid.dataSource.read();
						grid.refresh(); */
						return false;
					}
				

			  else if (e.type == "create") 
				{
					$("#alertsBox").html("");
					$("#alertsBox").html("Document Record Created Successfully");
					$("#alertsBox").dialog
					({
						modal : true,
						buttons : 
						{
							"Close" : function() 
							{
								$(this).dialog("close");
							}
						}
					});
				}

				else if (e.type == "update") 
				{
					$("#alertsBox").html("");
					$("#alertsBox").html("Document Record updated successfully");
					$("#alertsBox").dialog
					({
						modal : true,
						buttons : 
						{
							"Close" : function() 
							{
								$(this).dialog("close");
							}
						}
					});
				}

				else if (e.type == "destroy") 
				{
					$("#alertsBox").html("");
					$("#alertsBox").html("Document Record delete successfully");
					$("#alertsBox").dialog
					({
						modal : true,
						buttons : 
						{
							"Close" : function() 
							{
								$(this).dialog("close");
							}
						}
					});
				}	
					
				}

		  }

		 (function($, kendo) {
				$
						.extend(
								true,
								kendo.ui.validator,
								{
									rules : { // custom rules          	
										documentNumber: function (input, params) 
							             {
						                     if (input.filter("[name = 'documentNumber']").length && input.val() != "") 
						                     {                          
						                    	 return /^[a-zA-Z0-9 ]{0,35}$/
													.test(input.val());
						                     }
						                     return true;
						                 },
						                 documentDescription: function (input, params) 
							             {
						                     if (input.filter("[name = 'documentDescription']").length && input.val() != "") 
						                     {                          
						                    	 return /^[a-zA-Z0-9 ]{0,50}$/
													.test(input.val());
						                     }
						                     return true;
						                 },
						                 documentDescription_blank :  function (input, params) {
						                     //check for the name attribute 
						                     if (input.attr("name") == "documentDescription") {
						                      return $.trim(input.val()) !== "";
						                     }
						                     return true;
						                 }
									},
									messages : {
										//custom rules messages
										documentNumber:"Only alphanumeric is allowed",
										documentDescription:"Only alphanumeric is allowed",
										documentDescription_blank : "Document Description is required"
									}
								});
			
			})(jQuery, kendo);
			//End Of Validation
			
			function documentEvent(e)
			{
				$('div[data-container-for="documentFormat"]').remove();
				$('label[for="documentFormat"]').closest('.k-edit-label').remove();
				if (e.model.isNew()) 
			    {
					securityCheckForActions("./commanagement/owneraddressdocuments/createButton");
					selectedRowIndex = 0;
					$(".k-window-title").text("Add New Document Details");
					$(".k-grid-update").text("Save");
					$('.k-edit-field .k-input').first().focus();
			    }
				else
				{
					securityCheckForActions("./commanagement/owneraddressdocuments/updateButton");
					$(".k-window-title").text("Update Document Details");
					$(".k-grid-update").text("Update");
					$('.k-edit-field .k-input').first().focus();
				}
				
				 $(".k-grid-cancel").click(function () 
						 {
							  var grid = $("#documentsUpload_"+SelectedRowId).data("kendoGrid");
							  grid.dataSource.read();
							  grid.refresh();
						 });
			}
			
			function approveDocuments()
			{
				
				securityCheckForActions("./commanagement/owneraddressdocuments/updateButton");
				
				var conf = "Approve all document related to owner?";
				
				
		
				if(conf){
				var gview = $("#documentsUpload_"+SelectedRowId).data("kendoGrid");
				var dataSource = gview.dataSource;
				//records on current view / page   
				var recordsOnCurrentView = dataSource.view().length;
				//total records
				var totalRecords = dataSource.total();
				
				
				if(totalRecords == 0)
				{
					$("#alertsBox").html("");
					$("#alertsBox").html("No Documents to approve");
					$("#alertsBox").dialog
					({
						modal : true,
						buttons : 
						{
							"Close" : function() 
							{
								$(this).dialog("close");
							}
						}
					});	
					return false;
				}
				
				
				var r = confirm("Have you checked all the KYC documents before approving ?");
				if (r == true && totalRecords > 0) 
				{
					$.ajax({
						type : "POST",
						dataType:"text",
						url : "./documents/checkFile/"+SelectedGroupId+"/Owner/",
						success : function(response)
						{
							 if( response == "FILEENOTEXISTS" ){
								$("#alertsBox").html("");
								$("#alertsBox").html("Error: Please Upload All Files Before Approving");
								$("#alertsBox").dialog
								({
									modal : true,
									buttons : 
									{
										"Close" : function() 
										{
											$(this).dialog("close");
										}
									}
								});	
								
							} 
							
							else{
								/*checking wid all document  */
								$.ajax({
									type : "POST",
									url : "./documents/checkAllDocument/"+SelectedGroupId+"/Owner/",
									dataType:"text",
									success : function(response)
									{	
										if( response == "NOTAPPROVED" ){
											$("#alertsBox").html("");
											$("#alertsBox").html("Error: Please Add All Mandatory Documents Before Approving");
											$("#alertsBox").dialog
											({
												modal : true,
												buttons : 
												{
													"Close" : function() 
													{
														$(this).dialog("close");
													}
												}
											});	
											
										} 
										else{
											
											$.ajax({
												type : "POST",
												url : "./documents/approve/"+SelectedRowId+"/Owner/"+kycCompliant,
												dataType:"text",
												success : function(response)
												{
													$("#alertsBox").html("");
													$("#alertsBox").html(response);
													$("#alertsBox").dialog
													({
														modal : true,
														buttons : 
														{
															"Close" : function() 
															{
																$(this).dialog("close");
															}
														}
													});	
													kycCompliant = "Owner";
													$("#approveDocuments_"+SelectedRowId).hide();
													var grid = $("#documentsUpload_"+SelectedRowId).data("kendoGrid");
										 			grid.dataSource.read();
										 			grid.refresh();
												}
											});
											
										}
									}
								});
								
				
							}
						}
					});
				}
			}
		}
</script>

	<!--  ------------------------------ Medical Emergency Disability script ----------------------------- -->
<script type="text/javascript">
						function medicalEmergencyEventOwner(e)
						{
							if (e.model.isNew()) 
						    {
								securityCheckForActions("./commanagement/owneraddressmedicalemergency/createButton");
								
								$(".k-window-title").text("Add New Medical Emergency Details");
								$('.k-edit-field .k-input').first().focus();
								$(".k-grid-update").text("Save");
						    }
							else
							{
								securityCheckForActions("./commanagement/owneraddressmedicalemergency/updateButton");
								
								$(".k-window-title").text("Edit Medical Emergency Details");
								$('.k-edit-field .k-input').first().focus();
							}
							
							/* 
							var grid = this;
							e.container.on("keydown", function(e) {        
						        if (e.keyCode == kendo.keys.ENTER) {
						          $(document.activeElement).blur();
						          grid.saveRow();
						        }
						      }); */
						}
						
						//register custom validation rules
						(function ($, kendo) 
							{   	  
						    $.extend(true, kendo.ui.validator, 
						    {
						         rules: 
						         { // custom rules
						        	 disabilityTypeSpcacesvalidation: function (input, params) 
						             {               	 
						                 if (input.filter("[name='disabilityType']").length && input.val()) 
						                 {
						                	 if(input.val().trim() == "")
						                     {
						                		 return false;
						                     } 		 
						                 }        
						                 return true;
						             },
						        	 disabilityTypevalidation: function (input, params) 
						             {               	 
						                 if (input.filter("[name='disabilityType']").length && input.val()) 
						                 {
						                	 return /^[a-zA-Z0-9 ]{0,45}$/.test(input.val());
						                 }        
						                 return true;
						             },
						             descriptionSpcacesvalidation: function (input, params) 
						             {               	 
						                 if (input.filter("[name='description']").length && input.val()) 
						                 {
						                	 if(input.val().trim() == "")
						                     {
						                		 return false;
						                     } 		 
						                 }        
						                 return true;
						             },
						             disabilityType_blank : function(input, params){
											if (input.attr("name") == "disabilityType")
											{
												return $.trim(input.val()) !== "";
											}
											return true;
									  },
						             /* descriptionvalidation: function (input, params) 
						             {               	 
						                 if (input.filter("[name='description']").length && input.val()) 
						                 {
						                	 return /^[a-zA-Z0-9 ]{0,225}$/.test(input.val());
						                 }        
						                 return true;
						             }, */
						             meHospitalNameSpcacesvalidation: function (input, params) 
						             {               	 
						                 if (input.filter("[name='meHospitalName']").length && input.val()) 
						                 {
						                	 if(input.val().trim() == "")
						                     {
						                		 return false;
						                     } 		 
						                 }        
						                 return true;
						             },
						             meHospitalNamevalidation: function (input, params) 
						             {               	 
						                 if (input.filter("[name='meHospitalName']").length && input.val()) 
						                 {
						                	 return /^[a-zA-Z0-9 ]{0,45}$/.test(input.val());
						                 }        
						                 return true;
						             },
						             meHospitalContactSpcacesvalidation: function (input, params) 
						             {               	 
						                 if (input.filter("[name='meHospitalContact']").length && input.val()) 
						                 {
						                	 if(input.val().trim() == "")
						                     {
						                		 return false;
						                     } 		 
						                 }        
						                 return true;
						             },
						             meHospitalContactvalidation: function (input, params) 
						             {               	 
						                 if (input.filter("[name='meHospitalContact']").length && input.val()) 
						                 {
						                	 return /^[0-9,+ ]{0,225}$/.test(input.val());
						                 }        
						                 return true;
						             },
						             meHospitalAddressSpcacesvalidation: function (input, params) 
						             {               	 
						                 if (input.filter("[name='meHospitalAddress']").length && input.val()) 
						                 {
						                	 if(input.val().trim() == "")
						                     {
						                		 return false;
						                     } 		 
						                 }        
						                 return true;
						             }
						         },
						         messages: 
						         {
									//custom rules messages
									disabilityTypeSpcacesvalidation: "Type cannot contain only spaces",
									disabilityTypevalidation: "Type of Disability/Emergency can contain alphabets, numbers and spaces but cannot allow other special characters and maximum 45 characters are allowed",
									descriptionSpcacesvalidation: "Description cannot contain only spaces",
									/* descriptionvalidation: "Description can contain alphabets, numbers and spaces but cannot allow other special characters and maximum 225 characters are allowed", */
									meHospitalNameSpcacesvalidation: "Hospital name cannot contain only spaces",
									meHospitalNamevalidation: "Hospital name can contain alphabets, numbers and spaces but cannot allow other special characters and maximum 45 characters are allowed",
									meHospitalContactSpcacesvalidation: "Hospital contact cannot contain only spaces",
									meHospitalContactvalidation: "Hospital contact can only numbers, spaces, plus symbols and commas but cannot allow alphabets and other special characters and maximum 225 charaters are allowed",
									meHospitalAddressSpcacesvalidation: "Hospital address cannot contain only spaces",
									disabilityType_blank:"Disability Type is required"
						     	 }
						    });
						    
						})(jQuery, kendo);
						  //End Of Validation
		
						  function deleteAccessCheckMedicalEmergencyOwner(e)
							{
							  securityCheckForActions("./commanagement/owneraddressmedicalemergency/deleteButton");
							}
						  
		function onRequestStartMedicalEmergencyOwner(e) 
		{
					$('.k-grid-update').hide();
					$('.k-edit-buttons')
							.append(
									'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please Wait....&nbsp;&nbsp;&nbsp;&nbsp;');
					$('.k-grid-cancel').hide();
			
			 
			var res = (e.sender.options.transport.read.url).split("/");
		/* 	var gridMedicalEmergency = $('#gridMedicalEmergencyOwner_' + res[res.length - 1]).data("kendoGrid");
			if(gridMedicalEmergency != null)
			{
				gridMedicalEmergency.cancelRow();
			} */
		}	
							  
		function onRequestEndMedicalEmergencyOwner(e) 
		{
			var res = (e.sender.options.transport.read.url).split("/");
			displayMessage(e, 'gridMedicalEmergencyOwner_' + res[res.length - 1], "Medical Emergency");
		}
						  
</script>

	<!-- -------------------------------------------------- Arms script ----------------------------------- -->
<script type="text/javascript">
							function armsEventOwner(e)
							{
								if (e.model.isNew()) 
							    {
									securityCheckForActions("./commanagement/ownerarms/createButton");
									
									
									$.ajax({
										type : "POST",
										url : "./documents/documentCheckForArms/"+SelectedGroupId+"/Owner/",
										dataType:"text",
										success : function(response)
										{
											
											if( response == "ARMSDOCUMENTNOTFOUND" ){
												
												$("#alertsBox").html("");
												$("#alertsBox").html("Error: Please Add 'Arms Approved Document' Before Adding Any Arms Record");
												$("#alertsBox").dialog
												({
													modal : true,
													buttons : 
													{
														"Close" : function() 
														{
															$(this).dialog("close");
														}
													}
												});	
												var gridArms = $("#gridArmsOwner_"+ SelectedRowId).data("kendoGrid");
													gridArms.cancelRow();
											}
											else if( response == "ARMSNOTAPPROVED" ){
												
												$("#alertsBox").html("");
												$("#alertsBox").html("Error: Please Apload 'Arms Approved Document' Before Adding Any Arms Record");
												$("#alertsBox").dialog
												({
													modal : true,
													buttons : 
													{
														"Close" : function() 
														{
															$(this).dialog("close");
														}
													}
												});	
												var gridArms = $("#gridArmsOwner_"+ SelectedRowId).data("kendoGrid");
													gridArms.cancelRow();
											}
											else{
												$(".k-window-title").text("Add New Arm Details");
												$('.k-edit-field .k-input').first().focus();
												$(".k-grid-update").text("Save");
											}
										}
									});
									
							    }
								else
								{
									securityCheckForActions("./commanagement/ownerarms/updateButton");
									
									$(".k-window-title").text("Edit Arm Details");
									$('.k-edit-field .k-input').first().focus();
								}
							/* 	
								var grid = this;
								e.container.on("keydown", function(e) {        
							        if (e.keyCode == kendo.keys.ENTER) {
							          $(document.activeElement).blur();
							          grid.saveRow();
							        }
							      });
								 */
								//CLIENT SIDE VALIDATION for dropdowns
								
						 		$(".k-grid-update").click(function () 
								{
									var typeOfArm = $("select[data-bind='value:typeOfArm'] :selected").val();
									
									if((typeOfArm == null) || (typeOfArm == ""))
									{
										alert("Please either enter or select Type of Arm");
										return false;
									}	

									var typeOfArmReg = /^[a-zA-Z0-9 ]{1,45}$/;
								    if(!typeOfArmReg.test(typeOfArm)) {
								    	alert("Type of Arm can contain alphabets, numbers and spaces but cannot allow other special characters and maximum 45 characters are allowed");
								    	return false;
								    }

								}); 
							}
							
							function deleteAccessCheckArmsOwner(e)
							{
								securityCheckForActions("./commanagement/ownerarms/deleteButton");
							}
							
							function removeAccessCard(e){
								securityCheckForActions("./commanagement/owneracesscards/deleteButton");
							}
							
							function removeAccessCardPermission(e){
								securityCheckForActions("./commanagement/owneracesscardspermission/deleteButton");
							}
							
							function removeDocument(e){
								securityCheckForActions("./commanagement/owneraddressdocuments/deleteButton");
								
							}
							
							//register custom validation rules
							(function ($, kendo) 
								{   	  
							    $.extend(true, kendo.ui.validator, 
							    {
							         rules: 
							         { 
							        	 // custom rules          	
							             armMakevalidation: function (input, params) 
							             {               	 
							                 if (input.filter("[name='armMake']").length && input.val()) 
							                 {
							                	 return /^[a-zA-Z0-9 ]{0,45}$/.test(input.val());
							                 }        
							                 return true;
							             },
							             armMakeSpacesvalidation: function (input, params) 
							             {               	 
							                 if (input.filter("[name='armMake']").length && input.val()) 
							                 {
							                	 if(input.val().trim() == "")
							                	 {
							                		 return false;
							                	 }	 
							                 }        
							                 return true;
							             },
							             /* licenceNovalidation: function (input, params) 
							             {               	 
							                 if (input.filter("[name='licenceNo']").length && input.val()) 
							                 {
							                	 return /^[a-zA-Z0-9]{1,45}$/.test(input.val());
							                 }        
							                 return true;
							             }, */
							             licenceNoSpacesvalidation: function (input, params) 
							             {               	 
							                 if (input.filter("[name='licenceNo']").length && input.val()) 
							                 {
							                	 if(input.val().trim() == "")
							                	 {
							                		 return false;
							                	 }	 
							                 }        
							                 return true;
							             },
							             noOfRoundsSizevalidation: function (input, params) 
							             {               	
							                 if (input.filter("[name='noOfRounds']").length && input.val()) 
							                 {
							                	 if(input.val() >= 1000000000)
							                	 {
							                		 return false;
							                	 }	 
							                 }        
							                 return true;
							             },
							             issuingAuthorityvalidation: function (input, params) 
							             {               	 
							                 if (input.filter("[name='issuingAuthority']").length && input.val()) 
							                 {
							                	 return /^[a-zA-Z ]{1,45}$/.test(input.val());
							                 }        
							                 return true;
							             },
							             issuingAuthoritySpacesvalidation: function (input, params) 
							             {               	 
							                 if (input.filter("[name='issuingAuthority']").length && input.val()) 
							                 {
							                	 if(input.val().trim() == "")
							                	 {
							                		 return false;
							                	 }	 
							                 }        
							                 return true;
							             },
							             licenceValidity: function (input, params) 
							             {
						                     if (input.filter("[name = 'licenceValidity']").length && input.val()) 
						                     {                          
						                         var selectedDate = input.val();
						                         var todaysDate = $.datepicker.formatDate('dd/mm/yy', new Date());
						                         var flagDate = false;

						                         if ($.datepicker.parseDate('dd/mm/yy', selectedDate) > $.datepicker.parseDate('dd/mm/yy', todaysDate)) 
						                         {
						                                flagDate = true;
						                         }
						                         return flagDate;
						                     }
						                     return true;
						                 }      
							         },
							         messages: 
							         {
										//custom rules messages
										armMakevalidation: "Arms make can contain alphabets, numbers and spaces but cannot allow other special characters and maximum 45 characters are allowed",
										armMakeSpacesvalidation: "Arms make cannot contain only spaces",
										/* licenceNovalidation: "Licence No should contain alphabets and numbers but cannot allow special characters and maximum 45 letters are allowed", */
										licenceNoSpacesvalidation: "Licence number cannot contain only spaces",
										noOfRoundsSizevalidation: "Maximum 999999999 rounds are allowed to enter",
										issuingAuthorityvalidation: "Authority name can contain alphabets, spaces but cannot allow numbers and special characters and maximum 45 letters are allowed",
										issuingAuthoritySpacesvalidation: "Authority name cannot contain only spaces",
										licenceValidity:"Licence validity is expired"
							     	 }
							    });
							    
							})(jQuery, kendo);
							  //End Of Validation
							  
		function onRequestStartArmsOwner(e)
		{		$('.k-grid-update').hide();
		$('.k-edit-buttons')
		.append(
				'<img src="./resources/images/preloader.GIF" alt="please wait" style="verticle-align:middle"/>&nbsp;&nbsp;Please Wait....&nbsp;&nbsp;&nbsp;&nbsp;');
               $('.k-grid-cancel').hide();
			var res = (e.sender.options.transport.read.url).split("/");
			/* var gridArms = $('#gridArmsOwner_' + res[res.length - 1]).data("kendoGrid");
			if(gridArms != null)
			{
				gridArms.cancelRow();
			}	 */
		}
								  
		function onRequestEndArmsOwner(e)
		{
			var res = (e.sender.options.transport.read.url).split("/");
			
			displayMessage(e, 'gridArmsOwner_' + res[res.length - 1], "Arms");
		}
		
	</script>
	
		<!-- -------------------------------------------------- Photo upload script ----------------------------------- -->
	<script type="text/javascript">
	function oncomplete() {
		$("#myImage").attr(
				"src",
				"<c:url value='/person/getpersonimage/" + SelectedRowId
						+ "?timestamp=" + new Date().getTime() + "'/>");
		$("#myImages_"+SelectedRowId).attr(
				"src",
				"<c:url value='/person/getpersonimage/" + SelectedRowId
						+ "?timestamp=" + new Date().getTime() + "'/>");
	}
	
	function clickToUploadImage(){
		$('#uploadDialog').dialog({
			modal : true,
		});
		return false;
	}
	
	function onpersonImageUpload(e) {
		var files = e.files;
		// Check the extension of each file and abort the upload if it is not .jpg
		$.each(files, function() {
			if (this.extension.toLowerCase() == ".png") {
				e.data = {
						personId : SelectedRowId
					};
			}
			else if (this.extension.toLowerCase() == ".jpg") {
				
				e.data = {
						personId : SelectedRowId
					};
			}
			else if (this.extension.toLowerCase() == ".jpeg") {
				
				e.data = {
						personId : SelectedRowId
					};
			}
			else {
				alert("Only Images can be uploaded\nAcceptable formats are png, jpg and jpeg");
				e.preventDefault();
				return false;
			}
		});
    }
	function onImageSuccess(e)
	{
		alert("Uploaded Successfully");
		$(".k-upload-files.k-reset").find("li").remove();
		window.location.reload();
	}
	
	/* function filesSelectedtoUpload(e)
	  {
		  var files = e.files;
		  var requiredFormat = $("#docFormat_"+SelectedRowId).val();
		  requiredFormat = "."+documentFormatToUpload.toLowerCase();//requiredFormat.toLowerCase();
		 // alert(requiredFormat);
		 // alert(files.length);
		 if(requiredFormat == '')
			 {
				alert("Please select Document Type");
				return false;
			 }
			if( files.length  > 10 ) {
				alert("Maximum 10 files can be uploaded at a time.");
				e.preventDefault();
				return false;
			}
		 
			for(var fileCntr = 0; fileCntr < files.length; fileCntr ++) {
				if( files[fileCntr].size > 10485760 ) {
					alert("File size more than 10MB can not be uploaded.");
					e.preventDefault();
					return false;
				}
		 
				if( files[fileCntr].extension.toLowerCase() != requiredFormat ) {
					alert("Please Upload "+documentFormatToUpload+" Format");
					e.preventDefault();
					return false;
				}
			}

	  } */
	
	  
	  
	  
	function uploadExtraDataAlongWithFile(e)
	{	
		e.data = { drId:drId};
    }
	</script>
	
	
	<!-- -------------------------------------------------- Common script ----------------------------------- -->
	<script type="text/javascript">
	function statusEditor(container,options)
	 {
		 $('<input name="Status"  data-text-field="name"  data-value-field="value"  data-bind="value:' + options.field + '" required="true"/>')
	     .appendTo(container)
	         .kendoDropDownList({
	        	 optionLabel: "Select Status",  		
	         dataSource: {  
	             transport:{
	                 read: "${statusReadUrl}"
	             }
	         },
	         placeholder :"Select",
	     });
		 $('<span class="k-invalid-msg" data-for="Status"></span>').appendTo(container);

	 }
	
</script>

<script>
	function parseAddress (response) {   
		
	    $.each(response, function (idx, elem) {
	    	if(elem!=null){
	    	if(elem.addressSeasonFrom!=null){
	    		if (elem.addressSeasonFrom && typeof elem.addressSeasonFrom === "string") {
	                elem.addressSeasonFrom = kendo.parseDate(elem.addressSeasonFrom, "yyyy-MM-ddTHH:mm:ss.fffZ");
	            }
	    	}
	    	if(elem.addressSeasonTo!=null){
	    		if (elem.addressSeasonTo && typeof elem.addressSeasonTo === "string") {
	                elem.addressSeasonTo = kendo.parseDate(elem.addressSeasonTo, "yyyy-MM-ddTHH:mm:ss.fffZ");
	            }
	    	}
	    	}
        });	   
        return response;
	} 
	
	function parseContact (response) {   
		
	    $.each(response, function (idx, elem) {
	    	if(elem!=null){
	    	if(elem.contactSeasonFrom!=null){
	    		if (elem.contactSeasonFrom && typeof elem.contactSeasonFrom === "string") {
	                elem.contactSeasonFrom = kendo.parseDate(elem.contactSeasonFrom, "yyyy-MM-ddTHH:mm:ss.fffZ");
	            }
	    	}
	    	if(elem.contactSeasonTo!=null){
	    		if (elem.contactSeasonTo && typeof elem.contactSeasonTo === "string") {
	                elem.contactSeasonTo = kendo.parseDate(elem.contactSeasonTo, "yyyy-MM-ddTHH:mm:ss.fffZ");
	            }
	    	}
	    	}
        });	   
        return response;
	} 
	
	function dateEditor(container, options) {
	    $('<input name="' + options.field + '"/>')
	            .appendTo(container)
	            .kendoDateTimePicker({
	                format:"dd/MM/yyyy hh:mm tt",
	                timeFormat:"hh:mm tt"         
	                
	    });
	}
	
	
	
	
	function dataBoundOwner(e) {
		var data = this.dataSource.view();
		var noOfCount = 0;
		for (var i = 0; i < data.length; i++) {
			if (i == (data.length - 1)) {
				var totalCount = $('.k-master-row').length;
				$('.k-grouping-row').eq(i).find('td').find('p').append(
						" Count : " + parseInt(totalCount - noOfCount));
			} else {
				if (typeof $('.k-grouping-row').get(i) != 'undefined') {
					var count = $('.k-grouping-row').get(i + 1).rowIndex
							- parseInt($('.k-grouping-row').get(i).rowIndex + 1);
					noOfCount = noOfCount + count;
					$('.k-grouping-row').eq(i).find('td').find('p').append(
							" Count : " + count);
				}
			}
			
			
		}
		
		  var GrpList = $(".k-grouping-row");

	        for (var i = 0; i < GrpList.length; i++) {
	            var firstGroup = GrpList[i];
	            if (firstGroup) {
	            	this.collapseGroup(firstGroup);
	            }
	        }
		
	}
</script>
	
<!-- -------------------------------------------- STYLE ---------------------------- -->

<style>


.k-edit-form-container {
	/* width: 550px; */
	text-align: center;
	position: relative;
	/*  height: 600px; */
	/* border: 1px solid black; */
	/*  overflow: hidden;  */
}

.wrappers {
	display: inline;
	float: left;
	width: 350px;
	padding-top: 10px;
	position: relative;

	/* float:left;  */
	/* border: 1px solid red;
 */
	/* border: 1px solid green;
    overflow: hidden; */
}

  				.photo {
                    width: 140px;                    
                }
                .details {
                    width: 400px;
                }                
                .title {
                    display: block;
                    font-size: 1.6em; 
                }
                .description {
                    display: block;
                    padding-top: 1.6em;
                }
                .employeeID {
                    font-family: "Segoe UI", "Helvetica Neue", Arial, sans-serif;
                    font-size: 50px;
                    font-weight: bold;
                    color: #898989;
                }
                td.photo, .employeeID {
                    text-align: center;
                }
                td {
    				vertical-align: middle;
				}
                #employeesTable td {
                    background: -moz-linear-gradient(top,  rgba(0,0,0,0.05) 0%, rgba(0,0,0,0.15) 100%);
                    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0.05)), color-stop(100%,rgba(0,0,0,0.15)));
                    background: -webkit-linear-gradient(top,  rgba(0,0,0,0.05) 0%,rgba(0,0,0,0.15) 100%);
                    background: -o-linear-gradient(top,  rgba(0,0,0,0.05) 0%,rgba(0,0,0,0.15) 100%);
                    background: -ms-linear-gradient(top,  rgba(0,0,0,0.05) 0%,rgba(0,0,0,0.15) 100%);
                    background: linear-gradient(to bottom,  rgba(0,0,0,0.05) 0%,rgba(0,0,0,0.15) 100%);
                    padding: 20px;
                }
                
                .employeesDropDownWrap
                {
                    display:block;
                    margin:0 auto;
                }
                
                #emplooyeesDropDown-list .k-item {
                    overflow: hidden; 
                }
                
                #emplooyeesDropDown-list img {
                    -moz-box-shadow: 0 0 2px rgba(0,0,0,.4);
                    -webkit-box-shadow: 0 0 2px rgba(0,0,0,.4);
                    box-shadow: 0 0 2px rgba(0,0,0,.4);
                    float: left;
                    margin: 5px 20px 5px 0;
                }
                
           
                #emplooyeesDropDown-list h3 {
                    margin: 30px 0 10px 0;
                    font-size: 2em;
                }
                
                #emplooyeesDropDown-list p {
                    margin: 0;
                }
                .k-upload-button input {
                z-index: inherit;
                }
                .k-edit-form-container {
    text-align: left;
}
.k-tabstrip{
	width: 1150px
}
.file-icon {
		display: inline-block;
		float: left;
		width: 48px;
		height: 48px;
		margin-left: 10px;
		margin-top: 13.5px;
		}
		
		.img-file {
		background-image: url(./resources/kendo/web/upload/jpg.png)
	}
	
	.doc-file {
		background-image: url(./resources/kendo/web/upload/doc.png)
	}
	
	.pdf-file {
		background-image: url(./resources/kendo/web/upload/pdf.png)
	}
	
	.xls-file {
		background-image: url(./resources/kendo/web/upload/xls.png)
	}
	
	.zip-file {
		background-image: url(./resources/kendo/web/upload/zip.png)
	}
	
	.default-file {
		background-image: url(./resources/kendo/web/upload/default.png)
	}
	
	#example .file-heading {
		font-family: Arial;
		font-size: 1.1em;
		display: inline-block;
		float: left;
		width: 450px;
		margin: 0 0 0 20px;
		height: 25px;
		-ms-text-overflow: ellipsis;
		-o-text-overflow: ellipsis;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	#example .file-name-heading {
		font-weight: bold;
	}
	
	#example .file-size-heading {
		font-weight: normal;
		font-style: italic;
	}
	
	li.k-file .file-wrapper .k-upload-action {
		position: absolute;
		top: 0;
		right: 0;
	}
	
	li.k-file div.file-wrapper {
		position: relative;
		height: 75px;
	}
	
	.ui-dialog-osx {
	    -moz-border-radius: 0 0 8px 8px;
	    -webkit-border-radius: 0 0 8px 8px;
	    border-radius: 0 0 8px 8px; border-width: 0 8px 8px 8px;
	}

</style>
<!-- </div> -->
