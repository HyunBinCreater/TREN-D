package egov.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.service.AdminProductService;
import egov.service.CategoryService;
import egov.service.CategoryVO;


@Controller
public class AdminProductController {
	
	@Resource(name="adminProductService")
	AdminProductService adminProductService;
	
	@Resource(name="categoryService")
	CategoryService categoryService;
	
	
	
	
	@RequestMapping("/adminProduct.do")
	public String adminProduct() {
		
		return"admin/product";
	}
	
	@RequestMapping("/adminProductreg.do")
	public String adminProductreg(CategoryVO vo,ModelMap model) throws Exception {
		
		
		List<?> categoryList1 = categoryService.CategoryList1(vo);
		model.addAttribute("CategoryList1",categoryList1);
		List<?> categoryList2 = categoryService.CategoryList2(vo);
		model.addAttribute("CategoryList2",categoryList2);
		List<?> categoryList3 = categoryService.CategoryList3(vo);
		model.addAttribute("CategoryList3",categoryList3);
		
		
		
		return"admin/productreg";
	}
	
	
	

}
