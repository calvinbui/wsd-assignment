/**
 * 
 */
package wsd.ass.rest;

import java.io.IOException;

import javax.xml.bind.JAXBException;

/**
 * 
 * The RESTServiceFactory  provides an interface for creating classes containing REST web service methods
 * 
 * @author Calvin
 *
 */
public interface RESTServiceFactory {
	public Object getApp() throws JAXBException, IOException;
	public Object fetch() throws JAXBException, IOException;
}
