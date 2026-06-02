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
String userId = (String)session.getAttribute("user_id");

%>
<%
PartBean part = (PartBean) request.getAttribute("part");
if(part == null){
    out.println("partがnullです（データが渡っていません）");
    return;
}
%>



	会員ID：<%= userId %><br>
参加者ID：登録時に自動採番されます<br>
氏名(漢字)：<%= part.getPartName() %><br>
	氏名（かな）：<%= part.getPartRuby() %><br>
	性別：<%= part.getPartGender() %><br>
	年齢：<%= part.getPartAge() %><br>
	入社年度：<%= part.getPartEmpyear() %><br>

<%
String post = part.getPartPost();
if (post == null) {
    post = "0"; // 値が取れなかった場合は、ひとまず「0（一般社員）」として扱う
} else {
    post = post.trim();
}
switch(post){
    case "0": post = "一般社員"; break;
    case "1": post = "主任・主査"; break;
    case "2": post = "係長"; break;
    case "3": post = "課長代理"; break;
    case "4": post = "課長"; break;
    case "5": post = "副部長"; break;
    case "6": post = "部長・支社長・所長"; break;
    case "7": post = "執行役員"; break;
    case "8": post = "常務取締役"; break;
    case "9": post = "専務取締役"; break;
    case "10": post = "社長"; break;
    case "11": post = "会長"; break;
    default: post = "不明"; break;
}
%>
役職：<%=post%><br>


    予算：<%= part.getPartBudget() %><br>
    アレルギー：<%= part.getPartAllergy() %><br>
  
  <% 
				String genre = part.getPartGenre();
if (genre == null) {
    genre = "0"; // 値が取れなかった場合は、ひとまず「0（特になし）」として扱う
} else {
    genre = genre.trim();
}

				switch(genre){
				    case "0": genre = "特になし"; break;
				    case "1": genre = "和食"; break;
				    case "2": genre = "洋食"; break;
				    case "3": genre = "中華料理"; break;
				    case "4": genre = "フレンチ"; break;
				    case "5": genre = "韓国料理"; break;
				    case "6": genre = "アジア・エスニック"; break;
				    case "7": genre = "居酒屋"; break;
				    case "8": genre = "焼肉"; break;
				    case "9": genre = "カレー"; break;
				    case "10": genre = "鍋"; break;
				    default: genre = "不明";
}
%>

		好きな食べ物のジャンル：<%=genre%><br>
  
    <%
String category = part.getPartCategory();
if (category == null) {
    category = "0"; // 値が取れなかった場合は、ひとまず「0（特になし）」として扱う
} else {
    category = category.trim();
}

switch(category){
    case "0": category = "特になし"; break;
    case "1": category = "肉"; break;
    case "2": category = "魚"; break;
    case "3": category = "野菜"; break;
    case "4": category = "麺類"; break;
    case "5": category = "米料理"; break;
    case "6": category = "揚げ物"; break;
    case "7": category = "お酒"; break;
    default: category = "不明";
}
%>
好きな食べ物のカテゴリ：<%=category%><br>
    
  <%
String beer = part.getPartBeer();
if (beer == null) {
    beer = "0"; // 値が取れなかった場合は、ひとまず「0（特になし）」として扱う
} else {
    beer = beer.trim();
}

switch(beer){
    case "0": beer = "特になし"; break;
    case "1": beer = "アサヒ"; break;
    case "2": beer = "キリン"; break;
    case "3": beer = "サントリー"; break;
    case "4": beer = "サッポロ"; break;
    case "5": beer = "エビス"; break;
    case "6": beer = "クラフトビール"; break;
    default: beer = "不明";
}
%>
好きなビールの種類：<%=beer%><br>
  
    <%
		String smoke = String.valueOf(part.getPartSmoke()); 
if("0".equals(smoke)){
    smoke = "吸う";
}else if("1".equals(smoke)){
    smoke = "吸わない";
}else{
    smoke = "不明";
}
%>
タバコ：<%=smoke%><br>
    <form action="select-part.jsp" method="POST">
    <input type="submit" class="submit-top-right" value="参加者一覧表示・検索画面へ戻る"><br>
</form>

	<form action="top.jsp" method="POST">
		<input type="submit" value="トップ画面に戻る">
	</form>


</body>
</html>