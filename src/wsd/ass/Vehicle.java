package wsd.ass;

import java.io.Serializable;

import javax.xml.bind.annotation.*;

/**
 * @author Calvin
 *
 */
@XmlRootElement(name="vehicle")
@XmlAccessorType(XmlAccessType.FIELD)
public class Vehicle implements Serializable {
	/** Static default serial */
	private static final long serialVersionUID = 1L;
	
	/** A vehicle's registration number */
	@XmlElement(name="registration")
	private String registration;
	
	/** The type of the vehicle */
	@XmlElement(name="type")
	private String type;
	
	/** The make of the vehicle */
	@XmlElement(name="make")
	private String make;
	
	/** The model of the vehicle */
	@XmlElement(name="model")
	private String model;
	
	/** The year of manufacture for the vehicle */
	@XmlElement(name="year")
	private int year;
	
	/** The colour of the vehicle */
	@XmlElement(name="colour")
	private String colour;
	
	/** The kilometres to date with the vehicle */
	@XmlElement(name="kilometres")
	private int kilometres;
	
	/**
	 * No-args constructor required by JavaBean.
	 */
	public Vehicle() {
		super();
	}
	
	/**
	 * Constructor to create a new vehicle
	 * @param registration vehicle registration number 
	 * @param type vehicle type
	 * @param make vehicle make
	 * @param model vehicle model
	 * @param year vehicle year of manufacture
	 * @param colour vehicle colour
	 * @param kilometres vehicle kilometres to date
	 */
	public Vehicle(String registration, String type, String make, String model, int year, String colour, int kilometres) {
		super();
		this.registration = registration;
		this.type = type;
		this.make = make;
		this.model = model;
		this.year = year;
		this.colour = colour;
		this.kilometres = kilometres;
	}

	/**
	 * Get the vehicle's registration number
	 * @return the vehicle's registration number
	 */
	public String getRegistration() {
		return registration;
	}
	
	/**
	 * Set the vehicle's registration number
	 * @param registration the vehicle's registration number
	 */
	public void setRegistration(String registration) {
		this.registration = registration;
	}
	
	/**
	 * Get the type of the vehicle
	 * @return the type of the vehicle e.g. Car, Minibus, Ute, etc.
	 */
	public String getType() {
		return type;
	}
	
	/**
	 * Set the type of the vehicle
	 * @param type the type of the vehicle
	 */
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * Get the model of the vehicle
	 * @return the model of the vehicle
	 */
	public String getModel() {
		return model;
	}
	
	/**
	 * Set the model of the vehicle
	 * @param model the model of the vehicle
	 */
	public void setModel(String model) {
		this.model = model;
	}
	
	/**
	 * Get the year of the vehicle
	 * @return the year of the vehicle's manufacture
	 */
	public int getYear() {
		return year;
	}
	
	/**
	 * Set the year of the vehicle
	 * @param year the year of the vehicle's manufacture
	 */
	public void setYear(int year) {
		this.year = year;
	}
	
	/**
	 * Get the colour of the vehicle
	 * @return the colour of the vehicle
	 */
	public String getColour() {
		return colour;
	}
	
	/**
	 * Set the colour of the vehicle
	 * @param colour the colour of the vehicle
	 */
	public void setColour(String colour) {
		this.colour = colour;
	}
	
	/**
	 * Get the kilometres travelled for the vehicle
	 * @return the kilometres travelled
	 */
	public int getKilometres() {
		return kilometres;
	}
	
	/**
	 * Set the kilometres travelled by the vehicle
	 * @param kilometres the kilometres travelled
	 */
	public void setKilometres(int kilometres) {
		this.kilometres = kilometres;
	}
	
	/**
	 * Get the make of the vehicle
	 * @return the make of the vehicle
	 */
	public String getMake() {
		return make;
	}

	/**
	 * Set the make of the vehicle
	 * @param make the make of the vehicle
	 */
	public void setMake(String make) {
		this.make = make;
	}
	
	/**
	 * Update the kilometres travelled by the vehicle
	 * @param kilometres the kilometres travelled in the latest drive
	 */
	public void updateKilometres(int kilometres) {
		this.kilometres += kilometres;
	}
}
