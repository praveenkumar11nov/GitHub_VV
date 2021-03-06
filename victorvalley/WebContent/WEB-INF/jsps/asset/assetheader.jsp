<%@taglib prefix="kendo" uri="/WEB-INF/kendo.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="<c:url value='/resources/kendo/js/jquery.min.js' />"></script>
<link
	href="<c:url value='/resources/kendo/css/web/kendo.common.min.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/kendo/css/web/kendo.rtl.min.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/kendo/css/web/kendo.bootstrap.min.css'/>"
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

<%-- <script type="text/javascript"
	src="<c:url value='/resources/jquery.min.js'/>"></script> --%>
	
<script type="text/javascript"
	src="<c:url value='/resources/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/resources/kendo/js/kendo.all.min.js' />"></script>
<script src="<c:url value='/resources/kendo/shared/js/console.js'/>"></script>
<script src="<c:url value='/resources/kendo/shared/js/prettify.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value='/resources/js/plugins/ui/jquery.tipsy.js'/>"></script> --%>

<script type="text/javascript" 
  src="<c:url value='/resources/jquery.i18n.properties-min-1.0.9.js'/>"></script>
 <%--  <script src="<c:url value='/resources/kendo.hin.js'/>"></script> --%>
<div id="langDiv"></div>
 
<div id="content">
	<div class="contentTop">
		<span class="pageTitle"><span class="icon-screen"></span><label id="labeldashboard">${ViewName}</label></span>
		<%-- <ul class="quickStats">
			<li><a href="" class="redImg"><img
					src="<c:url value='/resources/images/icons/quickstats/user.png'/>"
					alt="" /></a>
				<div class="floatR">
					<strong class="blue">4658</strong><span>users</span>
				</div></li>
		</ul> --%>
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
						<%-- <c:otherwise>
							<li><a href="${bc.value}">${bc.name}</a></li>
						</c:otherwise> --%>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div class="breadLinks">
			<ul id="menu"></ul>
		</div>
	</div>
	<script>
	//$('.tipN').tipsy({gravity: 'n',fade: true, html:true});
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

		/* $(document).ready(function() {
			$("#menu").kendoMenu({
				dataSource : [ {
					text : "MailRoom Management",
					value : "#", 
					items : [ {
						text : "Incoming Mails",
						value : "mailroom"
					},{
						text : "Delivery List",
						value : "mailroomDelivery"
					}]
				} ],
				select : onSelect
			});
		}); */
	</script>
	<div class="wrapper">
		<ul class="middleNavA">
			<li><a class="tipN" title="Asset Master" href="#"
				onclick="RenderLinkInner('assetmaster')"><img alt=""
					src="<c:url value='/resources/images/icons/color/order-149.png'/>" width="50px" height="50px"><span
					id="">Asset Master</span></a></li>
					
			<li><a class="tipN" title="Ownership" href="#"
				onclick="RenderLinkInner('assetownership')"><img alt=""
					src="<c:url value='/resources/images/icons/color/user.png'/>" width="50px" height="50px"><span
					id="">Asset Ownership</span></a></li>
					
			<li><a class="tipN" title="Service History" href="#"
				onclick="RenderLinkInner('assetservicehistory')"><img alt=""
					src="<c:url value='/resources/images/icons/color/order-149.png'/>" width="50px" height="50px"><span
					id="">Asset Service History</span></a></li> 
					
			<li><a class="tipN" title="Physical Survey" href="#"
				onclick="RenderLinkInner('assetphysicalsurvey')"><img alt=""
					src="<c:url value='/resources/images/icons/color/order-149.png'/>" width="50px" height="50px"><span
					id="">Physical Survey</span></a></li>
					
			<li><a class="tipN" title="Asset Maintainance Schedule" href="#"
				onclick="RenderLinkInner('assetmaintenanceschedule')"><img alt=""
					src="<c:url value='/resources/images/icons/color/order-149.png'/>" width="50px" height="50px"><span
					id="">Maintenance Schedule</span></a></li>
					
			<li><a class="tipN" title="Category" href="#"
				onclick="RenderLinkInner('assetcat')"><img alt=""
					src="<c:url value='/resources/images/icons/color/order-149.png'/>" width="50px" height="50px"><span
					id="">Asset Category</span></a></li>
					
			<li><a class="tipN" title="Location" href="#"
				onclick="RenderLinkInner('assetloc')"><img alt=""
					src="<c:url value='/resources/images/icons/color/order-149.png'/>" width="50px" height="50px"><span
					id="">Asset Location</span></a></li>

		</ul>
	</div>
	<div class="divider">
		<span></span>
	</div>


</div>

<style>
.tipsy-inner {
	background-color: #808080;
	color: #000000;
	max-width: 200px;
	padding: 2px 10px;
	text-align: center;
}
</style>