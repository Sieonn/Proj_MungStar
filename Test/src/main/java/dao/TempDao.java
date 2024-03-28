package dao;

import java.util.List;

import dto.Temp;

public interface TempDao {
	List<Temp> selectTempList(Integer row) throws Exception;
	List<Temp> selectTempListWithTempCgory(Integer row, String tempCgory) throws Exception;
	Integer selectBoardCount() throws Exception;
	Integer selectBoardCountWithTempCgory(String tempCgory) throws Exception;
	Temp selectTemp(Integer tempNum) throws Exception;
}
