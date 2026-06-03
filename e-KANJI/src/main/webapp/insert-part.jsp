<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者登録画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@ include file="header-logo.jsp" %>


	<%
	String userId = (String) session.getAttribute("user_id");
	String userName = (String) session.getAttribute("user_name");

	String partName = (String) request.getAttribute("part_name");
	String partRuby = (String) request.getAttribute("part_ruby");
	String partGender = (String) request.getAttribute("part_gender");

	Integer partAgeObj = (Integer) request.getAttribute("part_age");
	int partAge = (partAgeObj != null) ? partAgeObj : 0;

	Integer partEmpyearObj = (Integer) request.getAttribute("part_empyear");
	int partEmpyear = (partEmpyearObj != null) ? partEmpyearObj : 0;

	Integer partPostObj = (Integer) request.getAttribute("part_post");
	int partPost = (partPostObj != null) ? partPostObj : 0;

	Integer partBudgetObj = (Integer) request.getAttribute("part_budget");
	int partBudget = (partBudgetObj != null) ? partBudgetObj : 0;

	String partAllergy = (String) request.getAttribute("part_allergy");

	Integer partGenreObj = (Integer) request.getAttribute("part_genre");
	int partGenre = (partGenreObj != null) ? partGenreObj : 0;

	Integer partCategoryObj = (Integer) request.getAttribute("part_category");
	int partCategory = (partCategoryObj != null) ? partCategoryObj : 0;

	Integer partBeerObj = (Integer) request.getAttribute("part_beer");
	int partBeer = (partBeerObj != null) ? partBeerObj : 0;

	Integer partSmokeObj = (Integer) request.getAttribute("part_smoke");
	int partSmoke = (partSmokeObj != null) ? partSmokeObj : 0;

	if (partName == null)
		partName = "";
	if (partRuby == null)
		partRuby = "";
	if (partGender == null)
		partGender = "男";
	if (partAllergy == null)
		partAllergy = "";
	%>
	
	
    <form action="select-part.jsp" method="POST">
		<input type="submit" class="submit-top-right" value="参加者一覧表示・検索画面へ戻る">
	</form>
	
	参加者情報登録画面<br>

	<span class="required">*は必須入力です</span><br>
	<form action="insert-part-check-servlet" method="POST">
	    氏名（漢字）：<span class="required"> *</span>
	    	<input type="text" name="part_name" value="<%=partName%>"
	    				maxlength="100" required><br>
		氏名（かな）：<span class="required"> *</span>
			<input type="text" name="part_ruby" value="<%=partRuby%>"
						maxlength="100" required><br>
		性別：<span class="required"> *</span>
			<input type="radio" name="part_gender" value="男" required
					<%=partGender.equals("男") ? "checked" : ""%>>男
		      <input type="radio" name="part_gender" value="女"
		      		<%=partGender.equals("女") ? "checked" : ""%>>女<br>
		年齢：<span class="required"> *</span>
			<input type="number" name="part_age" value="<%= partAge == 0 ? "18" : partAge %>"
						min="18" max="100" required><br>
		入社年度：<span class="required"> *</span>
			<input type="number" name="part_empyear" min="1900" max="2100" required
					value="<%=partEmpyear == 0 ? "0" :partEmpyear%>"><br>
		役職：<select name="part_post">
						<option value="0" <%=partPost == 0 ? "selected" : ""%>>-</option>
						<option value="1" <%=partPost == 1 ? "selected" : ""%>>一般社員</option>
						<option value="2" <%=partPost == 2 ? "selected" : ""%>>主任・主査</option>
						<option value="3" <%=partPost == 3 ? "selected" : ""%>>係長</option>
						<option value="4" <%=partPost == 4 ? "selected" : ""%>>課長代理</option>
						<option value="5" <%=partPost == 5 ? "selected" : ""%>>課長</option>
						<option value="6" <%=partPost == 6 ? "selected" : ""%>>副部長</option>
						<option value="7" <%=partPost == 7 ? "selected" : ""%>>部長・支社長・所長</option>
						<option value="8" <%=partPost == 8 ? "selected" : ""%>>執行役員</option>
						<option value="9" <%=partPost == 9 ? "selected" : ""%>>常務取締役</option>
						<option value="10" <%=partPost == 10 ? "selected" : ""%>>専務取締役</option>
						<option value="11" <%=partPost == 11 ? "selected" : ""%>>社長</option>
						<option value="12" <%=partPost == 12 ? "selected" : ""%>>会長</option>
				</select><br>
		予算：<span class="required"> *</span>
			<input type="number" name="part_budget" value="<%= partBudget == 0 ? "1000" :partBudget%>" 
							min="1000" max="50000" step="500" required><br>
		アレルギー：<input type="text" name="part_allergy"
						value="<%=partAllergy%>" maxlength="100"><br>
		好きな食べ物のジャンル：<select name="part_genre">
							<option value="0" <%=partGenre == 0 ? "selected" : ""%>>特になし</option>
							<option value="1" <%=partGenre == 1 ? "selected" : ""%>>和食</option>
							<option value="2" <%=partGenre == 2 ? "selected" : ""%>>洋食</option>
							<option value="3" <%=partGenre == 3 ? "selected" : ""%>>中華料理</option>
							<option value="4" <%=partGenre == 4 ? "selected" : ""%>>フレンチ</option>
							<option value="5" <%=partGenre == 5 ? "selected" : ""%>>韓国料理</option>
							<option value="6" <%=partGenre == 6 ? "selected" : ""%>>アジア・エスニック</option>
							<option value="7" <%=partGenre == 7 ? "selected" : ""%>>居酒屋</option>
							<option value="8" <%=partGenre == 8 ? "selected" : ""%>>焼肉</option>
							<option value="9" <%=partGenre == 9 ? "selected" : ""%>>カレー</option>
							<option value="10" <%=partGenre == 10 ? "selected" : ""%>>鍋</option>
		    </select><br>
		好きな食べ物のカテゴリ：<select name="part_category">
							<option value="0" <%=partCategory == 0 ? "selected" : ""%>>特になし</option>
							<option value="1" <%=partCategory == 1 ? "selected" : ""%>>肉</option>
							<option value="2" <%=partCategory == 2 ? "selected" : ""%>>魚</option>
							<option value="3" <%=partCategory == 3 ? "selected" : ""%>>野菜</option>
							<option value="4" <%=partCategory == 4 ? "selected" : ""%>>麺類</option>
							<option value="5" <%=partCategory == 5 ? "selected" : ""%>>米料理</option>
							<option value="6" <%=partCategory == 6 ? "selected" : ""%>>揚げ物</option>
							<option value="7" <%=partCategory == 7 ? "selected" : ""%>>お酒</option>
		    </select><br>
		好きなビールの種類：<select name="part_beer">
							<option value="0" <%=partBeer == 0 ? "selected" : ""%>>特になし</option>
							<option value="1" <%=partBeer == 1 ? "selected" : ""%>>アサヒ</option>
							<option value="2" <%=partBeer == 2 ? "selected" : ""%>>キリン</option>
							<option value="3" <%=partBeer == 3 ? "selected" : ""%>>サントリー</option>
							<option value="4" <%=partBeer == 4 ? "selected" : ""%>>サッポロ</option>
							<option value="5" <%=partBeer == 5 ? "selected" : ""%>>エビス</option>
							<option value="6" <%=partBeer == 6 ? "selected" : ""%>>クラフトビール</option>
		    </select><br>
		喫煙者は☑：<input type="checkbox" name="part_smoke" value="1"
						<%=partSmoke == 1 ? "checked" : ""%>><br>
	
	<br>※個人情報の取扱いについては<a href="https://www.inet.co.jp/privacypolicy.html" target="_blank" rel="noopener noreferrer">
  こちら</a>をご確認のうえで確認画面へお進みください。<br>
		<input type="submit" value="確認画面へ">
	</form>
	
	

</body>
</html>