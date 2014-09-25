package wsd.ass;

import java.util.Date;

import javax.xml.bind.annotation.*;

@XmlRootElement(name="vehicle")
@XmlAccessorType(XmlAccessType.FIELD)
public class Vehicle implements java.io.Serializable {
	
	@XmlElement(name="registration")
	private String registration;
	@XmlElement(name="type")
	private String type;
	@XmlElement(name="make")
	private String make;
	@XmlElement(name="model")
	private String model;
	@XmlElement(name="year")
	private int year;
	@XmlElement(name="colour")
	private String colour;
	@XmlElement(name="kilometres")
	private int kilometres;
	
	public Vehicle() {
		super();
	}
	
	public Vehicle(String registration, String type, String make, String model,
			int year, String colour, int kilometres) {
		super();
		this.registration = registration;
		this.type = type;
		this.make = make;
		this.model = model;
		this.year = year;
		this.colour = colour;
		this.kilometres = kilometres;
	}

	public String getRegistration() {
		return registration;
	}
	public void setRegistration(String registration) {
		this.registration = registration;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getColour() {
		return colour;
	}
	public void setColour(String colour) {
		this.colour = colour;
	}
	public int getKilometres() {
		return kilometres;
	}
	public void setKilometres(int kilometres) {
		this.kilometres = kilometres;
	}
	
	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}
}	
