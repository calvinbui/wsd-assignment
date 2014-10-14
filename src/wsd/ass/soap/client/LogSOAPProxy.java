package wsd.ass.soap.client;

public class LogSOAPProxy implements wsd.ass.soap.client.LogSOAP {
  private String _endpoint = null;
  private wsd.ass.soap.client.LogSOAP logSOAP = null;
  
  public LogSOAPProxy() {
    _initLogSOAPProxy();
  }
  
  public LogSOAPProxy(String endpoint) {
    _endpoint = endpoint;
    _initLogSOAPProxy();
  }
  
  private void _initLogSOAPProxy() {
    try {
      logSOAP = (new wsd.ass.soap.client.LogSOAPServiceLocator()).getLogSOAPPort();
      if (logSOAP != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)logSOAP)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)logSOAP)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (logSOAP != null)
      ((javax.xml.rpc.Stub)logSOAP)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public wsd.ass.soap.client.LogSOAP getLogSOAP() {
    if (logSOAP == null)
      _initLogSOAPProxy();
    return logSOAP;
  }
  
  public wsd.ass.soap.client.Log[] getLogs() throws java.rmi.RemoteException{
    if (logSOAP == null)
      _initLogSOAPProxy();
    return logSOAP.getLogs();
  }
  
  
}