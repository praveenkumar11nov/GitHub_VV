<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@page import="com.bfm.portal.model.PayUForm" %>



<%!
public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>
<% 	
	
	 PayUForm payUForm = (PayUForm)request.getAttribute("payUForm");
	 String merchant_key = ResourceBundle.getBundle("application").getString("payUMoney.merchant_key");
	 String salt = ResourceBundle.getBundle("application").getString("payUMoney.salt");
	 String epo = ResourceBundle.getBundle("application").getString("payUMoney.epo");
	 String action1 ="";
	 //String base_url="https://test.payu.in";
	 
	 
	 String base_url="https://secure.payu.in";
	 int error=0;
	 String hashString="";
	
	 String Address1 = payUForm.getBillAddress1();
	 String Address2 = payUForm.getBillAddress2();
	 String BillCity = "Gurgaon";
	 String BillState = "Haryana";
	 String BillZipCode = "122102";
	 String BillCountry = "IND";
     String AdminCharges=(12+payUForm.getTxnAmount())+"";
	 String CustomerFirstName =payUForm.getCustomerFirstName();
	 String CustomerLastName = payUForm.getCustomerLastName();
	 String CustomerEmail =payUForm.getCustomerEmail();
	 String CustomerMobile = payUForm.getCustomerMobile();
	 String txAmount =""+payUForm.getTxnAmount();
	 String productInfo =payUForm.getProductInfo();
	 String accounId = payUForm.getAccountId(); 
	 
	 String serviceType = payUForm.getServiceType(); 
	 String cbid = payUForm.getCb_id(); 
	 
	 String responseUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
	 String successURL = responseUrl+"/users/payUResPage"; 
	 String failureURL = responseUrl+"/users/payUFailurePage"; 
	
	Enumeration paramNames = request.getParameterNames();
	 
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
    		
      		String paramName = (String)paramNames.nextElement();
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
	String udf2 ="";
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
        udf2 = txnid;
	  
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		
		if( empty(params.get("key")) || empty(params.get("txnid")) || empty(params.get("amount")) || empty(params.get("firstname")) || empty(params.get("email")) || empty(params.get("phone")) || empty(params.get("productinfo")) || empty(params.get("surl")) || empty(params.get("furl"))|| empty(params.get("service_provider"))){
			
			error=1;
		}
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}

%>
<html>
<script type="text/javascript">

function submitPayuForm() {
	alert("accountID="+<%=accounId %>+"  serviceType="+<%=serviceType %>+"  cbid="+<%=cbid %>);
	
	var payment = "<%=session.getAttribute("payment")%>";
	if(payment=='null'){
		<% session.setAttribute("payment","paymentAccept");%>
		alert("Your Payment Amount is : Rs."+<%=txAmount %>+" Click On Secure Payment to Pay");
	}
	
	if(<%=txAmount %>==0){
		alert("Your Total/Net Amount is (Rs.0) So You need not to Pay");
		return false;
	}
		
	
 }

</script>
<div id="content">
  <div class="row">
<div id="paymentid">
<h3 align="center" style="color: green;">Connect To PayUMoney Payment Gateway</h3>
<form action="<%= action1 %>" method="post" name="payuForm">
<input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
      <input type="hidden" name="udf2" value="<%= txnid %>" />
	  <input type="hidden" name="service_provider" value="payu_paisa" />
      <table>
        <tr style="visibility:hidden;">
          <td><b>Mandatory Parameters</b></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Recharge Amount: </td>
          <td><input type=Hidden name="paymentamt" value="<%=txAmount %>" /></td>
          <td>First Name: </td>
          <td><input type=Hidden name="firstname" id="firstname" value="<%=CustomerFirstName %>" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Email: </td>
          <td><input type=Hidden name="email" id="email" value="<%=CustomerEmail %>" /></td>
          <td>Phone: </td>
          <td><input type=Hidden name="phone" value="<%=CustomerMobile %>" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Product Info: </td>
          <td colspan="3"><input type=Hidden name="productinfo" value="<%=productInfo %>" size="64" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Success URI: </td>
         <td colspan="3"><input type=Hidden name="surl" value="<%= successURL %>" size="64" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Failure URI: </td>
          <td colspan="3"><input type=Hidden name="furl" value="<%= failureURL %>" size="64" /></td>
        </tr>
          <tr>
          <td style="vertical-align:middle;padding-left: 390px;color: green; "><input type="submit" value="Click here for Secure Payment" style="color: #008000;" onclick="return submitPayuForm()"/></td>
     
        </tr>
        <tr style="visibility:hidden;">
          <td><b>Optional Parameters</b></td>
        </tr>
        
        <tr style="visibility:hidden;">
          <td>Last Name: </td>
          <td><input type=Hidden name="lastname" id="lastname" value="<%=CustomerLastName %>" /></td>
          <td>Cancel URI: </td>
          <td><input type=Hidden name="curl" value="" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Address1: </td>
          <td><input type=Hidden name="address1" value="<%=Address1 %>" /></td>
          <td>Address2: </td>
          <td><input type=Hidden name="address2" value="<%=Address2 %>" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>City: </td>
          <td><input type=Hidden name="city" value="<%=BillCity %>" /></td>
          <td>State: </td>
          <td><input type=Hidden name="state" value="<%=BillState %>" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Country: </td>
          <td><input type=Hidden name="country" value="<%= BillCountry %>" /></td>
          <td>Zipcode: </td>
          <td><input type=Hidden name="zipcode" value="<%=BillZipCode %>" /></td>
        </tr>
         <tr style="visibility:hidden;">
          <td>Payment Amount: </td>
          <td><input type=text name="amount" value="<%=AdminCharges %>" readonly="readonly"/></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>UDF1: </td>
          <td><input type=Hidden name="udf1" value="<%=accounId%>" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>UDF3: </td>
          <td><input type=Hidden name="udf3" value="<%=serviceType%>"/></td>
          <td>UDF4: </td>
          <td><input type=Hidden name="udf4" value="<%=cbid%>"/></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>UDF5: </td>
          <td><input type=Hidden name="udf5" value="" /></td>
          <td>PG: </td>
          <td><input type=Hidden name="pg" value="" /></td>
        </tr>
      
      </table>
    </form>
</div>


<div id="clickpay">


<h3 align="left" style="color: green;">Please verify payments Details and click pay now</h3>
<form action="<%= action1 %>" method="post" name="payuForm">
<input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
      <input type="hidden" name="udf2" value="<%= txnid %>" />
	  <input type="hidden" name="service_provider" value="payu_paisa" />

<!-- <table border-collapse: separate; border-spacing: 5px;> -->
<table style="border-collapse: separate; border-spacing: 20px;" >
<tr >
           <td>Recharge Amount:</td> 
          <td ><input type=text name="paymentamt" value="<%=txAmount %>" readonly="readonly"/></td>
           <td>First Name: </td> 
          <td ><input type=text name="firstname" id="firstname" value="<%=CustomerFirstName %>" readonly="readonly"/></td>
        </tr>
        <tr>
          <td>Email: </td>
          <td><input type=text name="email" id="email" value="<%=CustomerEmail %>" readonly="readonly" /></td>
          <td>Phone: </td>
          <td><input type=text name="phone" value="<%=CustomerMobile %>" readonly="readonly"/></td>
        </tr>
        
           <tr>
          <td>City: </td>
          <td><input type=text name="city" value="<%=BillCity %>" readonly="readonly" /></td>
          <td>State: </td>
          <td><input type=text name="state" value="<%=BillState %>" readonly="readonly"/></td>
        </tr>
        <tr>
          <td>Country: </td>
          <td><input type=text name="country" value="<%= BillCountry %>" readonly="readonly"/></td>
          <td>Zipcode: </td>
          <td><input type=text name="zipcode" value="<%=BillZipCode %>" readonly="readonly"/></td>
        </tr>
        <tr>
          <td>Payment Amount: </td>
          <td><input type=text name="amount" value="<%=AdminCharges %>" readonly="readonly"/></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Product Info: </td>
          <td colspan="3"><input type=Hidden name="productinfo" value="<%=productInfo %>"  /></td>
        </tr>
              <tr>
          <td><input type="submit" value="Pay Now" style="color: #008000;" onclick="return submitPayuForm()"/></td>
          
        </tr>
        
        </table>
        <table>
        
        <tr style="visibility:hidden;">
          <td>Success URI: </td>
         <td colspan="3"><input type=Hidden name="surl" value="<%= successURL %>"  /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Failure URI: </td>
          <td colspan="3"><input type=Hidden name="furl" value="<%= failureURL %>" /></td>
        </tr>
       <!--    <tr>
          <td style="vertical-align:middle;padding-left: 390px;color: green; "><input type="submit" value="Click here for Secure Payment" style="color: #008000;" onclick="return submitPayuForm()"/></td>
     
        </tr> -->
   <!--     <td> <input type="submit" value="Click here for Secure Payment" style="color: #008000;" onclick="return submitPayuForm()"/></td> -->
        <tr style="visibility:hidden;">
          <td><b>Optional Parameters</b></td>
        </tr>
        
        <tr style="visibility:hidden;">
          <td>Last Name: </td>
          <td><input type=Hidden name="lastname" id="lastname" value="<%=CustomerLastName %>" /></td>
          <td>Cancel URI: </td>
          <td><input type=Hidden name="curl" value="" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>Address1: </td>
          <td><input type=text name="address1" value="<%=Address1 %>" /></td>
          <td>Address2: </td>
          <td><input type=Hidden name="address2" value="<%=Address2 %>" /></td>
        </tr>
     
        <tr style="visibility:hidden;">
          <td>UDF1: </td>
          <td><input type=Hidden name="udf1" value="<%=accounId%>" /></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>UDF3: </td>
          <td><input type=Hidden name="udf3" value="<%=serviceType%>"/></td>
          <td>UDF4: </td>
          <td><input type=Hidden name="udf4" value="<%=cbid%>"/></td>
        </tr>
        <tr style="visibility:hidden;">
          <td>UDF5: </td>
          <td><input type=Hidden name="udf5" value="" /></td>
          <td>PG: </td>
          <td><input type=Hidden name="pg" value="" /></td>
        </tr>
       
        
        
</table>

<p style="font-size: 10px; margin-top: -182px ;margin-left: 20px;">*Admin charges - Rs 12 / per Transaction</p>
<p style="font-size: 10px ; margin-top: 0px; margin-left: 20px;">*By clicking on the Pay Button you are agree to Pay the Admin Charges with the Recharge Amount</p>

</form>



</div>

</div>

</div>


<script>
	
	 $(document).ready(function() {
		  $("#clickpay").hide();
		  
	 
		  
		  var x="<%= action1 %>";
		  
		  if(x!="" && x!=null){
		 
			  
			  $("#clickpay").show();
			  $("#paymentid").hide();
	     
		 }
	 });
	
	
	
	</script>
	<!-- <!DOCTYPE html>

To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.

<html>
    <head >
    </head>

    <body>


        <h1>PayUForm </h1>

        <form action="./myServlet"  name="payuform" method=POST >
            <input type="hidden" name="key"value="rjQUPktU" />
            <input type="hidden" name="hash_string" value="" />
            <input type="hidden" name="hash" />

            <input type="hidden" name="txnid"/>

            <table>
                <tr>
                    <td><b>Mandatory Parameters</b></td>
                </tr>
                <tr>
                    <td>Amount: </td>
                    <td><input name="amount"  /></td>
                    <td>First Name: </td>
                    <td><input name="firstname" id="firstname"  /></td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><input name="email" id="email"   /></td>
                    <td>Phone: </td>
                    <td><input name="phone"  /></td>
                </tr>
                <tr>
                    <td>Product Info: </td>
                    <td colspan="3"><textarea name="productinfo" >  </textarea></td>
                </tr>
                <tr>
                    <td>Success URI: </td>
                    <td colspan="3"><input name="surl"  size="64"  /></td>
                </tr>
                <tr>
                    <td>Failure URI: </td>
                    <td colspan="3"><input name="furl"  size="64" /></td>
                </tr>

                <tr>
                    <td colspan="3"><input type="hidden" name="service_provider" value="payu_paisa" /></td>
                </tr>
                <tr>
                    <td><b>Optional Parameters</b></td>
                </tr>
                <tr>
                    <td>Last Name: </td>
                    <td><input name="lastname" id="lastname"  /></td>
                    <td>Cancel URI: </td>
                    <td><input name="curl" value="" /></td>
                </tr>
                <tr>
                    <td>Address1: </td>
                    <td><input name="address1" /></td>
                    <td>Address2: </td>
                    <td><input name="address2"  /></td>
                </tr>
                <tr>
                    <td>City: </td>
                    <td><input name="city"  /></td>
                    <td>State: </td>
                    <td><input name="state"  /></td>
                </tr>
                <tr>
                    <td>Country: </td>
                    <td><input name="country"  /></td>
                    <td>Zipcode: </td>
                    <td><input name="zipcode"  /></td>
                </tr>
                <tr>
                    <td>UDF1: </td>
                    <td><input name="udf1"  /></td>
                    <td>UDF2: </td>
                    <td><input name="udf2"  /></td>
                </tr>
                <tr>
                    <td>UDF3: </td>
                    <td><input name="udf3"   /></td>
                    <td>UDF4: </td>
                    <td><input name="udf4"  /></td>
                </tr>
                <tr>
                    <td>UDF5: </td>
                    <td><input name="udf5"  /></td>
                    <td>PG: </td>
                    <td><input name="pg"  /></td>
                </tr>

                <td colspan="4"><input type="submit" value="Submit"  /></td>


                </tr>
            </table>
        </form>

    </body>
</html>
 -->


	
