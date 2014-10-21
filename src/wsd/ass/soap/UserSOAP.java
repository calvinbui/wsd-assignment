package wsd.ass.soap;

import java.io.IOException;

import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

import wsd.ass.Constants;
import wsd.ass.User;
import wsd.ass.UserApplication;
import wsd.ass.Users;

/**
 * The UserSOAP class defines the functions to be used by the SOAP web service in relation to users.
 * 
 * It communicates with the UserApplication class to retrieve data from user.xml
 * 
 * @author Calvin
 *
 */

@WebService
public class UserSOAP {
	@Resource
	private WebServiceContext context;
	
	/**
	 * @return a UserApplication object
	 * @throws JAXBException if Users class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@WebMethod
	private UserApplication getUserApp() throws JAXBException, IOException {
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		synchronized (application) {
			UserApplication userApp = (UserApplication)application.getAttribute(Constants.USER_APP);
			if (userApp == null) {
				userApp = new UserApplication();
				String filePath = application.getRealPath(Constants.USER_XML);
				userApp.setFilePath(filePath);
				userApp.unmarshall();
				application.setAttribute(Constants.USER_APP, userApp);
			}
			return userApp;
		}
	}
	
	/**
	 * Get all users
	 * @return a Users object containing all users
	 * @throws JAXBException if Users class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@WebMethod
	public Users getUsers() throws JAXBException, IOException {
		return (Users) getUserApp().get();
	}
	
	/**
	 * User login function given an email and password
	 * @param email to verify user
	 * @param password to verify user
	 * @return the User object that is found by the matching email and password, or null if there is no match
	 * @throws JAXBException if Users class does not contain the correct elements to link with
	 * @throws IOException if the filepath is wrong or file does not exist
	 */
	@WebMethod
	public User getUser(String email, String password) throws JAXBException, IOException {
		return getUserApp().login(email, password);
	}
}