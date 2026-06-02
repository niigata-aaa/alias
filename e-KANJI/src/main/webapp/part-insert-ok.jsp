<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.entity.PartBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規参加者登録</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%	
	String userName = (String) session.getAttribute("user_name");
	PartBean part = (PartBean)request.getAttribute("part");
%>

	<%@ include file="header-logo.jsp"%>
	<div>
		<h2>新規参加者登録</h2>
		以下の内容で参加者登録しました。
	</div>
	
	<div>
			<table>
				<tr>
					<th>名前<span class="required"> *</span></th>
					<td><%=part.getPartName() %></td>
				</tr>
				<tr>
					<th>名前（かな）</th>
					<td><%=part.getPartRuby() %></td>
				</tr>
				<tr>
					<th>性別</th>
					<td><%=part.getPartGender() %></td>
				</tr>
				<tr>
					<th>年齢</th>
					<td><%=part.getPartAge() %></td>
				</tr>
				<tr>
					<th>入社年度</th>
					<td><%=part.getPartEmpyear() %></td>
				</tr>
				<tr>
					<th>役職名</th>
					<td>
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
					%>
					</td>
				</tr>
				<tr>
					<th>希望予算</th>
					<td><%=part.getPartBudget() %></td>
				</tr>
				<tr>
					<th>アレルギー</th>
					<td><%=part.getPartAllergy() %></td>
				</tr>
				<tr>
					<th>希望店ジャンル</th>
					<td>
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
					%>
					</td>
				</tr>
				<tr>
					<th>希望食材カテゴリ</th>
					<td>
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
					%>
					</td>
				</tr>
				<tr>
					<th>ビールの好み</th>
					<td>
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
					%>
					</td>
				</tr>
				<tr>
					<th>たばこ</th>
					<td><%= part.getPartSmoke() == 1 ? "吸う" : "吸わない" %></td>
				</tr>
			</table>
	</div>
	
	<div>
		<form action="login.jsp" method="post">
			<input type="submit" value="ログイン画面に戻る">
		</form>
	</div>

</body>
</html>