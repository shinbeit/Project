package com.ticket.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ticket.dao.RemainDAO;
import com.ticket.dao.SeatDAO;
import com.ticket.dao.SelectedTicketDAO;
import com.ticket.dto.Remain;
import com.ticket.dto.SelectedTicket;
import com.ticket.dto.SelectedTicketDTO;
import com.ticket.util.HttpUtils;
import com.ticket.util.MyUtil;

@Controller
public class SeatController {

	@Autowired
	@Qualifier("remainDAO")
	RemainDAO remain;

	@Autowired
	@Qualifier("selectedTicketDAO")
	SelectedTicketDAO selectedTicket;
	
	@Autowired
	@Qualifier("seatDAO")
	SeatDAO seat;

	@RequestMapping(value = "/step2", method = RequestMethod.GET)
	public String reservation(HttpServletRequest request) {
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		List<Remain> checkSeat = remain.selectListIsEmpty();
		System.out.println(checkSeat.size());
		request.setAttribute("checkSeat", checkSeat);
		return "step2";
	}

	@RequestMapping(value = "/right", method = RequestMethod.GET)
	public String right() {
		return "right";
	}


	/*
	 * SelectedTicket�� ���õ� �¼��� �Է��ϰ�, 
	 * ���õ� �¼��� �����Ͽ� right�������� ��ȯ.
	 * right���������� ���õ� �¼����� ����Ʈ�� ���.
	 */
	@RequestMapping(value = "/get/seatData", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView setTicket(@RequestParam String seatRow, @RequestParam String seatNum, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		String performCode = "";
		String userId = "";

		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("performcode")) {
					performCode = cookie.getValue();
				}
				if(cookie.getName().equals("userId")) {
					userId = cookie.getValue();
				}
			}
		}

		if(userId.equals("")) {
			ModelAndView m = new ModelAndView();
			m.setViewName("main");
			return m;
		}
		System.out.println(seatRow+"�� "+seatNum+"��");
		ModelAndView m = new ModelAndView();
		SelectedTicketDTO ticket = new SelectedTicketDTO();
		ticket.setUserId(userId);
		ticket.setPerformCode(performCode);
		ticket = selectedTicket.home_select(ticket);
		ticket.setSeatRow(seatRow);
		ticket.setSeatNum(Integer.parseInt(seatNum));
		if(seatRow.charAt(0) >= 'A' && seatRow.charAt(0) <='E') {
			ticket.setTicketPrice(100000);
		}
		else if(seatRow.charAt(0) >= 'F' && seatRow.charAt(0) <='J') {
			ticket.setTicketPrice(70000);
		}
		else {
			ticket.setTicketPrice(50000);
		}
		System.out.println("�帣: "+selectedTicket.get_performCode(performCode));
		ticket.setPerformGenreCode(selectedTicket.get_performCode(performCode));
		seat.setSelectedTicket(ticket);
		System.out.println("");
		List<SelectedTicketDTO> list = seat.getSelectedTicket(ticket);
		SelectedTicketDTO finalTicket = new SelectedTicketDTO();
		finalTicket.setUserId(userId);
		finalTicket.setPerformCode(performCode);
		finalTicket.setPerformGenreCode(ticket.getPerformGenreCode());
		finalTicket.setSelectedDate(ticket.getSelectedDate());
		finalTicket.setTime(ticket.getTime());
		int sum = 0;
		boolean checkFinal = false;
		for(SelectedTicketDTO l : list) {
			if(l.getFinalPay() == 1) {
				checkFinal = true;
				System.out.println("break;");
				break;
			}
			sum += l.getTicketPrice();
			finalTicket.setInwon(finalTicket.getInwon() + 1);
			System.out.println("���ο�: "+finalTicket.getInwon());
		}
		finalTicket.setTicketPrice(sum);
		if(checkFinal) {
			seat.updateFinalSelectedTicket(finalTicket);
		}
		else {
			seat.setFinalSelectedTicket(finalTicket);	
		}
		m.setViewName("right");
		m.addObject("seatRow", seatRow);
		m.addObject("seatNum", seatNum);
		m.addObject("list", list);
		request.setAttribute("seatRow", seatRow);
		request.setAttribute("seatNum", seatNum);
		request.setAttribute("list", list);
		return m;
	}

	/*
	 * ������ �¼��� �ٽ� Ŭ������ �� SelectedTicket���� �����ϰ�
	 * ������ �¼��� ������ ������ �¼����� ������ right�� ��ȯ.
	 */
	@RequestMapping(value = "/delete/seatData", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView removeTicketData(@RequestParam String seatRow, @RequestParam String seatNum, HttpServletRequest request) {
		Cookie[] cookie = request.getCookies();

		String performCode = "";
		String userId = "";

		if (cookie != null) {
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("performcode")) {
					performCode = cookie[i].getValue();
				}
			}
		}


		if (cookie != null) {
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("userId")) {
					userId = cookie[i].getValue();
				}
			}
		}

		ModelAndView m = new ModelAndView();
		SelectedTicketDTO ticket = new SelectedTicketDTO();
		ticket.setUserId(userId);
		ticket.setPerformCode(performCode);
		ticket.setSeatRow(seatRow);
		ticket.setSeatNum(Integer.parseInt(seatNum));
		seat.deleteSelectedTicket(ticket);
		List<SelectedTicketDTO> list = seat.getSelectedTicket(ticket);
		m.setViewName("right");
		m.addObject("seatRow", "");
		m.addObject("seatNum", "");
		m.addObject("list", list);
		request.setAttribute("seatRow", "");
		request.setAttribute("seatNum", "");
		request.setAttribute("list", list);
		return m;
	}

	/* ������ �� �Ǿ��� �� ó���ؾ��ϴ� �κ�
	 * selectedTicket���� userId��, performCode�� >> �̺κ��� ������.
	 * ������ �������� ������ �¼��� List�� �����´�.
	 * ������ list���� seatrow, seatnum�� �����ͼ� 
	 * dao�� ���� remainData�� �¼��� isEmpty = 0���� �����.
	 */
	@RequestMapping(value = "/set/remainData", method = RequestMethod.GET)
	@ResponseBody
	public String setIsEmpty(HttpServletRequest request) {
		Cookie[] cookie = request.getCookies();

		String performCode = "";
		String userId = "";

		if (cookie != null) {
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("performcode")) {
					performCode = cookie[i].getValue();
				}
			}
		}


		if (cookie != null) {
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("userId")) {
					userId = cookie[i].getValue();
				}
			}
		}
		SelectedTicketDTO ticket = new SelectedTicketDTO();
		ticket.setUserId(userId);
		ticket.setPerformCode(performCode);
		if(seat.updateSeat(ticket))
			return "success";
		return "fail";
	}
}