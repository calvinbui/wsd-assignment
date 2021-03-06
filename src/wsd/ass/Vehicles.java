package wsd.ass;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.*;

/**
 * The Vehicles class is used to store all vehicles (of type Vehicle) into an
 * ArrayList to be better and easily managed.
 * @author Calvin
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "vehicles", namespace = "http://www.wsd.com/vehicle")
public class Vehicles implements Serializable {
	/** Static default serial */
	private static final long serialVersionUID = 1L;
	
    /** The ArrayList containing all Vehicles (Vehicle.class) */	
	@XmlElement(name = "vehicle")
	private ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();

	/**
	 * Get the ArrayList of vehicles
	 * @return an ArrayList of Vehicle objects
	 */
	public ArrayList<Vehicle> getVehicles() {
		return vehicles;
	}

	/**
	 * Add a vehicle to the ArrayList
	 * @param vehicle a vehicle of type Vehicle
	 */
	public void addVehicle(Vehicle vehicle) {
		vehicles.add(vehicle);
	}
}
