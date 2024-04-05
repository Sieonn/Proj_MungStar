package service;

import javax.servlet.http.HttpServletRequest;

import dto.FBoard;

public interface FreeService {
	Integer freeWrite(HttpServletRequest request) throws Exception;
	void freeListByPage(HttpServletRequest request) throws Exception;
	FBoard freeDetail(Integer num)throws Exception;
	Integer freeModify(HttpServletRequest request)throws Exception;
}
