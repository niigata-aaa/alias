<%@ page pageEncoding="UTF-8"%>
<%
	String userid = (String)session.getAttribute("user_id");
%>

<div class="d4"><%=userid %> さん</div>