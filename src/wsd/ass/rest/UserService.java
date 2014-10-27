package wsd.ass.rest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;

import wsd.ass.Constants;
import wsd.ass.UserApplication;
import wsd.ass.Users;

@Path("/users")
public class UserService implements RESTServiceFactory {
	@Context // inject an instance of the JSP application into this field
	private ServletContext application;
	
	
	@Override
	public Object getApp() throws JAXBException, IOException {
		// locks the servlet for the current request
		synchronized (application) {
			// create a new user application with the 'users' attribute if available by casting the servlet
			UserApplication users = (UserApplication) application.getAttribute(Constants.USER_APP);
			// if 'users' is not available, the UserApplication will be null
			if (users == null) {
				// create a new user application object
				users = new UserApplication();
				// indicate the location of the user.xml file containing users
				users.setFilePath(application.getRealPath(Constants.USER_XML));
				// unmarshall the user.xml file into the Vehicle Application object
				users.unmarshall();
				// set the unmarshalled user.xml file application wide to save having to unmarshall it again for the next request. 
				application.setAttribute(Constants.USER_APP, users);
			} else {
				users.unmarshall();
			}
			// if 'users' attribute exists, return the already unmarshalled object or the one just unmarshalled
			return users;
		}
	}
	
	@Path("all") // the path of the REST call
	@GET // HTTP GET command to be invoked by user
	@Produces(MediaType.APPLICATION_XML) // output produces an XML file
	@Override
	public Object fetch() throws JAXBException, IOException {
		return (Users) ((UserApplication) getApp()).get();
	}

}
