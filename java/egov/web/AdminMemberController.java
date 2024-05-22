package egov.web;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egov.service.AdminMemberService;
import egov.service.BoardVO;
import egov.service.MemberVO;



@Controller
public class AdminMemberController {
	
	@Resource(name="adminMemberService")
	AdminMemberService adminMemberService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	
	@RequestMapping("adminMember.do")
	public String adminMember(MemberVO vo,ModelMap model) throws Exception {
		
		
		
		
		int memberSelectcnt = adminMemberService.adminMemberSelectCnt(vo); 
		
		int total = adminMemberService.adminMemberSelectCnt(vo);
		
		int pageIndex = vo.getPageIndex();	//출력페이지 번호 1
		// 화면당 데이터 출력개수   // context-properties.xml
		int pageUnit = propertiesService.getInt("pageUnit");
		// 화면당 페이징 출력개수
		int pageSize = propertiesService.getInt("pageSize");
		// 출력 페이지의 첫행 번호
		int number = total - (pageIndex-1)*pageUnit;

		int firstIndex = (pageIndex-1)*pageUnit +1;
		int lastIndex  = firstIndex + (pageUnit-1);
		
		/*페이징을 위한 설정*/
		int totalPage = (int)Math.ceil((double)total/pageUnit);
		
		int firstPno = (int)Math.floor((pageIndex-1)/pageUnit)*pageUnit+1;
		int lastPno  = firstPno + (pageSize-1);
		if(lastPno > totalPage) {lastPno = totalPage;}
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		List<?> memberselectlist = adminMemberService.adminMemberSelectList(vo);
		
		
		model.addAttribute("total", total);
		model.addAttribute("firstIndex", firstIndex);
		model.addAttribute("lastIndex", lastIndex);
		model.addAttribute("firstPno", firstPno);
		model.addAttribute("lastPno", lastPno);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("number", number);
		
		model.addAttribute("pageIndex", pageIndex);
		
		
		model.addAttribute("memberselectlist",memberselectlist);
		model.addAttribute("memberSelectcnt",memberSelectcnt);
		
	
		return"admin/member";
	}
	
	
	@RequestMapping("adminMemberWrite.do")
	public String adminMemberWrite() {
		
		return"admin/memberWrite";
	}
	
	@RequestMapping("adminMemberWriteSave.do")
	@ResponseBody
	public ModelAndView adminMemberWriteSave(MemberVO vo) throws Exception{
		
		
		
		ModelAndView mav = new ModelAndView("jsonView");
		String result = "0";
			
		int SaveCnt  = adminMemberService.adminMemberInsert(vo);
		int SaveCnt2 = adminMemberService.adminMemberInsert2(vo);
		if(SaveCnt == 0) { result = "1";
			
		}
		
		mav.addObject("result",result);	
		
		return mav;
	}
	
	@RequestMapping("adminMemberModify.do")
	public String adminMemberModify(MemberVO vo,ModelMap model) throws Exception{
		

		vo = adminMemberService.MemberSelectDetail(vo);
		
		model.addAttribute("vo", vo);
		
		
		
		return"admin/memberModify";
	}
	
	@RequestMapping("adminMemberModifySave.do")
	@ResponseBody
	public ModelAndView adminMemberModifySave(
								  MemberVO vo, 
								  ModelMap model) throws Exception {
		
		
		ModelAndView mav = new ModelAndView("jsonView");
		String result = "0";  // 성공

		int saveCnt = adminMemberService.adminmemberUpdate(vo);
		if( saveCnt == 0 ) result = "1";

		mav.addObject("result",result);
		
		return mav;
	}
	
	
	
	
	
	
	
	

}
