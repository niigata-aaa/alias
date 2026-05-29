<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者登録確認画面</title>
</head>
<body>
参加者情報登録確認画面<br>
    <a href="select-part.jsp">参加者一覧表示・検索画面へ戻る</a>
    <h2>この参加者情報を登録します</h2>
	<form action="insert-user-ok-servlet" method="POST">
	    会員ID：<input type="hidden" name="user_id" value=""><br>
	    参加者ID：<input type="hidden" name="part_id" value=""><br>
	    氏名（漢字）：<input type="hidden" name="part_name" value="<%=part.getPartName()%>"><br>
		氏名（かな）：<input type="hidden" name="part_ruby" value="<%=part.getPartRuby()%>"><br>
		性別：<input type="hidden" name="part_gender" value="<%=part.getPartGender()%>"><br>
		年齢：<input type="hidden" name="part_age" value="<%=part.getPartAge()%>"><br>
		入社年度：<input type="hidden" name="part_empyear" value="<%=part.getPartEmpyear()%>"><br>
		役職：<input type="hidden" name="part_post" value="<%=part.getPartPost()%>"><br>
		予算：<input type="text" name="part_budget" value="<%=part.getPartBudget()%>"><br>
		アレルギー：<input type="text" name="part_allergy" value="<%=part.getPartAllergy()%>"><br>
		好きな食べ物のジャンル：<input type="hidden" name="part_genre" value="<%=part.getPartGenre()%>"><br>
		好きな食べ物のカテゴリ：<input type="hidden" name="part_category" value="<%=part.getPartCategory()%>"><br>
		好きなビールの種類：<input type="hidden" name="part_beer" value="<%=part.getPartBeer()%>"><br>
		タバコ：<input type="hidden" name="part_smoke" value="<%=part.getPartSmoke()%>"><br>
	
		<input type="submit" value="この情報を追加する">
		
	</form>

</body>
</html>