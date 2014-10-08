package wsd.ass;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import wsd.ass.Vehicle;

/** 
 * The Vehicle Application class connects the Vehicle XML file to the POJOs/JavaBeans (Vehicle and Vehicles).
 * 
 * It is the middleman for interacting with the underlying data through other classes.
 * @author Calvin
 *
 */
public class VehicleApplication {
	/** The path of the XML file */
	private String filePath;

	/** All vehicles encapsulated within an ArrayList */
	private Vehicles vehicles;

	/**
	 * Get the file path of the XML file
	 * @return the file path of the XML path
	 */
	public String getFilePath() {
		return filePath;
	}

	/**
	 * Set the file path of the XML file
	 * @param filePath the file path to set
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	/**
	 * Get all vehicles
	 * @return an ArrayList containing all the vehicles
	 */
	public Vehicles getVehicles() {
		return vehicles;
	}

	/**
	 * Set all vehicles
	 * @param vehicles an ArrayList containing all vehicles
	 */
	public void setVehicles(Vehicles vehicles) {
		this.vehicles = vehicles;
	}

	/**
	 * Unmarshall the Vehicle XML file into the Vehicles ArrayList.
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	public void unmarshall() throws JAXBException, IOException {
		// Define the class to transform the XML file into using JAXB
        JAXBContext jc = JAXBContext.newInstance(Logs.class);
        
        // Create the unmarshaller
        Unmarshaller u = jc.createUnmarshaller();

        // load the file into from its location (filepath)
        FileInputStream fin = new FileInputStream(filePath);
        
        // unmarshall the object from the file into the ArrayList
		vehicles = (Vehicles) u.unmarshal(fin);
		
        // close the file input stream and release the lock on it
		fin.close();		
	}

}
