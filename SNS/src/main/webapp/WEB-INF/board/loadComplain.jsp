<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String state = "";

if(request.getAttribute("state") != null && !request.getAttribute("state").equals("")){
	state = (String)request.getAttribute("state");
}

System.out.println("loadComplain state: " + state);  // 콘솔 출력으로 확인

// 신고 상태에 따라 적절한 이미지를 표시
if (state.equals("E")) {
    // 신고한 상태일 때
    %>
    <img style="width:20px; cursor:pointer;" 
        src="https://img.icons8.com/?size=100&id=8773&format=png&color=FF7F50" />
    <button id="infoBtn">신고</button>
    <%
} else {
    // 신고하지 않은 상태일 때
    %>
    <img style="width:20px; cursor:pointer;" 
        src="https://img.icons8.com/?size=100&id=8773&format=png&color=767676" />
    <button id="infoBtn">신고</button>
    <%
}
%>