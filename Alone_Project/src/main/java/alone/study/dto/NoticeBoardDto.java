package alone.study.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeBoardDto {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private int viewcnt;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date regdate;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "NoticeBoardDto [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", viewcnt=" + viewcnt + ", regdate=" + regdate + "]";
	}

}
