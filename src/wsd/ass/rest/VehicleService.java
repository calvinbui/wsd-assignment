package wsd.ass.rest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;

import com.sun.jersey.api.provider.jaxb.XmlHeader;

import wsd.ass.Constants;
import wsd.ass.Vehicle;
import wsd.ass.VehicleApplication;
import wsd.ass.Vehicles;

/**
 * The Vehicle Service class handles REST calls for vehicle related requests
 * such as registration plates.
 * 
 * Based on what URL and parameters are provided by the user, this class will return
 * the requested information.
 * 
 * @author Calvin and Janette
 *
 */
@Path("/vehicles")
public class VehicleService implements RESTServiceFactory{
	/** Set of methods to communicate with the servlet container such as retrieve xml files */
	@Context // inject an instance of the JSP application into this field
	private ServletContext application;

	/**
	 * Retrieve the XML file and set it as an attribute within the servlet context for
	 * application wide usage. 
	 * 
	 * Utilises the 'synchronized' keyword to lock the XML file while being manipulated to
	 * prevent overwrites and incorrect reads.
	 * 
	 * @return A vehicle application object which is the middleman between this REST class and the
	 * Vehicle class beans/pojos.
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with 
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@Override
	public Object getApp() throws JAXBException, IOException {
		// locks the servlet for the current request
		synchronized (application) {
			// create a new vehicle application with the 'vehicles' attribute if available by casting the servlet
			VehicleApplication vehicles = (VehicleApplication) application.getAttribute(Constants.VEHICLE_APP);
			// if 'vehicles' is not available, the VehicleApplication will be null
			if (vehicles == null) {
				// create a new vehicle application object
				vehicles = new VehicleApplication();
				// indicate the location of the vehicle.xml file containing vehicles
				vehicles.setFilePath(application.getRealPath(Constants.VEHICLE_XML));
				// unmarshall the vehicle.xml file into the Vehicle Application object
				vehicles.unmarshall();
				// set the unmarshalled vehicle.xml file application wide to save having to unmarshall it again for the next request. 
				application.setAttribute(Constants.VEHICLE_APP, vehicles);
			} else {
				vehicles.unmarshall();
			}
			// if 'vehicles' attribute exists, return the already unmarshalled object or the one just unmarshalled
			return vehicles;
		}
	}
	
	/**
	 * REST call to return all vehicle entries.
	 * @return all vehicles in XML format
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@Path("all") // the path of the REST call
	@GET // HTTP GET command to be invoked by user
	@Produces(MediaType.APPLICATION_XML) // output produces an XML file
	@Override
	public Object fetch() throws JAXBException, IOException {
		// use the Vehicle application to return all vehicles
		return (Vehicles) ((VehicleApplication) getApp()).get();
	}
	
	/**
	 * REST call to return all details about a vehicle based on vehicle registration submitted.
	 * @param registration
	 * @return A vehicle with the matching registration details
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@Path("{rego}") // the path of the REST call
	@GET // HTTP GET command to be invoked by user
	@Produces(MediaType.APPLICATION_XML) // output produces an XML file
	// the stylesheet to apply to the XML file outputted
	public Vehicle getVehicle(@PathParam("rego") String registration) throws JAXBException, IOException {
		// store all vehicles in the system into an array list
		ArrayList<Vehicle> vehicles = ((Vehicles) fetch()).getVehicles();
        // for every vehicle in the arraylist
		for (Vehicle vehicle : vehicles)
			// if the matches the registration number entered
            if (registration.equals(vehicle.getRegistration()))
            	// return that particular vehicle and its details
                return vehicle;
		//otherwise return nothing
        return null;
	}
}
