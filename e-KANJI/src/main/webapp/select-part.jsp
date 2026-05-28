<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.PartBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者一覧表示</title>
</head>
<body>

<%--検索条件を表示 --%>
<form action="" method="">
■性別：<input type="checkbox" name="gender" value="men">男
	<input type="checkbox" name="gender" value="women">女<br>
	
■役職：
<input type="checkbox" name="post" value="">一般社員
<input type="checkbox" name="post" value="">主任・主査<br>
<input type="checkbox" name="post" value="">係長
<input type="checkbox" name="post" value="">課長代理<br>
<input type="checkbox" name="post" value="">課長
<input type="checkbox" name="post" value="">副部長<br>
<input type="checkbox" name="post" value="">部長・支社長・所長
<input type="checkbox" name="post" value="">執行役員<br>
<input type="checkbox" name="post" value="">常務取締役
<input type="checkbox" name="post" value="">専務取締役<br>
<input type="checkbox" name="post" value="">社長
<input type="checkbox" name="post" value="">会長<br>

■入社年度：
<input type="date" name="part_empyear">yyyy/mm/ddで入力<br>

■喫煙：
<input type="checkbox" name="smoke" value="yes">吸う
<input type="checkbox" name="smoke" value="no">吸わない

■ビールの好み：
<input type="checkbox"name="beer" value="">アサヒ
<input type="checkbox"name="beer" value="">キリン
<input type="checkbox"name="beer" value="">サントリー
<input type="checkbox"name="beer" value="">サッポロ
<input type="checkbox"name="beer" value="">エビス
<input type="checkbox"name="beer" value="">特になし
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
			for (PartBean part:partList) {
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
</html