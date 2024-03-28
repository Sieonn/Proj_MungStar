package service;

import javax.servlet.http.HttpServletRequest;

import dto.Temp;

public interface TempService {
	void tempListByPage (HttpServletRequest request) throws Exception;
	Temp tempDetail(Integer tempNum) throws Exception;
}
