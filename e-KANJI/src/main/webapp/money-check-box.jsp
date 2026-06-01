
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>割り勘・集金管理画面</title>
<link rel="stylesheet" href="css/money-check-box.css">
</head>
<body>
<form action="top.jsp" method="post"class="back-top-form">
<input type="submit" value="トップ画面に戻る">
</form>

<h1>割り勘・集金管理画面</h1>
<br>
<form action="money-check-box-servlet"  method="post">
合計金額 <input type="number" name="sum"  value="${sum}" required>円<br><br>
割り勘人数 <input type="number" name="party"value="${party}" required>人<br><br>
一人あたりの合計金額 <input type="number" name="result" value="${result }">円<br><br>
<input type="submit" value="割り算計算">


</form>
<br><br><br>


ログインID：<%=request.getAttribute("user_id") %><br>
ログインIDに応じた参加者を表示！！



<table>
<caption><h2>集金確認</h2></caption>

			<tr><th>参加者ID</th><th>氏名（漢字）</th><th>氏名（かな）</th><th>集金済みチェック</th></tr>
			<tr><td>part_id</td><td>part_name</td><td>part_ruby</td><td><input type="checkbox"name="check"></td></tr>
			<tr><td>part_id</td><td>part_name</td><td>part_ruby</td><td><input type="checkbox"name="check"></td></tr>
			<tr><td>part_id</td><td>part_name</td><td>part_ruby</td><td><input type="checkbox"name="check"></td></tr>
			<tr><td>part_id</td><td>part_name</td><td>part_ruby</td><td><input type="checkbox"name="check"></td></tr>
			<tr><td>part_id</td><td>part_name</td><td>part_ruby</td><td><input type="checkbox"name="check"></td></tr>

</table>


</body>
</html>