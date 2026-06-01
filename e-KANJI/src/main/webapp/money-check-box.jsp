<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, model.entity.PartBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>割り勘・集金管理画面</title>
<link rel="stylesheet" href="css/money-check-box.css">
</head>
<body>
	<form action="top.jsp" method="post" class="back-top-form">
		<input type="submit" value="トップ画面に戻る">
	</form>

	<%
	List<PartBean> partList = (List<PartBean>) request.getAttribute("partList");
	%>


	<h1>割り勘・集金管理画面</h1>
	<br>
	<form action="money-check-box" method="post">
		合計金額 <input type="number" name="sum" value="${sum}" required>円<br>
		<br> 割り勘人数 <input type="number" name="party" value="${party}"
			required>人<br> <br> 一人あたりの合計金額 <input type="number"
			name="result" value="${result }">円<br> <br> <input
			type="submit" value="割り算計算">

	</form>
	<br>
	<br>
	<br> 会員ID：<%=request.getAttribute("user_id")%><br>




	<%
	if (partList != null) {
	%>
	<table border=1>
		<tr>
			<th>参加者氏名（漢字）</th>
			<th>参加者氏名（かな）</th>
			<th>集金済みチェック</th>
		</tr>

		<%
		for (PartBean part : partList) {
		%>

		<tr>
			<td><%=part.getPartName()%></td>
			<td><%=part.getPartRuby()%></td>
			<td><input type="checkbox" name="check"></td>
		</tr>

		<%
		}
		}
		%>
	</table>

</body>
</html>