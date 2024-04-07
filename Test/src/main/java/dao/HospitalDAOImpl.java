package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Hospital;
import util.MybatisSqlSessionFactory;

public class HospitalDAOImpl implements HospitalDAO {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public List<Hospital> selectHospitalList() throws Exception{		
		return sqlSession.selectList("mapper.hospital.selectHospitalList");
		
		
		
	}
	@Override
	public Hospital selectHospital(Integer hosNum) throws Exception{
		return sqlSession.selectOne("mapper.hospital.selectHospital",hosNum);
	}
	
	
	
	
}
