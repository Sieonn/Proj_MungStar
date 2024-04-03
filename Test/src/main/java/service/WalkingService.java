package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Walking;



public interface WalkingService {
	void walkWriteForm(HttpServletRequest request) throws Exception;
	 List<Walking> allWalkingInfo() throws Exception;
	 Walking walkingDetail(Integer walkNum) throws Exception;

}
