package wsd.ass;
import javax.xml.bind.annotation.*;

import java.util.*;
import java.io.Serializable;

/**
 * The Logs class is used to store all log entries (of type Log) into an
 * ArrayList to be better and easily managed.
 * @author Calvin
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="logs", namespace="http://www.wsd.com/log")
public class Logs implements Serializable {
	/** Static default serial */
	private static final long serialVersionUID = 1L;
	
    /** The ArrayList containing all log entries (Log.class) */
	@XmlElement(name = "log")
	private ArrayList<Log> logs = new ArrayList<Log>();

	/**
	 * Get the ArrayList of log entries
	 * @return an ArrayList of Log objects
	 */
	public ArrayList<Log> getLogs() {
        return logs;
    }
	
	/**
	 * Add a log entry to the ArrayList
	 * @param log a log entry of type Log
	 */
    public void addLog(Log log) {
        logs.add(log);
    }
    
    /**
     * Remove a log entry from the ArrayList
     * @param log a log entry of type Log
     */
    public void removeLog(Log log) {
        logs.remove(log);
    }
    
    /**
     * Query the unmarshalled Log xml to find specific information about it. Encapsulated
     * within a switch statement. Takes a 'query' which can be a date, registration number,
     * keyword or boolean and the 'type' of information to find.
     * 
     * @param query the information to search for
     * @param type the type of information to search for
     * @return an ArrayList containing the information searched for.
     */
    public ArrayList<Log> getList(String query, String type) {
    	// initialise a new ArrayList to begin adding to it
    	ArrayList<Log> list = new ArrayList<Log>();
    	
    	// for each log entry in the ArrayList
    	for (Log log: logs) {
    		// depending on the type of information requested from the log entry it is
    		switch (type) {
    		// if it is a date of a log date, return all log entries with the same start date.
    		case "date":
    			// if the date equals a log entry's starting date
    			if (log.getStartDate().equals(query))
    				// add the log entry to the ArrayList
                    list.add(log);
    			break;
    		// if it is a registration number of a vehicle, returns all log entries for a vehicle
    		case "registration":
    			// if the registration number matches a vehicle's 
                if (log.getVehicle().equals(query))
                	// add the log entry to the ArrayList
                    list.add(log); 
                break;
    		// if it is a keyword of a log entry, returns all log entries containing the keyword within their description
    		case "keyword":
    			// if the description contains the keyword
                if (log.getDescription().contains(query))
                	// add the log entry to the ArrayList
                    list.add(log); 
                break;
            // if it is the visibility of a log entry, return all log entries with the matching boolean
    		case "visibility":
    			// if the log entry matches the boolean
    			if (log.getHidden().getShow() == Boolean.valueOf(query)) // value of the String 'true' or 'false' into a Boolean data type
    				// add the log entry to the ArrayList
        			list.add(log);  
    			break;
    		}
    	}
    	// return the finished ArrayList
		return list;
    }
}
