package wsd.ass;
import javax.xml.bind.annotation.*;

import java.util.*;
import java.io.Serializable;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="users")
public class Users implements Serializable {
    /**
	 * 
	 */
	@XmlElement(name = "user")
	private ArrayList<User> users = new ArrayList<User>();

	public ArrayList<User> getUsers() {
        return users;
    }
	
    public void addUser(User user) {
        users.add(user);
    }
    
    public void removeUser(User user) {
        users.remove(user);
    }
	
    public User login(String username, String password) {
        // For each user in the list...
        for (User user : users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
    
}
