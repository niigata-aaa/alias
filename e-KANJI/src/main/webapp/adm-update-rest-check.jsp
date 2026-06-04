<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店情報変更確認画面</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
	<%request.setCharacterEncoding("UTF-8");%>
	飲食店情報変更確認画面
	<br>
	<br> 飲食店情報を以下の内容に変更します。よろしいですか？
	<br>
	<jsp:useBean id="rest" scope="session" class="model.entity.RestBean" />

	<jsp:setProperty name="rest" property="restId" param="restId" />
	<jsp:setProperty name="rest" property="restName" param="restName" />
	<jsp:setProperty name="rest" property="restGenre" param="restGenre" />
	<jsp:setProperty name="rest" property="restCategory" param="restCategory" />
	<jsp:setProperty name="rest" property="restOpen" param="restOpen" />
	<jsp:setProperty name="rest" property="restClose" param="restClose" />
	<jsp:setProperty name="rest" property="restNextday" param="restNextday" />
	<jsp:setProperty name="rest" property="restDistance" param="restDistance" />
	<jsp:setProperty name="rest" property="restBudget" param="restBudget" />
	<jsp:setProperty name="rest" property="restCapacity" param="restCapacity" />
	<jsp:setProperty name="rest" property="restTel" param="restTel" />
	<jsp:setProperty name="rest" property="restAddress" param="restAddress" />
	<jsp:setProperty name="rest" property="restUrl" param="restUrl" />
	<jsp:setProperty name="rest" property="restReview" param="restReview" />
	<jsp:setProperty name="rest" property="restBeer" param="restBeer" />
	<jsp:setProperty name="rest" property="restSmoke" param="restSmoke" />
	<jsp:setProperty name="rest" property="restSmokeroom" param="restSmokeroom" />
	
<br>
	飲食店ID:<jsp:getProperty name="rest" property="restId" /><br>
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

	<form action="adm-update-rest-ok-servlet" method="POST">
		<input type="hidden" name="restId" value="${rest.restId}">
		<input type="hidden" name="restName" value="${rest.restName}">
		<input type="hidden" name="restGenre" value="${rest.restGenre}">
		<input type="hidden" name="restCategory" value="${rest.restCategory}">
		<input type="hidden" name="restOpen" value="${rest.restOpen}">
		<input type="hidden" name="restClose" value="${rest.restClose}">
		<input type="hidden" name="restNextday" value="${rest.restNextday}">
		<input type="hidden" name="restDistance" value="${rest.restDistance}">
		<input type="hidden" name="restBudget" value="${rest.restBudget}">
		<input type="hidden" name="restCapacity" value="${rest.restCapacity}">
		<input type="hidden" name="restTel" value="${rest.restTel}">
		<input type="hidden" name="restAddress" value="${rest.restAddress}">
		<input type="hidden" name="restUrl" value="${rest.restUrl}">
		<input type="hidden" name="restReview" value="${rest.restReview}">
		<input type="hidden" name="restBeer" value="${rest.restBeer}">
		<input type="hidden" name="restSmoke" value="${rest.restSmoke}">
		<input type="hidden" name="restSmokeroom" value="${rest.restSmokeroom}">
		<input type="submit" value="変更する">
	</form>

	<form action="adm-update-rest-servlet" method="POST">
		<input type="submit" value="変更画面に戻る">
	</form>
</body>
</html>