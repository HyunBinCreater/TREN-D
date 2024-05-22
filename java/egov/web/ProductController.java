package egov.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egov.service.BoardService;
import egov.service.BoardVO;
import egov.service.ProductService;
import egov.service.ProductVO;
import egov.service.Used_productVO;
import egov.service.searchVO;

@Controller
public class ProductController {
	
	@Resource(name="productService")
	ProductService productService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	//--------------------------------------------------------------------------

	   //검색 수정 필요!!
	    
	    @RequestMapping("/search.do")
	    public String search_window(ProductVO vo, Used_productVO vo1,  searchVO svo,  ModelMap model) throws Exception {
	    	//새제품
	    	int newtotal = productService.searchSelectTotal(vo);
	    	
	    	System.out.println(newtotal);
	    	
	    	int pageIndex = vo.getPageIndex();
	    	int pageUnit = propertiesService.getInt("pageUnit");
	    	int pageSize = propertiesService.getInt("pageSize");
	    	svo = commList(pageUnit, pageSize, pageIndex, newtotal, svo);
	    	List<?> list = productService.searchSelectList(svo);
	    	
	    	
		    
		    model.addAttribute("searchKeyword", svo.getSearchKeyword());
	    	model.addAttribute("newtotal", newtotal);
	    	model.addAttribute("list", list);
	    	
	    	
	    	// 페이징 관련 설정
	    	model.addAttribute("svo", svo);
	    	//중고상품 페이지 관련 설정
		   
		    
	        return "board/search";
	    }
	    @RequestMapping("/usedsearch.do")
	    public String usedsearch_window(ProductVO vo, Used_productVO vo1, searchVO svo,  ModelMap model) throws Exception {
	    	
	    	int pageIndex = vo.getPageIndex();
	    	int pageUnit = propertiesService.getInt("pageUnit");
	    	int pageSize = propertiesService.getInt("pageSize");
	    	
	    	//중고제품
	    	int usedtotal = productService.usedsearchSelectTotal(vo1);

	    	svo = commList(pageUnit, pageSize, pageIndex, usedtotal, svo);
	    	int usedpageIndex = vo1.getUsedpageIndex();
	    	

		    List<?> list1 = productService.usedsearchSelectList(svo);
		    
		    model.addAttribute("searchKeyword", svo.getSearchKeyword());
	    	model.addAttribute("usedtotal", usedtotal);
	    
	    	model.addAttribute("list1", list1);
	    	
	    	// 페이징 관련 설정
	    	model.addAttribute("svo", svo);
	    	//중고상품 페이지 관련 설정
		   
		    
	        return "board/usedsearch";
	    }

	  

	  //상단의 공통 내용 보관 메소드
		public static searchVO  commList(int pageUnit
												, int pageSize
												, int pageIndex
												, int total
												, searchVO svo
												) {
			
							
			//출력페이지의 시작번호
			int recordCountPerPage = total-(pageIndex-1)*pageUnit;
			System.out.println("recordCountPerPage::"+recordCountPerPage);
			//sql적용할 시작번호 및 마지막 번호
			int firstIndex = (pageIndex-1)*pageUnit + 1;
			int lastIndex = firstIndex + (pageUnit -1);
			
			//출력페이지의 페이징 시작(1), 끝번호(10)
			int pageStartNo = (int)Math.floor((double)(pageIndex-1)/pageSize)*pageSize+1;
			System.out.println("pageStartNo::"+pageStartNo);
			
			int pageLastNo= pageStartNo+(pageSize-1);
			
			//전체 페이지 수(=마지막 페이지 번호 동일)
			int totalPageCnt = (int)Math.ceil((double)total/pageUnit);
			// 하단 출력 페이지 갯수(10)가 원래 페이지 갯수(2) 보다 많을 경우 원래 페이지 겟수만 표출한다. 
			if(totalPageCnt < pageLastNo ) pageLastNo = totalPageCnt;
			
			System.out.println(pageLastNo);
			//변수를 vo에 저장
			svo.setRecordCountPerPage(recordCountPerPage);
			svo.setFirstIndex(firstIndex);
			svo.setLastIndex(lastIndex);
			svo.setPageLastNo(pageLastNo);
			svo.setPageStartNo(pageStartNo);
			svo.setTotalPageCnt(totalPageCnt);
			
			return svo;		
			
			}

	    
}
