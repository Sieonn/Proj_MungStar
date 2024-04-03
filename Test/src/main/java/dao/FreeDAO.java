package dao;

import java.util.List;

import dto.fBoard;
import dto.File;

public interface FreeDAO {

	   void insertDAO(fBoard board) throws Exception;
	   void insertFile(File file) throws Exception;
	   List<fBoard> selectBoardList(Integer row) throws Exception;
	   Integer selectBoardCount() throws Exception;
	   fBoard selectBoard(Integer num) throws Exception;
	   void updateBoard(fBoard board) throws Exception;
	   void updateBoardViewCount(Integer num);
	   int selectBoardCountByQuery(String query) throws Exception;
	   List<fBoard> searchBoardListByQuery(String query, int row) throws Exception;

}
