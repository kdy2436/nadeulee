package co.nadeulee.pjt.VO;

import java.sql.Date;

public class R_BoardVO {
	private int rno;
	private String rcontent_id;
	private String remail;
	private String rcontent; 
	private Date rdate;
	private int likes;
	private String img1;
	private String img2;
	private String img3;
	private String rnickname;
	
	//MemberVO 객체
	private String email;
	private String pw;
	private String gender;
	private String profile;
	private String auth;
	private String nickname;
	
	//C_BoardVO 객체
	private int cno;
	private String ccontent;
	private Date cdate;
	private int crno;
	private String cemail;
	private String cnickname;

	
	//TourVO 객체 
	private String tcontent_id;
	private String title;
	private String overview;
	private String addr;
	private String parking;
	private String pay;
	private String time;
	private String age;
	private String image;
	private String tel;
	private String map_x;
	private String map_y;
	private String tourtypecode;
	private int sigungucode;
	private String cat2;
	private String cat1;
	private String typeid;
	
	
	public R_BoardVO() {
		// TODO Auto-generated constructor stub
	}


	public int getRno() {
		return rno;
	}


	public void setRno(int rno) {
		this.rno = rno;
	}


	public String getRcontent_id() {
		return rcontent_id;
	}


	public void setRcontent_id(String rcontent_id) {
		this.rcontent_id = rcontent_id;
	}


	public String getRemail() {
		return remail;
	}


	public void setRemail(String remail) {
		this.remail = remail;
	}


	public String getRcontent() {
		return rcontent;
	}


	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}


	public Date getRdate() {
		return rdate;
	}


	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}


	public int getLikes() {
		return likes;
	}


	public void setLikes(int likes) {
		this.likes = likes;
	}


	public String getImg1() {
		return img1;
	}


	public void setImg1(String img1) {
		this.img1 = img1;
	}


	public String getImg2() {
		return img2;
	}


	public void setImg2(String img2) {
		this.img2 = img2;
	}


	public String getImg3() {
		return img3;
	}


	public void setImg3(String img3) {
		this.img3 = img3;
	}


	public String getRnickname() {
		return rnickname;
	}


	public void setRnickname(String rnickname) {
		this.rnickname = rnickname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public String getAuth() {
		return auth;
	}


	public void setAuth(String auth) {
		this.auth = auth;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public String getCcontent() {
		return ccontent;
	}


	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}


	public Date getCdate() {
		return cdate;
	}


	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}


	public int getCrno() {
		return crno;
	}


	public void setCrno(int crno) {
		this.crno = crno;
	}


	public String getCemail() {
		return cemail;
	}


	public void setCemail(String cemail) {
		this.cemail = cemail;
	}


	public String getCnickname() {
		return cnickname;
	}


	public void setCnickname(String cnickname) {
		this.cnickname = cnickname;
	}


	public String getTcontent_id() {
		return tcontent_id;
	}


	public void setTcontent_id(String tcontent_id) {
		this.tcontent_id = tcontent_id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getOverview() {
		return overview;
	}


	public void setOverview(String overview) {
		this.overview = overview;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getParking() {
		return parking;
	}


	public void setParking(String parking) {
		this.parking = parking;
	}


	public String getPay() {
		return pay;
	}


	public void setPay(String pay) {
		this.pay = pay;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getMap_x() {
		return map_x;
	}


	public void setMap_x(String map_x) {
		this.map_x = map_x;
	}


	public String getMap_y() {
		return map_y;
	}


	public void setMap_y(String map_y) {
		this.map_y = map_y;
	}


	public String getTourtypecode() {
		return tourtypecode;
	}


	public void setTourtypecode(String tourtypecode) {
		this.tourtypecode = tourtypecode;
	}


	public int getSigungucode() {
		return sigungucode;
	}


	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}


	public String getCat2() {
		return cat2;
	}


	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}


	public String getCat1() {
		return cat1;
	}


	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}


	public String getTypeid() {
		return typeid;
	}


	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}


	@Override
	public String toString() {
		return "R_BoardVO [rno=" + rno + ", rcontent_id=" + rcontent_id + ", remail=" + remail + ", rcontent="
				+ rcontent + ", rdate=" + rdate + ", likes=" + likes + ", img1=" + img1 + ", img2=" + img2 + ", img3="
				+ img3 + ", rnickname=" + rnickname + ", email=" + email + ", pw=" + pw + ", gender=" + gender
				+ ", profile=" + profile + ", auth=" + auth + ", nickname=" + nickname + ", cno=" + cno + ", ccontent="
				+ ccontent + ", cdate=" + cdate + ", crno=" + crno + ", cemail=" + cemail + ", cnickname=" + cnickname
				+ ", tcontent_id=" + tcontent_id + ", title=" + title + ", overview=" + overview + ", addr=" + addr
				+ ", parking=" + parking + ", pay=" + pay + ", time=" + time + ", age=" + age + ", image=" + image
				+ ", tel=" + tel + ", map_x=" + map_x + ", map_y=" + map_y + ", tourtypecode=" + tourtypecode
				+ ", sigungucode=" + sigungucode + ", cat2=" + cat2 + ", cat1=" + cat1 + ", typeid=" + typeid + "]";
	}


	
	
	
	


}