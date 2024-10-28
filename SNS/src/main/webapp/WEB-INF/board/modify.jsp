<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");
%>
<!--웹페이지 본문-->
<section>
	<div class="writeDiv">
		<form name="modify" method="post"  action="modify.do"> 
		<div class="leftDiv">
			<label>
				<span class="imgSpan"><img src="<%=request.getContextPath() %>/upload/<%=vo.getPname()%>" alt="고양이"  
					style="width: 100%;height: 100%; border-radius: 40px;"></span>
				<input type="file" style="display: none;">
			</label>
		</div>
		<div class="rightDiv">
			<input type="text" class="titleInput" placeholder="글제목" value="<%=vo.getTitle()%>">
			<br><br>
			<input type="text" class="contentInput" placeholder="글내용" value="<%=vo.getContent()%>">
			<br><br>
			<div class="btnDiv">
					<input class="btnR" type="button" value="수정">
					&nbsp;&nbsp;
					<input class="btnC" type="button" value="취소" onclick="location.href='view.do?=<%=vo.getBno()%>'">
			</div>
		</div>
		</form>
	</div>
</section>
<%@ include file="../include/aside.jsp" %>