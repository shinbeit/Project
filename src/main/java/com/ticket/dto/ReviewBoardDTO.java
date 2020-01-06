package com.ticket.dto;

public class ReviewBoardDTO {

	private String performCode;
	private int boardNum;
	private String score;
	private String subject;
	private String message;
	private String created;
	private String userId;

	public String getPerformCode() {
		return performCode;
	}

	public void setPerformCode(String performCode) {
		this.performCode = performCode;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
