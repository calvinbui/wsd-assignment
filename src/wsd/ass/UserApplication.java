package wsd.ass;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
/**
 * The User Application class connects the User XML file to the POJOs/JavaBeans (User and Users).
 * 
 * It is the middleman for interacting with the underlying data through other classes.
 * 
 * @author Calvin and Janette
 *
 */
public class UserApplication implements ApplicationFactory {
	/** The path of the XML file storing all users */
	private String filePath;
	/** All users encapsulated within an ArrayList */
	private Users users;
	
	/** Get the path of the XML file storing all users */
	public String getFilePath() {
		return filePath;
	}
	
	/** Set the path of the XML file storing all users */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	/**
	 * Unmarshall the User XML file into the Users ArrayList.
	 * @throws JAXBException if Vehicle class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	public void unmarshall() throws JAXBException, IOException {
		// Define the class to transform the XML file into using JAXB
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        
        // Create the unmarshaller
        Unmarshaller u = jc.createUnmarshaller();

        // load the file into from its location (filepath)
        FileInputStream fin = new FileInputStream(filePath);
        
        // unmarshall the object from the file into the ArrayList
		users = (Users) u.unmarshal(fin);
		
        // close the file input stream and release the lock on it
		fin.close();		
	}

	/**
	 * Marshal the users object back into xml format and output it to the filepath
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	public void marshall() throws JAXBException, FileNotFoundException {
		JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        m.marshal(users, new FileOutputStream(getFilePath()));
	}
	
	/**
	 * Add a new user to the users object and then marshal it back into xml
	 * @param user The new user to add
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	public void add(Object object) throws FileNotFoundException, JAXBException {
		users.addUser((User) object);
		marshall();
	}

	/** Get all users */
	public Object get() {
		return users;
	}

	/** Set all users
	 *  @param users The users object
	 */
	public void set(Object object) {
		this.users = (Users) object;
	}
}
