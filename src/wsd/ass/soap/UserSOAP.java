package wsd.ass.soap;

import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.servlet.ServletContext;
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
	private UserApplication getUserApp() {
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		synchronized (application) {
			UserApplication userApp = (UserApplication)application.getAttribute("userApp");
			if (userApp == null) {
				userApp = new UserApplication();
				String filePath = application.getRealPath("/logs.xml");
				userApp.setFilePath(filePath);
				application.setAttribute("userApp", userApp);
			}
			return userApp;
		}
	}
	
	@WebMethod
	public Users getUsers() {
		return getUserApp().getUsers();
	}
	
	@WebMethod
	public User getUser(String email, String password) {
		User user = getUsers().login(email, password);
		if (user != null)
			return user;
		return null;
	}
}