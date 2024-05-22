package egov.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import egov.service.CartService;
import egov.service.CartVO;

@Controller
public class CartController {
	
	@Resource(name="cartService")
	CartService cartService;
	
	@RequestMapping("/cart.do")
	public String cartList (CartVO vo,ModelMap model) throws Exception {
		
		List<?> cartList = cartService.cartSelectList(vo);
		
		model.addAttribute("cartList",cartList);
		
		return "cart/cart";
	}
	
	@RequestMapping("/cartAmountUpdate.do")
	@ResponseBody
	public ModelAndView cartAmountUpdate (CartVO vo) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		String result = "0"; // 성공

	
		System.out.println("1111"+vo.getProunq());
		System.out.println("2222"+vo.getUsedprounq());

		    int saveItemAmount = cartService.cartItemAmountUpdate(vo);
	
		    if (saveItemAmount == 0) {
		    	result = "1";

		    } else {
		    	cartService.cartAmountUpdate(vo);

		    }
			mav.addObject("result",result);

			return mav;
		}
	
		@RequestMapping("/cartItemDelete.do")
		@ResponseBody
		public ModelAndView cartItemDelete(CartVO vo,
											ModelMap model) throws Exception {
			
		ModelAndView mav = new ModelAndView("jsonView");
		String result = "0"; // 성공
		     
		    int DeleteCnt = cartService.cartItemDelete(vo);
		    if (DeleteCnt == 0) result = "1";	    		     
			mav.addObject("result",result);
			
			return mav;
		}

}
