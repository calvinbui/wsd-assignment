package wsd.ass;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBException;

/**
 * The Validator class is used for validating data from user input
 * 
 * It contains static methods that perform specific validation checks
 * 
 * @author Calvin
 *
 */
public final class Validator {
	
	/** Check if the given date is in the HH:mm:ss format
	 * @param time This is the string to check
	 * @return boolean value
	 */
	public static boolean timeCheck(String time) {
		if (emptyOrNullCheck(time))
			return true;
		
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.TIME_FORMAT);
		sdf.setLenient(false);
		try {
			sdf.parse(time);
		} catch (ParseException e) {
			return true;
		}
		
		return false;
	}
	
	/** Check if the given string is empty or null
	 * @param s
	 * @return boolean
	 */
	public static boolean emptyOrNullCheck(String s) {
		if (s == null || s.equals(""))
			return true;
		return false;
	}
	
	// http://www.mkyong.com/java/how-to-check-if-date-is-valid-in-java/
	/** Check if the given date is in the yyyy-MM-dd format
	 * @param date This is the string to check
	 * @return boolean value
	 */
	public static boolean dateCheck(String date) {
		if (emptyOrNullCheck(date))
			return true;
		
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
		sdf.setLenient(false);
		try {
			sdf.parse(date);
		} catch (ParseException e) {
			return true;
		}
		
		return false;
	}
	
	/** Get the UserApplication, , which communicates with the users xml file
	 * @return a UserApplication object
	 * @throws JAXBException if Users class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	private static UserApplication getUserApp() throws JAXBException, IOException {
		UserApplication userApp = new UserApplication();
		userApp.setFilePath(Constants.LOG_XML);
		userApp.unmarshall();
		return userApp;
	}

	/** Validate that a user with the given email address exists in the xml file
	 * @param email This is the email that needs to be checked
	 * @return boolean value
	 * @throws JAXBException if Users class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	public static boolean userCheck(String email) throws JAXBException, IOException {
		ArrayList<User> users = ((Users) getUserApp().get()).getUsers();
		for (User user : users) {
			if (user.getUsername().equals(email))
					return false;
		}
		return true;
	}
	
	/** Get the VehicleApplication, which communicates with the vehicles xml file
	 * @return vehicleApp
	 * @throws JAXBException if Vehicles class does not contain the correct elements to link with
	 * @throws FileNotFoundException if the filepath is wrong or file does not exist
	 */
	private static VehicleApplication getVehicleApp() throws JAXBException, IOException {
		VehicleApplication vehicleApp = new VehicleApplication();
		vehicleApp.setFilePath(Constants.VEHICLE_XML);
		vehicleApp.unmarshall();
		return vehicleApp;
	}
	
	/** Validates that a vehicle with the given registration exists
	 * @param registration The registration to check
	 * @return a boolean value
	 * @throws JAXBException
	 * @throws IOException
	 */
	public static boolean vehicleCheck(String registration) throws JAXBException, IOException {
		ArrayList<Vehicle> vehicles = ((Vehicles) getVehicleApp().get()).getVehicles();
		for (Vehicle vehicle : vehicles) {
			if (vehicle.getRegistration().equals(registration))
				return false;
		}
		return true;
	}
	
	/** Checks that the given startdate occurs before the given endtime
	 * @param startDateTime 
	 * @param endDateTime
	 * @return a boolean value
	 */
	public static boolean startDateTimeBeforeEndDateTimeCheck(String startDateTime, String endDateTime) {
		
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATETIME_FORMAT);
	    
		Date start;
		Date end;
    	try {
			start = sdf.parse(startDateTime);
			end = sdf.parse(endDateTime);
		} catch (ParseException e) {
			return true;
		}
    	
    	if (start.before(end))
    		return false;
	    
		return true;
	}
	
	//http://www.mkyong.com/regular-expressions/how-to-validate-email-address-with-regular-expression/
	/** emailCheck validates whether or not the given string is in a valid email format
	 * It also checks that the string isn't empty
	 * @param email This is the string to validate
	 * @return boolean for whether or not it matches
	 */
	public static boolean emailCheck(String email) {
		if (emptyOrNullCheck(email))
			return true;
		
		Pattern pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		Matcher matcher = pattern.matcher(email);
		return !matcher.matches();
	}
	
	//http://www.java2s.com/Tutorial/Java/0120__Development/Validatethefirstnameandlastname.htm
	/** nameCheck validates whether or not the given string is in a name format
	 * It also checks that the string isn't empty
	 * @param name This is the string to validate
	 * @return boolean for whether or not it matches
	 */
	public static boolean nameCheck(String name) {
		if (emptyOrNullCheck(name))
			return true;
		
		return !name.matches( "[A-Z][a-zA-Z]*" );
    }
	
	
	/** convertValidInt converts the given parameter into an int
	 * @param parameter
	 * @param session
	 * @return the converted int
	 */
	public static int convertValidInt(String parameter, HttpSession session) {
		int i = 0;
		try {
			i = Integer.parseInt(parameter);
		} catch (Exception e) {
			session.setAttribute(parameter, parameter);
		}
		return i;
	}
}
