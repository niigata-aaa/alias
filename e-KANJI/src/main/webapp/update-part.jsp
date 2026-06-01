<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報変更画面</title>
<style>
.submit-top-right {
        position: fixed;   
        top: 10px;         
        right: 10px;       
        padding: 10px 20px;
        cursor: pointer;
        
.submit-under-right {
        position: fixed;   
        under: 10px;         
        right: 10px;       
        padding: 10px 20px;
        cursor: pointer;
</style>
</head>
<body>
    <form action="top" method="post">
        <input type="submit" class="submit-top-right" value="参加者一覧表示・検索画面へ戻る">
    </form>
参加者情報変更画面<br>

	<jsp:useBean id="part" class="model.entity.PartBean" scope="session"/>
	<form action="update-part-check-servlet" method="post">
		会員ID：<jsp:getProperty name="part" property="userID" /><br>
		参加者ID：<jsp:getProperty name="part" property="partID" /><br>
		氏名（漢字）：<input type="text" name="partName"
			value="<jsp:getProperty name="part" property="partName" />"><br>
		氏名（かな）：<input type="text" name="partRuby"
			value="<jsp:getProperty name="part" property="partRuby" />"><br>
	    性別：<input type="radio" name="partGender"
			value="男">男
			  <input type="radio" name="partGender"
			value="女">女<br>
		年齢：<input type="text" name="partAge"
			value="<jsp:getProperty name="part" property="partAge" />"><br>
		入社年度：<input type="text" name="partEmpyear"
			value="<jsp:getProperty name="part" property="partEmpyear" />"><br>
		役職：<select name="partPost"
			value="<jsp:getProperty name="part" property="partPost" />">
			    <option value="1">一般社員</option>
		        <option value="2">主任・主査</option>
		        <option value="3">係長</option>
		        <option value="4">課長代理</option>
		        <option value="5">課長</option>
		        <option value="6">副部長</option>
		        <option value="7">部長・支社長・所長</option>
		        <option value="8">執行役員</option>
		        <option value="9">常務取締役</option>
		        <option value="10">専務取締役</option>
		        <option value="11">社長</option>
		        <option value="12">会長</option>
		    </select>
			<br>
		予算：<input type="text" name="partBudget"
			value="<jsp:getProperty name="part" property="partBudget" />"><br>
		アレルギー：<input type="text" name="partAllergy"
			value="<jsp:getProperty name="part" property="partAllergy" />"><br>
		好きな食べ物のジャンル：<select name="partGenre"
			value="<jsp:getProperty name="part" property="partGenre" />">
			    <option value="0">特になし</option>
		        <option value="1">和食</option>
		        <option value="2">洋食</option>
		        <option value="3">中華料理</option>
		        <option value="4">フレンチ</option>
		        <option value="5">韓国料理</option>
		        <option value="6">アジア・エスニック</option>
		        <option value="7">居酒屋</option>
		        <option value="8">焼肉</option>
		        <option value="9">カレー</option>
		        <option value="10">鍋</option>
		    </select><br>
		好きな食べ物のカテゴリ：<select name="partCategory"
			value="<jsp:getProperty name="part" property="partCategory" />">
			   <option value="0">特になし</option>
		        <option value="1">肉</option>
		        <option value="2">魚</option>
		        <option value="3">野菜</option>
		        <option value="4">麺類</option>
		        <option value="5">米料理</option>
		        <option value="6">揚げ物</option>
		        <option value="7">お酒</option>
		    </select><br>
		好きなビールの種類：<select name="partBeer"
			value="<jsp:getProperty name="part" property="partBeer" />">
			    <option value="0">特になし</option>
		        <option value="1">アサヒ</option>
		        <option value="2">キリン</option>
		        <option value="3">サントリー</option>
		        <option value="4">サッポロ</option>
		        <option value="5">エビス</option>
		        <option value="6">クラフトビール</option>
		    </select><br>
		タバコ：<input type="radio" name="partSmoke"
			value="1">吸う
			    <input type="radio" name="partSmoke"
			value="0">吸わない<br>
		<input type="submit" class="submit-under-right" value="確認画面へ">
	</form>

</body>
</html>