package wsd.ass.rest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;

import wsd.ass.Constants;
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
public class LogService implements RESTServiceFactory{
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
	 * @return A log application object which is the middleman between this REST class and the
	 * Log class beans/pojos.
	 * @throws JAXBException
	 * @throws IOException
	 */
	@Override
	public Object getApp() throws JAXBException, IOException {
		// locks the servlet for the current request
		synchronized (application) {
			// create a new log application with the 'logs' attribute if available by casting the servlet
			LogApplication logs = (LogApplication) application.getAttribute(Constants.LOG_APP);
			// if 'logs' is not available, the LogApplication will be null
			if (logs == null) {
				// create a new log application object
				logs = new LogApplication();
				//indicate the location of the log.xml file containing vehicles
				logs.setFilePath(application.getRealPath(Constants.LOG_XML));
				// unmarshall the log.xml file into the LogApplication object
				logs.unmarshall();
				// set the unmarshalled log.xml file application wide to save having to unmarshall it again for the next request.
				application.setAttribute(Constants.LOG_APP, logs);
			}
			// if 'logs' attribute exists, return the already unmarshalled object or the one just unmarshalled
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
	@Override
	public Logs fetch() throws JAXBException, IOException {
		// use the Log Application to return all log entries
		return (Logs) ((LogApplication) getApp()).get();
	}
	
	public ArrayList<Log> queryLogs (String query, String type) throws JAXBException, IOException {
		return (ArrayList<Log>) ((LogApplication) getApp()).getList(query, type);
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
		return queryLogs(date, "date");
	}
	
	/**
	 * REST call to return all logs for a certain vehicle with matching registration number
	 * @param registration the registration number of the vehicle
	 * @return all log entries with for the vehicle with matching registration number
	 * @throws JAXBException
	 * @throws IOException
	 */
	@Path("registration/{registration}") // the path of the REST call
	@GET // HTTP GET command to be invoked by user
	@Produces(MediaType.APPLICATION_XML) // output produces an XML file
	public ArrayList<Log> getRegoLog(@PathParam("registration") String registration) throws JAXBException, IOException {
		// use the Log Application to return all log entries for a certain vehicle
		return queryLogs(registration, "registration");
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
	public ArrayList<Log> getKeywordLog(@PathParam("keyword") String keyword) throws JAXBException, IOException {
		// use the Log Application to return all log entries with the matching keyword in thier description
		return queryLogs(keyword, "keyword");
	}
	
	/**
	 * Get Logs entries with a certain type of visibility. They can be either hidden (false) or shown (true)
	 * @param visibility the type of logs to show, boolean String
	 * @return a list of log with the selected type of visibility
	 * @throws JAXBException
	 * @throws IOException
	 */
	private ArrayList<Log> getVisibleLog(String visibility) throws JAXBException, IOException {
		return queryLogs(visibility, "visibility");
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
	public ArrayList<Log> getQuery(@QueryParam("vehicleRego") String vehicleRego, @QueryParam("startDate") String startDate, @QueryParam("keyword") String keyword ) throws JAXBException, IOException {
		// if the date parameter is not null add all matching logs to the array list
		if (startDate != null || vehicleRego != null || keyword != null) {
			// create a new array list to hold the log entries
			ArrayList<Log> logs = new ArrayList<Log>();
			if (startDate != null)
				logs.addAll(getDateLogs(startDate));
			// if the registration parameter is not null add all matching logs to the array list
			if (vehicleRego != null)
				logs.addAll(getRegoLog(vehicleRego));
			// if the keyword parameter is not null add all matching logs to the array list
			if (keyword != null)
				logs.addAll(getKeywordLog(keyword));
			return logs;
		} else
		// if the array list is empty display all logs which are not hidden
			return getVisibleLog("true");
		// return all the log entries which have met all or any of the parameters
		
	}
	
}
