package wsd.ass;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

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
	public Vehicles getVehiclesList() {
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
	 * @throws JAXBException if Vehicle class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	public void unmarshall() throws JAXBException, IOException {
		// Define the class to transform the XML file into using JAXB
        JAXBContext jc = JAXBContext.newInstance(Vehicles.class);
        
        // Create the unmarshaller
        Unmarshaller u = jc.createUnmarshaller();

        // load the file into from its location (filepath)
        FileInputStream fin = new FileInputStream(filePath);
        
        // unmarshall the object from the file into the ArrayList
		vehicles = (Vehicles) u.unmarshal(fin);
		
        // close the file input stream and release the lock on it
		fin.close();		
	}
	
	/**
	 * Marshal the vehicles object back into xml format and output it to the filepath
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	public void marshall() throws JAXBException, FileNotFoundException {
		JAXBContext jc = JAXBContext.newInstance(Vehicles.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        m.marshal(vehicles, new FileOutputStream(getFilePath()));
	}
	
	/**
	 * Find the vehicle, and then update the total kilometres
	 * @param kilometres
	 * @param registration
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	public void updateKilometres(int kilometres, String registration) throws FileNotFoundException, JAXBException {
		vehicles.getRegistration(registration).updateKilometres(kilometres);
		marshall();
	}
	
	/**
	 * Add a new vehicle to the users object and then marshal it back into xml
	 * @param vehicle The new vehicle to add
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	public void addVehicle(Vehicle vehicle) throws FileNotFoundException, JAXBException {
		vehicles.addVehicle(vehicle);
		marshall();
	}
}
