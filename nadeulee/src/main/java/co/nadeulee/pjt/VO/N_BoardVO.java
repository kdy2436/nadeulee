package co.nadeulee.pjt.VO;

import java.sql.Date;

public class N_BoardVO {
	private int n_no;
	private String content;
	private Date date;
	private String n_photo;
	private String nickname;
	private String email;

	public N_BoardVO() {
	}

	public int getN_no() {
		return n_no;
	}

	public String getContent() {
		return content;
	}

	public Date getDate() {
		return date;
	}

	public String getN_photo() {
		return n_photo;
	}

	public String getNickname() {
		return nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setN_photo(String n_photo) {
		this.n_photo = n_photo;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
