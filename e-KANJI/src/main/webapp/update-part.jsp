<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.entity.PartBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報変更画面</title>
<link rel="stylesheet" href="css/style.css">
<style>
.submit-top-right {
        position: fixed;   
        top: 10px;         
        right: 10px;       
        padding: 10px 20px;
        cursor: pointer;
        }
        
.submit-under-right {
        position: fixed;   
        bottom: 10px;         
        right: 10px;       
        padding: 10px 20px;
        cursor: pointer;
        }
</style>
</head>
<body>
<%@ include file="header-logo.jsp" %>
    <form action="top" method="post">
        <input type="submit" class="submit-top-right" value="参加者一覧表示・検索画面へ戻る">
    </form>

参加者情報変更画面<br>
 <%
        PartBean bean = (PartBean) request.getAttribute("bean");
 
    %>

    <form action="update-part-check-servlet" method="post">
        会員ID：<%=bean.getUserID() %><br>
        参加者ID：<%=bean.getPartID() %><br>
        氏名（漢字）：<input type="text" name="partName"
            value=<%=bean.getPartName() %>><br>
        氏名（かな）：<input type="text" name="partRuby"
            value=<%=bean.getPartRuby() %>><br>
        
        性別：
        <input type="radio" name="partGender" value="男" <%= "男".equals(bean.getPartGender()) ? "checked" : "" %>>男
        <input type="radio" name="partGender" value="女" <%= "女".equals(bean.getPartGender()) ? "checked" : "" %>>女<br>
        
        年齢：<input type="text" name="partAge"
            value=<%=bean.getPartAge() %>><br>
        入社年度：<input type="text" name="partEmpyear"
            value=<%=bean.getPartEmpyear() %>><br>
        
        役職：
        <select name="partPostId"> 
            <option value="1" <%= bean.getPartPost() == "一般社員" ? "selected" : "" %>>一般社員</option>
            <option value="2" <%= bean.getPartPost() == "主任・主査" ? "selected" : "" %>>主任・主査</option>
            <option value="3" <%= bean.getPartPost() == "係長" ? "selected" : "" %>>係長</option>
            <option value="4" <%= bean.getPartPost() == "課長代理" ? "selected" : "" %>>課長代理</option>
            <option value="5" <%= bean.getPartPost() == "課長" ? "selected" : "" %>>課長</option>
            <option value="6" <%= bean.getPartPost() == "副部長" ? "selected" : "" %>>副部長</option>
            <option value="7" <%= bean.getPartPost() == "部長・支社長・所長" ? "selected" : "" %>>部長・支社長・所長</option>
            <option value="8" <%= bean.getPartPost() == "執行役員" ? "selected" : "" %>>執行役員</option>
            <option value="9" <%= bean.getPartPost() == "常務取締役" ? "selected" : "" %>>常務取締役</option>
            <option value="10" <%= bean.getPartPost() == "専務取締役" ? "selected" : "" %>>専務取締役</option>
            <option value="11" <%= bean.getPartPost() == "社長" ? "selected" : "" %>>社長</option>
            <option value="12" <%= bean.getPartPost() == "会長" ? "selected" : "" %>>会長</option>
        </select>
        <br>
        
        予算：<input type="text" name="partBudget"
            value=<%=bean.getPartBudget() %>><br>
        アレルギー：<input type="text" name="partAllergy"
            value=<%=bean.getPartAllergy() %>><br>
        
        好きな食べ物のジャンル：
        <select name="partGenre">
            <option value="0" <%= "0".equals(bean.getPartGenre()) ? "selected" : "" %>>特になし</option>
            <option value="1" <%= "1".equals(bean.getPartGenre()) ? "selected" : "" %>>和食</option>
            <option value="2" <%= "2".equals(bean.getPartGenre()) ? "selected" : "" %>>洋食</option>
            <option value="3" <%= "3".equals(bean.getPartGenre()) ? "selected" : "" %>>中華料理</option>
            <option value="4" <%= "4".equals(bean.getPartGenre()) ? "selected" : "" %>>フレンチ</option>
            <option value="5" <%= "5".equals(bean.getPartGenre()) ? "selected" : "" %>>韓国料理</option>
            <option value="6" <%= "6".equals(bean.getPartGenre()) ? "selected" : "" %>>アジア・エスニック</option>
            <option value="7" <%= "7".equals(bean.getPartGenre()) ? "selected" : "" %>>居酒屋</option>
            <option value="8" <%= "8".equals(bean.getPartGenre()) ? "selected" : "" %>>焼肉</option>
            <option value="9" <%= "9".equals(bean.getPartGenre()) ? "selected" : "" %>>カレー</option>
            <option value="10" <%= "10".equals(bean.getPartGenre()) ? "selected" : "" %>>鍋</option>
        </select><br>
        
        好きな食べ物のカテゴリ：
        <select name="partCategory">
            <option value="0" <%= "0".equals(bean.getPartCategory()) ? "selected" : "" %>>特になし</option>
            <option value="1" <%= "1".equals(bean.getPartCategory()) ? "selected" : "" %>>肉</option>
            <option value="2" <%= "2".equals(bean.getPartCategory()) ? "selected" : "" %>>魚</option>
            <option value="3" <%= "3".equals(bean.getPartCategory()) ? "selected" : "" %>>野菜</option>
            <option value="4" <%= "4".equals(bean.getPartCategory()) ? "selected" : "" %>>麺類</option>
            <option value="5" <%= "5".equals(bean.getPartCategory()) ? "selected" : "" %>>米料理</option>
            <option value="6" <%= "6".equals(bean.getPartCategory()) ? "selected" : "" %>>揚げ物</option>
            <option value="7" <%= "7".equals(bean.getPartCategory()) ? "selected" : "" %>>お酒</option>
        </select><br>
        
        好きなビールの種類：
        <select name="partBeer">
            <option value="0" <%= "0".equals(bean.getPartBeer()) ? "selected" : "" %>>特になし</option>
            <option value="1" <%= "1".equals(bean.getPartBeer()) ? "selected" : "" %>>アサヒ</option>
            <option value="2" <%= "2".equals(bean.getPartBeer()) ? "selected" : "" %>>キリン</option>
            <option value="3" <%= "3".equals(bean.getPartBeer()) ? "selected" : "" %>>サントリー</option>
            <option value="4" <%= "4".equals(bean.getPartBeer()) ? "selected" : "" %>>サッポロ</option>
            <option value="5" <%= "5".equals(bean.getPartBeer()) ? "selected" : "" %>>エビス</option>
            <option value="6" <%= "6".equals(bean.getPartBeer()) ? "selected" : "" %>>クラフトビール</option>
        </select><br>
        
        タバコ：
        <input type="radio" name="partSmoke" value="1" <%= bean.getPartSmoke() == 1 ? "checked" : "" %>>吸う
        <input type="radio" name="partSmoke" value="0" <%= bean.getPartSmoke() == 0 ? "checked" : "" %>>吸わない<br>
        
        <input type="submit" class="submit-under-right" value="確認画面へ">
    </form>

</body>
</html>