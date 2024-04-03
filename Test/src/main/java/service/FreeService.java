package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.fBoard;

public interface FreeService {
	void freeWrite(HttpServletRequest request) throws Exception;
	void freeListByPage(HttpServletRequest request) throws Exception;
	fBoard freeDetail(Integer num)throws Exception;
	void freeModify(HttpServletRequest request)throws Exception;
	List<fBoard> searchFreeListByPage(HttpServletRequest request, String query) throws Exception;
	List<fBoard> search(String query) throws Exception;
}
