package wsd.ass.soap.client;

public class UserSOAPProxy implements wsd.ass.soap.client.UserSOAP {
  private String _endpoint = null;
  private wsd.ass.soap.client.UserSOAP userSOAP = null;
  
  public UserSOAPProxy() {
    _initUserSOAPProxy();
  }
  
  public UserSOAPProxy(String endpoint) {
    _endpoint = endpoint;
    _initUserSOAPProxy();
  }
  
  private void _initUserSOAPProxy() {
    try {
      userSOAP = (new wsd.ass.soap.client.UserSOAPServiceLocator()).getUserSOAPPort();
      if (userSOAP != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)userSOAP)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)userSOAP)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (userSOAP != null)
      ((javax.xml.rpc.Stub)userSOAP)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public wsd.ass.soap.client.UserSOAP getUserSOAP() {
    if (userSOAP == null)
      _initUserSOAPProxy();
    return userSOAP;
  }
  
  public wsd.ass.soap.client.User[] getUsers() throws java.rmi.RemoteException, wsd.ass.soap.client.JAXBException, wsd.ass.soap.client.IOException{
    if (userSOAP == null)
      _initUserSOAPProxy();
    return userSOAP.getUsers();
  }
  
  public wsd.ass.soap.client.User getUser(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException, wsd.ass.soap.client.JAXBException, wsd.ass.soap.client.IOException{
    if (userSOAP == null)
      _initUserSOAPProxy();
    return userSOAP.getUser(arg0, arg1);
  }
  
  
}