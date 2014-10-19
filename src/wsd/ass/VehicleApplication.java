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
public class VehicleApplication implements ApplicationFactory {
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
		getRegistration(registration).updateKilometres(kilometres);
		marshall();
	}
	
	/**
	 * Return the matching vehicle with the given registration number
	 * @param registration the registration number to query
	 * @return a vehicle with the matching registration
	 */
	public Vehicle getRegistration(String registration) {
		for (Vehicle vehicle : vehicles.getVehicles()) {
			if (vehicle.getRegistration().equals(registration))
				return vehicle; // Vehicle matches registration. Return the vehicle
		}
		return null; // Vehicle not found, return null
	}
	
	/**
	 * Add a new vehicle to the users object and then marshal it back into xml
	 * @param vehicle The new vehicle to add
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	@Override
	public void add(Object object) throws FileNotFoundException, JAXBException {
		vehicles.addVehicle((Vehicle) object);
		marshall();
	}

	/**
	 * Get all vehicles
	 * @return an ArrayList containing all the vehicles
	 */
	@Override
	public Object get() {
		return vehicles;
	}

	/**
	 * Set all vehicles
	 * @param vehicles an ArrayList containing all vehicles
	 */
	@Override
	public void set(Object object) {
		vehicles = (Vehicles) object;
	}
}
