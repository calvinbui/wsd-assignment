package wsd.ass.soap;

import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.servlet.ServletContext;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

import wsd.ass.LogApplication;
import wsd.ass.Logs;

@WebService
public class LogSOAP {
	@Resource
	private WebServiceContext context;
	
	@WebMethod
	private LogApplication getLogApp() {
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		synchronized (application) {
			LogApplication logApp = (LogApplication)application.getAttribute("logApp");
			if (logApp == null) {
				logApp = new LogApplication();
				String filePath = application.getRealPath("/log.xml");
				logApp.setFilePath(filePath);
				application.setAttribute("logApp", logApp);
			}
			return logApp;
		}
	}
	
	@WebMethod
	public Logs getLogs() {
		return getLogApp().getLogs();
	}
}