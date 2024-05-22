package egov.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import egov.service.AdminMemberService;
import egov.service.MemberVO;



@Controller
public class AdminController {
	
	@Resource(name="adminMemberService")
	AdminMemberService adminMemberService;

	@RequestMapping("/adminMain.do")
	public String adminMain(MemberVO vo,ModelMap model) throws Exception {
		
		
		
		
		List<?> memberselectlist = adminMemberService.adminMemberSelectList(vo);
		model.addAttribute("memberselectlist",memberselectlist);
			
		return"admin/main";
	}
	
	
	
	
	
	
	
	@RequestMapping("/adminOrder.do")
	public String adminorder() {
		
		return"admin/order";
	}
	
	
	
	
	
	
	
	
}
