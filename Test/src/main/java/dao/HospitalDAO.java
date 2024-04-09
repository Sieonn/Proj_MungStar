package dao;

import java.util.List;

import dto.Comment;
import dto.Hospital;

public interface HospitalDAO {
	List<Hospital> selectHospitalList() throws Exception;
	Hospital selectHospital(Integer hosNum) throws Exception;
	List<Comment> selectHosComment(Integer hosNum) throws Exception;
	
	void insertHosComment(Comment comment) throws Exception;
	
	String selectHosNick(String memId) throws Exception;
	
}
