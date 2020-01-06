package com.ticket.dto;

public class PreservedTicketDTO {
	private String userId;
	private String performCode;
	private String performName;
	private String seatRow;
	private int seatNum;
	private String selectedDate;
	private String time;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPerformCode() {
		return performCode;
	}
	public void setPerformCode(String performCode) {
		this.performCode = performCode;
	}
	public String getPerformName() {
		return performName;
	}
	public void setPerformName(String performName) {
		this.performName = performName;
	}
	public String getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}
	public int getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}
	public String getSelectedDate() {
		return selectedDate;
	}
	public void setSelectedDate(String selectedDate) {
		this.selectedDate = selectedDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
