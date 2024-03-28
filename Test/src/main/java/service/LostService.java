package service;

import javax.servlet.http.HttpServletRequest;

import dto.Lost;

public interface LostService {
	void lostListByPage (HttpServletRequest request) throws Exception;
	Lost lostDetail(Integer lostNum) throws Exception;
}
