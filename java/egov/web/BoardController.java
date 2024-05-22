package egov.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egov.service.AnswerVO;
import egov.service.BoardService;
import egov.service.BoardVO;
import egov.service.FaqVO;
import egov.service.NoticeVO;
import egov.service.ProductService;
import egov.service.ProductVO;
import egov.service.ReviewVO;
import egov.service.searchVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	BoardService boardService;
	
	@Resource(name="productService")
	ProductService productService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	//--------------------------------------------------------------------------

	@RequestMapping("/noticeList.do")
	public String noticeboardList(NoticeVO vo, ModelMap model)throws Exception {
		
		int total = boardService.noticeSelectTotal(vo);
		
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
		List<?> list = boardService.noticeSelectList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("firstIndex", firstIndex);
		model.addAttribute("lastIndex", lastIndex);
		model.addAttribute("firstPno", firstPno);
		model.addAttribute("lastPno", lastPno);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("number", number);
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("searchCondition", vo.getSearchCondition());
		return "board/noticeList";
	}
	
	@RequestMapping("/faqList.do")
	public String faqboardList(FaqVO vo, ModelMap model)throws Exception {
		
		
		if(vo.getFaq_page_no()==null || vo.getFaq_page_no() == "") {
			vo.setFaq_page_no("0");
		}
		
		
		int total = boardService.faqSelectTotal(vo);
		
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
		List<?> list = boardService.faqSelectList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("firstIndex", firstIndex);
		model.addAttribute("lastIndex", lastIndex);
		model.addAttribute("firstPno", firstPno);
		model.addAttribute("lastPno", lastPno);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("number", number);
		model.addAttribute("tap", vo.getFaq_page_no());
		model.addAttribute("pageIndex", pageIndex);
		return "board/faqList";
	}
	
	
	//상세페이지
	@RequestMapping("/goodsDetail.do")
	public String goodsDetail(BoardVO vo, ModelMap model) throws Exception {
		
		model.addAttribute("topmenu","goodsDetail");
		
		return "board/goodsDetail";
	}


//answer
	
	@RequestMapping("/answerList.do")
	public String answerList(AnswerVO vo, ModelMap model, searchVO svo) throws Exception {
	    // 페이징 관련 변수 설정
	    int pageIndex = setPageIndex(svo);
	    int pageUnit = propertiesService.getInt("pageUnit");
	    int pageSize = propertiesService.getInt("pageSize");
	    int total = boardService.answerSelectTotal(svo);
	    svo = commList(pageUnit, pageSize, pageIndex, total, svo);

	    // Answer board 정보 설정
	    List<?> list = boardService.answerSelectList(svo);
	    model.addAttribute("list", list);
	    model.addAttribute("total", total);
	    model.addAttribute("ansnumber", svo.getRecordCountPerPage());
	    model.addAttribute("pageIndex", pageIndex);
	    // 페이징 관련 설정
	    model.addAttribute("svo", svo);
	   
	    return "board/answerboard";
	}
	
	
	@RequestMapping("/answerWriteSave.do")
	@ResponseBody
	public ModelAndView  answerInsert(AnswerVO vo) throws Exception {
		  ModelAndView mav = new ModelAndView("jsonView");
		  String result = "0";
		  
		  int cnt = boardService.answerInsert(vo);
		  if(cnt == 0) {
			  result = "1";
		  }
		mav.addObject("result", result);
		return mav;
	}
	
	
	@RequestMapping("/answerModify.do")
	public String  answerModify(AnswerVO vo, ProductVO provo,ModelMap model) throws Exception {
		String prounq = vo.getProunq();
		//제품 정보 받아와야함!!!!!
		prounq = "1";
		
		provo = productService.productSelectLsit(prounq); 
		vo = boardService.answerSelectModify(vo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("provo", provo);
		return "board/answerModify";
	}
	
	
	@RequestMapping("/answerModifySave.do")
	@ResponseBody
	public ModelAndView  answerModifySave(AnswerVO vo, ModelMap model) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		String result = "0";
		
		int saveCnt = boardService.answerUpdate(vo);
		if(saveCnt == 0) result = "1";
		
		mav.addObject("result", result);
		return mav;
	}
	
	@RequestMapping("/answerDelete.do")
	@ResponseBody
	public ModelAndView answerDelete(AnswerVO vo, ModelMap model) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		String result = "0";
		
		int delCnt = boardService.answerDelete(vo);
		if(delCnt==0)result = "1";
		
		mav.addObject("result", result);
		
		
		return mav;
	}
	
	
	
//review
	
	@RequestMapping("/reviewList.do")
	public String reviewList(ReviewVO vo, ModelMap model,searchVO svo) throws Exception {
	  
		// 페이징 관련 변수 설정
	    int pageIndex = setPageIndex(svo);
	    int pageUnit = 5;// propertiesService.getInt("pageUnit") -> 출력범위가 커서 5개로 줄임
	    int pageSize = propertiesService.getInt("pageSize");
	    int total = boardService.reviewSelectTotal();
	    svo = commList(pageUnit, pageSize, pageIndex, total, svo);
	   
	    System.out.println(total);
	    // Review board 정보 설정
	    
	    List<?> list = boardService.reviewSelect(svo);
	    model.addAttribute("list", list);
	    model.addAttribute("retotal", total);
	    model.addAttribute("number", svo.getRecordCountPerPage());
	    model.addAttribute("pageIndex", pageIndex);
	   
	    
	    // 파일명 관련 설정
	    String filename = vo.getRevfilename();
	    if (filename == null) {
	        vo.setRevfilename("");
	    }
	    String img_h = getImageHeight(filename);
	   
	    // 모델에 추가
	    
	    model.addAttribute("img_h", img_h);

	    // 페이징 관련 설정
	    model.addAttribute("svo", svo);
	    
	    //별점 평균
	    double avg = boardService.revSelectAvg();
	    
	    model.addAttribute("avg", avg);
	    return "board/reboardList";
	}
	
	//VO 나누면서 기능 깨짐 (수정ok)
	@RequestMapping("/reviewDetail.do")
	@ResponseBody
	public ModelAndView reviewDetail(@RequestParam("revnum") int revnum, ReviewVO vo, ModelMap model) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		ReviewVO vo1 = boardService.reviewSelectDetailrevnum(revnum);
	    String result = "0";
	   
	    // 파일명 관련 설정
	    String filename = vo1.getRevfilename();
	    if (filename == null) {
	        vo1.setRevfilename("");
	        
	    }
	   
	    String img_h = getImageHeight(filename);
	    String revcont = vo1.getRevcont().replace("\n", "<br>");
	    vo1.setRevcont(revcont);
	    // 모델에 추가
	    mav.addObject("vo1", vo1);
	    mav.addObject("img_h", img_h);
	    mav.addObject("result", result);
	    System.out.println("ok");
	    return mav;
	}
	
	@RequestMapping("/reviewWrite.do")
	public String reviewWrite(BoardVO vo, ModelMap model)throws Exception {
		
		model.addAttribute("userid", "test1");
		return "board/reboardWrite";
	}
	
	
	@RequestMapping("/reviewWriteSave.do")
	@ResponseBody
	public ModelAndView reviewWriteSave(ReviewVO vo, 
										MultipartHttpServletRequest multiRequest, 
										ModelMap model) throws Exception {
		System.out.println("aaa");
		
		
		ModelAndView mav = new ModelAndView("jsonView");
		String result = "0";
		
		
		String path = propertiesService.getString("filePath1");
		//C:/eGovFrameDev-4.2.0-64bit/workspace/TRENDPROJECT/src/main/webapp/review_upload
		// 올라온 파일을 Map 담는 작업
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		// Map 형식으로 저장된 파일을 Iterator 클래스 형식으로 정보화 하는 작업
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		
		String str = "";
		Calendar cal = Calendar.getInstance();
		int cnt = 1;
		
		// 파일의 존재 유무
		while( itr.hasNext() ) {
			// 특정 파일 위치로 포인터를 옮기는 작업
			Entry<String, MultipartFile> entry = itr.next();
			// 포인터의 위치에서 파일의 모든 정보를 가져온다.
			MultipartFile file = entry.getValue();
			// 파일의 정보들 중 파일의 원래 이름을 얻어온다.
			String orgname = file.getOriginalFilename();
			
			if( orgname == null || orgname.equals("") ) {
				//break;  // 즉시종료
				continue; // 중단 후 다시 실행
			}
			String[] ext1 = orgname.split("\\.");
			String   ext2 = ext1[ext1.length-1];
			
			cal = Calendar.getInstance();
			String uxt = cal.getTimeInMillis()+"";
			uxt = uxt.substring(uxt.length()-7);
			uxt += cnt;
			
			// 실제 저장 위치에 파일명을 연결하여 전체 경로를 완성한다.
			String filename = uxt+"."+ext2; 
			String filePath = path + "/" + filename;
			// 서버의 공유(폴더) 공간에 있는 파일을 지정된 경로로 복사한다.

			file.transferTo(new File(filePath));  // COPY 매소드(원본->복사)
			str += filename+"／";
			cnt++;
		}
		//  nata.jpg／aa.jpg／
		vo.setRevfilename(str);
		
		System.out.println(vo.getRevfilename());
		
		int insertCnt = boardService.reviewInsert(vo);
		if(insertCnt==0) result ="1";
		
		
		mav.addObject("result", result);
		
		return mav;
	}
	
	
	
	@RequestMapping("/reviewModify.do")
	public String reviewModify(ReviewVO vo, ProductVO provo,ModelMap model) throws Exception {
		
		String prounq = vo.getProunq();
		//제품 정보 받아와야함!!!!!
		prounq = "1";
		
		provo = productService.productSelectLsit(prounq);
		
		String img_h = "";
		vo = boardService.reviewSelectDetail(vo);
		
		String filename = vo.getRevfilename();		
		if( filename == null ) {
			vo.setRevfilename("");
		}
		if( filename != null && !filename.equals("")) {
			String[] files = filename.split("／");
			String path = propertiesService.getString("filePath1");
			
			for(int i=0; i<files.length; i++) {
				File file = new File(path+"/"+files[i]);
				int hh = 0;
				if( file.exists() ) {
					BufferedImage img = ImageIO.read(file);	
					int width = img.getWidth();
					int height = img.getHeight();
					hh = (height*100)/width;
					img_h += hh+"／";
				}
			}
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("img_h", img_h);
		model.addAttribute("provo", provo);

		return "board/reboardModify";
	}
	
	@RequestMapping("/reviewFileDelete.do")
	@ResponseBody
	public ModelAndView uploadFileDelete(ReviewVO vo) throws Exception {
		
		System.out.println("=== uploadFileDelete ===");
		
		ModelAndView mav = new ModelAndView("jsonView");
		String path = propertiesService.getString("filePath1");
		String result = "0";
		
		int unq = vo.getRevnum();
		String filename = vo.getRevfilename();
		
		System.out.println("unq :::::::: " + unq);
		System.out.println("filename :::::::: " + filename);
		
		// 파일삭제
		String filePath = path + "/" + filename;
		File file = new File(filePath);
		if( file.exists() ) {
			file.delete();
		}

		// DB의 데이터 변경
		int updateCnt = boardService.reviewUpdateFilename(vo);
		if( updateCnt == 0 ) result = "1";
		
		mav.addObject("result", result);
		
		return mav;
	}
	
	@RequestMapping("/reviewModifySave.do")
	@ResponseBody
	public ModelAndView reivewModifySave(
								  MultipartHttpServletRequest multiRequest, 
								  ReviewVO vo, 
								  ModelMap model) throws Exception {
		
		// 저장 성공 번호
		String result = "0";
		// 반복분 횟수를 저장하는 변수
		int    filecnt = 0; 
		// 수정 처리 되는 파일명이 저장되는 초기 변수
		// UPDATE SQL의  filename="값"을 설정하는 변수
		String modifyFile = "";  // a1.jpg／b1.jpg／
		
		// JSON 타입으로의 리턴 값을 위한 객체 선언
		ModelAndView mav = new ModelAndView("jsonView");
		
		// 파일 저장 위치 (절대경로)
		String path = propertiesService.getString("filePath1");
		
		// 올라온 파일을 Map 담는 작업
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		// Map 형식으로 저장된 파일을 Iterator 클래스 형식으로 정보화 하는 작업
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();

		// 수정처리를 위해 저장된 파일명을 가져온다. 
		ReviewVO vo1 = boardService.reviewSelectDetail(vo);
	
		String dbfile = vo1.getRevfilename();

		if(dbfile == null) dbfile = "";
		String[] dbfileArray = dbfile.split("／");

		// 파일의 존재 유무
		while( itr.hasNext() ) {

			System.out.println("-- while --");
			filecnt++;
			if(filecnt == 5) break;
			
			// 특정 파일 위치로 포인터를 옮기는 작업
			Entry<String, MultipartFile> entry = itr.next();
			
			// 포인터의 위치에서 파일의 모든 정보를 가져온다.
			MultipartFile file = entry.getValue();
				
			String orgname = "";
			try {
				// 파일의 정보들 중 파일의 원래 이름을 얻어온다. 예) a1.jpg
				orgname = file.getOriginalFilename();
				// 파일이 안올라왔을 경우의 세팅
				if( orgname == null || orgname.equals("")) {
					if(dbfileArray[filecnt-1].length() > 0) {
						// 올라온 파일이 없는 경우 DB에 있던 파일명을 도로 세팅한다.
						modifyFile += dbfileArray[filecnt-1]+"／";
					}
					continue; // STOP AND RETRY
				}			
			} catch (Exception e) { continue; } 
			
			/*
			 * 아래 설정은 파일이 올라왔을 경우의 설정
			 */
			
			// 오리진 파일 명에서 확장자를 분리하는 작업, 예) a1.jpg -> "a1","jpg"
			// 분리하는 구분자 중에 "." 은 원천적으로 사용불가이지만 "\\" 를 붙이면 사용가능
			String[] ext1 = orgname.split("\\.");
			String   ext2 = ext1[ext1.length-1];  // 확장자 얻음  예) jpg
			
			// 유니큐한 파일명을 얻기위한 작업 (유닉스타임 맨뒤 7자리를 이용함)
			Calendar cal = Calendar.getInstance();
			String uxt = cal.getTimeInMillis()+"";
			uxt = uxt.substring(uxt.length()-7);
			uxt += filecnt;
			
			// 유닉스타임으로 얻은 파일명에 확장자를 붙임
			String filename = uxt+"."+ext2; 
			// 물리적인 위치에 저장 처리를 하기위한 경로 설정
			String filePath = path + "/" + filename;
			
			// 실제 저장처리되는 모습
			file.transferTo(new File(filePath));
			
			// UPDATE SQL의  filename 값을 설정하는 부분
			// 물리적 공간에 저장 처리된 파일명을 구분자와 같이 세팅한다. 
			modifyFile += filename+"／";
			
			// 수정처리에서 물리적인 OLD 파일을 삭제하는 설정
			try {
				// DB에 저장된 filename이 공백이 아닌경우 (즉 파일이 있는 경우)의 체크
				if (!dbfileArray[filecnt-1].equals("")) {
					// 삭제 파일의 경로 설정
					String del_filepath = path + "/" + dbfileArray[filecnt-1];
					// 삭제 파일의 경로를 물리적 위치로 인식
					// 물리적 위치 설정이 잘못되는 경우 에러를 발생시킴 (그래서 try설정 한것임)
					File del_file = new File(del_filepath);
					// 진짜 삭제
					del_file.delete();
				}
			} catch (Exception e) { }
			
			System.out.println("filecnt : " + filecnt );
		}
		
		vo.setRevfilename(modifyFile);
		int updateCnt = boardService.reviewUpdate(vo);
		if (updateCnt == 0) result = "1";
		
		mav.addObject("result", result);

		return mav;
	}
	
	
	@RequestMapping("/reviewDelete.do")
	@ResponseBody
	public ModelAndView  reviewDelete(ReviewVO vo, ModelMap model) throws Exception {
		  
		System.out.println("aaa");
		ModelAndView mav = new ModelAndView("jsonView");
		String result = "0";
		String path = propertiesService.getString("filePath1");
		
		vo = boardService.reviewSelectDetail(vo);
		int deleteCnt = boardService.reviewDelete(vo);

		if( deleteCnt == 0 ) {
			result = "1";
		} else {
			String files = vo.getRevfilename();
			if( files != null ) {
				String[] array = files.split("／");
				for( int i=0; i<array.length; i++ ) {
					String filePath = path + "/" + array[i];
					File file = new File(filePath);
					file.delete();
				}
			}
		}
		mav.addObject("result", result);
		
		return mav;
	}
	
	

	//공통 메서드
	private int setPageIndex(searchVO svo) {
	    int pageIndex = svo.getPageIndex();
	    if (svo.getPageIndex() != 0 || svo.getPageIndex() != 0) {
	        pageIndex = svo.getPageIndex() != 0 ? svo.getPageIndex() : svo.getPageIndex();
	    }
	    return pageIndex;
	}

	private String getImageHeight(String filename) {
	    String img_h = "";
	    if (filename != null && !filename.equals("")) {
	        String[] files = filename.split("／");
	        String path = propertiesService.getString("filePath1");
	        for (String file : files) {
	            File f = new File(path + "/" + file);
	            if (f.exists()) {
	                try {
	                    BufferedImage img = ImageIO.read(f);
	                    int hh = (img.getHeight() * 100) / img.getWidth();
	                    img_h += hh + "／";
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    }
	    return img_h;
	}

	public static searchVO  commList(int pageUnit
											, int pageSize
											, int pageIndex
											, int total
											, searchVO svo
											) {
		
						
		//출력페이지의 시작번호
		int recordCountPerPage = total-(pageIndex-1)*pageUnit;
		
		//sql적용할 시작번호 및 마지막 번호
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		int lastIndex = firstIndex + (pageUnit -1);
		
		//출력페이지의 페이징 시작(1), 끝번호(10)
		int pageStartNo = (int)Math.floor((double)(pageIndex-1)/pageSize)*pageSize+1;
		
		
		int pageLastNo= pageStartNo+(pageSize-1);
		
		//전체 페이지 수(=마지막 페이지 번호 동일)
		int totalPageCnt = (int)Math.ceil((double)total/pageUnit);
		// 하단 출력 페이지 갯수(10)가 원래 페이지 갯수(2) 보다 많을 경우 원래 페이지 겟수만 표출한다. 
		if(totalPageCnt < pageLastNo ) pageLastNo = totalPageCnt;
		
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
