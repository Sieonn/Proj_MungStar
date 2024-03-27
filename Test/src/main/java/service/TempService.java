package service;



import javax.servlet.http.HttpServletRequest;



public interface TempService {
	void tempListByPage (HttpServletRequest request) throws Exception;
}
