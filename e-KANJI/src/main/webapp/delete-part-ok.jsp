<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
PartBean bean = (PartBean) request.getAttribute("bean");
%>

以下の参加者情報を削除が完了しました。<br>

<form action="select-part-servlet" method="post">
会員ID：<%=bean.getPartID() %><br>
参加者ID:<%=bean.getUserID() %><br>
氏名（漢字）：<%=bean.getPartName() %><br>
氏名（かな）：<%=bean.getPartRuby() %><br>
性別：<%=bean.getPartGender() %><br>
年齢：<%=bean.getPartAge() %><br>
役職：<%=bean.getPartPost() %><br>
入社年度：<%=bean.getPartEmpyear() %><br>
アレルギー：<%=bean.getPartAllergy() %><br>
食べ物の好み：<%=bean.getPartGenre() %><br>
好きな料理のカテゴリ：<%=bean.getPartCategory() %><br>
好きなビールの種類：<%=bean.getPartBeer() %><br>
予算：<%=bean.getPartBudget() %><br>
タバコ：<%=bean.getPartSmoke() %><br>

<input type="submit" value="参加者一覧表示・検索画面へ戻る"><br>
</form>
</body>
</html>