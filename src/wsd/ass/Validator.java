package wsd.ass;

import java.io.IOException;
import java.util.ArrayList;
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
	
	public boolean dateCheck(String date) {
		if (emptyOrNullCheck(date))
			return true;
		// need to validate leap years and months but the guy in front of me is so smelly i can't think at the moment.
		// smelly guy is gone. perhaps using Java's built in Date class it can validate like if it throws an exception then its obvs a bad date.
		Pattern pattern = Pattern.compile("([01][0-9]|[20-23])-([0][0-9]|[1][0-2])-([0][0-9]|[1][0-9]|[2][0-9]|[3][0-2])");
		Matcher matcher = pattern.matcher(date);
		return !matcher.matches();
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
	
	//validate start date+time is before end date + time. look in android code if possible.
	//will be diffs. maybe can use java built in date class which takes datetime after all!
}
