<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%
UserVO pageUser = (UserVO)request.getAttribute("user");
String pUno = pageUser.getUno();
String pPname = pageUser.getPname();
%>
<!--웹페이지 본문-->
<section>
	<div class="mypage_inner">
		<div id="mypage_top">
			<!-- 프로필이미지 -->
			<%
	        if(pPname != null && !pPname.equals("")){
        	%>
        	<img id="previewProfil" class="circular-img" 
	            style="border:none; width:300px; height:300px;" 
	            src="<%= request.getContextPath()+"/upload/" + pPname %>" 
           		alt="첨부된 이미지" style="max-width: 100%; height: auto;" />
         	<%
	        }else{
	        	String firstNick = pageUser.getUnick().substring(0, 1);
        	%>
	        <div class="icon profileicon"
	        style="background-color:#EEEEEE; border-radius: 50%; cursor: pointer;
	        display: flex; justify-content: center; align-items: center;
	         font-size: 100px; font-weight: bold; width: 300px; height: 300px;">
		        <%= firstNick %>
        	</div>
        	<%
	        }
	        %>
	    	<div><%= pageUser.getUnick() %></div>
	    	<div>팔로워 수 10</div>
	    	<div>
	    		<%
	    		if(loginUser != null && pUno.equals(loginUser.getUno())){
    			%>
	    		<!-- 로그인한 회원의 마이페이지인 경우 -->
	    		<button class="ssBtn" onclick="location.href='profileModify.do'">프로필 수정</button>
    			<%
	    		}else{
    			%>
	    		<!-- 내가 아닌 다른 회원페이지인 경우 -->
	    		<button class="ssBtn">메시지</button>
	    		<button class="ssBtn">팔로우</button>
    			<%	
	    		}
	    		%>
			</div>
			<div class="mypage_page">
				<%
	    		if(loginUser != null && pUno.equals(loginUser.getUno())){
    			%>
				<!-- 로그인한 회원의 마이페이지인 경우 -->
				<a href="mypage.do?uno=<%= loginUser.getUno() %>" style="text-decoration: underline; text-underline-offset: 6px;">북마크</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="mypage_write.do" style="color:gray;">내가쓴글</a>
				<%
	    		}else{
    			%>
				<!-- 내가 아닌 다른 회원페이지인 경우 -->
				<a style="text-decoration: underline; text-underline-offset: 6px;">작성글</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%	
	    		}
	    		%>
            </div>
		</div>
		<!-- 게시글출력되는곳 -->
		<div id="indexDiv" class="scrollable">
            <!-- 1번째 줄 -->
            <div class="listDiv">
                <!-- 이미지 -->
            </div>
            <div class="listDiv">
                <!-- 이미지 -->
            </div>
            <div class="listDiv">
                <!-- 이미지 -->
            </div>
            <div class="listDiv">
                <!-- 이미지 -->
            </div>
            <div class="listDiv">
                <!-- 이미지 -->
            </div>
            <div class="listDiv">
                <!-- 이미지 -->
            </div>
        </div> 
    </div>
</section>
<%@ include file="../include/aside.jsp" %>