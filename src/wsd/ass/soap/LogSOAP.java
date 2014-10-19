package wsd.ass.soap;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

import wsd.ass.Constants;
import wsd.ass.Log;
import wsd.ass.LogApplication;
import wsd.ass.Logs;

/**
 * The LogSOAP class defines the functions to be used by the SOAP web service in relation to logs.
 * 
 * It communicates with the LogApplication class to retrieve data from log.xml
 * 
 * @author Calvin
 *
 */

@WebService
public class LogSOAP {
	@Resource
	private WebServiceContext context;
	
	@WebMethod
	private LogApplication getLogApp() throws JAXBException, IOException {
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		synchronized (application) {
			LogApplication logApp = (LogApplication)application.getAttribute(Constants.LOG_APP);
			if (logApp == null) {
				logApp = new LogApplication();
				String filePath = application.getRealPath(Constants.LOG_XML);
				logApp.setFilePath(filePath);
				logApp.unmarshall();
				application.setAttribute(Constants.LOG_APP, logApp);
			}
			return logApp;
		}
	}
	
	/**
	 * Get all log entries
	 * @return a Logs object containing all the log files
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@WebMethod
	public Logs getLogs() throws JAXBException, IOException {
		return (Logs) getLogApp().get();
	}
	
	/**
	 * Show all log entries on screen
	 * @return a String containing all log info
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@WebMethod
	public String showAllLogs() throws JAXBException, IOException {
		String s = "\n";
		ArrayList<Log> logs = getLogs().getLogs();
		for (Log log : logs) {
			s += showLog(log);
		}
		return s;
	}
	
	/**
	 * Get data about a single log in string format
	 * @return a String containing all info about a log
	 */
	@WebMethod
	public String showLog(Log log) {
		String s = "\n";
		s += "\nID: " + log.getId();
		s += "\nRego: " + log.getVehicle();
		s += "\nDriver: " + log.getDriver();
		s += "\nStart Date: " + log.getStartDate();
		s += "\nStart Time: " + log.getStartTime();
		s += "\nEnd Date: " + log.getEndDate();
		s += "\nEnd Time: " + log.getEndTime();
		s += "\nDescription: " + log.getDescription();
		s += "\nKilometres: " + log.getKilometres();
		s += "\nHidden: " + String.valueOf(!log.getHidden().getShow()); //grab opposite by using !
		if (log.getHidden().getShow() == false)
			s += "\nHidden By: " + log.getHidden().getHidden();
		return s;
	}
	
	/**
	 * Hide the specified log
	 * @param id the id of the log to be hidden
	 * @param user the user that is hiding the log
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@WebMethod
	public void hideLog(int id, String user) throws JAXBException, IOException {
		getLogApp().hideLog(id, user);
	}
	
	/**
	 * Check if a log with a specified id number exists
	 * @param id the id of the log that we want to check
	 * @throws JAXBException if Logs class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@WebMethod
	public boolean exists(int id) throws JAXBException, IOException {
		ArrayList<Log> logs = getLogs().getLogs();
		for (Log log : logs) {
			if (log.getId() == id) {
				return true;
			}
		}
		return false;
	}
}