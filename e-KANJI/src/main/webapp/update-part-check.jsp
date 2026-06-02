<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報変更確認画面</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%
		request.setCharacterEncoding("UTF-8");
	%>
	
	<%@ include file="header-logo.jsp" %>
	
	参加者情報変更確認画面<br>
	<br>
	参加者情報を以下の内容に変更します。よろしいですか？<br>
	<jsp:useBean id="part" scope="session" class="model.entity.PartBean" />
	
	<jsp:setProperty name="part" property="partName" param="partName" />
	<jsp:setProperty name="part" property="partRuby" param="partRuby" />
	<jsp:setProperty name="part" property="partGender" param="partGender" />
	<jsp:setProperty name="part" property="partAge" param="partAge" />
	<jsp:setProperty name="part" property="partEmpyear" param="partEmpyear" />
	<jsp:setProperty name="part" property="part_post" param="part_post" />
	<jsp:setProperty name="part" property="partBudget" param="partBudget" />
	<jsp:setProperty name="part" property="partAllergy" param="partAllergy" />
	<jsp:setProperty name="part" property="partGenre" param="partGenre" />
	<jsp:setProperty name="part" property="partCategory" param="partCategory" />
	<jsp:setProperty name="part" property="partBeer" param="partBeer" />
	<jsp:setProperty name="part" property="partSmoke" param="partSmoke" />
	
	会員ID：<jsp:getProperty name="part" property="userID" /><br>
	参加者ID：<jsp:getProperty name="part" property="partID" /><br>
	氏名（漢字）：<jsp:getProperty name="part" property="partName" /><br>
	氏名（かな）：<jsp:getProperty name="part" property="partRuby" /><br>
	性別：<jsp:getProperty name="part" property="partGender" /><br>
	年齢：<jsp:getProperty name="part" property="partAge" /><br>
	入社年度：<jsp:getProperty name="part" property="partEmpyear" /><br>
	役職：<jsp:getProperty name="part" property="partPost" /><br>
    予算：<jsp:getProperty name="part" property="partBudget" /><br>
    アレルギー：<jsp:getProperty name="part" property="partAllergy" /><br>
    好きな食べ物のジャンル：<jsp:getProperty name="part" property="partGenre" /><br>
    好きな食べ物のカテゴリ：<jsp:getProperty name="part" property="partCategory" /><br>
    好きなビールの種類：<jsp:getProperty name="part" property="partBeer" /><br>
    タバコ：<jsp:getProperty name="part" property="partSmoke" /><br>

	<form action="update-part-ok-servlet" method="POST">
		<input type="submit" value="変更する">
	</form>

	<form action="update-part-servlet" method="POST">
		<input type="submit" value="変更画面に戻る">
	</form>


</body>
</html>