package dao;

import java.util.List;

import dto.Temp;

public interface TempDao {
	List<Temp> selectTempList(Integer row) throws Exception;
	Integer selectBoardCount() throws Exception;
}
