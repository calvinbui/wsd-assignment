package wsd.ass;
 
import java.util.*;
import java.io.*;
import javax.xml.bind.*;
 
public class TestUser implements Serializable {
 public static void main(String[] args) throws Exception {
  Users users = new Users();
  users.addUser(new User("driver", "ryan@ryanheise.com", "hello", "Ryan", "Heise"));
  users.addUser(new User("admin", "joe@bloggs.com", "foobar", "Joe", "Bloggs"));
  // Boilerplate code to convert objects to XML...
  JAXBContext jc = JAXBContext.newInstance(Users.class);
  Marshaller m = jc.createMarshaller();
  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
  m.marshal(users, System.out);
 }
}