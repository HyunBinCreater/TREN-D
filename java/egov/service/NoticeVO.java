package egov.service;

public class NoticeVO {

	//notice	
		String noticenum;
		String noticetitle;
		String noticecont;
		String noticedate;
		String noticename;
		String noticestate;
		
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

		int repageIndex;

		public String getNoticenum() {
			return noticenum;
		}

		public void setNoticenum(String noticenum) {
			this.noticenum = noticenum;
		}

		public String getNoticetitle() {
			return noticetitle;
		}

		public void setNoticetitle(String noticetitle) {
			this.noticetitle = noticetitle;
		}

		public String getNoticecont() {
			return noticecont;
		}

		public void setNoticecont(String noticecont) {
			this.noticecont = noticecont;
		}

		public String getNoticedate() {
			return noticedate;
		}

		public void setNoticedate(String noticedate) {
			this.noticedate = noticedate;
		}

		public String getNoticename() {
			return noticename;
		}

		public void setNoticename(String noticename) {
			this.noticename = noticename;
		}

		public String getNoticestate() {
			return noticestate;
		}

		public void setNoticestate(String noticestate) {
			this.noticestate = noticestate;
		}

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

		public int getRepageIndex() {
			return repageIndex;
		}

		public void setRepageIndex(int repageIndex) {
			this.repageIndex = repageIndex;
		}
		
		
		
	
	
	
}
