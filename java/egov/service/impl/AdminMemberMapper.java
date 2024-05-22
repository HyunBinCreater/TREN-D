package egov.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.service.MemberVO;


@Mapper("adminMemberMapper")
public interface AdminMemberMapper {

	int adminMemberInsert(MemberVO vo);

	List<?> adminMemberSelectList(MemberVO vo);  

	int adminMemberSelectCnt(MemberVO vo);

	int adminMemberInsert2(MemberVO vo);

	MemberVO MemberSelectDetail(MemberVO vo);

	int adminmemberUpdate(MemberVO vo);
	
	

	
	

}
