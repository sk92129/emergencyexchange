package lionsteins;

import java.util.*;
import java.io.*;
import java.sql.*;
import java.sql.Timestamp;

public class AlertBean implements Serializable {

	private String id;
	private String senderName;
	private Timestamp sent;

	public AlertBean() {
		id = "48484884";
		senderName = "Lionsteins";
		java.util.Date utilDate = new java.util.Date(System.currentTimeMillis());
		java.sql.Date date = new java.sql.Date(utilDate.getTime());
		sent = new Timestamp(date.getTime());
	}


	public String getId() {
		return id;
	}


	public String getSenderName() {
		return senderName;
	}


	public String getSentTime() {
		return sent.toString();
	}
}
