<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.PartBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者一覧表示</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/scroll.css">
<style>
td button {
  width: 90%;
  padding: 5px;
  box-sizing: border-box;
}
</style>
</head>
<body>

<br>
<%--検索条件を表示 --%>

<%-- <form action="" method="post">
<input type="submit" value="検索"><br>--%>
<table border=0>
<tr>
<td>
<%--トップに戻る --%>
<form action="top.jsp" method="post">
<input type="submit" value="トップに戻る">
</form>
</td>

<td>
<%--参加者情報登録画面へ --%>
<form action="insert-part.jsp" method="post">
<input type="submit" value="参加者情報登録">
</form>
</td>

<td>
<%--参加者一括削除 --%>
<form action="dlete-all-part-check-servlet" method="post">
<input type="submit" value="参加者一括削除">
</form>
</td>
<td>
<%--参加者全表示 --%>
<form action="select-part-servlet" method="post">
<input type="submit" value="参加者全表示">
</form>
</td>
</tr>
</table>

<div id="table_title"><h1>参加者一覧表示・検索画面</h1></div>        
<div class="exampleSearchPart"><br>

<%--検索機能 --%>
<form action="narrow-part-savlet" method="post">
キーワード検索<input type="text" name="part_name" placeholder="苗字か名前で検索してください">

<input type="submit" value="検索"><br><br>


	<%
		List<PartBean> partList= (List<PartBean>) request.getAttribute("partList");	
	%>


<%--
<input type="checkbox"name="beer" value="">アサヒ
<input type="checkbox"name="beer" value="">キリン
<input type="checkbox"name="beer" value="">サントリー
<input type="checkbox"name="beer" value="">サッポロ
<input type="checkbox"name="beer" value="">エビス
<input type="checkbox"name="beer" value="">特になし<br>
--%>


</form>
</div>

<div class="exampleResultPart">
<%--参加者一覧表示 --%>

<table border=1>
		<tr>
			<th>登録した幹事のID</th>
			<th>参加者ID</th>
			<th>氏名（漢字）</th>
			<th>氏名（かな）</th>
			<th>性別</th>
			<th>年齢</th>
			<th>入社年度</th>
			<th>役職</th>
			<th>予算</th>
			<th>アレルギー</th>
			<th>好きな食べ物のジャンル</th>
			<th>好きな食べ物のカテゴリ</th>
			<th>ビールの好み</th>
			<th>喫煙するか</th>
			<th>参加者情報変更</th>
			<th>参加者情報削除</th>
		</tr>

		<%
		if(partList != null){	
		for (PartBean part : partList) {
		%>

		<tr>
			<td><%=part.getUserID()%></td>
			<td><%=part.getPartID()%></td>
			<td><%=part.getPartName() %></td>
			<td><%=part.getPartRuby() %></td>
			<td><%=part.getPartGender() %></td>
			<td><%=part.getPartAge() %></td>
			<td><%=part.getPartEmpyear() %></td>
			<td><%=part.getPartPost() %></td>
			<td><%=part.getPartBudget() %></td>
			<td><%=part.getPartAllergy() %></td>
			<td><%=part.getPartGenre() %></td>
			<td><%=part.getPartCategory() %></td>
			<td><%=part.getPartBeer() %></td>
			<td><%=part.getPartSmoke() %></td>
			
			<td>
				<form action="update-part-servlet" method="POST">
					<input type="hidden" name="partID" value="<%=part.getPartID()%>">
					<input type="submit" value="更新">
				</form>
			</td>
			
			<td>
				<form action="delete-part-check-servlet" method="POST">
					<input type="hidden" name="partID" value="<%=part.getPartID()%>">
					<input type="submit" value="削除">
				</form>
			</td>
		</tr>
		
		<%
			}
		}
		%>
</table>

</div>
</body>
</html>