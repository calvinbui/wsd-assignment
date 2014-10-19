/**
 * UserSOAP.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package wsd.ass.soap.client;

public interface UserSOAP extends java.rmi.Remote {
    public wsd.ass.soap.client.User[] getUsers() throws java.rmi.RemoteException, wsd.ass.soap.client.JAXBException, wsd.ass.soap.client.IOException;
    public wsd.ass.soap.client.User getUser(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException, wsd.ass.soap.client.JAXBException, wsd.ass.soap.client.IOException;
    public java.lang.String hello() throws java.rmi.RemoteException;
}
