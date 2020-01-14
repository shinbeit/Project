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
-프로젝트에서 맡은 역할은 DB설계 및 구축, 공연 정보페이지, 지도API사용, 후기게시판, 회원가입, 로그인등의 기능 구현 <br/>
-회원가입시 비밀번호 Encoding 하여 암호화 및 E-mail 인증기능 구현<br/>
-로그인시 Interceptor를 사용하여 Session에 로그인 객체정보를 저장 하여 인증 , 권한 관리<br/>
-Cookie 이용 자동로그인 기능구현
-Ajax를 이용 공연정보 페이지에 관람후기 게시판을 구현<br/>
-카카오맵 API를 사용 공연정보페이지에 공연장소 좌표 구현<br/>

# DB Structure 
<img src ="/projectimage/dbdiagram.jpg"/>
-공연정보관련테이블 : Performdata, PerformDetail, GenreData, PlaceData, RatingData, SeatingData, PaymentData, ReviewBoard <br/>
-회원정보관련테이블 : UserInfo, CompanyInfo, Mydiscount, MyCoupon, seatUser <br/>
-예매결제관련테이블 : PreservedTicket, SelectedTicket, RemainData, AutoImage, CouponData <br/>
<br/>
공연정보테이블 PerformData의 PerformCode를 참조키로하여 공연정보관련테이블을 세분화함 <br/>
PerformDetail(공연상세정보), PerformInfo(공연시간,날짜), GenreData(장르), PlaceData(장소), RatingData(등급), SeatingData(좌석), 
PaymentData(가격), ReviewBoard(공연관람후기)<br/>
<br/>
UserInfo(일반회원테이블), CompanyInfo(기업회원테이블) 구분하여 기업회원은 공연등록,관리,삭제가능 일반회원은 공연예매,결제 구분<br/>




# 
