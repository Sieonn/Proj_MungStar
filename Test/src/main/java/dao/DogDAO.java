package dao;

import dto.Dog;

public interface DogDAO {

	void insertDog(Dog dog) throws Exception;
	Dog selectDog(String memId) throws Exception;
	void updateDog(Dog dog) throws Exception;
	void deleteDog(Dog dog)throws Exception;
}
