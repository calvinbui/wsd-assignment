package wsd.ass.rest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;

import wsd.ass.Log;
import wsd.ass.LogApplication;
import wsd.ass.Logs;

/**
 * @author Calvin and Janette
 * The Log Service class handles REST calls for all vehicle log related requests.
 * 
 * Based on what URL and parameters are provided by the user, this class will return
 * the requested information.
 * 
 */
@Path("/logs")
public class LogService {
	/**
	 *  
	 */
	@Context
	private ServletContext application;

	/**
	 * Retrieve the XML file and set it as an attribute within the servlet context for
	 * application wide usage. 
	 * 
	 * Utilises the 'synchronized' keyword to lock the XML file while being manipulated to
	 * prevent overwrites and incorrect reads.
	 * 
	 * @return A log application object which is the middleman between this REST class and the
	 * Log class beans/pojos.
	 * @throws JAXBException
	 * @throws IOException
	 */
	private LogApplication getLogApp() throws JAXBException, IOException {
		// locks the servlet for the current request
		synchronized (application) {
			// create a new log application with the 'logs' attribute if available by casting the servlet
			LogApplication logs = (LogApplication) application.getAttribute("logs");
			// if 'logs' is not available, the LogApplication will be null
			if (logs == null) {
				// create a new log application object
				logs = new LogApplication();
				// unmarshall the log.xml file into the LogApplication object
				logs.setFilePath(application.getRealPath("/log.xml"));
				// set the unmarshalled log.xml file application wide to save having to unmarshall it again 
				application.setAttribute("logs", logs);
			}
			// if 'logs' attribute exists, return the already unmarshalled object
			return logs;
		}
	}
	
	/**
	 * REST call to return all log entries regardless of their statuses.
	 * @return all log entries in XML format
	 * @throws JAXBException
	 * @throws IOException
	 */
	@Path("all") // the path of the REST call
	@GET // HTTP GET command to be invoked by user
	@Produces(MediaType.APPLICATION_XML) // output produces an XML file
	public Logs getAll() throws JAXBException, IOException {
		// use the Log Application to return all log entries
		return getLogApp().getLogs();
	}
	
	/**
	 * REST call to return all logs which commence on a certain date.
	 * @param date the date to check against
	 * @return all log entries with a matching starting dat in XML format
	 * @throws JAXBException
	 * @throws IOException
	 */
	@Path("date/{date}") // the path of the REST call
	@GET // HTTP GET command to be invoked by user
	@Produces(MediaType.APPLICATION_XML) // output produces an XML file
	public ArrayList<Log> getDateLogs(@PathParam("date") String date) throws JAXBException, IOException {
		// use the Log Application to return all log entries with the same starting date
		return getLogApp().getLogs().getDate(date);
	}
	
	/**
	 * REST call to return all logs for a certain vehicle with matching registration number
	 * @param registration the registration number of the vehicle
	 * @return all log entries with for the vehicle with matching registration number
	 * @throws JAXBException
	 * @throws IOException
	 */
	@Path("rego/{rego}") // the path of the REST call
	@GET // HTTP GET command to be invoked by user
	@Produces(MediaType.APPLICATION_XML) // output produces an XML file
	public ArrayList<Log> getLog(@PathParam("rego") String registration) throws JAXBException, IOException {
		// use the Log Application to return all log entries for a certain vehicle
		return getLogApp().getLogs().getRegistration(registration);
	}
	
	/**
	 * REST call to return all log entries with the keyword in their description
	 * @param keyword the keyword to search for within the log description
	 * @return all log entries with the keyword found in their description
	 * @throws JAXBException
	 * @throws IOException
	 */
	@Path("keyword/{keyword}") // the path of the REST call
	@GET // HTTP GET command to be invoked by user
	@Produces(MediaType.APPLICATION_XML) // output produces an XML file
	public ArrayList<Log> getKeyword(@PathParam("keyword") String keyword) throws JAXBException, IOException {
		// use the Log Application to return all log entries with the matching keyword in thier description
		return getLogApp().getLogs().getKeyword(keyword);
	}
	
	/**
	 * REST call to return all log entries which satisfy any of the three parameters:
	 * - registration number
	 * - starting date
	 * - keyword in description
	 * @param rego all log entries with for the vehicle with matching registration number
	 * @param date the date to check against
	 * @param keyword the keyword to search for within the log description
	 * @return all log entries which satisfy any or all of the parameters otherwise all log files that are not hidden
	 * @throws JAXBException
	 * @throws IOException
	 */
	@Path("")
	@GET // HTTP GET command to be invoked by user
	@Produces(MediaType.APPLICATION_XML) // output produces an XML file
	public ArrayList<Log> getQuery(@QueryParam("rego") String rego, @QueryParam("date") String date, @QueryParam("keyword") String keyword ) throws JAXBException, IOException {
		// create a new array list to hold the log entries
		ArrayList<Log> logs = new ArrayList<Log>();
		// if the date parameter is not null add all matching logs to the array list
		if (date != null)
			logs.addAll(getLogApp().getLogs().getDate(date));
		// if the registration parameter is not null add all matching logs to the array list
		if (rego != null)
			logs.addAll(getLogApp().getLogs().getRegistration(rego));
		// if the keyword parameter is not null add all matching logs to the array list
		if (keyword != null)
			logs.addAll(getLogApp().getLogs().getKeyword(keyword));
		// if the array list is empty display all logs which are not hidden
		if (logs.isEmpty())
			return getLogApp().getLogs().getVisibleLogs();
		// return all the log entries which have met all or any of the parameters
		return logs;
	}
	
}
