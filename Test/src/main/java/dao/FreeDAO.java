package dao;

import java.util.List;

import dto.FBoard;
import dto.File;

public interface FreeDAO {

	   void insertDAO(FBoard board) throws Exception;
	   void insertFile(File file) throws Exception;
	   List<FBoard> selectBoardList(Integer row) throws Exception;
	   Integer selectBoardCount() throws Exception;
	   FBoard selectBoard(Integer num) throws Exception;
	   void updateBoard(FBoard board) throws Exception;
	   void updateBoardViewCount(Integer num);
	
}
