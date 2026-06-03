package model.entity;

import java.io.Serializable;

public class LogBean implements Serializable {
	private String logUserId;
	private int logRestId;
	private String logTime;
	
	public LogBean() {
		
	}

	public String getLogUserId() {
		return logUserId;
	}

	public void setLogUserId(String logUserId) {
		this.logUserId = logUserId;
	}

	public int getLogRestId() {
		return logRestId;
	}

	public void setLogRestId(int logRestId) {
		this.logRestId = logRestId;
	}

	public String getLogTime() {
		return logTime;
	}

	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}

}
