<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.PartBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報変更完了画面</title>
<link rel="stylesheet" href="css/style.css">
<style>
  .submit-top-right {
        position: fixed;   
        top: 10px;         
        right: 10px;       
        padding: 10px 20px;
        cursor: pointer;
</style>
</head>
<body>
<%@ include file="header-logo.jsp" %>
<%
PartBean bean = (PartBean) request.getAttribute("bean");
%>

以下の参加者情報を変更しました。<br>

<form action="select-part-servlet" method="post">

	以下の参加者情報を変更しました。<br>

	<jsp:useBean id="part" scope="session" class="model.entity.PartBean" />
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
    
    <input type="submit" class="submit-top-right" value="参加者一覧表示・検索画面へ戻る"><br>
</form>

	<form action="menu.html" method="POST">
		<input type="submit" value="メニュー画面に戻る">
	</form>

	<% session.invalidate(); %>

</body>
</html>