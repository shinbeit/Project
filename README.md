# Project Info
<img src ="/projectimage/메인 헤더.PNG"/>

# Project Content
Partycat은 공연예매사이트로 Yes24 Ticket 홈페이지를 모티브로하여 개발했습니다. 
회원가입 및 로그인, 공연 등록 및 관리가 가능한 기업회원과 고객인 일반회원 구분 , 공연 결제 및 예매 등을 구현하였습니다.
프로젝트 개발 기간은 2019-11-15 ~ 2019.12.15 입니다.
<hr>
<br/>

# Project Technology Stack
-OS : window 7<br/>
-WAS : Tomcat 8.5<br/>
-Front-End : Javascript, Jquery, Ajax<br/>
-Back-End : Spring FrameWork<br/>
-DB : Oracle DB<br/>
<hr>
<br/>

# Project Role 
-프로젝트에서 맡은 역할은 DB설계 및 구축, 공연 정보페이지, 지도API사용, 후기게시판, 회원가입, 로그인등의 기능 구현 <br/>
-회원가입시 비밀번호 Encoding 하여 암호화<br/>
-JSTL이용 공연정보페이지에 해당공연에 맞는 데이터 출력<br/>
-Ajax를 이용 공연정보 페이지에 관람후기 게시판을 구현<br/>
-카카오맵 API를 사용 공연정보페이지에 공연장소 좌표 구현<br/>
<hr>
<br/>

# DB Structure 
<img src ="/projectimage/dbdiagram.jpg"/>
-공연정보관련테이블 : Performdata, PerformDetail, GenreData, PlaceData, RatingData, SeatingData, PaymentData, ReviewBoard <br/>
-회원정보관련테이블 : UserInfo, CompanyInfo, Mydiscount, MyCoupon, seatUser <br/>
-예매결제관련테이블 : PreservedTicket, SelectedTicket, RemainData, AutoImage, CouponData <br/>
<br/>
- 공연정보테이블 PerformData의 PerformCode를 참조키로하여 공연정보관련테이블을 세분화함 <br/>
- PerformDetail(공연상세정보), PerformInfo(공연시간,날짜), GenreData(장르), PlaceData(장소), RatingData(등급), SeatingData(좌석), 
PaymentData(가격), ReviewBoard(공연관람후기)<br/>
<hr>
<br/> 


# 회원가입 / 로그인
<img src ="/projectimage/회원가입.jpg"/><br/>
- spring-security를 이용 bcryptPasswordEncoder로 회원가입시 패스워드 암호화
<img src ="/projectimage/비밀번호 암호화.jpg"/>
<br/>
<img src ="/projectimage/로그인.jpg"/>
<br/> 
- matches 함수이용 암호화된 비밀번호비교하여 로그인 가능하도록 구현
<hr>
<br/>

# 공연정보페이지
<img src ="/projectimage/예매페이지.PNG"/>
<br/>
- 공연정보관련 테이블에서 공연고유의 키값인 performcode를 사용 Join을통해 데이터를 조회,
JSTl을 사용하여 해당공연의 데이터를 출력
<br/>
<img src ="/projectimage/poster mapper.jpg"/>
<hr>
<br/>
- jquery Tabs를 활용 상세정보/관람후기/공연장소/환불규정 으로 페이지 구분 
- 각 탭 페이지는 <jsp:include> 액션 태그를 이용한 페이지 모듈화 









