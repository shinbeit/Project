# Project Info
<img src ="/projectimage/메인 헤더.PNG"/>

# Project Content
Partycat은 공연예매사이트로 Yes24 Ticket 홈페이지를 모티브로하여 개발했습니다. 
회원가입 및 로그인, 공연 등록 및 관리가 가능한 기업회원과 고객인 일반회원 구분 , 공연 결제 및 예매 등을 구현하였습니다.

# Project Technology Stack
-OS : window 7<br/>
-WAS : Tomcat 8.5<br/>
-Front-End : Javascript, Jquery, Ajax<br/>
-Back-End : Spring FrameWork<br/>
-DB : Oracle DB<br/>

# Project Role 
-프로젝트에서 맡은 역할은 DB설계 및 구축 공연 정보창, 지도API사용, 후기게시판, 로그인등의 기능 구현 
-<br/>
-<br/>

# DB Structure 
<img src ="/projectimage/dbdiagram.jpg"/>
-공연정보테이블 PerformData의 PerformCode를 참조키로하여 공연정보관련테이블을 세분화함 
PerformDetail(공연상세정보), PerformInfo(공연시간,날짜), GenreData(장르), PlaceData(장소), RatingData(등급), SeatingData(좌석), 
PaymentData(가격), ReviewBoard(공연관람후기)<br/>
-<br/>



# 
