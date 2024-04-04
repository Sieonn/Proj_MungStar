package service;

import javax.servlet.http.HttpServletRequest;

import dto.Lost;

public interface LostService {
	void lostListByPage (HttpServletRequest request) throws Exception;
	Lost lostDetail(Integer lostNum) throws Exception;
	void lostWrite(HttpServletRequest request) throws Exception;
	void lostModify(HttpServletRequest request) throws Exception;
	void lostDelete(Integer lostNum) throws Exception;
}
