<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>KNUFLIX</title>
	<link rel="stylesheet" href="/Knuflix_web/designTest/globals.css" />
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <div class="macbook-pro">
      <div class="overlap-wrapper">
        <div class="overlap">
          <a href="/Knuflix_web/designTest/firstScreen/firstScreen.jsp"><img class="main-logo" src="/Knuflix_web/designTest/img/main-logo.png" /></a>
          <div class="view">
            <img class="poster" src="/Knuflix_web/designTest/img/poster-2.png" />
            <img class="/Knuflix_web/designTest/img" src="/Knuflix_web/designTest/img/poster-4.png" />
            <img class="poster-2" src="/Knuflix_web/designTest/img/poster-3.png" />
            <img class="poster-3" src="/Knuflix_web/designTest/img/poster-1.png" />
            <img class="poster-4" src="/Knuflix_web/designTest/img/poster-5.png" />
          </div>
          <div class="overlap-group-wrapper">
            <div class="overlap-group">
              <div class="text-wrapper">로그인</div>
              <a href="/Knuflix_web/designTest/signUpScreen/signUp.jsp"><div class="div-wrapper"><div class="div">로그인</div></div></a>
             <div class="view-2">
                <input class="input-field" type="text" Placeholder="아이디" id="username" name="username">
                <%-- 
			 	<div class="overlap-group-2">
				    <div class="text-wrapper-2">아이디</div>
				</div>
				--%>
			 </div>
			 <div class="view-3">
			    <input class="input-field" type="password" Placeholder="비밀번호" id="password" name="password">
			    <%-- 
				<div class="overlap-group-2">
				    <div class="text-wrapper-2">비밀번호</div>
				    <input class="input-field" type="password" id="password" name="password">
				</div>
				--%>
			 </div>
              <div class="view-4">
                <div class="overlap-2">
                  <div class="text-wrapper-3">Knuflix 회원이 아닌가요?</div>
                  <a href="/Knuflix_web/designTest/signUpScreen/signUp.jsp"><div class="text-wrapper-4">지금 가입하세요.</div></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>