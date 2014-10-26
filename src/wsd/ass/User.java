package wsd.ass;

import javax.xml.bind.annotation.*;

import java.io.Serializable;

/**
 * The User class is a Bean/POJO which defines a
 * driver or administrator within the system. Users are
 * unique based on their email.
 * 
 * @author Calvin
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="user")
public class User implements Serializable {
	/** Static default serial */
	private static final long serialVersionUID = 1L;

	/** The type of user, either Administrator or Driver */
	@XmlElement(name="type")
	private String type;
	
	/** The user's email address. Must be unique */
	@XmlElement(name="username")
	private String username;
	
	/** The user's password to authenticate their account */
	@XmlElement(name="password")
	private String password;
	
	/** The user's first name */
	@XmlElement(name="firstname")
	private String firstname;
	
	/** The user's last name */
	@XmlElement(name="lastname")
	private String lastname;
	
	/**
	 * No-args constructor required by JavaBean.
	 */
	public User () {
		super();
	}
	
	/**
	 * Constructor to create a new user.
	 * @param type the type of user, 'admin' or 'driver'
	 * @param username the user's email address
	 * @param password the user's password
	 * @param firstname the user's first name
	 * @param lastname the user's last name
	 */
	public User(String type, String username, String password, String firstname, String lastname) {
		super();
		this.type = type;
		this.username = username;
		this.password = MD5.hash(password);
		this.firstname = firstname;
		this.lastname = lastname;
	}

	/**
	 * Get the type of the user.
	 * @return the type of user, either 'admin' or 'driver'
	 */
	public String getType() {
		return type;
	}
	
	/**
	 * Set the type of the user.
	 * @param type the type of the user, either 'admin' or 'driver'
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * Get the user's email address
	 * @return the user's email address.
	 */
	public String getUsername() {
		return username;
	}
	
	/**
	 * Set the user's email address
	 * @param username the user's email address. Must contain the proper syntax of 'username'@['subdomain'].'domain'.'gtld'
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**
	 * Get the user's password
	 * @return the user's password.
	 */
	public String getPassword() {
		return password;
	}
	
	/**
	 * Set the user's password
	 * @param password the user's password. 
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * Get the user's first name.
	 * @return the user's first name.
	 */
	public String getFirstname() {
		return firstname;
	}
	
	/**
	 * Set the user's first name
	 * @param firstname the user's first name. Must only contain alphabet characters.
	 */
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	/**
	 * Get the user's last name
	 * @return the user's last name
	 */
	public String getLastname() {
		return lastname;
	}
	
	/**
	 * Set the user's last name
	 * @param lastname the user's last name. Must only contain alphabet characters.
	 */
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
}
