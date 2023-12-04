<%--
  Created by IntelliJ IDEA.
  User: rlaekdud
  Date: 12/1/23
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>KNUFLIX</title>
    <link rel="stylesheet" href="/globals.css" />
    <link rel="stylesheet" href="errorStyle.css" />
</head>
<body>
<div class="signin-error">
    <div class="overlap-wrapper">
        <div class="overlap">
            <a href="/FE/Home/Home.jsp"><img class="main-logo" src="/img/main-logo.png" /></a>
            <div class="background-poster">
                <img class="poster" src="/img/poster-2.png" />
                <img class="img" src="/img/poster-4.png" />
                <img class="poster-2" src="/img/poster-3.png" />
                <img class="poster-3" src="/img/poster-1.png" />
                <img class="poster-4" src="/img/poster-5.png" />
            </div>
            <div class="sign-in-box">
                <div class="overlap-group">
                    <div class="text-wrapper">로그인</div>
                    <form action="/BE/SignInService/SignInService.jsp">
                        <button class="sign-in-button" type="submit"><div class="div">로그인</div></button>
                        <div class="id-input">
                            <input class="input-field" type="text" placeholder="아이디" id="id" name="id">
                        </div>
                        <div class="pw-input">
                            <input class="input-field" type="password" placeholder="비밀번호" id="pw" name="pw">
                        </div>
                    </form>
                    <div class="go-sign-up">
                        <div class="text-wrapper-4">Knuflix 회원이 아닌가요?</div>
                        <a href="/FE/SignUp/SignUp1.jsp"><div class="text-wrapper-5">지금 가입하세요.</div></a>
                    </div>
                    <p class="p">잘못된 로그인 정보입니다. 다시 입력해주세요.</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

