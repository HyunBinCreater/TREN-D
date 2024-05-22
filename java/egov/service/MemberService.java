package egov.service;

import java.util.Map;

public interface MemberService {

	String memberSelectUseridName(MemberVO vo) throws Exception;

	int memberInsert(MemberVO vo) throws Exception;

	int memberSelectUseridCnt(MemberVO vo) throws Exception;

	int memberSelectMobileCnt(MemberVO vo) throws Exception;

	int memberSelectSessionCheck(MemberVO vo) throws Exception;

	String searchIdResult(MemberVO vo) throws Exception;

	String searchPwResult(MemberVO vo) throws Exception;

	int passUpdate(MemberVO vo) throws Exception;

	int searchPassCheck(MemberVO vo) throws Exception;


}
