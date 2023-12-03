<%--
  Created by IntelliJ IDEA.
  User: rlaekdud
  Date: 12/2/23
  Time: 13:39
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
<div class="my-account">
  <div class="div">
    <div class="overlap">
      <a href="/FE/Home/Home_SignedIn.jsp"><img class="main-logo" src="/img/main-logo.png" /></a>
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

      <div class="title">계정 삭제</div>
      <div class="desc-string-warning">계정은 삭제 후 복구할 수 없습니다.</div>
      <div class="pw-box">
        <form action="/FE/Home/Home.jsp">
          <button class="next-button"><dev class="modify-pw-string">계정 삭제</dev></button>
          <div class="pw-input">
            <input class="input-field" type="password" placeholder="비밀번호를 입력하세요." id="formerPw" name="formerPw">
          </div>
        </form>
      </div>
      <div class="error-string1">비밀번호가 틀렸습니다. 다시 입력해주세요.</div>

      <div class="search-my-party">
        <div class="dropdown">
          <button class="dropbtn">내가 공유 중인 파티</button>
          <div class="dropdown-content">
            <a href="/FE/MyParty/SearchMyPartyFee/MyPartyFee.jsp">내 파티 구독료 조회</a>
            <a href="/FE/MyParty/SearchMySub/MySub.jsp">구독 중인 플랫폼 조회</a>
            <a href="/FE/MyParty/SearchMyPInfo/MyPInfo.jsp">공유 중인 플랫폼 계정 정보 조회</a>
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
            <a href="/FE/Ebook/SearchYear/Year.jsp">출판연도 순으로 조회</a>
          </div>
        </div>
      </div>
      <div class="search-platform">
        <div class="dropdown">
          <button class="dropbtn">플랫폼 검색</button>
          <div class="dropdown-content">
            <a href="/FE/Platform/SearchPopularity/Popularity.jsp">인기 순 조회</a>
            <a href="/FE/Platform/SearchExpensive/Expensive.jsp">플랫폼별 비교 조회</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>