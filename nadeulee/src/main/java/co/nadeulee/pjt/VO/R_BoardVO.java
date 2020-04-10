package co.nadeulee.pjt.VO;

import java.sql.Date;

public class R_BoardVO {
	private int r_no;
	private String content;
	private Date rdate;
	private String r_photo;
	private int like;
	private String content_id;

	public R_BoardVO() {
	}

	public int getR_no() {
		return r_no;
	}

	public String getContent() {
		return content;
	}

	public Date getRdate() {
		return rdate;
	}

	public String getR_photo() {
		return r_photo;
	}

	public int getLike() {
		return like;
	}

	public String getContent_id() {
		return content_id;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public void setR_photo(String r_photo) {
		this.r_photo = r_photo;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}

}
