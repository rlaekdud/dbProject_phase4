<%--
  Created by IntelliJ IDEA.
  User: rlaekdud
  Date: 12/1/23
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>KNUFLIX</title>
    <link rel="stylesheet" href="/globals.css" />
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="sign-up">
    <div class="overlap-wrapper">
        <div class="overlap">
            <a href="/View/Home/Home.jsp"><img class="main-logo" src="/img/main-logo.png" /></a>
            <div class="background-poster">
                <img class="poster" src="/img/poster-2.png" />
                <img class="img" src="/img/poster-4.png" />
                <img class="poster-2" src="/img/poster-3.png" />
                <img class="poster-3" src="/img/poster-1.png" />
                <img class="poster-4" src="/img/poster-5.png" />
            </div>
            <div class="sign-up-box">
                <div class="overlap-group">
                    <div class="text-wrapper">결제 정보 입력</div>
                    <a href="/View/Home/Home.jsp"><div class="next-button"><div class="div">회원가입 완료</div></div></a>
                    <div class="id-input">
                        <input class="input-field" type="text" placeholder="은행명" id="id" name="id">
                        </div>
                    <div class="pw-input">
                        <input class="input-field" type="text" placeholder="계좌번호" id="pw" name="pw">
                    </div>
                    <div class="go-sign-in">
                        <div class="overlap-2">
                            <div class="text-wrapper-4">이미 계정이 있으신가요?</div>
                            <a href="/View/SignIn/SignIn.jsp"><div class="text-wrapper-5">지금 로그인하세요.</div></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-wrapper-6">3/3 단계</div>
        </div>
    </div>
</div>
</body>
</html>

