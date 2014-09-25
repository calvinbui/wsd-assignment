package wsd.ass;

import java.util.Date;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import wsd.ass.Log.Hidden;

public class TestLog {

	public static void main(String[] args) throws JAXBException {
		Logs logs = new Logs();
		logs.addLog(new Log(1, "calvin@ok.com", "2014-05-11", "2014-05-22", "09:00:01", "09:00:02", "My first date", 123120, new Hidden(true, "calvin@ok.com")));
		JAXBContext jc = JAXBContext.newInstance(Logs.class);
		Marshaller m = jc.createMarshaller();
		m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		m.marshal(logs, System.out);
	}
}
