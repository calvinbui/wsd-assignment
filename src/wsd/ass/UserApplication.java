package wsd.ass;

import java.io.FileInputStream;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class UserApplication {
	/** */
	private String filePath;
	/** All users encapsulated within an ArrayList */
	private Users users;
	
	public String getFilePath() {
		return filePath;
	}
	
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

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}
}
