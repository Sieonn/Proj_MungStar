package dao;

import org.apache.ibatis.session.SqlSession;

import dto.Dog;
import util.MybatisSqlSessionFactory;

public class DogDAOImpl implements DogDAO{
	SqlSession sqlSession=MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	public void insertDog(Dog dog) throws Exception {
		sqlSession.insert("mapper.dog.insertDog",dog);
		sqlSession.commit();
	}

	public Dog selectDog(String memId) throws Exception {
		return sqlSession.selectOne("mapper.dog.selectDog",memId);
	}
	public void updateDog(Dog dog) throws Exception {
		sqlSession.update("mapper.dog.update", dog);
		sqlSession.commit();
	}
	public void deleteDog(Dog dog)throws Exception  {
		sqlSession.delete("mapper.dog.delete", dog);
		sqlSession.commit();
	}


}
