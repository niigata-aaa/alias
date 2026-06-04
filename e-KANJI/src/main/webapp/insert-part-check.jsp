<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.PartBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者登録確認画面</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
<style>
table {
	border: 2px solid #000;
	text-align: center;
	margin: 0 auto;
	/* ← これを追加：上下マージン0、左右マージンを自動調整して中央配置 */
	background-color: rgb(255, 255, 255);
}

table th,
table td {
    text-align: left;
    margin-left:6px;
    margin-right:6px;
}

</style>
</head>
<body>
<%@ include file="header-logo.jsp" %>
参加者情報登録確認画面<br>
<!--<%-->
<!--String userId = (String)session.getAttribute("user_id");-->
<!--PartBean part = (PartBean) request.getAttribute("part");-->
<!--if (part == null) {-->
<!--    out.println("partがnullです");-->
<!--    return;-->
<!--}-->
<!--%>-->

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
		partGender = "";
	if (partAllergy == null)
		partAllergy = "";
	%>


	<form action="select-part-servlet" method="post">
		<input type="submit" value="参加者一覧表示・検索画面へ戻る">
	</form>
    <h2>この参加者情報を登録します</h2>


	<div>
			<table>
				<tr>
					<th>名前　　　　　　：<span class="required"> *</span></th>
					<td><%=partName%></td>
				</tr>
				<tr>
					<th>名前（かな）　　：</th>
					<td><%=partRuby%></td>
				</tr>
				<tr>
					<th>性別　　　　　　：</th>
					<td><%=partGender%></td>
				</tr>
				<tr>
					<th>年齢　　　　　　：</th>
					<td><%=partAge%></td>
				</tr>
				<tr>
					<th>入社年度　　　　：</th>
					<td><%=partEmpyear%></td>
				</tr>
				<tr>
					<th>役職名　　　　　：</th>
					<td>
					<%
					switch(partPost){
					case 0:
					    out.print("-");
					    break;
					case 1:
					    out.print("一般社員");
					    break;
					case 2:
					    out.print("主任・主査");
					    break;
					case 3:
					    out.print("係長");
					    break;
					case 4:
					    out.print("課長代理");
					    break;
					case 5:
					    out.print("課長");
					    break;
					case 6:
					    out.print("副部長");
					    break;
					case 7:
					    out.print("部長・支社長・所長");
					    break;
					case 8:
					    out.print("執行役員");
					    break;
					case 9:
					    out.print("常務取締役");
					    break;
					case 10:
					    out.print("専務取締役");
					    break;
					case 11:
					    out.print("社長");
					    break;
					case 12:
					    out.print("会長");
					    break;
					}
					%>
					</td>
				</tr>
				<tr>
					<th>希望予算　　　　：</th>
					<td><%=partBudget%></td>
				</tr>
				<tr>
					<th>アレルギー　　　：</th>
					<td><%=partAllergy%></td>
				</tr>
				<tr>
					<th>希望店ジャンル　：</th>
					<td>
					<%
					switch(partGenre){
					case 0:
					    out.print("特になし");
					    break;
					case 1:
					    out.print("和食");
					    break;
					case 2:
					    out.print("洋食");
					    break;
					case 3:
					    out.print("中華料理");
					    break;
					case 4:
					    out.print("フレンチ");
					    break;
					case 5:
					    out.print("韓国料理");
					    break;
					case 6:
					    out.print("アジア・エスニック");
					    break;
					case 7:
					    out.print("居酒屋");
					    break;
					case 8:
					    out.print("焼肉");
					    break;
					case 9:
					    out.print("カレー");
					    break;
					case 10:
					    out.print("鍋");
					    break;
					}
					%>
					</td>
				</tr>
				<tr>
					<th>希望食材カテゴリ：</th>
					<td>
					<%
					switch(partCategory){
					case 0:
					    out.print("特になし");
					    break;
					case 1:
					    out.print("肉");
					    break;
					case 2:
					    out.print("魚");
					    break;
					case 3:
					    out.print("野菜");
					    break;
					case 4:
					    out.print("麺類");
					    break;
					case 5:
					    out.print("米料理");
					    break;
					case 6:
					    out.print("揚げ物");
					    break;
					case 7:
					    out.print("お酒");
					    break;
					}
					%>
					</td>
				</tr>
				<tr>
					<th>ビールの好み　　：</th>
					<td>
					<%
					switch(partBeer){
					case 0:
					    out.print("特になし");
					    break;
					case 1:
					    out.print("アサヒ");
					    break;
					case 2:
					    out.print("キリン");
					    break;
					case 3:
					    out.print("サントリー");
					    break;
					case 4:
					    out.print("サッポロ");
					    break;
					case 5:
					    out.print("エビス");
					    break;
					case 6:
					    out.print("クラフトビール");
					    break;
					}
					%>
					</td>
				</tr>
				<tr>
					<th>たばこ　　　　　：</th>
					<td><%= partSmoke == 1 ? "吸う" : "吸わない" %></td>
				</tr>
			</table>
	</div>


	 <form action="insert-part-ok-servlet" method="post">
			<input type="hidden" name="part_name" value="<%=partName %>">
			<input type="hidden" name="part_ruby" value="<%=partRuby %>">
			<input type="hidden" name="part_gender" value="<%=partGender %>">
			<input type="hidden" name="part_age" value="<%=partAge %>">
			<input type="hidden" name="part_empyear" value="<%=partEmpyear %>">
			<input type="hidden" name="part_post" value="<%=partPost %>">
			<input type="hidden" name="part_budget" value="<%=partBudget %>">
			<input type="hidden" name="part_allergy" value="<%=partAllergy %>">
			<input type="hidden" name="part_genre" value="<%=partGenre %>">
			<input type="hidden" name="part_category" value="<%=partCategory %>">
			<input type="hidden" name="part_beer" value="<%=partBeer %>">
			<input type="hidden" name="part_smoke" value="<%=partSmoke %>">
		<input type="submit" value="この情報を追加する">
	</form>
	
		<form action="insert-part-back" method="post">
			<input type="hidden" name="part_name" value="<%=partName %>">
			<input type="hidden" name="part_ruby" value="<%=partRuby %>">
			<input type="hidden" name="part_gender" value="<%=partGender %>">
			<input type="hidden" name="part_age" value="<%=partAge %>">
			<input type="hidden" name="part_empyear" value="<%=partEmpyear %>">
			<input type="hidden" name="part_post" value="<%=partPost %>">
			<input type="hidden" name="part_budget" value="<%=partBudget %>">
			<input type="hidden" name="part_allergy" value="<%=partAllergy %>">
			<input type="hidden" name="part_genre" value="<%=partGenre %>">
			<input type="hidden" name="part_category" value="<%=partCategory %>">
			<input type="hidden" name="part_beer" value="<%=partBeer %>">
			<input type="hidden" name="part_smoke" value="<%=partSmoke %>">
			<input type="submit" value="戻る">
		</form>

</body>
</html>