package wsd.ass;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.*;

import java.util.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="logs", namespace="http://www.uts.edu.au/31284/log")
public class Logs implements Serializable {
    /**
	 * 
	 */
	@XmlElement(name = "log")
	private ArrayList<Log> logs = new ArrayList<Log>();
	
	private String filePath;

	public ArrayList<Log> getLogs() {
        return logs;
    }
	
    public void addLog(Log log) {
        logs.add(log);
    }
    
    public void removeLog(Log log) {
        logs.remove(log);
    }
    
    public void setFilePath(String filePath) throws JAXBException, IOException {
        this.filePath = filePath;
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Logs.class);
        Unmarshaller u = jc.createUnmarshaller();

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        logs = (ArrayList<Log>)u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }

    public ArrayList<Log> getList(String query, String type) {
    	ArrayList<Log> list = new ArrayList<Log>();
    	for (Log log: logs) {
    		switch (type) {
    		case "date":
    			if (log.getStartDate().equals(query))
                    list.add(log);
    			break;
    		case "registration":
                if (log.getVehicle().equals(query))
                    list.add(log); // Log matches date. Return the registration
                break;
    		case "keyword":
                if (log.getDescription().contains(query))
                    list.add(log); // Log matches date. Return the registration
                break;
    		case "visibility":
    			if (log.getHidden().getShow() == Boolean.valueOf(query))
        			list.add(log);  
    			break;
    		}
    	}
		return list;
    }
}
