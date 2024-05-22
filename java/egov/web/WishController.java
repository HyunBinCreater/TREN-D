package egov.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egov.service.WishListVO;
import egov.service.WishService;
import egov.service.WishVO;

@Controller
public class WishController {
	
	@Resource(name="wishService")
	WishService wishService;
	
	@RequestMapping("/wishBrand.do")
	public String wishBrandList (WishVO vo,ModelMap model) throws Exception {
						
		List<?> brandList = wishService.wishBrandList(vo);
		
		model.addAttribute("brandList",brandList);		
			
		return "wish/wishBrand";
	}
	
	@RequestMapping("/wishList.do")
	public String wishList (WishListVO vo,ModelMap model) throws Exception {
						
		List<?> wishList = wishService.wishList(vo);
		
		model.addAttribute("wishList",wishList);		
			
		return "wish/wishList";
	}

	@RequestMapping("/wishBrandDelete.do")
	@ResponseBody
	public String wishBrandDelete(WishVO vo) throws Exception {
	    String message;
	    
	    int result = wishService.wishBrandDelete(vo);
	    if (result == 0) {
	        message = "fail";
	    } else {
	        message = "ok";
	    }
	    
	    return message;
	}
	
	@RequestMapping("/wishListDelete.do")
	@ResponseBody
	public String wishListDelete(WishListVO vo) throws Exception {
	    String message;
	    
	    int result = wishService.wishListDelete(vo);
	    if (result == 0) {
	        message = "fail";
	    } else {
	        message = "ok";
	    }
	    
	    return message;
	}
	
}
