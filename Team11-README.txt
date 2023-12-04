1. 실행 및 사용 방법
 - 프로그램 실행에 앞서, Java Runtime Environment (JRE)를 설치하고 데이터베이스 연결을 위한 JDBC 드라이버(ojdbc10) 를 준비합니다.
 - JAVA 11 버전 사용
 - ojdbc10 사용
 - Tomcat v8.5사용
 - (Intellij) Project Structure → Modules → Dependencies
  - apache-tomcat-8.5.95\lib\ 안에 있는 servlet-api.jar 파일이랑 jsp-api.jar 파일 추가

2. 기능 설명
 1. 회원가입 및 로그인
 2. 홈 메뉴
  - 내가 공유 중인 파티
  - 영상 컨텐츠 검색
  - e-book 검색
  - 플랫폼 검색
  
3. 유의 사항

4. SQL 쿼리 변경사항
 1. Type 9의 '공유하는 파티의 수가 많은 순으로 플랫폼 조회' 쿼리에 구독료를 추가했습니다.
  SELECT a.pltf_name AS Platform, COUNT() AS NUM, f.sub_price
  FROM PARTY a, PLATFORM f
  WHERE a.pltf_name = f.pltf_name
  GROUP BY a.pltf_name, f.sub_price
  ORDER BY COUNT() desc;

 2. Type 6의 'user id로 구독 중인 플랫폼 조회'쿼리에 구독중인 플랫폼 조회시 구독료도 함께 조회되도록 변경하였습니다.
  SELECT  Pltf_name AS Platform, Sub_price
  FROM    PARTY NATURAL JOIN PLATFORM
  WHERE   leader_id = 'ZSnhmzSD0828'
     OR   party_id IN (SELECT party_id
                       FROM PARTICIPATE
                       WHERE user_id = 'ZSnhmzSD0828');

4. Application 제작 환경
 - IntelliJ IDEA 23.2.5 에서 개발하였습니다. 
  - eclipse 4.27.0 에서 개발 후 테스트를 진행하였습니다.
