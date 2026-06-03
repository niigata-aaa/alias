<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.RestBean, model.entity.LogBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>飲食店詳細</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Zen+Maru+Gothic:wght@400;500;700&display=swap" rel="stylesheet">

<style>
table{
    border-collapse: collapse; /* 枠線を重ねる */
    margin: 0 auto;            /* 左右のマージンを自動にして中央寄せ */
    width: 40%;                /* 任意の幅（%やpxで指定可能） */
    text-align: center;        /* セル内の文字を中央揃え */
}

table th {
    white-space: normal;
    word-break: break-all; /* ヘッダーも枠内で改行を許可 */
    border-right: 1px solid #999;
    border-bottom: 1px solid #999;
    background: #f2f2f2;
    position: sticky;
    top: 0;
    left: 0;
    padding: 6px 2px;     /* ★上下左右の余白を少し詰める */
    font-size: 11px;      /* ★文字サイズを11pxに下げて縦伸びを抑える */
    font-weight: bold;
}

table td{
    white-space: normal;
    word-break: break-all;
    border-right: 1px solid #999;
    border-bottom: 1px solid #999;
    background: #FFF;
    padding: 4px 2px;     /* ★上下左右の余白を少し詰める */
    font-size: 11px;      /* ★文字サイズを小さくして、横一列に入る文字数を増やす */
    text-align: center;   /* 中央寄せで見やすくする */
}

.submit-top-right {
        position: fixed;   
        top: 10px;         
        right: 10px;       
        padding: 10px 20px;
        cursor: pointer;
}
       
</style>
</head>
<body>
<%@ include file="header-logo.jsp" %>
<h2>飲食店詳細</h2>
<%
	RestBean bean = (RestBean) request.getAttribute("bean");
	List<LogBean> logList = (List<LogBean>) request.getAttribute("logList");

	double distance = bean.getRestDistance() / 1000.0;
%>
<%
	if(bean != null){
%>
	
	<table border=1>
			<tr><th>店舗名</th><td><%=bean.getRestName() %></td></tr>
			<tr><th>料理ジャンル</th><td><%=bean.getRestGenre() %></td></tr>
			<tr><th>食材カテゴリ</th><td><%=bean.getRestCategory() %></td></tr>
			<tr><th>新潟駅からの距離</th><td><%=distance %> km</td></tr>
			<tr><th>予算</th><td><%=bean.getRestBudget() %> 円</td></tr>
			<tr><th>最大収容数</th><td><%=bean.getRestCapacity() %> 席</td></tr>
			<tr><th>住所</th><td><%=bean.getRestAddress() %></td></tr>
			<tr>
				<th>営業時間</th>
				<td><%=bean.getRestOpen().substring(0, 5) %> ~ <%=bean.getRestClose().substring(0, 5) %></td>
			</tr>
			<tr><th>店のURL</th><td><%=bean.getRestUrl() %></td></tr>
			<tr><th>電話番号</th><td><%=bean.getRestTel() %></td></tr>
			<tr><th>ビールの種類</th><td><%=bean.getRestBeer() %></td></tr>
			<tr><th>口コミ</th><td>★ <%=bean.getRestReview() %></td></tr>
			<tr><th>喫煙席</th><td><%= bean.getRestSmoke() == 0 ? "なし" : "あり" %></td></tr>
			<tr><th>店内喫煙所</th><td><%= bean.getRestSmokeroom() == 0 ? "なし" : "あり" %></td></tr>
	</table>
	<br>

<%
	}
%>
		
		
	<h3>訪問履歴</h3>
<%
	if(logList != null){
%>

	<table border=1>
		<tr><th>訪問回数</th><td><%= bean.getVisitCount() + "回" %></td></tr>
	</table>
	
	<table border=1>
<%
		int count = 1;
		for (LogBean log : logList) {
%>

			<tr><th><%= count %>.</th><td><%= log.getLogTime() %></td></tr>

<%
			count++;
		}
%>

	</table>

	
<%
	} else {
%>
	訪問履歴はありません。
<%
	}
%>

	<br><br><br>

	<form action="select-rest-ok" method="POST">
		<input type="hidden" name="restId" value="<%=bean.getRestId()%>">
		<input type="submit" value="ここに決めた！"><br>
	</form>
	<br>


	<form class="submit-top-right" action="select-rest" method="POST">
		<input type="submit" value="飲食店一覧表示・検索画面へ戻る">
	</form>

</body>
</html>