package egov.service;

import java.util.List;

public interface AdminMemberService {

	int adminMemberInsert(MemberVO vo) throws Exception;

	List<?> adminMemberSelectList(MemberVO vo) throws Exception;

	int adminMemberSelectCnt(MemberVO vo) throws Exception;

	int adminMemberInsert2(MemberVO vo) throws Exception;

	MemberVO MemberSelectDetail(MemberVO vo) throws Exception;

	int adminmemberUpdate(MemberVO vo) throws Exception;

	
	

}
