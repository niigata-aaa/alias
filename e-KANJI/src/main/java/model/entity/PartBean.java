/*package model.entity;

import java.io.Serializable;

public class PartBean implements Serializable {

}
*/
package model.entity;

import java.io.Serializable;

public class PartBean implements Serializable{

	//会員ID
	private String userID;
	
	//参加者ID
	private int partID;
	
	//参加者名
	private String partName;
	
	//参加者ふりがな
	private String partRuby;
	
	//性別
	private String partGender;
	
	//年齢
	private int partAge;
	
	//入社年度
	private int partEmpyear;
	
	//役職ID　（！！！！！！！！！！！！！！！追加！！！！！！！！！！！！！！！！！！）
	private int partPostId;

	//役職
	private String partPost;
	
	//予算
	private int partBudget;
	
	//アレルギー
	private String partAllergy;
	
	//好きな料理ジャンル
	private String partGenre;
	
	//好きな食材カテゴリ
	private String partCategory;
	
	//好きなビールの種類
	private String partBeer;
	
	//喫煙するか
	private int partSmoke;
	
	/**
	 * PartBeenを構築
	 */
	public PartBean() {
		
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public int getPartID() {
		return partID;
	}

	public void setPartID(int partID) {
		this.partID = partID;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getPartRuby() {
		return partRuby;
	}

	public void setPartRuby(String partRuby) {
		this.partRuby = partRuby;
	}

	public String getPartGender() {
		return partGender;
	}

	public void setPartGender(String partGender) {
		this.partGender = partGender;
	}

	public int getPartAge() {
		return partAge;
	}

	public void setPartAge(int partAge) {
		this.partAge = partAge;
	}

	public int getPartEmpyear() {
		return partEmpyear;
	}

	public void setPartEmpyear(int partEmpyear) {
		this.partEmpyear = partEmpyear;
	}
	
	public int getPartPostId() {
		return partPostId;
	}

	public void setPartPostId(int partPostId) {
		this.partPostId = partPostId;
	}

	public String getPartPost() {
		return partPost;
	}

	public void setPartPost(String partPost) {
		this.partPost = partPost;
	}

	public int getPartBudget() {
		return partBudget;
	}

	public void setPartBudget(int partBudget) {
		this.partBudget = partBudget;
	}

	public String getPartAllergy() {
		return partAllergy;
	}

	public void setPartAllergy(String partAllergy) {
		this.partAllergy = partAllergy;
	}

	public String getPartGenre() {
		return partGenre;
	}

	public void setPartGenre(String partGenre) {
		this.partGenre = partGenre;
	}

	public String getPartCategory() {
		return partCategory;
	}

	public void setPartCategory(String partCategory) {
		this.partCategory = partCategory;
	}

	public String getPartBeer() {
		return partBeer;
	}

	public void setPartBeer(String partBeer) {
		this.partBeer = partBeer;
	}

	public int getPartSmoke() {
		return partSmoke;
	}

	public void setPartSmoke(int partSmoke) {
		this.partSmoke = partSmoke;
	}
	
	
}
