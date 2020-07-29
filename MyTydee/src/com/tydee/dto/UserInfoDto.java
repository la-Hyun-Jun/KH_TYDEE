package com.tydee.dto;

import java.util.Date;

public class UserInfoDto {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_role;
	private String user_nickname;
	private Date user_regdate;
	private String naver_tk;
	private String kakao_tk;
	private String google_tk;
	private String user_active;
	public UserInfoDto() {}
	public UserInfoDto(String user_id, String user_pw) {
		this.user_id = user_id;
		this.user_pw = user_pw;
	}
	public UserInfoDto(int user_no, String user_id, String user_pw, String user_role, String user_nickname,
			Date user_regdate, String naver_tk, String kakao_tk, String google_tk, String user_active) {
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_role = user_role;
		this.user_nickname = user_nickname;
		this.user_regdate = user_regdate;
		this.naver_tk = naver_tk;
		this.kakao_tk = kakao_tk;
		this.google_tk = google_tk;
		this.user_active = user_active;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public Date getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}
	public String getNaver_tk() {
		return naver_tk;
	}
	public void setNaver_tk(String naver_tk) {
		this.naver_tk = naver_tk;
	}
	public String getKakao_tk() {
		return kakao_tk;
	}
	public void setKakao_tk(String kakao_tk) {
		this.kakao_tk = kakao_tk;
	}
	public String getGoogle_tk() {
		return google_tk;
	}
	public void setGoogle_tk(String google_tk) {
		this.google_tk = google_tk;
	}
	public String getUser_active() {
		return user_active;
	}
	public void setUser_active(String user_active) {
		this.user_active = user_active;
	}
	
}
