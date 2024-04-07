package dao;

import java.util.List;

import dto.Hospital;

public interface HospitalDAO {
	List<Hospital> selectHospitalList() throws Exception;
	Hospital selectHospital(Integer hosNum) throws Exception;
}
