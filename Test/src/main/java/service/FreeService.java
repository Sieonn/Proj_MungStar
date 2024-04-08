package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Comment;
import dto.FBoard;

public interface FreeService {
	Integer freeWrite(HttpServletRequest request) throws Exception;
	void freeListByPage(HttpServletRequest request) throws Exception;
	FBoard freeDetail(Integer num) throws Exception;
	Integer freeModify(HttpServletRequest request) throws Exception;
	boolean deleteBoard(HttpServletRequest request) throws Exception;
	List<Comment> freeCommentList(Integer freeNum) throws Exception;
	String getFreeNick(String memId) throws Exception;
	Comment addFreeComment(HttpServletRequest request) throws Exception;
}
