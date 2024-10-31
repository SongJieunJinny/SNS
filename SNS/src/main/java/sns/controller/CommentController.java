package sns.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import sns.util.DBConn;
import sns.vo.BoardVO;
import sns.vo.CommentsVO;

public class CommentController {
	public CommentController(HttpServletRequest request, HttpServletResponse response, String[] comments)
			throws ServletException, IOException {

		if (comments[comments.length - 1].equals("view.do")) {
			commentWrite(request, response);
		}else if (comments[comments.length - 1].equals("view.do")) {
			commentModify(request, response);
		}
	}


	public void commentModify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 폼 데이터 가져오기
		int cno = Integer.parseInt(request.getParameter("cno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		String content = request.getParameter("content");
		
		// DB연결
				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				
				try{
					conn = DBConn.conn();
					String sql = " UPDATE comments SET content = ? WHERE cno= ? ";
					
					psmt = conn.prepareStatement(sql);
					psmt.setString(1,content);
			 		psmt.setInt(2,cno);
			 		rs = psmt.executeQuery();
					
					CommentsVO vo = new CommentsVO();
					if(rs.next()) {
						vo.setBno(rs.getInt("bno"));
						vo.setCno(rs.getInt("cno"));
						vo.setContent(rs.getString("content"));
					}
					
					request.setAttribute("vo", vo);
					request.getRequestDispatcher("/WEB-INF/board/view.jsp").forward(request, response);
					
				}catch(Exception e){
					e.printStackTrace();
				}
		
	}
	
	public void commentWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("commentWrite 호출");

		// 응답의 Content-Type을 JSON으로 설정
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		// 폼 데이터 가져오기
		int bno = Integer.parseInt(request.getParameter("bno"));
		int uno = Integer.parseInt(request.getParameter("uno"));
		String content = request.getParameter("content");

		// DB연결
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {

			conn = DBConn.conn();

			String sql = " insert into comments (bno,uno,content)value(?,?,?); ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bno);
			psmt.setInt(2, uno);
			psmt.setString(3, content);

			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 방금등록된 댓글 번호를 db에서 받아온다
		int cno = 0;

		try {
			String sql = " select last_insert_id() as cno; ";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			if (rs.next()) {
				cno = rs.getInt("cno");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("cno : " + cno);

		// 댓글번호로 댓글 정보를 db에서 받아온다
		// 댓글을 쓴 사람 번호로 프로필 이미지 파일명과 유저네임을 가져온다

		JSONObject json = new JSONObject();

		try {
			String sql = " select c.cno, c.rdate, u.unick, u.fname, u.pname from comments as c join user as u on c.uno = u.uno where cno = ?; ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cno);

			rs = psmt.executeQuery();

			if (rs.next()) {
				// JSON 객체 생성
				json.put("cno", cno);
				json.put("name", rs.getString("unick"));
				json.put("content", content);
				json.put("rdate", rs.getString("rdate"));
				json.put("fname", rs.getString("fname"));
				json.put("pname", rs.getString("pname"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		// JSON 응답 전송
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		out.flush();
	}
}