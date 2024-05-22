package egov.service;

public class ReviewVO {
	//review
	String userid;
	String prounq;
	String nickname;
	String revcont;
	String revdate;
	String revgrade;
	String revfilename;
	int revnum;
	int repageIndex;
	
	
	
	
	
	public int getRevnum() {
		return revnum;
	}
	public void setRevnum(int revnum) {
		this.revnum = revnum;
	}
	public int getRepageIndex() {
		return repageIndex;
	}
	public void setRepageIndex(int repageIndex) {
		this.repageIndex = repageIndex;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getProunq() {
		return prounq;
	}
	public void setProunq(String prounq) {
		this.prounq = prounq;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRevcont() {
		return revcont;
	}
	public void setRevcont(String revcont) {
		this.revcont = revcont;
	}
	public String getRevdate() {
		return revdate;
	}
	public void setRevdate(String revdate) {
		this.revdate = revdate;
	}

	public String getRevfilename() {
		return revfilename;
	}
	public void setRevfilename(String revfilename) {
		this.revfilename = revfilename;
	}
	public String getRevgrade() {
		return revgrade;
	}
	public void setRevgrade(String revgrade) {
		this.revgrade = revgrade;
	}
	
	
	
	
	
}
