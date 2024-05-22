package egov.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egov.service.AdminMemberService;
import egov.service.KakaoService;
import egov.service.MemberService;
import egov.service.MemberVO;

@Controller
public class MemberController {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="memberService")
	MemberService memberService;
	
	@Resource(name="kakaoService")
	KakaoService kakaoService;
	
	@Resource(name="adminMemberService")
	AdminMemberService adminMemberService;
	

	@RequestMapping("/login.do")
	public String login() {
				
		return "member/login";
	}
	
	public boolean sessionConfirm(MemberVO vo, HttpSession session) 
			throws Exception {
	
		boolean result  = true;
	
		String userid = (String) session.getAttribute("LoginID");
		String name   = (String) session.getAttribute("LoginNM");
	
		if( userid == null || name == null ) {
			result = false;
		} else {
			vo.setUserid(userid);
			vo.setName(name);
			int cnt = memberService.memberSelectSessionCheck(vo);
			if( cnt == 0 ) result = false;
		}
	
		return result;
	}
		
	// useridCheck.do
	@RequestMapping("/useridCheck.do") 
	@ResponseBody
	public String useridCheck(MemberVO vo) throws Exception {
		String msg = "0"; // 사용가능
		// 아이디 (6~12, 영문+숫자+(_-) 조합, 첫글자는 영문)
		String  pattern = "^[a-zA-Z]{1}[a-zA-Z0-9_-]{5,11}";
		boolean result  = vo.getUserid().matches(pattern);	
		if( !result ) {
			msg = "1";
		} else {	
			int userid_cnt = memberService.memberSelectUseridCnt(vo);	
			if( userid_cnt > 0 ) {
				msg = "2";
			}
		}
		return msg;
	}
	
	@RequestMapping("/loginWrite.do")
	public String loginWrite() {
	
		return "member/login";
	}
	
	@RequestMapping("/loginSession.do")
	@ResponseBody
	public String loginSession(MemberVO vo, HttpSession session) 
			throws Exception{

		// ID/PW 인증 후 로그인 처리
		// 결과값 0:OK, 1:일치정보없음
		String returnValue = "0";
		String userid   = vo.getUserid();
		String username = memberService.memberSelectUseridName(vo);

		if(username == null) {
			returnValue = "1";
		} else {
			session.setAttribute("LoginID", userid);
			session.setAttribute("LoginNM", username);
			// 세션 유지시간 (초단위)
			session.setMaxInactiveInterval(60*60);
		}

		return returnValue;
	}
	
	@RequestMapping("/userSearch.do")
	public String searchId() throws Exception {
		
		return "member/userSearch";
	}
	@RequestMapping("/searchIdResult.do")
	@ResponseBody
	public String searchIdResult(MemberVO vo) throws Exception {
				
		String result;
		
		String searchUserid = memberService.searchIdResult(vo);
		
		if(searchUserid == null) {
			result = "1";
		} else {		
			result = searchUserid;
		}
		return result;
	}
	@RequestMapping("/searchPwResult.do")
	@ResponseBody
	public String searchPwResult(MemberVO vo,ModelMap model) throws Exception {
						
		String result ="0";

		String searchPass = memberService.searchPwResult(vo);
		
		if(searchPass == null || searchPass.equals("") ) {
			result ="1";		
		} else {
			model.addAttribute("userid",searchPass);			
		}
		
		return result;
	}
	@RequestMapping("/searchPwResultSave.do")
	@ResponseBody
	public String searchPwResultSave(MemberVO vo) throws Exception {
						
		String result ="0";
		
		int passCnt = memberService.passUpdate(vo);
		
		if(passCnt == 0) {
			result ="1";
			
		} 
		
		
		return result;
	}
	
	@RequestMapping("/memberAgree.do")
	public String memberAgree() {
		
		return "member/memberAgree";
	}
	
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		
		return "member/memberWrite";
	}
	
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public ModelAndView memberInsert(MemberVO vo) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		String result ="0"; // 성공
		
		// 아이디 (6~12, 영문+숫자+(_-) 조합, 첫글자는 영문)
		String pattern = "^[a-zA-Z]{1}[a-zA-Z0-9_-]{5,11}";
		String pattern1 = "[0-9a-zA-Z_-|#$%*]{4,20}";
		String pattern2 = "(010|011)[0-9]{8}";
	    int userid_cnt = memberService.memberSelectUseridCnt(vo);
	    if( userid_cnt > 0 ) {
	    	result = "2";
	    	boolean userPattern  = vo.getUserid().matches(pattern);
	    	if( !userPattern ) result = "3";    		
	    	
	    	userPattern  =  vo.getPass().matches(pattern1);
	    	if( !userPattern) result = "4";
	    	
	    	userPattern = vo.getMobile().matches(pattern2);
	    	if( !userPattern ) result = "5";
	    	int mobile_cnt = memberService.memberSelectMobileCnt(vo);
			if( mobile_cnt > 0 ) result = "6";
	    
	    } else {	    
		    int saveCnt = memberService.memberInsert(vo);
		    int saveCnt2 = adminMemberService.adminMemberInsert2(vo);
		    
		    if( saveCnt == 0 ) result ="1";
	    }
	    
	    mav.addObject("result",result);
		
		
		return mav;
	}
	
	@RequestMapping("/index.do")
	public String main(ModelMap model) {
		
		model.addAttribute("topmenu","index");
		
		return "index";
	}

	@RequestMapping("/logout.do")
	@ResponseBody
	public String logout(HttpServletRequest request,HttpSession session) {
	

		session.invalidate();
		
		return "ok";
	}
	
	
}
