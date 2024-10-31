<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page import="sns.vo.* "%>
<%
	ArrayList<BoardVO> board = (ArrayList<BoardVO>)request.getAttribute("board");
%>
<!--웹페이지 본문-->
<section>
       <div class="bcSpan">
           <a href="<%= request.getContextPath() %>/admin/blackList.do">
           		<span class="bUnderline" style="color: lightgray;"> 블랙리스트 </span>
           </a>
           <a href="<%= request.getContextPath() %>/admin/complainList.do">
          	 	<span class="cUnderline" > 신고 게시글 </span>
           </a>
       </div>
        <% for(BoardVO vo : board){ %> 
           <input type="hidden" name="bno" id ="bno" value="<%=vo.getBno()%>">
       	   <input type="hidden" name="state" id ="state" value="<%=vo.getState()%>">  
          <%}%>
       <div class="complainTable">
         
           <table class="inner_table">
               <thead>
               	<tr>
                   <th>번호</th>
                   <th>닉네임</th>
                   <th>제목</th>
                   <th>작성일</th>
                   <th>신고 횟수</th>
                   <th>활성화 여부</th>
                 </tr>
               </thead>
              <tbody>
               <% for(BoardVO vo : board){ %>
                   <tr>
                       	<td>페이징 번호</td>
                       	<td><%=vo.getUnick() %></td>
                       	<td><%=vo.getTitle() %></td>
                       	<td><%=vo.getRdate() %></td>
                       	<td><%=vo.getDeclaration() %></td>
                       <%
                       if(vo.getState().equals("E")){
                    	%>	   
                   	   <td>
                       		<button type="button" class="ssBtn" onclick="stateFn()">비활성화</button>
                       </td>
                     	<%
                     	}else{
                    	%> 
                   	    <td>
                       		<button type="button" class="ssBtn" 
                       		style="background-color:#767676; color:white;" onclick="stateFn()">활성화</button>
                       </td>
                       <%
                       }
                       %>
                <% } %>
                   </tr>
               </tbody>
           </table>
       </div>
</section>
<%@ include file="../include/aside.jsp" %>
<script>
// post 방식으로 보내야하기 때문에 onclick 할 때 함수 안에 ajax를 사용해야함
function stopFn(){
	const bno = $('#bno').val();
	const state = $('#state').val();
	// 값을 가져왔나 확인 
	// 만약 가져오지 않았다면, controller에서 vo에 담겨져 있는지 확인해야함
	console.log(bno);
	console.log(state);
	$.ajax({
		url : "admin/stopUser.do",
		type : "post",
		data : {
			// 보내야 할 데이터를 담음 
			"bno" : bno,
			"state" : state
		},
		success: function(response){
			alert("상태가 변경되었습니다.");
            location.reload(); // 페이지 새로 고침으로 상태 갱신
		},
		error: function(xhr, status, error) {
            // 에러 처리
            console.error("오류 발생:", error);
            alert("상태 변경에 실패했습니다.");
        } 
	});
}

</script>
 
 