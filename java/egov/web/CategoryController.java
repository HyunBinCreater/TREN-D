package egov.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egov.service.CategoryService;
import egov.service.CategoryVO;



@Controller 
public class CategoryController {
	
	@Resource(name="categoryService")
	CategoryService categoryService;
	
	
	
	@RequestMapping("adminCategory.do")
	public String admincategory(CategoryVO vo, ModelMap model) throws Exception{
		
	
		List<?> categoryList1 = categoryService.CategoryList1(vo);
		model.addAttribute("CategoryList1",categoryList1);
		List<?> categoryList2 = categoryService.CategoryList2(vo);
		model.addAttribute("CategoryList2",categoryList2);
		List<?> categoryList3 = categoryService.CategoryList3(vo);
		model.addAttribute("CategoryList3",categoryList3);
		
		return"admin/category";
	}
	
	
	
	@RequestMapping("categorySave.do")
	@ResponseBody
	public ModelAndView categorySave(CategoryVO vo) throws Exception{
		
		
		
		ModelAndView mav = new ModelAndView("jsonView");
		String result = "0";
			
		int SaveCnt = categoryService.CategoryInsert(vo);
		
		
		mav.addObject("result",result);	
		
		return mav;
	}
	
	
	

}
