/**
 * UserSOAPService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package wsd.ass.soap.client;

public interface UserSOAPService extends javax.xml.rpc.Service {
    public java.lang.String getUserSOAPPortAddress();

    public wsd.ass.soap.client.UserSOAP getUserSOAPPort() throws javax.xml.rpc.ServiceException;

    public wsd.ass.soap.client.UserSOAP getUserSOAPPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
