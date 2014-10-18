/**
 * 
 */
package wsd.ass;

import java.util.*;
import java.io.*;
import javax.xml.bind.*;

/**
 * @author chaui_000
 *
 */
public class TestJAXB implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Users users = new Users();
		users.addUser(new User("ryan@ryanheise.com", "Ryan Heise", "blahblah", "male", "green"));
		users.addUser(new User("joe@bloggs.com", "Joe Bloggs", "foobar", "male", "yellow"));
		// Boilerplate code to convert objects to XML...
		JAXBContext jc = JAXBContext.newInstance(Users.class);
		Marshaller m = jc.createMarshaller();
		m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		m.marshal(users, System.out);
	}

}
