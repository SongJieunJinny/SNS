# SNS

## 📑 목차

- [프로젝트 진행기간](#프로젝트-진행기간)
- [프로젝트 소개](#프로젝트-소개)
- [Team Members](#Team-Members)
- [주요목표](#주요목표)
- [주요 기능 요약](#주요-기능-요약) 
- [개발환경](#개발환경)
- [PPT 및 추가 자료들](#PPT-및-추가-자료들)
- [담당기능](#담당기능)
- [트러블슈팅](#트러블슈팅)
- [개선할 부분](#개선할-부분)

--- 

## 🗓️프로젝트 진행기간
- 2024.10.14 ~ 2024.11.13

--- 

## 🎯 프로젝트 소개
- Java 13 + JSP 기반의 간단한 SNS 웹 애플리케이션.
- 회원가입·로그인, 게시글 작성·수정·조회, 댓글, 팔로우, 좋아요, 관리자 신고/블랙리스트 화면을 제공한다.
- 아키텍처는 JSP 기반 MVC이며 DB는 MySQL 8.0, 서버는 Tomcat 9.0을 사용한다.
- 본 문서는 사용자가 업로드한 실제 파일만을 근거로 작성했다.

--- 

## 👥Team Members

| Name   | Role | Planning                | Development |
|--------|------|-------------------------|-------------|
| 장이슬 | 팀장 | 화면설계서 작성, 프로토타입 제작, HTML, CSS, 시퀀스(로그인), PPT | 회원가입/로그인-아웃, 이메일인증, 아이디,비밀번호 찾기, 좋아요, 신고, 내정보조회 및 수정 |
| 송지은 | 팀원 | 주제제안서 작성, HTML, CSS, 시퀀스(글쓰기), ERD | 댓글 CRUD, PagingUtil 처리 연동 및 검색기능, 팔로우하기 |
| 박인재 | 팀원 | 요구분석서 작성, HTML, CSS, 시퀀스(회원가입), 유즈케이스 | 게시판 CRUD, 블랙리스트 유저 조회, 신고게시글 조회, 본인과 다른회원의 작성글 조회, 회원정지 |
| 이동윤 | 팀원 | 프로젝트설계서 작성, HTML, CSS | 알림, 마이페이지에서 좋아요 누른 게시글 조회 (※ 메시지 송수신 기능은 미구현) |

--- 

## 💡주요목표
- 비동기 통신 기술인 **AJAX를 활용한 실시간 모니터링 기능을 갖춘 소셜 웹 서비스를 개발**하는 데 목표
  
--- 

## ⚙️ 주요 기능 요약
|구분|기능|기술 키워드|
|-----|------|------------|
|👥 회원/인증|회원가입, 로그인, 이메일 인증, 아이디·비밀번호 찾기|JSP, jQuery, AJAX, Sendmail|
|📝 게시판|게시글 등록·수정·조회, 첨부파일 표시, 페이징|JSP, JSTL, PagingUtil|
|💬 댓글|댓글 작성·수정·삭제 (비동기 처리)|jQuery AJAX, CommentController|
|🤝 팔로우|팔로우·언팔로우, 팔로워/팔로잉 수 조회|FollowVO, AJAX|
|❤️ 좋아요|게시글 좋아요 및 취소 처리|BoardController, AJAX|
|🚨 신고|게시글 신고 등록 및 관리자 확인|AdminController, ComplainList.jsp|
|🔔 알림|팔로우·댓글 알림 (구조 설계, 구현 예정)|AlarmVO|
|👩‍💼 관리자|신고 게시글·블랙리스트 관리 화면|AdminController, JSTL|
|👥 마이페이지|내 정보 조회·수정, 프로필 이미지 변경|UserController, profileModify.jsp|
|🎨 UI/UX|다크모드, 반응형 디자인, 공통 헤더·네비게이션|HTML5, CSS3, sns.css, include JSP|
  
--- 

## 🛠개발환경
### Backend
- JDK 13.0.2 / Java 13
- JSP / Servlet 기반 MVC 아키텍처
- JDBC (직접 연결), Mail API, File Upload (cos.jar)

### Frontend
- HTML5 / CSS3 / JavaScript
- JSP 4 / Ajax
- jQuery 3.7.1

### Database & Server
- MySQL 8.0 (Workbench 8.0)
- Apache Tomcat 9.0
 
### Tools & Collaboration
- Eclipse IDE 4.22.0
- Visual Studio Code
- MySQL Workbench 8.0
- ERMaster
- StarUML
- Git & GitHub
- Notion

--- 

## 🔗PPT 및 추가 자료들

### ERD
![ERD_SNS](https://github.com/user-attachments/assets/2385c6f2-d27d-4102-86d3-69c2a6f3d70b)

### UseCase
![UseCase_SNS](https://github.com/user-attachments/assets/13f96540-0ec8-4b60-a8f4-f1cf1d221421)

### 시퀀스(로그인)
![로그인시퀀스_SNS](https://github.com/user-attachments/assets/612917a7-5c2f-45a4-a252-0d47ef4a6a72)

### 시퀀스(글쓰기)
![글쓰기시퀀스_SNS](https://github.com/user-attachments/assets/92554610-2f57-4edb-a195-f0ac56e2ae10)

### 시퀀스(회원가입)
![회원가입시퀀스_SNS](https://github.com/user-attachments/assets/c4725022-7356-48b0-b3cc-cdacb7f3900c)

### 프로토타입
- [📎 Prototype_SNS.pptx](https://github.com/SongJieunJinny/SNS/document/PPT/Prototype_SNS.pptx?raw=true)

### 최종PPT
- [📎 Presentation_SNS.pptx](https://github.com/SongJieunJinny/SNS/document/PPT/Presentation_SNS.pptx?raw=true)

--- 
## 🖥담당기능
**🗨 댓글 CRUD**
게시글 상세 페이지에서 댓글을 작성·조회·수정·삭제할 수 있도록 구현. Ajax를 이용해 새로고침 없이 비동기 갱신되도록 처리.
 - 관련 JSP: commentWrite.jsp, view.jsp
 - 관련 Controller: CommentController.java
 - 관련 VO: CommentsVO.java
 - 주요 함수:
   - writeComment() : 댓글 등록
   - updateComment() : 댓글 수정
   - deleteComment() : 댓글 삭제
   - listComments() : 댓글 목록 조회

**🔍 게시글 검색**
제목, 내용, 작성자 키워드 검색 기능 구현. 페이징 처리(PagingUtil)와 연동하여 결과를 표시.
 - 관련 Controller: BoardController.java
 - 관련 Util: PagingUtil.java
 - 주요 함수:
   - searchBoard(keyword) : 키워드 기반 게시글 검색
   - listBoard(page) : 페이징 처리된 목록 조회

**🤝 팔로우 기능**
회원 간 팔로우/언팔로우 기능 구현. 프로필 페이지에서 버튼 클릭 시 실시간으로 반영되도록 설계.
 - 관련 JSP: mypage.jsp, profileModify.jsp
 - 관련 Controller: UserController.java
 - 관련 VO: FollowVO.java
 - 주요 함수:
   - followUser() : 팔로우 등록
   - unfollowUser() : 팔로우 해제
   - countFollow() : 팔로워·팔로잉 수 조회

**🧩 추가 담당기능들**
 - ERD 정규화 및 참조 무결성 검토
 - CRUD 기능 단위 테스트 수행 및 UI 통합 테스트
 - CSS 스타일 보정 및 반응형 개선

--- 
## 🐞트러블슈팅
### 1️⃣ Ajax 댓글 등록 실패  

**문제 배경**  
 - 댓글 등록 후 새로고침 없이 비동기로 화면에 반영되도록 Ajax를 적용했으나, 요청이 Controller에 전달되지 않거나 결과가 화면에 표시되지 않는 문제가 발생.

**해결 방법**  
 - data 객체 내 파라미터 이름과 Controller 매개변수 이름 불일치 확인
 - Ajax 요청에 event.preventDefault() 추가로 form 기본 전송 방지
 - 성공 콜백(success)에서 새 댓글을 .append()로 동적 추가

**코드 비교**

```java
// 수정 전
$.ajax({
  url: "/comment/write.do",
  type: "post",
  data: $("#commentForm").serialize(),
});

// 수정 후
$("#commentForm").on("submit", function(e){
  e.preventDefault();
  $.ajax({
    url: "/comment/write.do",
    type: "post",
    data: { content: $("#comment").val(), bno: $("#bno").val() },
    success: function(data){
      $("#commentList").append(data);
    }
  });
});
```
💭 **알게 된 점**
 - Ajax는 단순히 비동기 요청이 아니라 **요청·응답 구조를 명확히 이해해야 작동한다는 것**을 깨달았다.
 - Java, JSP, jQuery가 서로 연결되는 흐름을 파악하는 데 많은 시행착오가 있었고, **태어나 처음으로 코드를 작동시킨 순간의 성취감**이 가장 기억에 남았다.

### 2️⃣ 팔로우 상태 미반영 오류

**문제 배경**
 - 팔로우 버튼 클릭 후 DB에는 반영되지만 화면의 버튼 텍스트가 즉시 바뀌지 않음.

**해결 방법**
 - Ajax 응답으로 팔로우 상태(true/false)를 반환
 - jQuery로 상태에 따라 버튼 텍스트 실시간 변경

**코드 비교**

```java
// 수정 전 (프런트 계산만 존재)
$.ajax({
  url: "/user/follow.do",
  data: {tuno: tuno}
});

// 수정 후 (서버 검증 추가)
$.ajax({
  url: "/user/follow.do",
  data: {tuno: tuno},
  success: function(res){
    if(res === "followed") $(".followBtn").text("언팔로우");
    else $(".followBtn").text("팔로우");
  }
});
```
💭 **알게 된 점**
 - 비동기 요청 후 즉각적인 UI 피드백이 사용자 경험에 중요함을 이해했다.
 - Ajax 성공 콜백에서 DOM 변경을 처리하는 것이 가장 안정적임을 배웠다.

### 3️⃣ JSP 한글 인코딩 오류

**문제 배경**
 - 댓글 작성 시 한글이 깨지거나 물음표(???)로 표시됨.

**해결 방법**
 - 모든 JSP 상단에 UTF-8 선언 추가.

**코드 비교**

```java
<%@ page contentType="text/html; charset=UTF-8" %>
```
💭 **알게 된 점**
 - 서버와 클라이언트 간 문자 인코딩 일관성이 필수적임을 인식.
 - JSP는 기본적으로 ISO-8859-1로 처리되므로, UTF-8 명시가 필요함을 학습.

--- 
## 📖개선할 부분

- 게시글은 작성자, 내용, 제목에서 검색이 되어야하지만 제목으로만 검색되고 있습니다.
- 댓글 수정하고 취소를 누를경우 원래 댓글목록 상태로 돌아가야하지만 수정창이 유지되면서 내용만 reset 되고 있습니다.
- 마이페이지에서 닉네임 중복체크 확인이 누락되었습니다.
- 게시글을 신고할 때 신고 사유가 확인이 되지않아 해당 신고글을 확인해야하는 불편함이 있습니다.
- 일정관리의 미흡함으로 메시지 송수신기능을 구현하지 못했습니다.

--- 
