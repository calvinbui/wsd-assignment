package wsd.ass;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

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
public class LogApplication {
	/** The path of the XML file */
	private String filePath;
	
	/** All log entries encapsulated within an ArrayList */
	private Logs logs;
	
	/**
	 * Get the file path of the XML file
	 * @return the filepath of the XML file
	 */
	public String getFilePath() {
		return filePath;
	}
	
	/**
	 * Set the filepath of the XML file 
	 * @param filePath the filepath to be set
	 */
	public void setFilePath(String filePath) {
        // set the filepath
		this.filePath = filePath;
    }
	
	/**
	 * Unmarshall the Log XML file into the Logs ArrayList.
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
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
	 * Get all log entries
	 * @return an ArrayList containing all the log files
	 */
	public Logs getLogs() {
		return logs;
	}

	/**
	 * Set all log entries
	 * @param logs an ArrayList containing all log files
	 */
	public void setLogs(Logs logs) {
		this.logs = logs;
	}
	
	/**
	 * Hide the specified log
	 * @param id the id of the log to be hidden
	 * @param user the user that is hiding the log
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 */
	public void hideLog(int id, String user) throws FileNotFoundException, JAXBException {
        logs.hideLog(id, user);
        marshall();
	}
	
	/**
	 * Marshal the logs object back into xml format and output it to the filepath
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	public void marshall() throws JAXBException, FileNotFoundException {
		JAXBContext jc = JAXBContext.newInstance(Logs.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        m.marshal(logs, new FileOutputStream(getFilePath()));
	}
	
	public void search() {
		
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
	public void createLog(Log log) throws FileNotFoundException, JAXBException {
		log.setId(logs.getLogs().get(logs.getLogs().size()-1).getId() + 1);
		log.setHidden(new Hidden(true, ""));
		logs.addLog(log);
		marshall();
	}
}
