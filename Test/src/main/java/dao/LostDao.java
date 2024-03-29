package dao;

import java.util.List;

import dto.Lost;

public interface LostDao {
	List<Lost> selectLostList(Integer row) throws Exception;
	List<Lost> selectLostListWithCgoryAndSearch(Integer row, String lostCgory, String searchText) throws Exception;
	Integer selectBoardCount() throws Exception;
	Integer selectLostCountWithCgoryAndSearch(String lostCgory, String searchText) throws Exception;
	Lost selectLost(Integer lostNum) throws Exception;
}
