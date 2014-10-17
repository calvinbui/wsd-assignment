package wsd.ass;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

/**
 * The TestVehicle is used to test the jaxb for vehicle objects
 * @author Calvin
 *
 */
public class TestVehicle {
	
	public static void main(String[] args) throws JAXBException {
		Vehicles vehicles = new Vehicles();
		vehicles.addVehicle(new Vehicle("BA30HS", "Car", "Toyota", "Corolla", 2009, "Grey", 60000));
		vehicles.addVehicle(new Vehicle("AAAAAA", "Bus", "Mazda", "3", 2010, "Purple", 1111111));
		// Boilerplate code to convert objects to XML...
	    JAXBContext jc = JAXBContext.newInstance(Vehicles.class);
	    Marshaller m = jc.createMarshaller();
	    m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	    m.marshal(vehicles, System.out);
	}
}
