package egov.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.AdminMemberService;
import egov.service.MemberVO;



@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Resource(name="adminMemberMapper")
	AdminMemberMapper adminMemberMapper;

	@Override
	public int adminMemberInsert(MemberVO vo) {  
		
		return adminMemberMapper.adminMemberInsert(vo);
	}

	@Override
	public List<?> adminMemberSelectList(MemberVO vo) {
		
		return adminMemberMapper.adminMemberSelectList(vo);
	}

	@Override
	public int adminMemberSelectCnt(MemberVO vo) throws Exception {
		
		return adminMemberMapper.adminMemberSelectCnt(vo);
	}

	@Override
	public int adminMemberInsert2(MemberVO vo) throws Exception {
		
		return adminMemberMapper.adminMemberInsert2(vo);
	}

	@Override
	public MemberVO MemberSelectDetail(MemberVO vo) throws Exception {
		
		return adminMemberMapper.MemberSelectDetail(vo);
	}

	@Override
	public int adminmemberUpdate(MemberVO vo) throws Exception {
		
		return adminMemberMapper.adminmemberUpdate(vo);
	}

	

	


}
