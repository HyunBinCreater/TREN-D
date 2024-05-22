package egov.service;

public class FaqVO {

	//faq	
		String faqnum;
		String faqcode;
		String faqtitle;
		String faqcont;
		String faqans;
		
		String open_no;
		String faq_page_no;
		
		
		/** 검색조건 */
		String searchCondition = "";

		/** 검색Keyword */
		String searchKeyword = "";

		/** 검색사용여부 */
		String searchUseYn = "";

		/** 현재페이지 */
		int pageIndex = 1;
		

		/** 페이지갯수 */
		int pageUnit = 10;

		/** 페이지사이즈 */
		int pageSize = 10;

		/** firstIndex */
		int firstIndex = 1;

		/** lastIndex */
		int lastIndex = 10;
		
		/** recordCountPerPage */
		private int recordCountPerPage = 10;

		int PageStartNo;
		
		int PageLastNo;
		
		int TotalPageCnt;
		
		
		
		
		public String getSearchCondition() {
			return searchCondition;
		}
		public void setSearchCondition(String searchCondition) {
			this.searchCondition = searchCondition;
		}
		public String getSearchKeyword() {
			return searchKeyword;
		}
		public void setSearchKeyword(String searchKeyword) {
			this.searchKeyword = searchKeyword;
		}
		public String getSearchUseYn() {
			return searchUseYn;
		}
		public void setSearchUseYn(String searchUseYn) {
			this.searchUseYn = searchUseYn;
		}
		public int getPageIndex() {
			return pageIndex;
		}
		public void setPageIndex(int pageIndex) {
			this.pageIndex = pageIndex;
		}
		public int getPageUnit() {
			return pageUnit;
		}
		public void setPageUnit(int pageUnit) {
			this.pageUnit = pageUnit;
		}
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public int getFirstIndex() {
			return firstIndex;
		}
		public void setFirstIndex(int firstIndex) {
			this.firstIndex = firstIndex;
		}
		public int getLastIndex() {
			return lastIndex;
		}
		public void setLastIndex(int lastIndex) {
			this.lastIndex = lastIndex;
		}
		public int getRecordCountPerPage() {
			return recordCountPerPage;
		}
		public void setRecordCountPerPage(int recordCountPerPage) {
			this.recordCountPerPage = recordCountPerPage;
		}
		public int getPageStartNo() {
			return PageStartNo;
		}
		public void setPageStartNo(int pageStartNo) {
			PageStartNo = pageStartNo;
		}
		public int getPageLastNo() {
			return PageLastNo;
		}
		public void setPageLastNo(int pageLastNo) {
			PageLastNo = pageLastNo;
		}
		public int getTotalPageCnt() {
			return TotalPageCnt;
		}
		public void setTotalPageCnt(int totalPageCnt) {
			TotalPageCnt = totalPageCnt;
		}
		public String getOpen_no() {
			return open_no;
		}
		public void setOpen_no(String open_no) {
			this.open_no = open_no;
		}
		public String getFaq_page_no() {
			return faq_page_no;
		}
		public void setFaq_page_no(String faq_page_no) {
			this.faq_page_no = faq_page_no;
		}
		public String getFaqnum() {
			return faqnum;
		}
		public void setFaqnum(String faqnum) {
			this.faqnum = faqnum;
		}
		public String getFaqcode() {
			return faqcode;
		}
		public void setFaqcode(String faqcode) {
			this.faqcode = faqcode;
		}
		public String getFaqtitle() {
			return faqtitle;
		}
		public void setFaqtitle(String faqtitle) {
			this.faqtitle = faqtitle;
		}
		public String getFaqcont() {
			return faqcont;
		}
		public void setFaqcont(String faqcont) {
			this.faqcont = faqcont;
		}
		public String getFaqans() {
			return faqans;
		}
		public void setFaqans(String faqans) {
			this.faqans = faqans;
		}
		
		
	
}
