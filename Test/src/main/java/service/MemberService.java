package service;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {
	void login(HttpServletRequest request) throws Exception;
	void signup(HttpServletRequest request) throws Exception;
	boolean memberIdCheck(String memId) throws Exception;
	boolean memberNickCheck(String memNick) throws Exception;
}
