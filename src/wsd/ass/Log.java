package wsd.ass;

import javax.xml.bind.annotation.*;

import java.io.Serializable;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="log")
public class Log implements Serializable {
	
	@XmlElement (name="id")
	private int id;
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
	private Hidden hidden;	
	
	public Log() {
		super();
	}
	
	public Log(int id, String driver, String startDate, String endDate,
			String startTime, String endTime, String description, int kilometres, Hidden hidden) {
		super();
		this.id = id;
		this.driver = driver;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.description = description;
		this.kilometres = kilometres;
		this.hidden = new Hidden();
	}
	@XmlAccessorType(XmlAccessType.FIELD)
	@XmlRootElement(name="hidden")
	public static class Hidden {
		@XmlAttribute
		protected boolean value;
		
		@XmlValue
		protected String hidden;

		public Hidden() {

		}

		public Hidden(boolean value, String hidden) {
			super();
			this.value = value;
			this.hidden = hidden;
		}

		public boolean isValue() {
			return value;
		}

		public void setValue(boolean value) {
			this.value = value;
		}

		public String getHidden() {
			return hidden;
		}

		public void setHidden(String hidden) {
			this.hidden = hidden;
		}
		
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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