package wsd.ass.soap.client;

import java.rmi.RemoteException;
import java.util.Scanner;

import javax.xml.rpc.ServiceException;

public class ApplicationClient {
	//private static User user;
	
	public static void main(String[] args) throws ServiceException, RemoteException{
		System.out.println("== Welcome to the Vehicle Log Book System ==");
		//UserSOAPServiceLocator userLocator = new UserSOAPServiceLocator();
		//UserSOAP userSOAP = userLocator.getUserSOAPPort();
		
		boolean userValidated = false;
		
		do {
			System.out.print("Enter email: ");
			Scanner s = new Scanner(System.in);
			String email = s.nextLine();
			System.out.print("Enter password: ");
			String password = s.nextLine();
			/*user = userSOAP.getUser(email, password);
			if (user != null)
				userValidated = true;
			else
				System.out.println("Login Failed. Try again.");*/
			
		} while (userValidated = false);
		
		//LogSOAPServiceLocator logLocator = new LogSOAPServiceLocator();
		//LogSOAP log = logLocator.getLogSOAPPort();
		
	}
}
