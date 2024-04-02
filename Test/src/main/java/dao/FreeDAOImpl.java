package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.File;
import dto.fBoard;
import util.MybatisSqlSessionFactory;

public class FreeDAOImpl implements FreeDAO {
	 //sqlSession 생성 
	   SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	   // 앞에는 매번 생성되는건 아니지만 뒤에 있는 건 이미 생성되어 있는 것
	
	@Override
	public void insertDAO(fBoard board) throws Exception {
		 sqlSession.insert("mapper.board.insertBoard", board);
	      // board.xml에 있는 곳
	      // mapper.board는 mapper의 namespace, insertBoard는 아이디 
	      //board는 파라미터 이름
	      sqlSession.commit();
	      // 자동 커밋이 없기 떄문에 commit 을해줘야 함 
		
	}

	@Override
	public void insertFile(File file) throws Exception {
		sqlSession.insert("mapper.file.insertFile", file);
	    sqlSession.commit();
	    // dto에 있는 파일 import
		
	}

	@Override
	public List<fBoard> selectBoardList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.board.selectBoardList",row);
	}

	@Override
	public Integer selectBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.board.selectBoardCount");
	}

	@Override
	public fBoard selectBoard(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.board.selectBoard", num);
	}

	@Override
	public void updateBoard(fBoard board) throws Exception {
		sqlSession.update("mapper.board.updateBoard", board);
	    sqlSession.commit();
	}

	@Override
	public void updateBoardViewCount(Integer num) {
		 try {
		        // 데이터베이스 연결 설정
		        Connection conn = DriverManager.getConnection("데이터베이스 url", "사용자이름", "비밀번호");

		        // SQL 쿼리 작성
		        String sql = "UPDATE freeboard SET freeView = freeView + 1 WHERE freeNum = ?";

		        // PreparedStatement 생성
		        PreparedStatement pstmt = conn.prepareStatement(sql);

		        // 매개변수 설정
		        pstmt.setInt(1, num);

		        // 쿼리 실행
		        pstmt.executeUpdate();

		        // 리소스 정리
		        pstmt.close();
		        conn.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		
	}

}
