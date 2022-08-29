package alone.study.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReplyDto {
	private int bno;
	private int rno;
	private String replytext;
	private String replyer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regdate;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReplyDto [bno=" + bno + ", rno=" + rno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + "]";
	}

}
