<%@include file="/common/taglibs.jsp"%>
<link	href="<c:url value='/resources/twitter-bootstrap-wizard/bootstrap/css/bootstrap.min.css'/>"	rel="stylesheet" />

    <script type="text/javascript">

        $(document).ready(function () {

            $("#BTNSERVICE").click(function (event) {

                var webserUrl = "http://122.160.87.14:81/service.asmx";

                var soapRequest ='<?xml version="1.0" encoding="utf-8"?> \<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" \xmlns:xsd="http://www.w3.org/2001/XMLSchema" \xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"> \<soap:Body> \<liveEmsTransaction xmlns="http://tempuri.org/"> \<TXN_NAME>RECHARGE</TXN_NAME>\<DATA>{CA_no:"52",Reference_No:"900011",Payment_Mode:"CASH",TRN_Amt:500,To_Account:"ICICI"}</DATA>\<username>IREO_WEB_CALL</username>\<password>WEB_CALL_ADMIN@IREO987</password>\</liveEmsTransaction>\</soap:Body> \</soap:Envelope>';

                $.ajax({

                    type: "POST",

                    url: webserUrl,

                    processData: false,
                    contentType: "text/xml; charset=\"utf-8\"",

                    dataType: "xml",

                    data: soapRequest,

                    success: SuccessOccur,

                    error: ErrorOccur

                });

            });

        });

        function SuccessOccur(data, status, req) {
                alert("");
            if (status == "SUCCESS")

                alert(req.responseText);

        }

        function ErrorOccur(data, status, req) {

            alert(req.responseText + " " + status);

        }

    </script>




<div class='container'>
	<div class="span12" style=" width: 500px;">
		<section id="wizard">
<form action=""  method="post">
  <div id="rootwizard">
					<div class="tab-content" >
						    <ul class="pager wizard" style="margin-top: -1px">
							<li><a style="background-color: rgb(236, 236, 236);"><input type="button" value="Submit" id="BTNSERVICE"></a></li>
							</ul>
					
					</div>					
				</div>
</form> 
		</section>
	</div>
</div>

