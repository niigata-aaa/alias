<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.RestBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店情報変更完了画面</title>
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
<%
RestBean bean = (RestBean) request.getAttribute("bean");
%>

以下の参加者情報を変更しました。<br>

<form action="adm-select-rest" method="post">

	以下の飲食店情報を変更しました。<br>

	<jsp:useBean id="rest" scope="session" class="model.entity.RestBean" />
	飲食店ID:<jsp:setProperty name="rest" property="restId" /><br>
	飲食店名：<jsp:getProperty name="rest" property="restName" /><br>
	店ジャンル：<jsp:getProperty name="rest" property="restGenre" /><br>
	食材カテゴリ：<jsp:getProperty name="rest" property="restCategory" /><br>
	オープン：<jsp:getProperty name="rest" property="restOpen" /><br>
	クローズ：<jsp:getProperty name="rest" property="restClose" /><br>
	日跨ぎ営業：<jsp:getProperty name="rest" property="restNextday" /><br>
	距離：<jsp:getProperty name="rest" property="restDistance" /><br>
	予算：<jsp:getProperty name="rest" property="restBudget" /><br>
	最大収容数：<jsp:getProperty name="rest" property="restCapacity" /><br>
	電話番号：<jsp:getProperty name="rest" property="restTel" /><br>
	住所：<jsp:getProperty name="rest" property="restAddress" /><br>
	詳細URL：<jsp:getProperty name="rest" property="restUrl" /><br>
	口コミ：<jsp:getProperty name="rest" property="restReview" /><br>
	ビールの種類：<jsp:getProperty name="rest" property="restBeer" /><br>
	喫煙席の有無：<jsp:getProperty name="rest" property="restSmoke" /><br>
	店内に喫煙所：<jsp:getProperty name="rest" property="restSmokeroom" /><br>
    
    <input type="submit" class="submit-top-right" value="管理者用飲食店一覧表示・検索画面へ戻る"><br>
</form>
<%--
	<form action="menu.html" method="POST">
		<input type="submit" value="メニュー画面に戻る">
	</form>
--%>
	<%--<% session.invalidate();%>--%>
</body>
</html>