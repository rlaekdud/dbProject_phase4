<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>KNUFLIX</title>
	<link rel="stylesheet" href="/View/globals.css" />
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <div class="macbook-pro">
      <div class="overlap-wrapper">
        <div class="overlap">
          <a href="View/Home/Home.jsp"><img class="main-logo" src="/View/img/main-logo.png" /></a>
          <div class="view">
            <img class="poster" src="/View/img/poster-2.png" />
            <img class="View/img" src="/View/img/poster-4.png" />
            <img class="poster-2" src="/View/img/poster-3.png" />
            <img class="poster-3" src="/View/img/poster-1.png" />
            <img class="poster-4" src="/View/img/poster-5.png" />
          </div>
          <div class="overlap-group-wrapper">
            <div class="overlap-group">
              <div class="text-wrapper">로그인</div>
              <a href="/View/SignUp/SignUp.jsp"><div class="div-wrapper"><div class="div">로그인</div></div></a>
             <div class="view-2">
                <input class="input-field" type="text" Placeholder="아이디" id="id" name="id">
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
                  <a href="/View/SignUp/SignUp.jsp"><div class="text-wrapper-4">지금 가입하세요.</div></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>