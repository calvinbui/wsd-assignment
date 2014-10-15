package wsd.ass.soap.client;

import java.rmi.RemoteException;
import java.util.Scanner;

import javax.xml.rpc.ServiceException;

public class ApplicationClient {
	private static User user;
	private static UserSOAP userSOAP;
	
	public static void main(String[] args) throws JAXBException, IOException, RemoteException, ServiceException {
		run();
		
		
		//LogSOAPServiceLocator logLocator = new LogSOAPServiceLocator();
		//LogSOAP log = logLocator.getLogSOAPPort();
		
	}
	
	private static void run() throws JAXBException, IOException, RemoteException, ServiceException {
		UserSOAPServiceLocator userLocator = new UserSOAPServiceLocator();
		userSOAP = userLocator.getUserSOAPPort();
		System.out.println("== Welcome to the Vehicle Log Book System == \n");
		login();
		options();
		
	}
	
	private static void login() throws ServiceException, JAXBException, IOException, RemoteException {
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
	
	private static void options() {

		for (int i = 0; i < 50; ++i) System.out.println();
		System.out.println("Hello " + user.getFirstname());
		System.out.println("\n\nSelect an option:");
		System.out.println("1: View all Logs");
		System.out.println("2: Delete a Log");
		System.out.print("\n\nEnter your choice: ");
		Scanner s = new Scanner(System.in);
		String choice = s.nextLine();
	}
}
