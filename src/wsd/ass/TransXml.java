/**
 * 
 */
package wsd.ass;

import java.io.File;
import java.io.FileOutputStream;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

/**
 * @author chaui_000
 *
 */
public class TransXml {
	public static void main(String args[])
	{
		try
		{
			// Load StreamSource objects with XML and XSLT files
		      StreamSource xmlSource = 
		      new StreamSource( new File("vehicle.xml") );
		      StreamSource xsltSource = 
		      new StreamSource( new File("vehiclerest.xsl") );
		      
		      // Create a StreamResult pointing to the output file 
		      StreamResult fileResult = 
		      new StreamResult(new FileOutputStream("vehicle/{rego}.xml"));
		      
		      // Load a Transformer object and perform the transformation
		      TransformerFactory tfFactory =
		      TransformerFactory.newInstance();
		      Transformer tf = tfFactory.newTransformer(xsltSource);
		      tf.transform(xmlSource, fileResult);
		}
		catch (Exception e) { e.printStackTrace(); }
	}
}
