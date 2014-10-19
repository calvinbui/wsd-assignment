package wsd.ass;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.xml.bind.JAXBException;

public interface ApplicationFactory {
	public void marshall() throws JAXBException, FileNotFoundException;
	public void unmarshall() throws JAXBException, IOException;
	public String getFilePath();
	public void setFilePath(String filePath);
	public void add(Object object) throws FileNotFoundException, JAXBException;
	public Object get();
	public void set(Object object);
}
