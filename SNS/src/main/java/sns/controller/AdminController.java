package sns.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sns.util.DBConn;
import sns.vo.BoardVO;
import sns.vo.UserVO;

public class AdminController {
	public AdminController(HttpServletRequest request
			, HttpServletResponse response
			, String[] comments) throws ServletException, IOException {
		
		if(comments[comments.length-1].equals("blackList.do")) {
			blackList(request,response);
		}else if(comments[comments.length-1].equals("complainList.do")) {
			complainList(request,response);
		}else if (comments[comments.length-1].equals("loadComplain.do")) {
			loadComplain(request,response);
		}else if (comments[comments.length-1].equals("complainAdd.do")) {
			complainAdd(request,response);
		}
	}
		
	public void blackList (HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try{
			conn =DBConn.conn();
			//데이터 출력에 필요한 게시글 데이터 조회 쿼리 영역
			
			// complaint_board 신고 게시판   date_format(b.rdate,'%Y-%m-%d') as rdate" 
			
			// 서브쿼리 쓸 때 조심해야함 >> complaint_board c로 작성하면 sql문법 오류가 발생함
			String sql =" SELECT u.*, c.*,  "
					// 신고 횟수를 정하기 위한 쿼리 
					   + "( select count(*) from complaint_board c2 where c2.bno = b.bno ) as cnt"
					   +" 	FROM complaint_board c "
					   +"   INNER JOIN board b "
					   +" 	ON c.bno = b.bno "
						+"   INNER JOIN user u "
						+" 	ON b.uno = u.uno ";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			UserVO vo = new UserVO();
			while(rs.next()){
				vo.setUnick(rs.getString("unick"));
				vo.setUemail(rs.getString("uemail"));
				vo.setUrdate(rs.getString("urdate"));
				vo.setDeclaration(rs.getInt("cnt"));
				vo.setUstate(rs.getString("ustate"));
				vo.setCpno(rs.getInt("cpno"));
				}
			request.setAttribute("vo", vo);
			// board 작성한 
			request.getRequestDispatcher("/WEB-INF/admin/blackList.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				DBConn.close(rs,psmt, conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void complainList (HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/admin/complainList.jsp").forward(request, response);
	}
		
		
	public void loadComplain(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bno = request.getParameter("bno");
		String uno = "0";
		String state = "D";
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null){
			UserVO user = (UserVO)session.getAttribute("loginUser");
			uno = user.getUno();
		}
		System.out.println("loadComplain 받은 bno 값: " + bno + ", uno : " + uno);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
		    conn = DBConn.conn();

		    // 사용자가 이 게시물을 추천했는지 확인
		    String sql = "select * from COMPLAINT_BOARD where uno = ? and bno = ?";
		    System.out.println("sql checkComplain: "+sql);
		    psmt = conn.prepareStatement(sql);
		    psmt.setString(1, uno);
		    psmt.setString(2, bno);
		    
		    rs = psmt.executeQuery();
		    
		    if(rs.next()) {
		    	state = "E";
		    }
		    
		    request.setAttribute("state", state);
		    request.setAttribute("bno", bno);
			request.getRequestDispatcher("/WEB-INF/admin/loadComplain.jsp").forward(request, response);

		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    try {
				DBConn.close(rs, psmt, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void complainAdd(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("loginUser");
		String uno = user.getUno();
		String bno = request.getParameter("bno"); 

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = "";


		try {
		    conn = DBConn.conn();

		    sql = "select * from COMPLAINT_BOARD where uno = ? and bno = ?";
		    psmt = conn.prepareStatement(sql);
		    psmt.setString(1, uno);
		    psmt.setString(2, bno);

		    rs = psmt.executeQuery();

		    if (rs.next()) {
		        // 신고가 이미 존재하면 delete
		    	sql = "delete from COMPLAINT_BOARD where uno = ? and bno = ?";
		        psmt = conn.prepareStatement(sql);
		        psmt.setString(1, uno);
		        psmt.setString(2, bno);
		    } else {
		        // 신고가 없으면 insert
		        sql = "insert into COMPLAINT_BOARD (uno, bno) values (?, ?)";
		        psmt = conn.prepareStatement(sql);
		        psmt.setString(1, uno);
		        psmt.setString(2, bno);
		    }
		    psmt.executeUpdate();

		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    try {
				DBConn.close(rs, psmt, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
