<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.PartBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報変更確認画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%
    	PartBean part = (PartBean)request.getAttribute("part");
	%>
	
	<%@ include file="header-logo.jsp" %>
	
	参加者情報変更確認画面<br>
	<br>
	参加者情報を以下の内容に変更します。よろしいですか？<br>


	氏名（漢字）：<%=part.getPartName()%><br>
	氏名（かな）：<%=part.getPartRuby()%><br>
	性別：<%=part.getPartGender()%><br>
	年齢：<%=part.getPartAge()%><br>
	入社年度：<%=part.getPartEmpyear()%><br>
	役職：
	<%
					switch(part.getPartPostId()){
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
					%><br>
    予算：<%=part.getPartBudget()%><br>
    アレルギー：<%=part.getPartAllergy()%><br>
    好きな食べ物のジャンル：
    <%
					switch(part.getPartGenreId()){
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
					%><br>
    好きな食べ物のカテゴリ：
    <%
					switch(part.getPartCategoryId()){
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
					%><br>
    好きなビールの種類：
    <%
					switch(part.getPartBeerId()){
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
					%><br>
    タバコ：<%= part.getPartSmoke() == 1 ? "吸う" : "吸わない" %><br>

	<form action="update-part-ok-servlet" method="POST">
		<input type="hidden" name="partID" value="<%=part.getPartID()%>">
		<input type="hidden" name="partName" value="<%=part.getPartName()%>">
		<input type="hidden" name="partRuby" value="<%=part.getPartRuby()%>">
		<input type="hidden" name="partGender" value="<%=part.getPartGender()%>">
		<input type="hidden" name="partAge" value="<%=part.getPartAge()%>">
		<input type="hidden" name="partEmpyear" value="<%=part.getPartEmpyear()%>">
		<input type="hidden" name="partPostId" value="<%=part.getPartPostId()%>">
		<input type="hidden" name="partBudget" value="<%=part.getPartBudget()%>">
		<input type="hidden" name="partAllergy" value="<%=part.getPartAllergy()%>">
		<input type="hidden" name="partGenreId" value="<%=part.getPartGenreId()%>">
		<input type="hidden" name="partCategoryId" value="<%=part.getPartCategoryId()%>">
		<input type="hidden" name="partBeerId" value="<%=part.getPartBeerId()%>">
		<input type="hidden" name="partSmoke" value="<%=part.getPartSmoke()%>">
		<input type="submit" value="変更する">
	</form>

	<form action="update-part-servlet" method="POST">
		<input type="hidden" name="partID" value="<%=part.getPartID()%>">
		<input type="submit" value="変更画面に戻る">
	</form>


</body>
</html>