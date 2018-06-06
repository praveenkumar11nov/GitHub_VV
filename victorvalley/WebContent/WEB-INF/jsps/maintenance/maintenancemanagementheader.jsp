<%@taglib prefix="kendo" uri="/WEB-INF/kendo.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link
	href="<c:url value='/resources/kendo/css/web/kendo.common.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/kendo/css/web/kendo.rtl.min.css'/>"
	rel="stylesheet" />
<%-- <link
	href="<c:url value='/resources/kendo/css/web/kendo.bootstrap.min.css'/>"
	rel="stylesheet" /> --%>
		<link
 href="<c:url value='/resources/kendo/css/web/kendo.silver.min.css'/>"
 rel="stylesheet" />
<link
	href="<c:url value='/resources/kendo/css/dataviz/kendo.dataviz.min.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/kendo/css/dataviz/kendo.dataviz.default.min.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/kendo/shared/styles/examples-offline.css'/>"
	rel="stylesheet">
<script src="<c:url value='/resources/kendo/js/jquery.min.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/resources/kendo/js/kendo.all.min.js' />"></script>
<script src="<c:url value='/resources/kendo/shared/js/console.js'/>"></script>
<script src="<c:url value='/resources/kendo/shared/js/prettify.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/resources/jquery.i18n.properties-min-1.0.9.js'/>"></script>
 <div id="langDiv"></div>
<div id="content">
	<div class="contentTop">
		<span class="pageTitle"><span class="icon-screen"></span><label id="labeldashboard">${ViewName}</label></span>
	</div>

	<!-- Breadcrumbs line -->
	<div class="breadLine">
		<div class="bc">
			<ul id="breadcrumbs" class="breadcrumbs">
				<c:url var="home" value="./home" />
				<c:url value="/images/icons/breadsHome.png" var="homeimage" />
				<c:forEach var="bc" items="${breadcrumb.tree}" varStatus="status">
					<c:choose>
						<c:when test="${status.index==0}">
							<li><a href="${home}"><label id="labelhome">Home</label></a></li>
						</c:when>
						<c:when
							test="${status.index == fn:length(breadcrumb.tree)-1 && status.index!=0}">
							<li><a href="#"><label id="labelbcdashboard">${bc.name}</label></a></li>
						</c:when>					
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="breadLinks">
			<ul id="menu"></ul>
		</div>
	</div>
	<script>
		function onSelect(e) {
			var item = $(e.item), menuElement = item.closest(".k-menu"), dataItem = this.options.dataSource, index = item
					.parentsUntil(menuElement, ".k-item").map(function() {
						return $(this).index();
					}).get().reverse();

			index.push(item.index());

			for (var i = -1, len = index.length; ++i < len;) {
				dataItem = dataItem[index[i]];
				dataItem = i < len - 1 ? dataItem.items : dataItem;
			}
			if(dataItem.value !="#"){
			RenderLinkInner(dataItem.value);
			}
		}

		$(document).ready(function() {
			$("#menu").kendoMenu({
				dataSource : [ {
					text : "Maintenance Management",
					value : "#",
					items : [{
						text : "Manage Job Calender",
						value : "jobcalender",					
					},{
						text : "Manage Jobs Types",
						value : "jobtypes",
					},{
						text : "Manage Maintenance Types",
						value : "maintenancetypes",					
					},{
						text : "Manage Job Cards",
						value : "jobcards",					
					},
					,{
						text : "Manage Tool Master",
						value : "toolmaster",					
					},
					]
				} ],
				select : onSelect
			});
		});
	</script>
	<div class="wrapper">
		<ul class="middleNavA">
			<li><a title="Manage Jobs Calender" href="#"
				onclick="RenderLinkInner('jobcalender')"><img alt="" width="50px" height="50px"
					src="<c:url value='/resources/images/icons/color/jobcalender.png'/>">
					<span id="mNavUsers"> Manage Job Calender</span></a>
			</li>
			<li><a title="Manage Jobs Types" href="#"
				onclick="RenderLinkInner('jobtypes')"><img alt="" width="50px" height="50px"
					src="<c:url value='/resources/images/icons/color/jobtypes.jpg'/>">
					<span id="mNavUsers"> Manage Job Types</span></a>
			</li>
					
			<li><a title="Manage Maintenance Types" href="#"
				onclick="RenderLinkInner('maintenancetypes')"><img alt="" width="50px" height="50px"
					src="<c:url value='/resources/images/icons/color/maintenancetypes.jpg'/>">
					<span id="mNavMaintenance">Manage Maintenance Types</span></a>
			</li>	
			
			<li><a title="Manage Job Cards" href="#"
				onclick="RenderLinkInner('jobcards')"><img alt="" width="50px" height="50px"
					src="<c:url value='/resources/images/icons/color/card_file.png'/>">
					<span id="mNavJobcards">Manage Job Cards</span></a>
			</li>
			<li><a title="Manage Tool Master" href="#"
				onclick="RenderLinkInner('toolmaster')"><img alt="" width="50px" height="50px"
					src="<c:url value='/resources/images/icons/color/toolmaster.jpg'/>">
					<span id="mNavJobcards">Manage Tool Master</span></a>
			</li>				
				
		</ul>
	</div>
	<div class="divider">
		<span></span>
	</div>
</div>