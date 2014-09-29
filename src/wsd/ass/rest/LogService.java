package wsd.ass.rest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBException;

import wsd.ass.LogApplication;
import wsd.ass.Logs;

@Path("/logs")
public class LogService {
	@Context
	private ServletContext application;

	private LogApplication getLogApp() throws JAXBException, IOException {

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
			LogApplication logs = (LogApplication) application.getAttribute("logs");
			if (logs == null) {
				logs = new LogApplication();
				logs.setFilePath(application.getRealPath("/log.xml"));
				application.setAttribute("logs", logs);
			}
			return logs;
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
	public Logs getAll() throws JAXBException, IOException {
		return getLogApp().getLogs();
	}
	/*
	@Path("{rego}")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Log getLog(@PathParam("rego") String registration) {
		
	}*/
}
