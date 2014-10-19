package wsd.ass;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.bind.JAXBException;

public final class Validator {
	
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
	
	public static boolean emptyOrNullCheck(String s) {
		if (s == null || s.equals(""))
			return true;
		return false;
	}
	
	// http://www.mkyong.com/java/how-to-check-if-date-is-valid-in-java/
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
	
	private static UserApplication getUserApp() throws JAXBException, IOException {
		UserApplication userApp = new UserApplication();
		userApp.setFilePath(Constants.LOG_XML);
		userApp.unmarshall();
		return userApp;
	}

	//validate user exists
	public static boolean userCheck(String email) throws JAXBException, IOException {
		ArrayList<User> users = getUserApp().getUsers().getUsers();
		for (User user : users) {
			if (user.getUsername().equals(email))
					return false;
		}
		return true;
	}
	
	private static VehicleApplication getVehicleApp() throws JAXBException, IOException {
		VehicleApplication vehicleApp = new VehicleApplication();
		vehicleApp.setFilePath(Constants.VEHICLE_XML);
		vehicleApp.unmarshall();
		return vehicleApp;
	}
	
	//validate vehicle exists
	public static boolean vehicleCheck(String registration) throws JAXBException, IOException {
		ArrayList<Vehicle> vehicles = getVehicleApp().getVehiclesList().getVehicles();
		for (Vehicle vehicle : vehicles) {
			if (vehicle.getRegistration().equals(registration))
				return false;
		}
		return true;
	}
	
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
	public static boolean emailCheck(String email) {
		if (emptyOrNullCheck(email))
			return true;
		
		Pattern pattern = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		Matcher matcher = pattern.matcher(email);
		return !matcher.matches();
	}
	
	//http://www.java2s.com/Tutorial/Java/0120__Development/Validatethefirstnameandlastname.htm
	public static boolean nameCheck(String name) {
		if (emptyOrNullCheck(name))
			return true;
		
		return !name.matches( "[A-Z][a-zA-Z]*" );
    }
}
