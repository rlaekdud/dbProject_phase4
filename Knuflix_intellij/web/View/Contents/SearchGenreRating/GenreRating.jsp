<%--
  Created by IntelliJ IDEA.
  User: rlaekdud
  Date: 12/2/23
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>KNUFLIX</title>
    <link rel="stylesheet" href="/globals.css" />
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="search-genre-rating">
    <div class="div">
        <div class="overlap">
            <a href="/View/Home/Home_SignedIn.jsp"><img class="main-logo" src="/img/main-logo.png" /></a>
            <div class="my-account-button">
                <div class="dropdown">
                    <button class="dropbtn"><img class="user-icon" src="/img/user-icon-1.png" /> <img class="polygon" src="/img/polygon-1.svg" /></button>
                    <div class="dropdown-content1">
                        <a href="/View/MyAccount/ModifyPw1.jsp">내 정보 변경</a>
                        <a href="/View/Home/Home.jsp">로그아웃</a>
                        <a href="/View/MyAccount/DeleteAccount.jsp">계정 삭제</a>
                    </div>
                </div>
            </div>

            <div class="title">장르, 평점으로 검색</div>
            <div class="desc-string">입력한 평점 이상인 컨텐츠가 검색됩니다.</div>
            <div class="genre-string">장르를 선택하세요.</div>
            <div class="rating-string">평점을 선택하세요.</div>
            <div class="input-form">
                <form action="GenreRatingView.jsp">
                    <select class="genre-input" id="genre" name="genre">
                        <option value="Horror" selected>Horror+</option>
                        <option value="Romcom">Romcom</option>
                        <option value="SF">SF</option>
                        <option value="Disaster">Disaster</option>
                        <option value="Blockbuster">Blockbuster</option>
                        <option value="Comedy">Comedy</option>
                        <option value="Action">Action</option>
                        <option value="Animation">Animation</option>
                        <option value="Documentary">Documentary</option>
                        <option value="Classic">Classic</option>
                        <option value="Romance">Romance</option>
                        <option value="Drama">Drama</option>
                        <option value="Fantasy">Fantasy</option>
                    </select>
                    <select class="rating-input" id="rating" name="rating">
                        <option value="0" selected>0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    <button class="search-button" type="submit">검색하기</button>
                </form>
            </div>

            <div class="search-my-party">
                <div class="dropdown">
                    <button class="dropbtn">내가 공유 중인 파티</button>
                    <div class="dropdown-content">
                        <a href="/View/MyParty/SearchMyPartyFee/MyPartyFee.jsp">내 파티 구독료 조회</a>
                        <a href="/View/MyParty/SearchMySub/MySub.jsp">구독 중인 플랫폼 조회</a>
                        <a href="/View/MyParty/SearchMyPInfo/MyPInfo.jsp">공유 중인 플랫폼 계정 정보 조회</a>
                    </div>
                </div>
            </div>
            <div class="search-contents">
                <div class="dropdown">
                    <button class="dropbtn">영상 컨텐츠 검색</button>
                    <div class="dropdown-content">
                        <a href="/View/Contents/SearchPnameAll/PnameAll.jsp">플랫폼의 모든 컨텐츠 조회</a>
                        <a href="/View/Contents/SearchPnameRating/PnameRating.jsp">플랫폼과 평점으로 검색</a>
                        <a href="/View/Contents/SearchGenreRating/GenreRating.jsp">장르와 평점으로 검색</a>
                    </div>
                </div>
            </div>
            <div class="search-ebook">
                <div class="dropdown">
                    <button class="dropbtn">e-book 검색</button>
                    <div class="dropdown-content">
                        <a href="/View/Ebook/SearchAuthorJob/AuthorJob.jsp">작가 직업으로 검색</a>
                        <a href="/View/Ebook/SearchYear/Year.jsp">출판연도 순으로 조회</a>
                    </div>
                </div>
            </div>
            <div class="search-platform">
                <div class="dropdown">
                    <button class="dropbtn">플랫폼 검색</button>
                    <div class="dropdown-content">
                        <a href="/View/Platform/SearchPopularity/Popularity.jsp">인기 순 조회</a>
                        <a href="/View/Platform/SearchExpensive/Expensive.jsp">플랫폼별 비교 조회</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>