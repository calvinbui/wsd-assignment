/**
 * LogSOAP.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package wsd.ass.soap.client;

public interface LogSOAP extends java.rmi.Remote {
    public boolean exists(int arg0) throws java.rmi.RemoteException, wsd.ass.soap.client.JAXBException, wsd.ass.soap.client.IOException;
    public void hideLog(int arg0, java.lang.String arg1) throws java.rmi.RemoteException, wsd.ass.soap.client.JAXBException, wsd.ass.soap.client.IOException;
    public wsd.ass.soap.client.Log[] getLogs() throws java.rmi.RemoteException, wsd.ass.soap.client.JAXBException, wsd.ass.soap.client.IOException;
    public java.lang.String showAllLogs() throws java.rmi.RemoteException, wsd.ass.soap.client.JAXBException, wsd.ass.soap.client.IOException;
    public java.lang.String showLog(wsd.ass.soap.client.Log arg0) throws java.rmi.RemoteException;
}
