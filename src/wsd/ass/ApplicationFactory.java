package wsd.ass;

public interface ApplicationFactory {
	public void marshall();
	public void unmarshall();
	public String getFilePath();
	public String setFilePath(String filePath);
	public void add(Object object);
	public void remove(Object object);
	public Object get(Object object);
	public Object set(Object object);
}
