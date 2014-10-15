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

import wsd.ass.Log;
import wsd.ass.LogApplication;
import wsd.ass.Logs;

@WebService
public class LogSOAP {
	@Resource
	private WebServiceContext context;
	
	@WebMethod
	private LogApplication getLogApp() throws JAXBException, IOException {
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		synchronized (application) {
			LogApplication logApp = (LogApplication)application.getAttribute("logApp");
			if (logApp == null) {
				logApp = new LogApplication();
				String filePath = application.getRealPath("/log.xml");
				logApp.setFilePath(filePath);
				logApp.unmarshall();
				application.setAttribute("logApp", logApp);
			}
			return logApp;
		}
	}
	
	@WebMethod
	public Logs getLogs() throws JAXBException, IOException {
		return getLogApp().getLogs();
	}
	
	@WebMethod
	public String showAllLogs() throws JAXBException, IOException {
		String s = "\n";
		ArrayList<Log> logs = getLogs().getLogs();
		for (Log log : logs) {
			s += showLog(log);
		}
		return s;
	}
	
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
	
	@WebMethod
	public void hideLog(int id, String user) throws JAXBException, IOException {
		getLogApp().hideLog(id, user);
		//getLogApp().marshall();
	}
}