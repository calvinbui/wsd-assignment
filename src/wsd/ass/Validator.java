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
	
	public boolean timeCheck(String time) {
		if (emptyOrNullCheck(time))
			return true;
		Pattern pattern = Pattern.compile("([01][0-9]|[20-23]):[0-5][0-9]:[0-5][0-9]");
		Matcher matcher = pattern.matcher(time);
		return !matcher.matches();
	}
	
	public boolean emptyOrNullCheck(String s) {
		if (s == null || s.equals(""))
			return true;
		return false;
	}
	
	// http://www.mkyong.com/java/how-to-check-if-date-is-valid-in-java/
	public boolean dateCheck(String date) {
		if (emptyOrNullCheck(date))
			return true;
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
		
		try {
			sdf.parse(date);
		} catch (ParseException e) {
			return true;
		}
		
		return false;
	}
	
	public UserApplication getUserApp() throws JAXBException, IOException {
		UserApplication userApp = new UserApplication();
		userApp.setFilePath(Constants.LOG_XML);
		userApp.unmarshall();
		return userApp;
	}

	//validate user exists
	public boolean userCheck(String email) throws JAXBException, IOException {
		ArrayList<User> users = getUserApp().getUsers().getUsers();
		for (User user : users) {
			if (user.getUsername().equals(email))
					return false;
		}
		return true;
	}
	
	public VehicleApplication getVehicleApp() throws JAXBException, IOException {
		VehicleApplication vehicleApp = new VehicleApplication();
		vehicleApp.setFilePath(Constants.VEHICLE_XML);
		vehicleApp.unmarshall();
		return vehicleApp;
	}
	
	//validate vehicle exists
	public boolean vehicleCheck(String registration) throws JAXBException, IOException {
		ArrayList<Vehicle> vehicles = getVehicleApp().getVehiclesList().getVehicles();
		for (Vehicle vehicle : vehicles) {
			if (vehicle.getRegistration().equals(registration))
				return false;
		}
		return true;
	}
	
	public boolean startDateTimeBeforeEndDateTimeCheck(String startDateTime, String endDateTime) {
		
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
	
	//validate start date+time is before end date + time. look in android code if possible.
	//will be diffs. maybe can use java built in date class which takes datetime after all!
}
