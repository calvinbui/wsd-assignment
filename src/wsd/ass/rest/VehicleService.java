package wsd.ass.rest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;

import wsd.ass.VehicleApplication;
import wsd.ass.Vehicles;

@Path("/vehicles")
public class VehicleService {
	@Context
	private ServletContext application;

	private VehicleApplication getVehicleApp() throws JAXBException, IOException {

		// The web server can handle requests from different clients in
		// parallel.
		// These are called "threads".
		//
		// We do NOT want other threads to manipulate the application object at
		// the same
		// time that we are manipulating it, otherwise bad things could happen.
		//
		// The "synchronized" keyword is used to lock the application object
		// while
		// we're manpulating it.
		synchronized (application) {
			VehicleApplication vehicles = (VehicleApplication) application.getAttribute("vehicles");
			if (vehicles == null) {
				vehicles = new VehicleApplication();
				vehicles.setFilePath(application.getRealPath("/vehicle.xml"));
				application.setAttribute("vehicles", vehicles);
			}
			return vehicles;
		}
	}
	
	@Path("hello")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String hello() {
	 return "Hello World";
	}
	
	@Path("all")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Vehicles getAll() throws JAXBException, IOException {
		return getVehicleApp().getVehicles();
	}
}
