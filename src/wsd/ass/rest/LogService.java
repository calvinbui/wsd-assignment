package wsd.ass.rest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.xml.bind.JAXBException;

import wsd.ass.Logs;

@Path("/logs")
public class LogService {
	@Context
	private ServletContext application;

	private Logs getLogss() throws JAXBException, IOException {

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
			Logs logs = (Logs) application.getAttribute("logs");
			if (logs == null) {
				logs = new Logs();
				logs.setFilePath(application.getRealPath("logs.xml"));
				application.setAttribute("logs", logs);
			}
			return logs;
		}
	}
}
