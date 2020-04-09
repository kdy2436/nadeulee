package co.nadeulee.pjt.DTO;

import java.sql.Date;

public class C_BoardDTO {
	private int c_no;
	private String content;
	private Date cdate;
	private int like;
	private int r_no;
	private String email;

	public C_BoardDTO() {
	}

	public int getC_no() {
		return c_no;
	}

	public String getContent() {
		return content;
	}

	public Date getCdate() {
		return cdate;
	}

	public int getLike() {
		return like;
	}

	public int getR_no() {
		return r_no;
	}

	public String getEmail() {
		return email;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
