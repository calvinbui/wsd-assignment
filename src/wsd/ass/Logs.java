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
}
