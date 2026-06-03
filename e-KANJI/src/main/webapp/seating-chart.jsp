<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.PartBean, model.entity.RestBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>配席システム</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/seating-chart.css">
</head>
<body>
	<%@ include file="header-logo.jsp" %>
	<%@ include file="header-user-id.jsp" %>
	
	<%
		List<PartBean> partList = (List<PartBean>) request.getAttribute("partList");	
		RestBean rest = (RestBean) request.getAttribute("rest");
		String sortType = (String)request.getAttribute("sortType");
		if(sortType == null){
		    sortType = "random";
		}
	%>
	
	
	<br><br>
	<form action="top" method="POST">
		<input type="submit" value="トップに戻る">
	</form>
	
	<h2>選択中の飲食店</h2>
	
	

		<%
			if(rest != null){
		%>
		
		<table class="rest">
			<tr>
				<th>店名</th>
				<th>ジャンル</th>
				<th>カテゴリ</th>
				<th>距離</th>
				<th>予算</th>
				<th>席数</th>
				<th>営業時間</th>
				<th>評価</th>
				<th>TEL</th>
			</tr>
	
			<tr>
				<td><%=rest.getRestName()%></td>
				<td><%=rest.getRestGenre()%></td>
				<td><%=rest.getRestCategory() %></td>
				<td><%=rest.getRestDistance() / 1000.0 %> km</td>
				<td><%=rest.getRestBudget() %></td>
				<td><%=rest.getRestCapacity() %> 席</td>
				<td><%=rest.getRestOpen() %> ~ <%=rest.getRestClose() %></td>
				<td>★ <%=rest.getRestReview() %></td>
				<td><%=rest.getRestTel() %></td>
			</tr>
			
		</table>
		
		<%
			if (rest.getRestCapacity() < partList.size()) {
		%>
				<a class="alert">参加者数がお店の最大収容数を超えています。</a>
		<%	
			}
		
			} else {
		%>
				お店が選択されていません。
		<%
			}
		%>

	
	<br>
	
	<h2>配席</h2>
	
	
	<form action="seating-chart" method="post">

	    <input type="radio" name="sortType" value="random" <%= sortType.equals("random") ? "checked" : "" %>>
	    ランダム
	
	    <input type="radio" name="sortType" value="post" <%= sortType.equals("post") ? "checked" : "" %>>
	    役職順
	
	    <input type="radio" name="sortType" value="gender" <%= sortType.equals("gender") ? "checked" : "" %>>
	    性別順
	
	    <input type="radio" name="sortType" value="smoke" <%= sortType.equals("smoke") ? "checked" : "" %>>
	    喫煙者配慮

	    <br>
	    <input type="submit" value="並び替える">

	</form>
	
	
	

	<h3>参加者数：<%=partList.size() %>名</h3>

	<% if("post".equals(sortType)){ %>
	
	    <%-- 役職順表示（右列が上座） --%>
	
	    <%
	    List<PartBean> leftList =
	        (List<PartBean>)request.getAttribute("leftList");
	
	    List<PartBean> rightList =
	        (List<PartBean>)request.getAttribute("rightList");
	    %>
	    
	    <div class="seatArea">
		    <div class="desk"></div>
		    
		    <table class="seatTable">
		    
		    <tr>
		        <th class="seatHeader">下座</th>
		        <th class="seatHeader">上座</th>
		    </tr>

				
		    <%
		    for(int i = 0; i < rightList.size(); i++){
		    %>
		
		        <tr>
		
		            <%-- 左側（下座） --%>
		            <td class="seat">
		
		            <%
		            if(i < leftList.size()){
		
		                PartBean left = leftList.get(i);
		            %>
		
		                <div class="ruby"><%=left.getPartRuby()%></div>
		                <div class="name"><%=left.getPartName()%></div>
		                <div class="info">
			                <%=left.getPartPost()%><br>
			                <%=left.getPartGender()%>
			                <%=left.getPartSmoke() == 1 ? "🚬" : "" %>
			            </div>
		
		            <%
		            }
		            %>
		
		            </td>
		            
		
		            <%-- 右側（上座） --%>
		            <td class="seat">
		
		            <%
		            PartBean right = rightList.get(i);
		            %>
		
		                <div class="ruby"><%=right.getPartRuby()%></div>
		                <div class="name"><%=right.getPartName()%></div>
		                <div class="info">
			                <%=right.getPartPost()%><br>
			                <%=right.getPartGender()%>
			                <%=right.getPartSmoke() == 1 ? "🚬" : "" %>
			            </div>
		
		            </td>
		
		        </tr>
		
		    <%
		    }
		    %>
		
		    </table>
	    </div>
	
	<% } else { %>
	
	    <%-- ランダム・男女・喫煙順表示 --%>
	
		<div class="seatArea">
			<div class="desk"></div>
			
		    <table class="seatTable">
		
		    <%
		    for(int i = 0; i < partList.size(); i += 2){
		    %>
		
		        <tr>
		
		            <td class="seat">
		
		            <%
		            PartBean left = partList.get(i);
		            %>
		
			            <div class="ruby"><%=left.getPartRuby()%></div>
			            <div class="name"><%=left.getPartName()%></div>
			            <div class="info">
				                <%=left.getPartPost()%><br>
				                <%=left.getPartGender()%>
				                <%=left.getPartSmoke() == 1 ? "🚬" : "" %>
				        </div>
		
		            </td>
		
		            <td class="seat">
		
		            <%
		            if(i + 1 < partList.size()){
		
		                PartBean right = partList.get(i + 1);
		            %>
		
		                <div class="ruby"><%=right.getPartRuby()%></div>
		                <div class="name"><%=right.getPartName()%></div>
		                <div class="info">
			                <%=right.getPartPost()%><br>
			                <%=right.getPartGender()%>
			                <%=right.getPartSmoke() == 1 ? "🚬" : "" %>
			            </div>
		
		            <%
		            }
		            %>
		
		            </td>
		
		        </tr>
		
		    <%
		    }
		    %>
		
		    </table>
	    </div>
	
	<% } %>

	
	
	<%@ include file="footer.jsp" %>
</body>
</html>