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

import wsd.ass.User;
import wsd.ass.UserApplication;
import wsd.ass.Users;

@WebService
public class UserSOAP {
	@Resource
	private WebServiceContext context;
	
	@WebMethod
	private UserApplication getUserApp() throws JAXBException, IOException {
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		synchronized (application) {
			UserApplication userApp = (UserApplication)application.getAttribute("userApp");
			if (userApp == null) {
				userApp = new UserApplication();
				String filePath = application.getRealPath("/user.xml");
				userApp.setFilePath(filePath);
				userApp.unmarshall();
				application.setAttribute("userApp", userApp);
			}
			return userApp;
		}
	}
	
	@WebMethod
	public Users getUsers() throws JAXBException, IOException {
		return getUserApp().getUsers();
	}
	
	@WebMethod
	public User getUser(String email, String password) throws JAXBException, IOException {
		return getUsers().login(email, password);
	}
}