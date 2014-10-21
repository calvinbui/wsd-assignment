package wsd.ass.soap;

import java.io.IOException;

import javax.xml.bind.JAXBException;

public interface SOAPServiceFactory {
	public Object getApp() throws JAXBException, IOException;
	public Object fetch() throws JAXBException, IOException;
}
