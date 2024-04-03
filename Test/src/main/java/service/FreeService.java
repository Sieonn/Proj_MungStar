package service;

import javax.servlet.http.HttpServletRequest;

import dto.FBoard;

public interface FreeService {
	void freeWrite(HttpServletRequest request) throws Exception;
	void freeListByPage(HttpServletRequest request) throws Exception;
	FBoard freeDetail(Integer num)throws Exception;
	void freeModify(HttpServletRequest request)throws Exception;
}
