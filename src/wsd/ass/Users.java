package wsd.ass;

import javax.xml.bind.annotation.*;

import java.util.*;
import java.io.Serializable;

/**
 * The Users class is used to store all users (of type User) into an
 * ArrayList to be better and easily managed.
 * 
 * @author Calvin
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users", namespace = "http://www.wsd.com/user")
public class Users implements Serializable {
	/** Static default serial */
	private static final long serialVersionUID = 1L;
	
	/** The ArrayList containing all user (User.class) */
	@XmlElement(name = "user")
	private ArrayList<User> users = new ArrayList<User>();

	/**
	 * Get the ArrayList of users
	 * @return an ArrayList of User objects
	 */
	public ArrayList<User> getUsers() {
		return users;
	}

	/**
	 * Add a user to the ArrayList
	 * @param user a user of type User
	 */
	public void addUser(User user) {
		users.add(user);
	}

	/**
	 * Remove a user from the ArrayList
	 * @param user a user of type User
	 */
	public void removeUser(User user) {
		users.remove(user);
	}

	/**
	 * Login method.
	 * Validate a user's credentials against the ArrayList of users.
	 * Return matched user.
	 * @param username user inputed username/email
	 * @param password user inputed password
	 * @return user with matching username and password
	 */
	public User login(String username, String password) {
		// For each user in the list...
		for (User user : users) {
			// if username matches and password matches
			if (user.getUsername().equals(username) && user.getPassword().equals(password))
				return user; // Login correct. Return this user.
		}
		return null; // Login incorrect. Return null.
	}
}
