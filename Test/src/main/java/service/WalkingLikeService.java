package service;

public interface WalkingLikeService {
	boolean walkingLike(String memId, Integer walkNum) throws Exception;
	boolean togleWalkingLike(String memId, Integer walkNum) throws Exception;
}
