package service;

import java.util.List;

import dto.Hospital;

public interface HospitalService {
	 List<Hospital> allHospitalInfo() throws Exception;
	 Hospital hospitalDetail(Integer hosNum) throws Exception;

}
