package egov.service.impl;

import java.util.ArrayList;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.service.MemberVO;

@Mapper("memberMapper")
public interface MemberMapper {

	String memberSelectUseridName(MemberVO vo);

	int memberInsert(MemberVO vo);

	int memberSelectUseridCnt(MemberVO vo);

	int memberSelectMobileCnt(MemberVO vo);

	int memberSelectSessionCheck(MemberVO vo);

	String searchIdResult(MemberVO vo);

	String searchPwResult(MemberVO vo);

	int passUpdate(MemberVO vo);

	int searchPassCheck(MemberVO vo);



}
