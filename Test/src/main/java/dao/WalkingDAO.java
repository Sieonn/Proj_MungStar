package dao;

import java.util.List;

import dto.File;
import dto.Walking;

public interface WalkingDAO {
	void insertWalking(Walking walk) throws Exception;
	List<Walking> selectWalkingList() throws Exception;
	Walking selectWalking(Integer walkNum) throws Exception;
	void insertFile(File file) throws Exception;
}
