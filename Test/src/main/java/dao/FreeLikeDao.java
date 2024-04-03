package dao;

public interface FreeLikeDao {
	void insertBoardLike(String memberId ,Integer boardNum) throws Exception;
	void deleteBoardLike(String memberId ,Integer boardNum) throws Exception;
	Integer selectBoardLike(String memberId ,Integer boardNum) throws Exception;
}
