package model.entity;

import java.io.Serializable;

public class RestBean implements Serializable {
	private int restId;
	private String restName;
	private String restGenre;
	private String restCategory;
	private String restOpen;
	private String restClose;
	private int restNextday;
	private int restDistance;
	private int restBudget;
	private int restCapacity;
	private String restTel;
	private String restAddress;
	private String restUrl;
	private double restReview;
	private String restBeer;
	private int restSmoke;
	private int restSmokeroom;
	private int visitCount;

	public RestBean() {

	}

	public int getRestId() {
		return restId;
	}

	public void setRestId(int restId) {
		this.restId = restId;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getRestGenre() {
		return restGenre;
	}

	public void setRestGenre(String restGenre) {
		this.restGenre = restGenre;
	}

	public String getRestCategory() {
		return restCategory;
	}

	public void setRestCategory(String restCategory) {
		this.restCategory = restCategory;
	}

	public String getRestOpen() {
		return restOpen;
	}

	public void setRestOpen(String restOpen) {
		this.restOpen = restOpen;
	}

	public String getRestClose() {
		return restClose;
	}

	public void setRestClose(String restClose) {
		this.restClose = restClose;
	}

	public int getRestNextday() {
		return restNextday;
	}

	public void setRestNextday(int restNextday) {
		this.restNextday = restNextday;
	}

	public int getRestDistance() {
		return restDistance;
	}

	public void setRestDistance(int restDistance) {
		this.restDistance = restDistance;
	}

	public int getRestBudget() {
		return restBudget;
	}

	public void setRestBudget(int restBudget) {
		this.restBudget = restBudget;
	}

	public int getRestCapacity() {
		return restCapacity;
	}

	public void setRestCapacity(int restCapacity) {
		this.restCapacity = restCapacity;
	}

	public String getRestTel() {
		return restTel;
	}

	public void setRestTel(String restTel) {
		this.restTel = restTel;
	}

	public String getRestAddress() {
		return restAddress;
	}

	public void setRestAddress(String restAddress) {
		this.restAddress = restAddress;
	}

	public String getRestUrl() {
		return restUrl;
	}

	public void setRestUrl(String restUrl) {
		this.restUrl = restUrl;
	}

	public double getRestReview() {
		return restReview;
	}

	public void setRestReview(double restReview) {
		this.restReview = restReview;
	}

	public String getRestBeer() {
		return restBeer;
	}

	public void setRestBeer(String restBeer) {
		this.restBeer = restBeer;
	}

	public int getRestSmoke() {
		return restSmoke;
	}

	public void setRestSmoke(int restSmoke) {
		this.restSmoke = restSmoke;
	}

	public int getRestSmokeroom() {
		return restSmokeroom;
	}

	public void setRestSmokeroom(int restSmokeroom) {
		this.restSmokeroom = restSmokeroom;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

}
