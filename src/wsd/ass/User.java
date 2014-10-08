package wsd.ass;

import javax.xml.bind.annotation.*;

import java.io.Serializable;

/**
 * 
 * @author Calvin
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="user")
public class User implements Serializable {
	/**  */
	@XmlElement(name="type")
	private String type;
	
	/**  */
	@XmlElement(name="username")
	private String username;
	
	/**  */
	@XmlElement(name="password")
	private String password;
	
	/**  */
	@XmlElement(name="firstname")
	private String firstname;
	
	/**  */
	@XmlElement(name="lastname")
	private String lastname;
	
	/**
	 * 
	 */
	public User () {
		
	}
	
	/**
	 * 
	 * @param type
	 * @param username
	 * @param password
	 * @param firstname
	 * @param lastname
	 */
	public User(String type, String username, String password,
			String firstname, String lastname) {
		super();
		this.type = type;
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
	}

	/**
	 * 
	 * @return
	 */
	public String getType() {
		return type;
	}
	
	/**
	 * 
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getUsername() {
		return username;
	}
	
	/**
	 * 
	 * @param username
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getPassword() {
		return password;
	}
	
	/**
	 * 
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getFirstname() {
		return firstname;
	}
	
	/**
	 * 
	 * @param firstname
	 */
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getLastname() {
		return lastname;
	}
	
	/**
	 * 
	 * @param lastname
	 */
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
}
