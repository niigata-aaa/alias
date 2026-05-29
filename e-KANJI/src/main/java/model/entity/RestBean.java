package model.entity;

import java.io.Serializable;

public class RestBean implements Serializable {
	private int restId;
	private String restName;
	private String genre;
	private String category;
	private String open;
	private String close;
	private int nextday;
	private int distance;
	private int restBudget;
	private int capacity;
	private String tel;
	private String address;
	private String url;
	private String restBeer;
	private String restSmoke;
	private String restSmokeroom;
	
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getClose() {
		return close;
	}
	public void setClose(String close) {
		this.close = close;
	}
	public int getNextday() {
		return nextday;
	}
	public void setNextday(int nextday) {
		this.nextday = nextday;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public int getRestBudget() {
		return restBudget;
	}
	public void setRestBudget(int restBudget) {
		this.restBudget = restBudget;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRestBeer() {
		return restBeer;
	}
	public void setRestBeer(String restBeer) {
		this.restBeer = restBeer;
	}
	public String getRestSmoke() {
		return restSmoke;
	}
	public void setRestSmoke(String restSmoke) {
		this.restSmoke = restSmoke;
	}
	public String getRestSmokeroom() {
		return restSmokeroom;
	}
	public void setRestSmokeroom(String restSmokeroom) {
		this.restSmokeroom = restSmokeroom;
	}
}
