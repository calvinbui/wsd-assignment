package wsd.ass;

import java.io.FileInputStream;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import wsd.ass.Vehicle;

/**
 * @author Calvin
 *
 */
public class VehicleApplication {
	/**  */
	private String filePath;

	/**  */
	private Vehicles vehicles;

	/**
	 * 
	 * @return
	 */
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) throws JAXBException, IOException {
		this.filePath = filePath;
		// Create the unmarshaller
		JAXBContext jc = JAXBContext.newInstance(Vehicles.class);
		Unmarshaller u = jc.createUnmarshaller();

		// Now unmarshal the object from the file
		FileInputStream fin = new FileInputStream(filePath);
		vehicles = (Vehicles) u.unmarshal(fin); // This loads the "shop" object
		fin.close();
	}

	/**
	 * 
	 * @return
	 */
	public Vehicles getVehicles() {
		return vehicles;
	}

	/**
	 * 
	 * @param vehicles
	 */
	public void setVehicles(Vehicles vehicles) {
		this.vehicles = vehicles;
	}

}
