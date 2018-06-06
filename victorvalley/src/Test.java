import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.joda.time.LocalDate;
import org.joda.time.Period;
import org.joda.time.PeriodType;


public class Test {
	 @SuppressWarnings("unused")
	 public static void main(String[] args) throws UnsupportedEncodingException {

	     StringBuilder kanadaunicode = new StringBuilder();
	     String string = "ಕಳೆದ ಶತಮಾನದಲ್ಲಿ ಎಂದರೆ ೨೦ನೆಯ ಶತಮಾನದಲ್ಲಿ ಕನ್ನಡ ಭಾಷೆಯ ಅಭಿವೃದ್ಧಿ ಬಹಳ ವ್ಯಾಪಕವಾಗಿ ನಡೆಯಿತು. ಕನ್ನಡ ಭಾಷೆಯು ಅಭಿಜಾತ ಭಾಷೆಯೆಂಬ ಸ್ಥಾನಮಾನವನ್ನು ಕೇಂದ್ರ ಸರಕಾರದಿಂದ ಪಡೆದಿದೆ. ಅಂತರಜಾಲದಲ್ಲಿ ಕನ್ನಡ ಭಾಷೆಯ ಬಳಕೆ ಯಥೇಚ್ಛವಾಗಿದೆ. ಕನ್ನಡ ಭಾಷೆ ವಾಣಿಜ್ಯ ಕ್ಷೇತ್ರದಲ್ಲಿಯೂ ಮುಂಚೂಣಿಯ ಭಾಷೆಯಾಗಿ ಬೆಳೆಯತೊಡಗಿದೆ."
	             + "ಕನ್ನಡದಲ್ಲಿ ಸಂಸ್ಕೃತದ ಪ್ರಭಾವ ಅಸಾಧಾರಣವಾದುದು. ಪ್ರಾಕೃತ, ಪಾಳಿ ಮುಂತಾದ ಭಾಷೆಗಳ ಪ್ರಭಾವವೂ ಕನ್ನಡಕ್ಕಿದೆ. ಕ್ರಿ.ಪೂ ಮೂರನೆಯ ಶತಮಾನಕ್ಕೂ ಮುನ್ನವೇ ಕನ್ನಡ ಮೌಖಿಕ ಪರಂಪರೆಯ ಭಾಷೆಯಾಗಿ ರೂಪುಗೊಂಡಿತ್ತೆಂಬುದಕ್ಕೂ ಪ್ರಾಕೃತ ಭಾಷೆಯಲ್ಲಿಯೂ ತಮಿಳು ಭಾಷೆಯಲ್ಲಿಯೂ ಬರೆಯಲ್ಪಟ್ಟ ಶಾಸನಗಳಲ್ಲಿ ಕನ್ನಡದ ಶಬ್ದಗಳು ಬಳಕೆಯಾಗಿವೆಯೆಂದೂ ಇತಿಹಾಸ ತಜ್ಞ ಐರಾವತಂ ಮಹಾದೇವನ್ ಸಾಬೀತುಪಡಿಸಿದ್ದಾರೆ. ಆ ಸಂಶೋಧನೆಯ ಪ್ರಕಾರ ಕನ್ನಡ ಅಗಾಧ ಪ್ರಮಾಣದ ಜನತೆ ಮಾತನಾಡುತ್ತಿದ್ದ ಭಾಷೆಯಾಗಿದ್ದಿತೆಂದೂ ತಿಳಿದುಬಂದಿದೆ.[೧೫][೧೬][೧೭][೧೮][೧೯] ಕೆ.ವಿ. ನಾರಾಯಣರು ಹೇಳುವಂತೆ, ಇಂದಿಗೆ ಕನ್ನಡದ ಉಪಭಾಷೆಗಳೆಂದು ಗುರುತಿಸಲ್ಪಡುವ ಭಾಷೆಗಳಲ್ಲಿ ಹೆಚ್ಚಿನವು ಕನ್ನಡದ ಹಳೆಯ ರೂಪವನ್ನು ಹೋಲುವಂಥವಾಗಿರಬಹುದು. ಅಲ್ಲದೆ ಅನ್ಯ ಭಾಷೆಗಳ ಪ್ರಭಾವ ವ್ಯಾಪಕವಾಗಿ ಒಳಗಾಗದ ಭಾಷೆಗಳು ಇವೆಂದೂ ಅಭಿಪ್ರಾಯಪಡುತ್ತಾರೆ";
	     boolean kanada = true;
	     for (int ii=0; ii<string.length(); ii++) {
	         char character = string.charAt(ii);
	         if (!(character >= 0x0C80 && character<= 0x0CFF)) {
	              kanada = false;
	         }else{
	             kanadaunicode.append( "\\u0" ).append( Integer.toHexString(character) );
	         }
	     }

	     String unicodeKanada = ""+kanadaunicode.toString()+"";
	     String ax=kanadaunicode.toString();
	     
	   //  byte[] bytes = new byte[10];
	     byte[] bytes = ax.getBytes(Charset.forName("UTF-8"));

	     String str = new String(bytes);

	     System.out.println(str);
	   

	     String a="\u0c95\u0cb3\u0cc6\u0ca6\u0cb6\u0ca4\u0cae\u0cbe\u0ca8\u0ca6\u0cb2\u0ccd\u0cb2\u0cbf\u0c8e\u0c82\u0ca6\u0cb0\u0cc6\u0ce8\u0ce6\u0ca8\u0cc6\u0caf\u0cb6\u0ca4\u0cae\u0cbe\u0ca8\u0ca6\u0cb2\u0ccd\u0cb2\u0cbf\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0cad\u0cbe\u0cb7\u0cc6\u0caf\u0c85\u0cad\u0cbf\u0cb5\u0cc3\u0ca6\u0ccd\u0ca7\u0cbf\u0cac\u0cb9\u0cb3\u0cb5\u0ccd\u0caf\u0cbe\u0caa\u0c95\u0cb5\u0cbe\u0c97\u0cbf\u0ca8\u0ca1\u0cc6\u0caf\u0cbf\u0ca4\u0cc1\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0cad\u0cbe\u0cb7\u0cc6\u0caf\u0cc1\u0c85\u0cad\u0cbf\u0c9c\u0cbe\u0ca4\u0cad\u0cbe\u0cb7\u0cc6\u0caf\u0cc6\u0c82\u0cac\u0cb8\u0ccd\u0ca5\u0cbe\u0ca8\u0cae\u0cbe\u0ca8\u0cb5\u0ca8\u0ccd\u0ca8\u0cc1\u0c95\u0cc7\u0c82\u0ca6\u0ccd\u0cb0\u0cb8\u0cb0\u0c95\u0cbe\u0cb0\u0ca6\u0cbf\u0c82\u0ca6\u0caa\u0ca1\u0cc6\u0ca6\u0cbf\u0ca6\u0cc6\u0c85\u0c82\u0ca4\u0cb0\u0c9c\u0cbe\u0cb2\u0ca6\u0cb2\u0ccd\u0cb2\u0cbf\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0cad\u0cbe\u0cb7\u0cc6\u0caf\u0cac\u0cb3\u0c95\u0cc6\u0caf\u0ca5\u0cc7\u0c9a\u0ccd\u0c9b\u0cb5\u0cbe\u0c97\u0cbf\u0ca6\u0cc6\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0cad\u0cbe\u0cb7\u0cc6\u0cb5\u0cbe\u0ca3\u0cbf\u0c9c\u0ccd\u0caf\u0c95\u0ccd\u0cb7\u0cc7\u0ca4\u0ccd\u0cb0\u0ca6\u0cb2\u0ccd\u0cb2\u0cbf\u0caf\u0cc2\u0cae\u0cc1\u0c82\u0c9a\u0cc2\u0ca3\u0cbf\u0caf\u0cad\u0cbe\u0cb7\u0cc6\u0caf\u0cbe\u0c97\u0cbf\u0cac\u0cc6\u0cb3\u0cc6\u0caf\u0ca4\u0cca\u0ca1\u0c97\u0cbf\u0ca6\u0cc6\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0ca6\u0cb2\u0ccd\u0cb2\u0cbf\u0cb8\u0c82\u0cb8\u0ccd\u0c95\u0cc3\u0ca4\u0ca6\u0caa\u0ccd\u0cb0\u0cad\u0cbe\u0cb5\u0c85\u0cb8\u0cbe\u0ca7\u0cbe\u0cb0\u0ca3\u0cb5\u0cbe\u0ca6\u0cc1\u0ca6\u0cc1\u0caa\u0ccd\u0cb0\u0cbe\u0c95\u0cc3\u0ca4\u0caa\u0cbe\u0cb3\u0cbf\u0cae\u0cc1\u0c82\u0ca4\u0cbe\u0ca6\u0cad\u0cbe\u0cb7\u0cc6\u0c97\u0cb3\u0caa\u0ccd\u0cb0\u0cad\u0cbe\u0cb5\u0cb5\u0cc2\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0c95\u0ccd\u0c95\u0cbf\u0ca6\u0cc6\u0c95\u0ccd\u0cb0\u0cbf\u0caa\u0cc2\u0cae\u0cc2\u0cb0\u0ca8\u0cc6\u0caf\u0cb6\u0ca4\u0cae\u0cbe\u0ca8\u0c95\u0ccd\u0c95\u0cc2\u0cae\u0cc1\u0ca8\u0ccd\u0ca8\u0cb5\u0cc7\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0cae\u0ccc\u0c96\u0cbf\u0c95\u0caa\u0cb0\u0c82\u0caa\u0cb0\u0cc6\u0caf\u0cad\u0cbe\u0cb7\u0cc6\u0caf\u0cbe\u0c97\u0cbf\u0cb0\u0cc2\u0caa\u0cc1\u0c97\u0cca\u0c82\u0ca1\u0cbf\u0ca4\u0ccd\u0ca4\u0cc6\u0c82\u0cac\u0cc1\u0ca6\u0c95\u0ccd\u0c95\u0cc2\u0caa\u0ccd\u0cb0\u0cbe\u0c95\u0cc3\u0ca4\u0cad\u0cbe\u0cb7\u0cc6\u0caf\u0cb2\u0ccd\u0cb2\u0cbf\u0caf\u0cc2\u0ca4\u0cae\u0cbf\u0cb3\u0cc1\u0cad\u0cbe\u0cb7\u0cc6\u0caf\u0cb2\u0ccd\u0cb2\u0cbf\u0caf\u0cc2\u0cac\u0cb0\u0cc6\u0caf\u0cb2\u0ccd\u0caa\u0c9f\u0ccd\u0c9f\u0cb6\u0cbe\u0cb8\u0ca8\u0c97\u0cb3\u0cb2\u0ccd\u0cb2\u0cbf\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0ca6\u0cb6\u0cac\u0ccd\u0ca6\u0c97\u0cb3\u0cc1\u0cac\u0cb3\u0c95\u0cc6\u0caf\u0cbe\u0c97\u0cbf\u0cb5\u0cc6\u0caf\u0cc6\u0c82\u0ca6\u0cc2\u0c87\u0ca4\u0cbf\u0cb9\u0cbe\u0cb8\u0ca4\u0c9c\u0ccd\u0c9e\u0c90\u0cb0\u0cbe\u0cb5\u0ca4\u0c82\u0cae\u0cb9\u0cbe\u0ca6\u0cc7\u0cb5\u0ca8\u0ccd\u0cb8\u0cbe\u0cac\u0cc0\u0ca4\u0cc1\u0caa\u0ca1\u0cbf\u0cb8\u0cbf\u0ca6\u0ccd\u0ca6\u0cbe\u0cb0\u0cc6\u0c86\u0cb8\u0c82\u0cb6\u0ccb\u0ca7\u0ca8\u0cc6\u0caf\u0caa\u0ccd\u0cb0\u0c95\u0cbe\u0cb0\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0c85\u0c97\u0cbe\u0ca7\u0caa\u0ccd\u0cb0\u0cae\u0cbe\u0ca3\u0ca6\u0c9c\u0ca8\u0ca4\u0cc6\u0cae\u0cbe\u0ca4\u0ca8\u0cbe\u0ca1\u0cc1\u0ca4\u0ccd\u0ca4\u0cbf\u0ca6\u0ccd\u0ca6\u0cad\u0cbe\u0cb7\u0cc6\u0caf\u0cbe\u0c97\u0cbf\u0ca6\u0ccd\u0ca6\u0cbf\u0ca4\u0cc6\u0c82\u0ca6\u0cc2\u0ca4\u0cbf\u0cb3\u0cbf\u0ca6\u0cc1\u0cac\u0c82\u0ca6\u0cbf\u0ca6\u0cc6\u0ce7\u0ceb\u0ce7\u0cec\u0ce7\u0ced\u0ce7\u0cee\u0ce7\u0cef\u0c95\u0cc6\u0cb5\u0cbf\u0ca8\u0cbe\u0cb0\u0cbe\u0caf\u0ca3\u0cb0\u0cc1\u0cb9\u0cc7\u0cb3\u0cc1\u0cb5\u0c82\u0ca4\u0cc6\u0c87\u0c82\u0ca6\u0cbf\u0c97\u0cc6\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0ca6\u0c89\u0caa\u0cad\u0cbe\u0cb7\u0cc6\u0c97\u0cb3\u0cc6\u0c82\u0ca6\u0cc1\u0c97\u0cc1\u0cb0\u0cc1\u0ca4\u0cbf\u0cb8\u0cb2\u0ccd\u0caa\u0ca1\u0cc1\u0cb5\u0cad\u0cbe\u0cb7\u0cc6\u0c97\u0cb3\u0cb2\u0ccd\u0cb2\u0cbf\u0cb9\u0cc6\u0c9a\u0ccd\u0c9a\u0cbf\u0ca8\u0cb5\u0cc1\u0c95\u0ca8\u0ccd\u0ca8\u0ca1\u0ca6\u0cb9\u0cb3\u0cc6\u0caf\u0cb0\u0cc2\u0caa\u0cb5\u0ca8\u0ccd\u0ca8\u0cc1\u0cb9\u0ccb\u0cb2\u0cc1\u0cb5\u0c82\u0ca5\u0cb5\u0cbe\u0c97\u0cbf\u0cb0\u0cac\u0cb9\u0cc1\u0ca6\u0cc1\u0c85\u0cb2\u0ccd\u0cb2\u0ca6\u0cc6\u0c85\u0ca8\u0ccd\u0caf\u0cad\u0cbe\u0cb7\u0cc6\u0c97\u0cb3\u0caa\u0ccd\u0cb0\u0cad\u0cbe\u0cb5\u0cb5\u0ccd\u0caf\u0cbe\u0caa\u0c95\u0cb5\u0cbe\u0c97\u0cbf\u0c92\u0cb3\u0c97\u0cbe\u0c97\u0ca6\u0cad\u0cbe\u0cb7\u0cc6\u0c97\u0cb3\u0cc1\u0c87\u0cb5\u0cc6\u0c82\u0ca6\u0cc2\u0c85\u0cad\u0cbf\u0caa\u0ccd\u0cb0\u0cbe\u0caf\u0caa\u0ca1\u0cc1\u0ca4\u0ccd\u0ca4\u0cbe\u0cb0\u0cc6";

	     System.out.println(a);

	     for(byte byt:unicodeKanada.getBytes()){
	         char ch=(char) byt;
	     /*    String a1=Integer.toHexString((int) ch);
	         System.out.println(a1);*/


	     }

	 }
	 } 
