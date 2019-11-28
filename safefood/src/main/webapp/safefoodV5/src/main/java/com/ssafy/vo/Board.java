package com.ssafy.vo;

public class Board {
	private int no;
	private String id;
	private String title;
	private String regdate;
	private String contents;

	public Board(String id, String title, String contents) {
		this.id = id;
		this.title = title;
		this.contents = contents;
	}

	public Board(int no, String id, String title, String regdate) {
		this.no = no;
		this.id = id;
		this.title = title;
		this.regdate = regdate;
	}

	public Board(int no, String id, String title, String regdate, String contents) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.regdate = regdate;
		this.contents = contents;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", id=" + id + ", title=" + title + ", regdate=" + regdate + ", contents=" + contents + "]";
	}

}
