package com.tydee.dto;

public class MyTydeeDistinctDto {
	private int lev;
	private int tiny_depth;
	private int user_no;
	public MyTydeeDistinctDto() {}
	public MyTydeeDistinctDto(int lev, int tiny_depth) {
		this.lev = lev;
		this.tiny_depth = tiny_depth;
	}
	public MyTydeeDistinctDto(int lev, int tiny_depth, int user_no) {
		this.lev = lev;
		this.tiny_depth = tiny_depth;
		this.user_no = user_no;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getTiny_depth() {
		return tiny_depth;
	}
	public void setTiny_depth(int tiny_depth) {
		this.tiny_depth = tiny_depth;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
}
