<%@page import="sns.util.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%@ include file="/WEB-INF/include/nav.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="sns.*" %>
<%
	String id = request.getParameter("id");

		//사용변수 선언 영역
		ArrayList<BoardVO> board = new ArrayList<>(); 
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			try{
				conn =DBConn.conn();
				//데이터 출력에 필요한 게시글 데이터 조회 쿼리 영역
				String sql =" SELECT b.bno"
						   +" 	    ,title"
						   +" 	    ,hit"
						   +" 	    ,date_format(b.rdate,'%Y-%m-%d') as rdate"
						   +" 	    ,content"
						   +" 	    ,uno"
						   +" 	    ,a.pname"
						   +" 	    ,a.fname"
						   +" 	FROM board b"
						   +"   INNER JOIN attach a"
						   +" 	ON b.bno = a.bno " 
						   +" where state='E' ";
				sql += " ORDER BY b.rdate desc";

				psmt= conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()){
					BoardVO vo = new BoardVO();
					vo.setBno(rs.getInt("bno"));
					vo.setHit(rs.getInt("hit"));
					vo.setTitle(rs.getString("title"));
					vo.setRdate(rs.getString("rdate"));
					vo.setContent(rs.getString("content"));
					vo.setUno(rs.getInt("uno"));
					vo.setPname(rs.getString("pname"));
					vo.setFname(rs.getString("fname"));
					board.add(vo);
				}
   
%>
<script>
window.onload = function(){
	$(".listDiv").click(function() {
	    $("#modal").fadeIn(); // 모달 창 보이게 하기
	    
	    let bno = $(this).attr('id');
	    console.log(bno);
	    
	    $.ajax({
	        url: "<%= request.getContextPath() %>/board/view.do",
	        data : {bno:bno},
	        type: "get",
	        success: function(data) {
	            $("#modalBody").html(data);
				
	            // 동적으로 로드된 스크립트 실행
	            $('script').each(function() {
	                if (this.src) {
	                    $.getScript(this.src);
	                } else {
	                	// eval 대체 할 수 있는 함수 > new function 
	                    eval($(this).text());
	                }
	            });
	
	            // 다크모드 초기화 다시 실행
	            DarkMode();
	            loadComplain(bno);
	            loadReco(bno);
	        }
	    });
	});
	
	$(window).click(function(event) {
	    if ($(event.target).is("#modal")) {
	        $("#modal").fadeOut(); // 모달 창 숨기기
	    }
	});
	// id가 null 일 경우를 생각해서 제약 조건을 걸어야함 
	// null인 경우 클릭x , null이 아닌 경우 클릭 o , boardController 경로 수정
	
	// 로컬스토리지에서 꺼낸 값을 클릭
	var bno = localStorage.getItem('bno'); 
	if(bno != ""){
		$("#"+bno).click(); 
		localStorage.setItem('bno', "");
	}
	// 로컬스토리지 삭제 
	
}

function DarkMode() {
    const currentMode = localStorage.getItem('mode') || 'light';
    const modeText = document.getElementById('modeText');
    if (currentMode === 'dark') {
        document.body.classList.add('dark-mode');
        modeText.textContent = '라이트모드';
    } else {
        document.body.classList.remove('dark-mode');
        modeText.textContent = '다크모드';
    }

    // 다크모드 토글 버튼 클릭 이벤트
    document.getElementById('modeToggle').addEventListener('click', function() {
        document.body.classList.toggle('dark-mode');
        const newMode = document.body.classList.contains('dark-mode') ? 'dark' : 'light';
        localStorage.setItem('mode', newMode);
        modeText.textContent = newMode === 'dark' ? '라이트모드' : '다크모드';
    });
}
</script>
<!--웹페이지 본문-->
<section class="scrollable">
	<div id="indexDiv">
          <!-- 1번째 줄 -->
          <%
          for(BoardVO bo : board){ 
       	  %>
        		<div class="listDiv" id="<%=bo.getBno() %>" >
	           	 	 <!-- 이미지 -->
	            	  <img style="width: 250px; height: 250px; border-radius: 20px;" 
	            	  src="<%=request.getContextPath()%>/upload/<%=bo.getPname() %>">
	            	  
	          		</div>  
          <%
          String imagePath = request.getContextPath() + "/upload/" + bo.getPname();
          System.out.println("Image Path: " + imagePath);
          }
          %>
      </div> 
</section>
<%@ include file="/WEB-INF/include/aside.jsp" %>

<% 
}catch(Exception e){
				e.printStackTrace();
			}finally{
				DBConn.close(rs, psmt, conn);
			}
			
 
%>
