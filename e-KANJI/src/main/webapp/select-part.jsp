<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.PartBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者一覧表示</title>
</head>
<body>
<h1>参加者一覧表示・検索画面</h1>
<br>
<%--検索条件を表示 --%>

<%-- <form action="" method="post">
<input type="submit" value="検索"><br>--%>


<%--参加者情報登録画面へ --%>
<form action="" method="post">
<input type="submit" value="参加者情報登録">
</form>


<%--参加者一括削除 --%>
<form action="" method="post">
<input type="submit" value="参加者一括削除">
</form>

<%--参加者全表示 --%>
<form action="/select-part-servlet" method="post">
<input type="submit" value="参加者全表示">
</form>


<%--検索機能 --%>
<form action="" method="post">
キーワード検索<input type="text" name="keyword" value="苗字か名前で検索してください">
<input type="submit" value="検索">

■性別：
<select name="gender">
<option value="men">男</option>
<option value="women">女</option>
</select>

■役職：
<select name="post">
<option value="">一般社員</option>
<option value="">主任・主査</option>
<option value="">係長</option>
<option value="">課長代理</option>
<option value="">課長</option>
<option value="">副部長</option>
<option value="">部長・支社長・所長</option>
<option value="">執行役員</option>
<option value="">常務取締役</option>
<option value="">専務取締役</option>
<option value="">社長</option>
<option value="">会長</option>
</select>

■入社年度：
<%-- <input type="date" name="part_empyear">yyyy/mm/ddで入力<br>  --%>
<select name="year">
<%for (int i=2026;i>=1960;i--){ %>
<option value=<%=i %>>
	<%=i %>年
</option>
<%} %>
</select>

■喫煙：
<select name="smoke">
<option value="yes">吸う</option>
<option value="no">吸わない</option>
</select>

■ビールの好み：
<select name="beer">
<option value="asahi">アサヒ</option>
<option value="kirin">キリン</option>
<option value="snatory">サントリー</option>
<option value="sapporo">サッポロ</option>
<option value="ebisu">エビス</option>
<option value="all">特になし</option>
</select>

<%--
<input type="checkbox"name="beer" value="">アサヒ
<input type="checkbox"name="beer" value="">キリン
<input type="checkbox"name="beer" value="">サントリー
<input type="checkbox"name="beer" value="">サッポロ
<input type="checkbox"name="beer" value="">エビス
<input type="checkbox"name="beer" value="">特になし<br>
--%>

</form>



<%--参加者一覧表示 --%>
	<%
		List<PartBean> partList= (List<PartBean>) request.getAttribute("partList");	
	%>
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
		%>

	</table>
</body>
</html>