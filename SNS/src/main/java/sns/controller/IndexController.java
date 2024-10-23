package sns.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sns.util.DBConn;
import sns.vo.BoardVO;


public class IndexController {
	public IndexController(HttpServletRequest request
			, HttpServletResponse response
			, String[] comments) throws ServletException, IOException {
		
		ArrayList <BoardVO> board = new ArrayList<>();
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			
			conn = DBConn.conn();
			
			String sql = " SELECT b.*,u.uid "
					+"   FROM board b , user u "
				    +"  WHERE b.uno = u.uno";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				 vo.setBno(rs.getInt("bno"));
				 vo.setHit(rs.getInt("hit"));
				 vo.setTitle(rs.getString("title"));
				 vo.setContent(rs.getString("content"));
				 vo.setRdate(rs.getString("rdate"));
				 vo.setState(rs.getString("state"));
				 vo.setUno(rs.getInt("uno"));
				board.add(vo);
			} 
			
			request.setAttribute("board", board);
			//2. WEB-INF/notice/list.jsp Æ÷¿öµå
			request.getRequestDispatcher(request.getContextPath()).forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBConn.close(rs, psmt, conn);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	


}
