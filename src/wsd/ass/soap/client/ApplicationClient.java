package wsd.ass.soap.client;

import java.rmi.RemoteException;
import java.util.Scanner;

import javax.xml.rpc.ServiceException;

public class ApplicationClient {
	private static User user;
	private static UserSOAP userSOAP;
	private static LogSOAP logSOAP;
	
	public static void main(String[] args) throws JAXBException, IOException, RemoteException, ServiceException, InterruptedException {
		try {
			initialise();
			login();
			welcome();
			choice(options());
	    } catch (Throwable ex) {
	        System.err.println("Uncaught exception - " + ex.getMessage());
	        ex.printStackTrace(System.err);
	    }
	}
	
	private static void initialise() throws ServiceException {
		System.out.println("== Welcome to the Vehicle Log Book System == \n");
		UserSOAPServiceLocator userLocator = new UserSOAPServiceLocator();
		userSOAP = userLocator.getUserSOAPPort();
		
		LogSOAPServiceLocator logLocator = new LogSOAPServiceLocator();
		logSOAP = logLocator.getLogSOAPPort();
	}
	
	private static void welcome() {
		for (int i = 0; i < 50; ++i) System.out.println(); //jump 50 files to clear the screen. similar to how linux/unix does it in terminal
		System.out.println("Hello " + user.getFirstname());
	}

	private static void login() throws ServiceException, JAXBException, IOException, RemoteException, InterruptedException {
		while (user == null) {
			System.out.print("Enter email: ");
			Scanner s = new Scanner(System.in);
			String email = s.nextLine();
			System.out.print("Enter password: ");
			String password = s.nextLine();
			user = userSOAP.getUser(email, password);
			if (user == null)
				System.out.println("\nLogin Failed. Try again. \n");
		}
	}
	
	private static String options() {
		System.out.println("\n\nSelect an option:");
		System.out.println("0) Logout");
		System.out.println("1) View all Logs");
		System.out.println("2) Delete a Log");
		System.out.print("\n\nEnter an option: ");
		Scanner s = new Scanner(System.in);
		return s.nextLine();
	}
	
	private static void choice(String choice) throws JAXBException, IOException, RemoteException {
		switch (choice) {
		case "0": 
			System.exit(0);
			break;
		case "1": 
			System.out.println(logSOAP.showAllLogs());
			options();
			break;
		case "2":
			logSOAP.hideLog(getLogId(), user.getUsername());
			System.out.println("Log has been deleted.");
			options();
			break;
		default: 
			options(); 
			break;
		}
	}
	
	private static int getLogId() {
		Scanner s = new Scanner(System.in);
		int number;
		do {
			System.out.print("ID of log to delete: ");
			// validate if integer or not
			while (!s.hasNextInt()) {
				System.out.print("\nID of log to delete: ");
				s.next();
			}
			number = s.nextInt();
		} while (number < 0); // integer must be greater than 0
		return number;
	}
}
