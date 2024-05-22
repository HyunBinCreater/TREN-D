package egov.service;

public class ProductVO {

	
	String prounq;
	String probrand;
	String proname;
	String proinfo;
	String amount;
	
	String proprice;
	String catelcode;
	String catemcode;
	String catescode;
	String profilename;
	
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
	
	//중고 상품 관련 페이징 
	/** 검색조건 */
	String usedsearchCondition = "";

	/** 현재페이지 */
	int usedpageIndex = 1;
	
	/** 페이지갯수 */
	int usedpageUnit = 10;

	/** 페이지사이즈 */
	int usedpageSize = 10;

	/** firstIndex */
	int usedfirstIndex = 1;

	/** lastIndex */
	int usedlastIndex = 10;
	
	/** recordCountPerPage */
	private int usedrecordCountPerPage = 10;

	int usedPageStartNo;
	
	int usedPageLastNo;
	
	int usedTotalPageCnt;
	
	
	
	
	
	
	public String getUsedsearchCondition() {
		return usedsearchCondition;
	}
	public void setUsedsearchCondition(String usedsearchCondition) {
		this.usedsearchCondition = usedsearchCondition;
	}

	public int getUsedpageIndex() {
		return usedpageIndex;
	}
	public void setUsedpageIndex(int usedpageIndex) {
		this.usedpageIndex = usedpageIndex;
	}
	public int getUsedpageUnit() {
		return usedpageUnit;
	}
	public void setUsedpageUnit(int usedpageUnit) {
		this.usedpageUnit = usedpageUnit;
	}
	public int getUsedpageSize() {
		return usedpageSize;
	}
	public void setUsedpageSize(int usedpageSize) {
		this.usedpageSize = usedpageSize;
	}
	public int getUsedfirstIndex() {
		return usedfirstIndex;
	}
	public void setUsedfirstIndex(int usedfirstIndex) {
		this.usedfirstIndex = usedfirstIndex;
	}
	public int getUsedlastIndex() {
		return usedlastIndex;
	}
	public void setUsedlastIndex(int usedlastIndex) {
		this.usedlastIndex = usedlastIndex;
	}
	public int getUsedrecordCountPerPage() {
		return usedrecordCountPerPage;
	}
	public void setUsedrecordCountPerPage(int usedrecordCountPerPage) {
		this.usedrecordCountPerPage = usedrecordCountPerPage;
	}
	public int getUsedPageStartNo() {
		return usedPageStartNo;
	}
	public void setUsedPageStartNo(int usedPageStartNo) {
		this.usedPageStartNo = usedPageStartNo;
	}
	public int getUsedPageLastNo() {
		return usedPageLastNo;
	}
	public void setUsedPageLastNo(int usedPageLastNo) {
		this.usedPageLastNo = usedPageLastNo;
	}
	public int getUsedTotalPageCnt() {
		return usedTotalPageCnt;
	}
	public void setUsedTotalPageCnt(int usedTotalPageCnt) {
		this.usedTotalPageCnt = usedTotalPageCnt;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
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
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getProunq() {
		return prounq;
	}
	public void setProunq(String prounq) {
		this.prounq = prounq;
	}
	public String getProbrand() {
		return probrand;
	}
	public void setProbrand(String probrand) {
		this.probrand = probrand;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getProinfo() {
		return proinfo;
	}
	public void setProinfo(String proinfo) {
		this.proinfo = proinfo;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public String getProprice() {
		return proprice;
	}
	public void setProprice(String proprice) {
		this.proprice = proprice;
	}
	public String getCatelcode() {
		return catelcode;
	}
	public void setCatelcode(String catelcode) {
		this.catelcode = catelcode;
	}
	public String getCatemcode() {
		return catemcode;
	}
	public void setCatemcode(String catemcode) {
		this.catemcode = catemcode;
	}
	public String getCatescode() {
		return catescode;
	}
	public void setCatescode(String catescode) {
		this.catescode = catescode;
	}
	public String getProfilename() {
		return profilename;
	}
	public void setProfilename(String profilename) {
		this.profilename = profilename;
	}
	
	
	
	
	
}
