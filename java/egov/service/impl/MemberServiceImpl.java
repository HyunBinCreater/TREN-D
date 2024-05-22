package egov.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.service.MemberService;
import egov.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberMapper")
	MemberMapper memberMapper;
	
	@Override
	public String memberSelectUseridName(MemberVO vo) throws Exception {

		return memberMapper.memberSelectUseridName(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) throws Exception {
		
		return memberMapper.memberInsert(vo);
	}

	@Override
	public int memberSelectUseridCnt(MemberVO vo) throws Exception {
		
		return memberMapper.memberSelectUseridCnt(vo);
	}

	@Override
	public int memberSelectMobileCnt(MemberVO vo) throws Exception {
		
		return memberMapper.memberSelectMobileCnt(vo);
	}

	@Override
	public int memberSelectSessionCheck(MemberVO vo) throws Exception {
		
		return memberMapper.memberSelectSessionCheck(vo);
	}

	@Override
	public String searchIdResult(MemberVO vo) throws Exception {
	
		return memberMapper.searchIdResult(vo);
	}

	@Override
	public String searchPwResult(MemberVO vo) throws Exception {
	
		return memberMapper.searchPwResult(vo);
	}

	@Override
	public int passUpdate(MemberVO vo) throws Exception {
		
		return memberMapper.passUpdate(vo);
	}

	@Override
	public int searchPassCheck(MemberVO vo) throws Exception {
		
		return memberMapper.searchPassCheck(vo);
	}

}
