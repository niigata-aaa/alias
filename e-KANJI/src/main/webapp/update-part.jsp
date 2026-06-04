<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.time.Year, model.entity.PartBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>参加者情報変更画面</title>
<link rel="stylesheet" href="css/style.css">
<style>
body {
    text-align: center; /* 画面全体を中央寄せ */
}

/* フォームを中央に配置しつつ中身は左揃え */
form {
    display: inline-block;
    text-align: left;
}

/* 入力エリア */
.part-data {
    text-align: left;
    margin-left: 0;
}

.submit-top-right {
        position: fixed;   
        top: 10px;         
        right: 10px;       
        padding: 10px 20px;
        cursor: pointer;
        }
        
.submit-under-right {
       margin-left:120px;
        }
</style>
</head>
<body>
<%@ include file="header-logo.jsp" %>
    <form action="select-part-servlet" method="post">
        <input type="submit" class="submit-top-right" value="参加者一覧表示・検索画面へ戻る">
    </form>

参加者情報変更画面<br><br>

		<span class="required">*は必須入力です</span><br>
 <%
        PartBean bean = (PartBean) request.getAttribute("bean");
 		int currentYear = Year.now().getValue();
 
    %>

    <form action="update-part-check-servlet" method="post">
    <div class="part-data">
        氏名：<span class="required"> *</span><input type="text" name="partName"
            value=<%=bean.getPartName() %> maxlength="100" required><br>
        氏名（かな）：<span class="required"> *</span><input type="text" name="partRuby"
            value=<%=bean.getPartRuby() %> maxlength="100" required><br>
        
        性別：<span class="required"> *</span>
        <input type="radio" name="partGender" value="男" <%= "男".equals(bean.getPartGender()) ? "checked" : "" %>>男
        <input type="radio" name="partGender" value="女" <%= "女".equals(bean.getPartGender()) ? "checked" : "" %>>女<br>
        
        年齢：<span class="required"> *</span><input type="number" name="partAge" min="18" max="100" required
            value=<%=bean.getPartAge() %>><br>
        入社年度：<input type="number" name="partEmpyear" min="1950" max="<%= currentYear %>" required
            value=<%=bean.getPartEmpyear() %>><br>
        
        役職：
        <select name="partPostId">         	
            <option value="0" <%= "-".equals(bean.getPartPost()) ? "selected" : "" %>>-</option>
            <option value="1" <%= "一般社員".equals(bean.getPartPost()) ? "selected" : "" %>>一般社員</option>
            <option value="2" <%= "主任・主査".equals(bean.getPartPost()) ? "selected" : "" %>>主任・主査</option>
            <option value="3" <%= "係長".equals(bean.getPartPost()) ? "selected" : "" %>>係長</option>
            <option value="4" <%= "課長代理".equals(bean.getPartPost()) ? "selected" : "" %>>課長代理</option>
            <option value="5" <%= "課長".equals(bean.getPartPost()) ? "selected" : "" %>>課長</option>
            <option value="6" <%= "副部長".equals(bean.getPartPost()) ? "selected" : "" %>>副部長</option>
            <option value="7" <%= "部長・支社長・所長".equals(bean.getPartPost()) ? "selected" : "" %>>部長・支社長・所長</option>
            <option value="8" <%= "執行役員".equals(bean.getPartPost()) ? "selected" : "" %>>執行役員</option>
            <option value="9" <%= "常務取締役".equals(bean.getPartPost()) ? "selected" : "" %>>常務取締役</option>
            <option value="10" <%= "専務取締役".equals(bean.getPartPost()) ? "selected" : "" %>>専務取締役</option>
            <option value="11" <%= "社長".equals(bean.getPartPost()) ? "selected" : "" %>>社長</option>
            <option value="12" <%= "会長".equals(bean.getPartPost()) ? "selected" : "" %>>会長</option>
        </select>
        <br>
        
        予算：<span class="required"> *</span><input type="number" name="partBudget" min="1000" max="50000" step="500" required
            value=<%=bean.getPartBudget() %>><br>
        アレルギー：<input type="text" name="partAllergy" maxlength="100"
            value=<%=bean.getPartAllergy() %> ><br>
        
        好きな食べ物のジャンル：
        <select name="partGenreId">
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
        <select name="partCategoryId">
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
        <select name="partBeerId">
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
        
        <input type="hidden" name="partId" value="<%= bean.getPartID() %>">
        
        </div>
        
        <input type="submit" class="submit-under-right" value="確認画面へ">
    </form>

</body>
</html>