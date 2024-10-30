<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="sns.vo.* "%>
<%
UserVO vo = (UserVO)request.getAttribute("vo");
%>
<!--웹페이지 본문-->
<section>
       <div class="bcSpan">
           <a href="<%= request.getContextPath() %>/admin/blackList.do">
           		<span class="bUnderline" > 블랙리스트 </span>
           </a>
           <a href="<%= request.getContextPath() %>/admin/complainList.do">
          	 	<span class="cUnderline" style="color: lightgray;"> 신고 게시글 </span>
           </a>
       </div>
       <div class="complainTable">
           <table class="inner_table">
               <thead>
               	<tr>
                    <th>신고 번호</th>
                    <th>닉네임</th>
                    <th>이메일</th>
                    <th>가입일</th>
                    <th>신고 횟수</th>
                    <th>정지</th>
                   </tr>
               </thead>
               <tbody>
                   <tr>
                    	<td><%=vo.getCpno() %></td>
                       <td><%=vo.getUnick() %></td>
                       <td><%=vo.getUemail() %></td>
                       <td><%=vo.getUrdate() %></td>
                       <td><%=vo.getDeclaration() %></td>
                       <%
                       if(vo.getUstate().equals("E")){
                    	%>	   
                   	   <td>
                       		<button type="button" class="ssBtn" onclick="stopFn()">정지</button>
                       </td>
                     	<%
                     	}else{
                    	%> 
                   	    <td>
                       		<button type="button" class="ssBtn" 
                       		style="background-color:#767676; color:white;">정지해제</button>
                       </td>
                       <%
                       }
                       %>
                   </tr>
               </tbody>
           </table>
       </div>
</section>
<%@ include file="../include/aside.jsp" %>
<script>
function stopFn(){
	
}

</script>