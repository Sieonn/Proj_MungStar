package dao;

import dto.Member;

public interface MemberDAO {
	void insertMember(Member member) throws Exception;
	Member selectMember(String memId) throws Exception;
	Member selectMemberN(String memNick) throws Exception;
	String selectFindId(String memNick, String memPhone) throws Exception;
	String selectFindPw(String memId, String memEmail) throws Exception;
	void updatePw(String memId, String memPw) throws Exception;
}
