package dao;

public interface WalkingLikeDAO {
	void insertWalkingLike(String memId ,Integer walkNum) throws Exception;
	void deleteWalkingLike(String memId ,Integer walkNum) throws Exception;
	Integer selectWalkingLike(String memId ,Integer walkNum) throws Exception;
}
