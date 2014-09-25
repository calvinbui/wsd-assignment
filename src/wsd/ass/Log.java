package wsd.ass;

import javax.xml.bind.annotation.*;

import java.io.Serializable;
import java.util.Date;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="log")
public class Log implements Serializable {
	
	@XmlElement (name="id")
	private int id;
	@XmlElement (name="driver")
	private String driver;
	@XmlElement (name="startdate")
	private Date startDate;
	@XmlElement (name="enddate")
	private Date endDate;
	@XmlElement (name="starttime")
	private Date startTime;
	@XmlElement (name="endtime")
	private Date endTime;
	@XmlElement (name="description")
	private String description;
	@XmlElement (name="kilometres")
	private int kilometres;
	private Hidden hidden;	
	
	public Log(int id, String driver, Date startDate, Date endDate,
			Date startTime, Date endTime, String description, int kilometres, Hidden hidden) {
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
	public class Hidden {
		@XmlAttribute
		private boolean value;
		
		@XmlValue
		private String hidden;

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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
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