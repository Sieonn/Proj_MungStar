package dao;

import java.util.List;

import dto.Lost;

public interface LostDao {
	List<Lost> selectLostList(Integer row) throws Exception;
	Integer selectBoardCount() throws Exception;
	Lost selectLost(Integer lostNum) throws Exception;
}
