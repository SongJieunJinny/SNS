<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sns.vo.*" %>
<%@ page import="java.util.*" %>
<%
BoardVO vo = (BoardVO)request.getAttribute("board");

UserVO viewUser = null;
int uno = 0;
if(session.getAttribute("loginUser") != null){
    viewUser = (UserVO)session.getAttribute("loginUser");
	uno = Integer.parseInt(viewUser.getUno());
}
%>
<<<<<<< HEAD
<%
	List<CommentsVO> clist = (List<CommentsVO>)request.getAttribute("clist");
%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="../jquery-3.7.1.js"></script>
<script>
    function btnComment() {
        var formData = $("#commentForm").serialize();  // 폼 데이터를 직렬화 (쿼리 문자열 형태로 변환)

        $.ajax({
            // JSP 파일 경로 :: commentWrite.jsp / commentWrite.do
            // /WEB-INF 폴더 내부에 있는 jsp는 바로 접근이 안됩니다
            url: "/teamProject1/reply/view.do",  
            type: "POST",        // POST 방식으로 서버에 요청
            data: formData,      // 폼 데이터를 전송
            dataType: "json",    // JSON 형식의 응답을 기대
            success: function (response) {
                displayResult(response);  // 성공 시 결과를 화면에 표시
            },
            error: function (xhr, status, error) {
                console.error("JSP 요청 오류: ", error);  // 오류 발생 시 콘솔에 출력
            }/* ,
            complete: function(){
            	json_data = { "name" : "홍길동", "filename" : "profile.jpg", "content" : "댓글내용" }
            	displayResult(json_data); \${data.filename}filename
            } */
        });
    }
    
    
    function toggleA (obj) {
    	//토글할 commentMenutableA를 찾는다
    	var target = $(obj).find(".commentMenutableA");
    	
    	// 표시 상태를 확인한다
    	// block이면 none으로 변경해야 함
    	// none이면 block으로 변경해야 함
    	var state = false;
    	if( target.css("display") == "none" ){
    		state = true; // 원래 none였다
    	}
    	
    	// 일괄적으로 모든 commentMenutableA를 감춘다
    	$(".commentMenutableA").css("display","none");
    	
    	// 토글할 commentMenutableA을 바꿔준다
    	if( state == true){ // 원래 none 였으면 block으로
	    	target.toggle()
    	}
    	// else는 필요없음. 원래 block이었으면 일괄적으로 none로 변경된 상태를 바꾸지 않아도 됨
    }
 // 서버에서 받은 데이터를 화면에 추가하는 함수 (역순 정렬)
	function displayResult(data) {
			console.log(data.name);
			console.log(data.fname);
			console.log(data.pname);
			console.log(data.content);
			console.log(data.rdate);
			console.log(data.cno);
			
	    var str = `
			<div style="display: flex; align-items: center; gap: 10px;">
        <!-- 댓글작성자 프로필이미지 -->
        	<div class="view_profil">
						<img id="previewProfil" class="circular-img" 
			           style="border:none; width:50px; height:50px;" 
			           src="<%= request.getContextPath() %>/upload/96a49eb6-2c1b-4dab-b538-2defa1fa1043" alt="프로필 이미지" />
				  </div>
				 <!-- 댓글작성자 닉네임 -->
		       <span style="font-size:18px;">\${data.name}</span>
		     </div>
		     <!-- 댓글작성 내용 -->
			   <div style="margin-top: 5px; margin-left: 70px;" id="content">
           <span>\${data.content}</span>
         </div>
         <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 5px; margin-left: 70px; font-size: 12px; color: #999;">
		     <!-- 댓글작성일 -->
		       <span>\${data.rdate}</span>
	    	<!-- 메뉴바 -->
			<div class="commentMenuA" style"width:30px; cursor:pointer; margin-bottom:5px;" onclick="toggleA(this);">
			<div style="display: flex; align-items: center; gap: 10px;"> 
		       <span id="menuB" class="menuB" style="display: flex; align-items: center; gap: 10px;">
		         <i class="fas fa-solid fa-bars"></i>
			  	 </span>
		  	 </div>
			    <!-- 서브메뉴바 -->
			    <div class="commentMenutableA" style="display:none;">
			        <!-- 댓글신고 -->
			        <div class="menu-container" id="complainDiv" onclick="complainAdd(<%= vo.getBno() %>);">
			            <%-- <img style="width:20px; cursor:pointer;" 
			                 src="https://img.icons8.com/?size=100&id=8773&format=png&color=767676" 
			                 onclick="complainAdd(<%= vo.getBno() %>)" />
			            <button id="infoBtn">신고</button> --%>
			        </div>
			        <%
					if(session.getAttribute("loginUser") != null){
						if(uno == vo.getUno()){
						%>
				        <!-- 댓글수정 -->
				        <div class="commentMenu-container">
				            <i class="fas fa-solid fa-pen-nib"></i>
				            <button id="infoBtn" onclick="location.href='<%=request.getContextPath()%>/board/modify.do?bno=<%= vo.getBno() %>'">수정</button>
				        </div>
				        <!-- 댓글삭제 -->
				        <div class="commentMenu-container">
				            <i class="fas fa-solid fa-eraser"></i>
				            <button id="infoBtn">삭제</button>
				        </div>
						<%
						}else if(viewUser.getUauthor().equals("A")){
							System.out.println("writer.getUauthor() : " + viewUser.getUauthor());
						%>
						<!-- 댓글삭제 -->
				        <div class="commentMenu-container">
				            <i class="fas fa-solid fa-eraser"></i>
				            <button id="infoBtn">삭제</button>
				        </div>
						<%	
						}
					%>
			        <%
					}
					%>
			    </div>
			</div>
				  	 </span>
			  	 </div>
		  	 </div>
		  	 </div>
		  	 </div>
	    `
	    $(".commentDiv").prepend(str);  // 기존 내용 위에 추가
	}
	
=======
<script>
function deleteFn(){
	const bno = $("#bno").val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/board/delete.do',
		type:'post',
		// AJAX의 data 객체에서는 키 값을 문자열로 명시할 필요가 없다.
		data : {bno : bno},
		success : function(response){
			if(response.trim()==='success'){
				location.href = '<%= request.getContextPath()%>';
			}else{
				alert('글 등록에 실패했습니다.');
			}
			
		},
		// ajax에서 ""와 ''를 구별하지 않으나, 통일성을 위해 둘 중 하나를 선택해서 사용해야한다.
		error : function(xhr, status, error){
			alert("서버 오류가 발생했습니다.");
		} 
	});
}
>>>>>>> branch 'main' of https://github.com/SNS-Bteam/first-SNS.git
</script>
<!--웹페이지 본문-->
<div class="view_div">
    <div class="view_inner">
    	<label>
			<span class="imgSpan" style="width: 550px; height: 550px; cursor: default;">
				<img style="width: 550px; height: 550px; border-radius: 40px;" src="<%= request.getContextPath() %>/upload/<%= vo.getPname() %>">
			</span>
		</label>
       	<div class="view_content" style="width: 50%;">
       		<div class="icon-container">
       		
				<!-- 추천표시되는곳 -->
				<div id="reco" style="width:30px; cursor:pointer;">
					<!-- <img style="width:30px; cursor:pointer;" 
			         src="https://img.icons8.com/?size=100&id=87&format=png&color=000000" /> -->
				</div>
				<!-- 이미지 다운로드 -->
				<a href="<%= request.getContextPath() %>/upload/<%= vo.getPname() %>" download="<%= request.getContextPath() %>/upload/<%= vo.getFname() %>">
					<img id="downIcon" style="width:30px;" src="https://img.icons8.com/?size=100&id=gElSR9wTv6aF&format=png&color=000000">
				</a>
				<!-- 메뉴바 -->
				<div id="menuA" style="width:30px; cursor:pointer; margin-bottom:5px;">
				    <img style="width:30px; transform: rotate(90deg);" 
				         src="https://img.icons8.com/?size=100&id=98963&format=png&color=000000">
				    <!-- 서브메뉴바 -->
				    <div id="menutableA" style="display: none;">
				        <!-- 게시글신고 -->
				        <div class="menu-container" id="complainDiv" onclick="complainAdd(<%= vo.getBno() %>);">
				        </div>
				        <%
						if(session.getAttribute("loginUser") != null){
							if(uno == vo.getUno()){
							%>
					        <!-- 게시글수정 -->
					        <div class="menu-container">
					            <i class="fas fa-solid fa-pen-nib"></i>
					            <button id="infoBtn" onclick="location.href='<%=request.getContextPath()%>/board/modify.do?bno=<%= vo.getBno() %>'">수정</button>
					        </div>
					        <!-- 게시글삭제 -->
					        <form action="">
						        <div class="menu-container">
						            <i class="fas fa-solid fa-eraser"></i>
						            <button id="infoBtn" onclick="deleteFn()">삭제</button>
						            <input type="hidden" id="bno" name="bno" value="<%=vo.getBno()%>">
						        </div>
					        </form>
							<%
							}else if(viewUser.getUauthor().equals("A")){
								System.out.println("writer.getUauthor() : " + viewUser.getUauthor());
							%>
							<!-- 게시글삭제 -->
					        <div class="menu-container">
					            <i class="fas fa-solid fa-eraser"></i>
					            <button id="infoBtn">삭제</button>
					        </div>
							<%	
							}
						%>
				        <%
						}
						%>
				    </div>
				</div>
			</div>
       	<p style="font-size:26px; margin:10px 0;"><%= vo.getTitle() %></p>
		<div style="font-size:16px; margin-top:5px;">
		<div class="view_profil">
				<%
				if(vo.getUpname() != null && !vo.getUpname().equals("")){
				%>
		        <!-- 프로필 이미지가 있을 경우 -->
		        <img id="previewProfil" class="circular-img" 
		       		 onclick="location.href='<%= request.getContextPath() %>/user/mypage.do?uno=<%= vo.getUno() %>'"
		             style="border:none; width:50px; height:50px; cursor:pointer; " 
		             src="<%= request.getContextPath() %>/upload/<%= vo.getUpname() %>" alt="프로필 이미지" />
				<%
				}else{
					String firstNick = vo.getUnick().substring(0, 1);
	        	%>
		        <div class="icon profileicon" 
			        onclick="location.href='<%= request.getContextPath() %>/user/mypage.do?uno=<%= vo.getUno() %>'"
			        style="background-color:#EEEEEE; border-radius: 50%; cursor: pointer;
			        display: flex; justify-content: center; align-items: center; 
			        font-size: 24px; font-weight: bold; width: 50px; height: 50px;">
			        <%= firstNick %>
	        	</div>
	        	<%
				}
				%>
			    <span><%= vo.getUnick() %></span>
			    <button class="ssBtn">팔로우</button>
			</div>
		&nbsp;
		<%= vo.getRdate() %>&nbsp;
		추천수&nbsp; <%= vo.getRecommend() %>&nbsp;
		조회수&nbsp; <%= vo.getHit() %>
		</div><br>
		<div><%= vo.getContent() %></div>
		<!-- 댓글위치 -->
		<div class="comment_inner">
			<table>
				<tr>
					<td colspan="3">
					<form action="" method="post" id="commentForm">
						<div class="search-wrapper">
							<div class="input-container" id="seach-container"
							style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
						    background-color: white;
						    border-radius: 40px;
						    width:100%;
						    display: flex;
						    align-items: center; 
						    gap: 10px;
						    ">
								<i class="fas solid fa-comment-dots" style="margin-left:10px;"></i>
									<!-- 댓글 작성자 -->
								<input type="hidden" name="bno" value="1">
								<%-- <input type="hidden" name="uno" value="<%= vo.getUno()%>"> --%>
								<input type="hidden" name="uno" value="<%= vo.getUno()%>">
							<!-- 댓글 입력창 -->
								<input type="text" id="commentContent" name="content" placeholder="댓글"	
								style="padding-right: 40px;	background-color: white;" size="50">
								<!-- 댓글 게시글번호 -->
								<input id="commentBno" type="hidden">
            	</div>
            	<!-- 댓글등록 버튼 -->
            	<button type="button" id="commentSubmit" class="btnComment" onclick="btnComment()"
            					style=" padding: 10px;
															box-sizing: border-box;
															border: 2px solid #BFBFBF;
															outline: none;
															font-weight:bold;
															font-size:18px;
															text-align: center;
															margin-bottom:20px;
															box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
															background-color: #BFBFBF;
															border-radius: 40px;
															width:20%;
															display: flex;
															align-items: center;
															gap: 10px;">등록</button>	
							</div>
						</form>
					</td>
				</tr>
			</table>
			<!-- 댓글목록 출력 -->
			<div class="commentDiv">
			</div>	
			</div>
		</div>
	</div>
</div>