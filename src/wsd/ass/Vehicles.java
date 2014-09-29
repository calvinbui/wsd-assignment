package wsd.ass;

import java.util.ArrayList;

import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="vehicles")
public class Vehicles implements java.io.Serializable {

	@XmlElement(name="vehicle")
	private ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
	
	public ArrayList<Vehicle> getVehicles(){
		return vehicles;
	}
	
	public void addVehicle(Vehicle vehicle) {
		vehicles.add(vehicle);
	}
}
