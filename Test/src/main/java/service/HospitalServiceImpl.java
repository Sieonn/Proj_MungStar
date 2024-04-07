package service;

import java.util.List;

import dao.HospitalDAO;
import dao.HospitalDAOImpl;
import dto.Hospital;

public class HospitalServiceImpl implements HospitalService {
	private HospitalDAO hosDAO = new HospitalDAOImpl();
	
	
	public List<Hospital> allHospitalInfo() throws Exception{
	List<Hospital> hospitalList = hosDAO.selectHospitalList();
	return hospitalList;
	
		
		
	
	}

	public Hospital hospitalDetail(Integer hosNum) throws Exception{
		return hosDAO.selectHospital(hosNum);
	}


}
