package wsd.ass;

import javax.xml.bind.annotation.*;

import java.io.Serializable;

/**
 * The Log class is a Bean/POJO which defines a
 * vehicle log entry within the system. It contains a 
 * sub-class Hidden which represents the attribute 'hidden'
 * and its own elements.
 * 
 * @author Calvin
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "log")
public class Log implements Serializable {
	/** Static default serial */
	private static final long serialVersionUID = 1L;

	/** The ID of the log. Unique. */
	@XmlElement(name = "id")
	private int id;
	
	/** The vehicle for the log entry */
	@XmlElement(name = "vehicle")
	private String vehicle;
	
	/** The ID of the driver who drove the vehicle */
	@XmlElement(name = "driver")
	private String driver;
	
	/** The date the vehicle was taken */
	@XmlElement(name = "startdate")
	private String startDate;
	
	/** The date the vehicle returned */
	@XmlElement(name = "enddate")
	private String endDate;
	
	/** The time the vehicle was taken */
	@XmlElement(name = "starttime")
	private String startTime;
	
	/** The time vehicle was returned */
	@XmlElement(name = "endtime")
	private String endTime;
	
	/** The description of the log entry */
	@XmlElement(name = "description")
	private String description;
	
	/** The kilometres clocked on the trip */
	@XmlElement(name = "kilometres")
	private int kilometres;
	
	/** A sub-class representing whether the log entry is hidden or not and by whom. */
	@XmlElement(name = "hidden")
	private Hidden hidden;

	/**
	 * No-args constructor required by JavaBean.
	 */
	public Log() {
		super();
	}

	/**
	 * Constructor to create a new log entry
	 * @param id Log ID
	 * @param vehicle Vehicle ID
	 * @param driver Driver ID
	 * @param startDate Start Date
	 * @param endDate End Date
	 * @param startTime Start Time
	 * @param endTime End Time
	 * @param description Description of entry
	 * @param kilometres Kilometres drive
	 * @param hidden Values for hidden entry
	 */
	public Log(int id, String vehicle, String driver, String startDate,
			String endDate, String startTime, String endTime,
			String description, int kilometres, Hidden hidden) {
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
		this.hidden = hidden;
	}

	/**
	 * A sub-class which holds the 'hidden' values
	 * of a log entry. This class represents whether a log entry
	 * is shown or hidden and whom it was hidden by.
	 * @author Calvin
	 *
	 */
	@XmlAccessorType(XmlAccessType.FIELD)
	@XmlRootElement(name = "hidden")
	public static class Hidden {
		
		/**
		 * An XML attribute to show (true) or hide (false) the log entry.
		 */
		@XmlAttribute
		private boolean show;

		/**
		 * A String representing the user who hid the log entry.
		 */
		@XmlValue
		private String hidden;

		/**
		 * No-args JavaBean constructor
		 */
		public Hidden() {

		}

		/**
		 * Constructor for class. Takes a boolean and String
		 * @param show Visibility of log entry.
		 * @param hidden User who hid log entry.
		 */
		public Hidden(boolean show, String hidden) {
			super();
			this.show = show;
			this.hidden = hidden;
		}

		/**
		 * Return the visibility of the log entry
		 * @return boolean representing visibility of the log entry
		 */
		public boolean getShow() {
			return show;
		}

		/**
		 * Set the visibility of the log entry
		 * @param show A boolean representing the visibility of the log entry
		 */
		public void setShow(boolean show) {
			this.show = show;
		}

		/**
		 * Return the user who hid the log entry
		 * @return ID of user who hid the log entry
		 */
		public String getHidden() {
			return hidden;
		}

		/**
		 * Set the user who hid the log entry
		 * @param hidden ID of user who hid the log entry
		 */
		public void setHidden(String hidden) {
			this.hidden = hidden;
		}
	}

	/**
	 * Get the Log ID
	 * @return ID of log file
	 */
	public int getId() {
		return id;
	}
	
	/**
	 * Set the Log ID
	 * @param id an integer for the log ID
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Get the vehicle for the log entry
	 * @return The registration number of the vehicle
	 */
	public String getVehicle() {
		return vehicle;
	}

	/**
	 * Set the vehicle for the log entry
	 * @param vehicle The registration number of the vehicle 
	 */
	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

	/**
	 * Get the driver for the log entry
	 * @return The email of the driver for the log entry
	 */
	public String getDriver() {
		return driver;
	}

	/**
	 * Set the driver for the log entry
	 * @param The email of the driver for the log entry
	 */
	public void setDriver(String driver) {
		this.driver = driver;
	}

	/**
	 * Get the start date for the long entry
	 * @return A String representing the start date of the log entry
	 */
	public String getStartDate() {
		return startDate;
	}

	/**
	 * Set the start date for the long entry
	 * @param A String representing the start date of the log entry
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	/**
	 * Get the visibility of the log entry
	 * @return a hidden object containing the visibility and user who hid it if applicable
	 */
	public Hidden getHidden() {
		return hidden;
	}

	/**
	 * Set the visibility of the log entry
	 * @param hidden a object containing the visibility and user who hid it if applicable
	 */
	public void setHidden(Hidden hidden) {
		this.hidden = hidden;
	}

	/**
	 * Get the end date for the log entry
	 * @return the end date of the log entry
	 */
	public String getEndDate() {
		return endDate;
	}

	/**
	 * Set the end date for the log entry
	 * @param endDate the end date for the log entry
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	/**
	 * Get the start time for the long entry
	 * @return the start time of the log entry
	 */
	public String getStartTime() {
		return startTime;
	}

	/**
	 * Set the start time for the log entry
	 * @param startTime the start time for the log entry
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	/**
	 * Get the end time for the log entry
	 * @return The end time for the log entry in HH:MM:SS format
	 */
	public String getEndTime() {
		return endTime;
	}

	/**
	 * Set the end time for the log entry
	 * @param endTime the end time for the log entry in HH:MM:SS format
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	/**
	 * Get the description of the log entry
	 * @return the description of the log entry
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Set the description of the log entry
	 * @param description A String representing the description of the log entry
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Get the kilometres of the log entry
	 * @return the kilometres of the log entry
	 */
	public int getKilometres() {
		return kilometres;
	}

	/**
	 * Set the kilometres of the log entry
	 * @param kilometres the kilometres for the log entry
	 */
	public void setKilometres(int kilometres) {
		this.kilometres = kilometres;
	}
}