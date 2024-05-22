package egov.service;

public class MemberVO {
 
	private int unq;
	private String userid;
	private String pass;
	private String name;
	private String nickname;
	private String birth;
	private String gender;
	private String postcode;
	private String loadaddr;
	private String rdate;

	private String etcaddr;
	private String mobile;
	private String kakaologin;
	private String naverlogin;
	private String searchUserid;
	
	String grade;
	String mileage;
	String height;
	String weight;
	String topsize;
	String btmsize;
	String footsize;
	String totalpay;
	
	
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
	
	/** 현재페이지 */
	int pageIndex = 1;
	

	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getTopsize() {
		return topsize;
	}
	public void setTopsize(String topsize) {
		this.topsize = topsize;
	}
	public String getBtmsize() {
		return btmsize;
	}
	public void setBtmsize(String btmsize) {
		this.btmsize = btmsize;
	}
	public String getFootsize() {
		return footsize;
	}
	public void setFootsize(String footsize) {
		this.footsize = footsize;
	}
	public String getTotalpay() {
		return totalpay;
	}
	public void setTotalpay(String totalpay) {
		this.totalpay = totalpay;
	}
	public String getSearchUserid() {
		return searchUserid;
	}
	public void setSearchUserid(String searchUserid) {
		this.searchUserid = searchUserid;
	}
	public String getKakaologin() {
		return kakaologin;
	}
	public void setKakaologin(String kakaologin) {
		this.kakaologin = kakaologin;
	}
	public String getNaverlogin() {
		return naverlogin;
	}
	public void setNaverlogin(String naverlogin) {
		this.naverlogin = naverlogin;
	}
	public String getLoadaddr() {
		return loadaddr;
	}
	public void setLoadaddr(String loadaddr) {
		this.loadaddr = loadaddr;
	}

	public String getEtcaddr() {
		return etcaddr;
	}
	public void setEtcaddr(String etcaddr) {
		this.etcaddr = etcaddr;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
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
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	



	
}
