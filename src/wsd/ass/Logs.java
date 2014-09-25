package wsd.ass;
import javax.xml.bind.annotation.*;

import java.util.*;
import java.io.Serializable;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="logs")
public class Logs implements Serializable {
    /**
	 * 
	 */
	@XmlElement(name = "logs")
	private ArrayList<Log> logs = new ArrayList<Log>();

	public ArrayList<Log> getLogs() {
        return logs;
    }
	
    public void addLog(Log log) {
        logs.add(log);
    }
    
    public void removeLog(Log log) {
        logs.remove(log);
    }

}
