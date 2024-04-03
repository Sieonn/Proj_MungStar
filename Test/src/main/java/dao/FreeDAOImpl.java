package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.FBoard;
import dto.File;
import util.MybatisSqlSessionFactory;

public class FreeDAOImpl implements FreeDAO {
	 //sqlSession 생성 
	   SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	   // 앞에는 매번 생성되는건 아니지만 뒤에 있는 건 이미 생성되어 있는 것
	
	@Override
	public void insertDAO(FBoard board) throws Exception {
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
	public List<FBoard> selectBoardList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.board.selectBoardList",row);
	}

	@Override
	public Integer selectBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.board.selectBoardCount");
	}

	@Override
	public FBoard selectBoard(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.board.selectBoard", num);
	}

	@Override
	public void updateBoard(FBoard board) throws Exception {
		sqlSession.update("mapper.board.updateBoard", board);
	    sqlSession.commit();
	}

	@Override
	public void updateBoardViewCount(Integer num) {
		sqlSession.update("mapper.board.updateBoardViewCount", num); 
		sqlSession.commit();
	}

}
