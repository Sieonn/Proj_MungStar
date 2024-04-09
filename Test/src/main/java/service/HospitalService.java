package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Comment;
import dto.Hospital;

public interface HospitalService {
	 List<Hospital> allHospitalInfo() throws Exception;
	 Hospital hospitalDetail(Integer hosNum) throws Exception;
	 List<Comment> hosCommentList(Integer hosNum) throws Exception;
		String getHosNick(String memId) throws Exception;
		Comment addHosComment(HttpServletRequest request) throws Exception;
}
