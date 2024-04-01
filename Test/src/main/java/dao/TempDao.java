package dao;

import java.util.List;

import dto.Temp;

public interface TempDao {
	List<Temp> selectTempList(Integer row) throws Exception;
	List<Temp> selectTempListWithTempCgory(Integer row, String tempCgory) throws Exception;
	List<Temp> selectTempListWithCgoryAndSearch(Integer row, String tempCgory, String searchText) throws Exception;
	Integer selectBoardCount() throws Exception;
	Integer selectBoardCountWithTempCgory(String tempCgory) throws Exception;
	Integer selectTempCountWithCgoryAndSearch(String tempCgory, String searchText) throws Exception;
	Temp selectTemp(Integer tempNum) throws Exception;
	
	void insertTemp(Temp temp) throws Exception;
}
