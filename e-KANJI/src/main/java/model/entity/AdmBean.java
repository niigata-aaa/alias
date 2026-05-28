package model.entity;

import java.io.Serializable;

public class AdmBean implements Serializable {
	private String admId;
	private String admPass;
	
	public AdmBean() {
		
	}

	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public String getAdmPass() {
		return admPass;
	}

	public void setAdmPass(String admPass) {
		this.admPass = admPass;
	}
}
