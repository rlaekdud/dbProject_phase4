<%--
  Created by IntelliJ IDEA.
  User: rlaekdud
  Date: 12/1/23
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>KNUFLIX</title>
    <link rel="stylesheet" href="/globals.css" />
    <link rel="stylesheet" href="signInStyle.css" />
</head>
<body>
<div class="home-loggedin">
    <div class="div">
        <div class="overlap">
            <div class="overlap-group">
                <img class="main-logo" src="/img/main-logo.png" />
                <div class="background-poster">
                    <img class="poster" src="/img/poster-2.png" />
                    <img class="img" src="/img/poster-4.png" />
                    <img class="poster-2" src="/img/poster-3.png" />
                    <img class="poster-3" src="/img/poster-1.png" />
                    <img class="poster-4" src="/img/poster-5.png" />
                </div>
                <div class="text-wrapper">지금 플랫폼 공유를 시작하세요.</div>
            </div>
            <div class="my-account-button">
                <div class="dropdown">
                    <button class="dropbtn"><img class="user-icon" src="/img/user-icon-1.png" /> <img class="polygon" src="/img/polygon-1.svg" /></button>
                    <div class="dropdown-content1">
                        <a href="/FE/MyAccount/ModifyPw1.jsp">내 정보 변경</a>
                        <a href="/FE/Home/Home.jsp">로그아웃</a>
                        <a href="/FE/MyAccount/DeleteAccount.jsp">계정 삭제</a>
                    </div>
                </div>
            </div>

            <div class="search-my-party">
                <div class="dropdown">
                    <button class="dropbtn">내가 공유 중인 파티</button>
                    <div class="dropdown-content">
                        <a href="/BE/userSubInfo/repository/SubFeeRepository.jsp">내 파티 구독료 조회</a>
                        <a href="/BE/userSubInfo/repository/SubscribingPlatformRepository.jsp">구독 중인 플랫폼 조회</a>
                        <a href="/BE/userSubInfo/repository/SubscribingPlatformAccInfoRepository.jsp">공유 중인 플랫폼 계정 정보 조회</a>
                    </div>
                </div>
            </div>
            <div class="search-contents">
                <div class="dropdown">
                    <button class="dropbtn">영상 컨텐츠 검색</button>
                    <div class="dropdown-content">
                        <a href="/FE/Contents/SearchPnameAll/PnameAll.jsp">플랫폼의 모든 컨텐츠 조회</a>
                        <a href="/FE/Contents/SearchPnameRating/PnameRating.jsp">플랫폼과 평점으로 검색</a>
                        <a href="/FE/Contents/SearchGenreRating/GenreRating.jsp">장르와 평점으로 검색</a>
                    </div>
                </div>
            </div>
            <div class="search-ebook">
                <div class="dropdown">
                    <button class="dropbtn">e-book 검색</button>
                    <div class="dropdown-content">
                        <a href="/FE/Ebook/SearchAuthorJob/AuthorJob.jsp">작가 직업으로 검색</a>
                        <a href="/BE/ebook/repository/PublishYearRepository.jsp">출판연도 순으로 조회</a>
                    </div>
                </div>
            </div>
            <div class="search-platform">
                <div class="dropdown">
                    <button class="dropbtn">플랫폼 검색</button>
                    <div class="dropdown-content">
                        <a href="/BE/platform/repository/PartyNumRepository.jsp">인기 순 조회</a>
                        <a href="/FE/Platform/SearchExpensive/Expensive.jsp">플랫폼별 비교 조회</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="OTT-logo">
            <img class="netflix-logo" src="/img/netflix-logo.png" />
            <img class="TVING-logo" src="/img/tving-logo.png" />
            <img class="watcha-logo" src="/img/watcha-logo.png" />
            <img class="disney-logo" src="/img/disney-logo.png" />
            <img class="wavve-logo" src="/img/wavve-logo.png" />
        </div>
    </div>
</div>
</body>
</html>
