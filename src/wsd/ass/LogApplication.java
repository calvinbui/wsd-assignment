package wsd.ass;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import wsd.ass.Logs;

public class LogApplication {
	private String filePath;
	private Logs logs;
	
	public String getFilePath() {
		return filePath;
	}
	
	public void setFilePath(String filePath) throws JAXBException, IOException {
        this.filePath = filePath;
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Logs.class);
        Unmarshaller u = jc.createUnmarshaller();

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        logs = (Logs)u.unmarshal(fin); // This loads the "shop" object
        fin.close();
    }

	public Logs getLogs() {
		return logs;
	}

	public void setLogs(Logs logs) {
		this.logs = logs;
	}
	
	
}
