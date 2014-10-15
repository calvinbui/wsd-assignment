/**
 * LogSOAPServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package wsd.ass.soap.client;

public class LogSOAPServiceLocator extends org.apache.axis.client.Service implements wsd.ass.soap.client.LogSOAPService {

    public LogSOAPServiceLocator() {
    }


    public LogSOAPServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public LogSOAPServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for LogSOAPPort
    private java.lang.String LogSOAPPort_address = "http://localhost:8080/wsdassignment/soap/log";

    public java.lang.String getLogSOAPPortAddress() {
        return LogSOAPPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String LogSOAPPortWSDDServiceName = "LogSOAPPort";

    public java.lang.String getLogSOAPPortWSDDServiceName() {
        return LogSOAPPortWSDDServiceName;
    }

    public void setLogSOAPPortWSDDServiceName(java.lang.String name) {
        LogSOAPPortWSDDServiceName = name;
    }

    public wsd.ass.soap.client.LogSOAP getLogSOAPPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(LogSOAPPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getLogSOAPPort(endpoint);
    }

    public wsd.ass.soap.client.LogSOAP getLogSOAPPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            wsd.ass.soap.client.LogSOAPPortBindingStub _stub = new wsd.ass.soap.client.LogSOAPPortBindingStub(portAddress, this);
            _stub.setPortName(getLogSOAPPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setLogSOAPPortEndpointAddress(java.lang.String address) {
        LogSOAPPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (wsd.ass.soap.client.LogSOAP.class.isAssignableFrom(serviceEndpointInterface)) {
                wsd.ass.soap.client.LogSOAPPortBindingStub _stub = new wsd.ass.soap.client.LogSOAPPortBindingStub(new java.net.URL(LogSOAPPort_address), this);
                _stub.setPortName(getLogSOAPPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("LogSOAPPort".equals(inputPortName)) {
            return getLogSOAPPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://soap.ass.wsd/", "LogSOAPService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://soap.ass.wsd/", "LogSOAPPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("LogSOAPPort".equals(portName)) {
            setLogSOAPPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
