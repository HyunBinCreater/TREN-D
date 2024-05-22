package egov.web;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egov.service.SampleDefaultVO;
import egov.service.UserService;
import egov.service.UserVO;

@Controller
public class MypageController {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "userService")
	UserService userService;
	
	@RequestMapping("/order.do")
	public String order(UserVO vo,ModelMap model) throws Exception {
	
		vo = userService.userSelectDetail(vo);
		UserVO vo2 = userService.userSelect2Detail(vo);	
		
		model.addAttribute("vo",vo);
		model.addAttribute("vo2",vo2);
		
		return "mypage/order";
	}
	
	@RequestMapping("/user.do")
	public String user (UserVO vo,ModelMap model) throws Exception {
		
		vo = userService.userSelectDetail(vo);
		UserVO vo2 = userService.userSelect2Detail(vo);		
		
		model.addAttribute("vo",vo);
		model.addAttribute("vo2",vo2);
	
		return "mypage/user";
	}
	
	@RequestMapping("/userSizeModifySave.do")
	@ResponseBody
	public ModelAndView userSizeModifySave(UserVO vo,
											ModelMap model) throws Exception {
		
	ModelAndView mav = new ModelAndView("jsonView");
	String result = "0"; // 성공
	     
	    int sizeSaveCnt = userService.userSizeUpdate(vo);
	    if (sizeSaveCnt == 0) result = "1";	    		     
		mav.addObject("result",result);
		
		return mav;
	}
	
	@RequestMapping("/userModifySave.do")
	@ResponseBody
	public ModelAndView userModifySave (UserVO vo,
										ModelMap model) throws Exception {
		
	ModelAndView mav = new ModelAndView("jsonView");
	String result = "0"; // 성공
	     	
	    int saveCnt = userService.userUpdate(vo);
	    if (saveCnt == 0) result = "1";	    		     
		mav.addObject("result",result);
	
		return mav;
	}
	
	@RequestMapping("/userPassModifySave.do")
	@ResponseBody
	public ModelAndView userPassModifySave (
										    UserVO vo,
										    ModelMap model) throws Exception {
		
	    ModelAndView mav = new ModelAndView("jsonView");

	    String result = "ok";
	    String newpw1 = vo.getNewPw1();
	    String newpw2 = vo.getNewPw2(); 

	    // 현재 암호의 일치 여부 확인
	    int passCnt = userService.userSelectpassCnt(vo);       
	    if (passCnt != 1) {
	        result = "pass1";   // 현재 암호 불일치
	    } else {       
	    
	    // 새로운 비밀번호의 패턴 검증
	    String pattern = "[0-9a-zA-Z_-|#$%*!~@%]{8,20}";
	    boolean passResult = newpw1.matches(pattern);
	    if (!passResult) {
	        result = "pass2";   // 암호 패턴 X
	    } else {
	    
	    vo.setPass(newpw2);
	    
	    // 새로운 비밀번호 저장
	    int passUpdateCnt = userService.userPassModifySave(vo);
	    if (passUpdateCnt == 0) {
	        result = "pass3";   // 새 암호 불일치
	    	}
	    	}
	    }
	    mav.addObject("result", result);
	    
	    return mav;
	}
	
	@RequestMapping("/addInfoModifySave.do")
	@ResponseBody
	public ModelAndView addInfoModifySave (UserVO vo,
											ModelMap model) throws Exception {
		
	ModelAndView mav = new ModelAndView("jsonView");
	String result = "0"; // 성공
	     	
	    int saveCnt = userService.addInfoUpdate(vo);
	    if (saveCnt == 0) result = "1";	    		     
		mav.addObject("result",result);
	
		return mav;
	}
}


