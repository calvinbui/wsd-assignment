package wsd.ass;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.xml.bind.JAXBException;

/**
 * The ApplicationFactory interface provides an interface for creating 'application' classes
 * 
 * In this project, application classes are those that are the controller between
 * the xml files and the javabeans/pojo
 * 
 * @author Calvin and Janette
 *
 */
public interface ApplicationFactory {
	public void marshall() throws JAXBException, FileNotFoundException;
	public void unmarshall() throws JAXBException, IOException;
	public String getFilePath();
	public void setFilePath(String filePath);
	public void add(Object object) throws FileNotFoundException, JAXBException;
	public Object get();
	public void set(Object object);
}
