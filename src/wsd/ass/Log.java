package wsd.ass;

import javax.xml.bind.annotation.*;

import java.io.Serializable;
import java.util.ArrayList;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="log")
public class Log implements Serializable {
	
	@XmlElement (name="id")
	private int id;
	@XmlElement (name="vehicle")
	private String vehicle;
	@XmlElement (name="driver")
	private String driver;
	@XmlElement (name="startdate")
	private String startDate;
	@XmlElement (name="enddate")
	private String endDate;
	@XmlElement (name="starttime")
	private String startTime;
	@XmlElement (name="endtime")
	private String endTime;
	@XmlElement (name="description")
	private String description;
	@XmlElement (name="kilometres")
	private int kilometres;
	@XmlElement (name="hiddenBy")
	private String hiddenBy;
	
	public Log() {
		super();
	}
	
	public Log(int id, String vehicle, String driver, String startDate, String endDate,
			String startTime, String endTime, String description, int kilometres, String hiddenBy) {
		super();
		this.id = id;
		this.vehicle = vehicle;
		this.driver = driver;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.description = description;
		this.kilometres = kilometres;
		this.hiddenBy = hiddenBy;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getVehicle() {
		return vehicle;
	}

	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getKilometres() {
		return kilometres;
	}
	public void setKilometres(int kilometres) {
		this.kilometres = kilometres;
	}
	
	
	

}