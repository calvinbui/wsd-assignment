package wsd.ass.soap;

import java.io.IOException;

import javax.xml.bind.JAXBException;

/**
 * The SOAP ServiceFactory  provides an interface for creating classes containing SOAP web service methods
 *
 */
public interface SOAPServiceFactory {
	public Object getApp() throws JAXBException, IOException;
	public Object fetch() throws JAXBException, IOException;
}
