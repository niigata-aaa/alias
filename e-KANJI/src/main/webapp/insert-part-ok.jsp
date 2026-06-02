<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="model.entity.PartBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者登録完了画面</title>
<style>
  .submit-top-right {
        position: fixed;   
        top: 10px;         
        right: 10px;       
        padding: 10px 20px;
        cursor: pointer;
</style>
</head>
<body>
<%
PartBean part = (PartBean) request.getAttribute("part");
if(part == null){
    out.println("partがnullです（データが渡っていません）");
    return;
}
%>



	会員ID：<%= part.getUserID() %><br>
参加者ID：<%= part.getPartID() %><br>
氏名(漢字)：<%= part.getPartName() %><br>
	氏名（かな）：<%= part.getPartRuby() %><br>
	性別：<%= part.getPartGender() %><br>
	年齢：<%= part.getPartAge() %><br>
	入社年度：<%= part.getPartEmpyear() %><br>
	役職：<%= part.getPartPost() %><br>
    予算：<%= part.getPartBudget() %><br>
    アレルギー：<%= part.getPartAllergy() %><br>
    好きな食べ物のジャンル：<%= part.getPartGenre() %><br>
    好きな食べ物のカテゴリ：<%= part.getPartCategory() %><br>
    好きなビールの種類：<%= part.getPartBeer() %><br>
    タバコ：<%= part.getPartSmoke() %><br>
    
    <input type="submit" class="submit-top-right" value="参加者一覧表示・検索画面へ戻る"><br>
</form>

	<form action="menu.html" method="POST">
		<input type="submit" value="メニュー画面に戻る">
	</form>

	<% session.invalidate(); %>
</body>
</html>