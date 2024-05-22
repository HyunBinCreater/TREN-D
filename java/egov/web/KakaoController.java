package egov.web;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egov.service.KakaoService;

@Controller
public class KakaoController {

	@Autowired
	private KakaoService kakaoService ;	
    
    @RequestMapping(value = "/kakaologin.do")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, ModelMap model) throws Exception {
		
		String access_token = kakaoService.getToken(code);//code로 토큰 받음
		System.out.println("access_token : " + access_token);
		
		//토큰으로 사용자 정보 담은 list 가져오기
		ArrayList<Object> list = kakaoService.getUserInfo(access_token);
				
				//list 모델에 담아 view로 넘김
		model.addAttribute("list", list);
		
	
	return "index";
    }
    
    
}
