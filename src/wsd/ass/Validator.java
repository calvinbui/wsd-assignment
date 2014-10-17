package wsd.ass;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class Validator {
	/**
	 * Validate time in 24 hours format with regular expression
	 * 
	 * @param time
	 *            time address for validation
	 * @return true valid time fromat, false invalid time format
	 */
	public boolean time(String time) {
		Pattern pattern = Pattern.compile("([01]?[0-9]|2[0-3]):[0-5][0-9]");
		Matcher matcher = pattern.matcher(time);
		return matcher.matches();
	}
	
	public boolean emptyOrNull(String s) {
		if (s == null || s.equals(""))
			return true;
		return false;
	}

}
