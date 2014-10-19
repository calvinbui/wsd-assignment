package wsd.ass;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import wsd.ass.Logs;
import wsd.ass.Log.Hidden;

/**
 * The Log Application class connects the Log XML file to the POJOs/JavaBeans (Log and Logs).
 * 
 * It is the middleman for interacting with the underlying data through other classes.
 * 
 * @author Calvin
 *
 */
public class LogApplication implements ApplicationFactory{
	/** The path of the XML file */
	private String filePath;
	
	/** All log entries encapsulated within an ArrayList */
	private Logs logs;
	
	/**
	 * Get the file path of the XML file
	 * @return the filepath of the XML file
	 */
	@Override
	public String getFilePath() {
		return filePath;
	}
	
	/**
	 * Set the filepath of the XML file 
	 * @param filePath the filepath to be set
	 */
	@Override
	public void setFilePath(String filePath) {
        // set the filepath
		this.filePath = filePath;
    }
	
	/**
	 * Unmarshall the Log XML file into the Logs ArrayList.
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@Override
	public void unmarshall()  throws JAXBException, IOException {
		// Define the class to transform the XML file into using JAXB
        JAXBContext jc = JAXBContext.newInstance(Logs.class);
        
        // Create the unmarshaller
        Unmarshaller u = jc.createUnmarshaller();

        // load the file into from its location (filepath)
        FileInputStream fin = new FileInputStream(filePath);
        
        // unmarshall the object from the file into the ArrayList
        logs = (Logs)u.unmarshal(fin);
        
        // close the file input stream and release the lock on it
        fin.close();
	}
	
	/**
	 * Marshal the logs object back into xml format and output it to the filepath
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	@Override
	public void marshall() throws JAXBException, FileNotFoundException {
		JAXBContext jc = JAXBContext.newInstance(Logs.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        m.marshal(logs, new FileOutputStream(getFilePath()));
	}

	/**
	 * Add a new log entry to the logs object then marshall it back into xml
	 * @param vehicle Vehicle ID
	 * @param driver Driver ID
	 * @param startDate Start Date
	 * @param endDate End Date
	 * @param startTime Start Time
	 * @param endTime End Time
	 * @param description Description of entry
	 * @param kilometres Kilometres drive
	 */
	@Override
	public void add(Object object) throws FileNotFoundException, JAXBException {
		Log log = (Log) object;
		log.setId(logs.getLogs().get(logs.getLogs().size()-1).getId() + 1);
		log.setHidden(new Hidden(true, ""));
		logs.addLog(log);
		marshall();
	}


	/**
	 * Get all log entries
	 * @return an ArrayList containing all the log files
	 */
	@Override
	public Object get() {
		return logs;
	}

	/**
	 * Set all log entries
	 * @param logs an ArrayList containing all log files
	 */
	@Override
	public void set(Object object) {
		this.logs = (Logs) object;
	}

    /**
     * Hide a log entry by setting its status to false.
     * Also set the name of the user who hid it.
     * Marshalls the changes back into the XML when finished.
     * @param id the the log's id.
     * @param user the user who deleted the log.
     * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
     */
    public void hideLog(int id, String user) throws FileNotFoundException, JAXBException {
		for (Log log : logs.getLogs()) {
			if (log.getId() == id) {
				log.getHidden().setHidden(user);
				log.getHidden().setShow(false);
			}
		}
		marshall();
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
    	ArrayList<Log> results = new ArrayList<Log>();
    	// for each log entry in the ArrayList
    	for (Log log: logs.getLogs()) {
    		// depending on the type of information requested from the log entry it is
    		switch (type) {
    		// if it is a date of a log date, return all log entries with the same start date.
    		case "date":
    			// if the date equals a log entry's starting date
    			if (log.getStartDate().equals(query))
    				// add the log entry to the ArrayList
                    results.add(log);
    			break;
    		// if it is a registration number of a vehicle, returns all log entries for a vehicle
    		case "registration":
    			// if the registration number matches a vehicle's 
                if (log.getVehicle().equals(query))
                	// add the log entry to the ArrayList
                    results.add(log); 
                break;
    		// if it is a keyword of a log entry, returns all log entries containing the keyword within their description
    		case "keyword":
    			// if the description contains the keyword
                if (log.getDescription().contains(query))
                	// add the log entry to the ArrayList
                    results.add(log); 
                break;
            // if it is the visibility of a log entry, return all log entries with the matching boolean
    		case "visibility":
    			// if the log entry matches the boolean
    			if (log.getHidden().getShow() == Boolean.valueOf(query)) // value of the String 'true' or 'false' into a Boolean data type
    				// add the log entry to the ArrayList
        			results.add(log);  
    			break;
    		}
    	}
    	// return the finished ArrayList
		return results;
    }
}
