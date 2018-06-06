import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

/*import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
*/
public class DemoClass {
	public static JSONObject jsonObject = null;
    public static void main(String[] args) throws IOException, ParseException {
    	List<String> list=new ArrayList<>();
	String string1="DAILYCONSUMPTION";
	String string2="{Date:20170209}";
	String string3="IREO_WEB_CALL";
	String string4="WEB_CALL_ADMIN@IREO987";
	String responseString = "";
	String outputString = "";
	String wsURL = "http://122.160.87.14:81/service.asmx";
	URL url = new URL(wsURL);
	URLConnection connection = url.openConnection();
	HttpURLConnection httpConn = (HttpURLConnection)connection;
	ByteArrayOutputStream bout = new ByteArrayOutputStream();
	String xmlInput =
	" <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\n" +
	" <soap12:Body>\n" +
	" <liveEmsTransaction xmlns=\"http://tempuri.org/\">\n" +
	" <TXN_NAME>"+string1+"</TXN_NAME>\n" +
	" <DATA>"+string2+"</DATA>\n" +
	" <username>"+string3+"</username>\n"+
	" <password>"+string4+"</password>\n"+
	" </liveEmsTransaction>\n"+
	" </soap12:Body>\n" +
	" </soap12:Envelope>";
	 
	byte[] buffer = new byte[xmlInput.length()];
	buffer = xmlInput.getBytes();
	bout.write(buffer);
	byte[] b = bout.toByteArray();
	String SOAPAction =
	"http://tempuri.org/liveEmsTransaction";
	// Set the appropriate HTTP parameters.
	httpConn.setRequestProperty("Content-Length",
	String.valueOf(b.length));
	httpConn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
	httpConn.setRequestProperty("SOAPAction", SOAPAction);
	httpConn.setRequestMethod("POST");
	httpConn.setDoOutput(true);
	httpConn.setDoInput(true);
	OutputStream out = httpConn.getOutputStream();
	
	//Write the content of the request to the outputstream of the HTTP Connection.
	out.write(b);
	out.close();
	//Ready with sending the request.
	 
	//Read the response.
	InputStreamReader isr =
	new InputStreamReader(httpConn.getInputStream());
	BufferedReader in = new BufferedReader(isr);
	 
	//Write the SOAP message response to a String.
	while ((responseString = in.readLine()) != null) {
	outputString = outputString + responseString;
	System.out.println(outputString);
	}
	
	try {
		jsonObject=new JSONObject(outputString);
		JSONArray array=(JSONArray) jsonObject.get("data");
		for(int i=0;i<array.length();i++){
			System.out.println(array.getJSONObject(i));
			  JSONObject obj1=array.getJSONObject(i);
				//Map<String, Object> data=getData(obj1);
				System.out.println("1 "+array.getJSONObject(i).getString("ca_no"));
				System.out.println("2 "+array.getJSONObject(i).getString("DEVICE_SLNO"));
				SimpleDateFormat dateFormat=new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
				System.out.println("3 "+dateFormat.parse(array.getJSONObject(i).getString("date")));
				System.out.println("4 "+array.getJSONObject(i).getString("ebunit"));
				System.out.println("5 "+array.getJSONObject(i).getString("dgunit"));
				System.out.println("6 "+array.getJSONObject(i).getString("EBAMT"));
				System.out.println("7 "+array.getJSONObject(i).getString("DGAMT"));
				System.out.println("8 "+array.getJSONObject(i).getString("FIXEDCHARGES"));
				System.out.println("9 "+array.getJSONObject(i).getString("rechargeamt"));
				System.out.println("10 "+array.getJSONObject(i).getString("Balance"));
		        list.add(array.getJSONObject(i).getString("ca_no"));
		        list.add(array.getJSONObject(i).getString("DEVICE_SLNO"));
		        list.add(array.getJSONObject(i).getString("date"));
		        list.add(array.getJSONObject(i).getString("ebunit"));
		        list.add(array.getJSONObject(i).getString("dgunit"));
		        list.add(array.getJSONObject(i).getString("EBAMT"));
		        list.add(array.getJSONObject(i).getString("DGAMT"));
		        list.add(array.getJSONObject(i).getString("FIXEDCHARGES"));
		        list.add(array.getJSONObject(i).getString("rechargeamt"));
		        list.add(array.getJSONObject(i).getString("Balance"));
		        System.out.println(list.get(i).length());
		}

	} catch (JSONException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	  /*try {

	        JSONParser jsonParser = new JSONParser();

	       // File file = new File(outputString);

	        Object object = jsonParser.parse(outputString);

	        jsonObject = (JSONObject) object;

	        parseJson(jsonObject);

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }*/
	}

	/*public static void getArray(Object object2)  {

	    JSONArray jsonArr = (JSONArray) object2;

	    for (int k = 0; k < jsonArr.size(); k++) {

	        if (jsonArr.get(k) instanceof JSONObject) {
	        	System.err.println("step2");
	            parseJson((JSONObject) jsonArr.get(k));
	        } else {
	        	System.err.println("step3");
	            System.out.println("step3"+jsonArr.get(k));
	        }

	    }
	}

	public static void parseJson(JSONObject jsonObject) {

	    Set<Object> set = jsonObject.keySet();
	    Iterator<Object> iterator = set.iterator();
	    while (iterator.hasNext()) {
	        Object obj = iterator.next();
	        if (jsonObject.get(obj) instanceof JSONArray) {
	            System.out.println("step1"+obj.toString());
	            getArray(jsonObject.get(obj));
	        } else {
	            if (jsonObject.get(obj) instanceof JSONObject) {
	                parseJson((JSONObject) jsonObject.get(obj));
	            } else {
	                System.out.println("step4"+ obj.toString() + "\t"
	                        + jsonObject.get(obj));
	            }
	        }
	    }
}*/
}
