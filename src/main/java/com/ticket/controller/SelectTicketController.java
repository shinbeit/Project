package com.ticket.controller;

import java.text.ParseException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ticket.dao.SelectedTicketDAO;
import com.ticket.dto.PerformDTO;
import com.ticket.dto.PerformInfoDTO;
import com.ticket.dto.PlaceDTO;
import com.ticket.dto.SeatingDTO;
import com.ticket.dto.SelectedTicketDTO;
import com.ticket.util.MyUtil;

@Controller
public class SelectTicketController {

	@Autowired
	@Qualifier("selectedTicketDAO")
	SelectedTicketDAO dao;

	@Autowired
	MyUtil myUtil;

	String selectYear = "";
	String selectMonth = "";
	String selectDay = "";

	PerformDTO performReaddto;
	PlaceDTO Read_placedto;

	@RequestMapping(value = "/home.action", method = RequestMethod.GET)
	public String home() {

		return "home";

	}

	@RequestMapping(value = "getDate", method = RequestMethod.GET)
	@ResponseBody 
	public String getDate(@RequestParam String year,@RequestParam String month,@RequestParam String day, HttpServletRequest request) {

		selectYear = year;
		selectMonth = month;
		selectDay = day;

		String params = selectYear + selectMonth + selectDay;

		return params;

	}

	@RequestMapping(value = "/step1.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String step1(HttpServletRequest request) {
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);

		int performGenreCode = dao.get_performCode(ticket.getPerformCode());

		String selectedYear = selectYear;
		String selectedMonth = selectMonth;
		String selectedDay = selectDay;
		String time = request.getParameter("time");

		String selectDate = selectedYear + "." + selectedMonth + "." + selectedDay;


		ticket.setSelectedDate(selectDate);
		ticket.setTime(time);
		ticket.setPerformGenreCode(performGenreCode);

		/* dao.home_insertData(ticket); */

		PerformDTO pdto = new PerformDTO();

//		PerformDTO performReaddto = new PerformDTO();
//		PlaceDTO Read_placedto = new PlaceDTO();
		
		System.out.println("�����ڵ�: "+ticket.getPerformCode());
		pdto = dao.cal_select(ticket.getPerformCode());
		/* ticket = dao.readData(ticket); */
		performReaddto = dao.read_performData(ticket.getPerformCode());
		Read_placedto = dao.read_placeData(Integer.toString(performReaddto.getPerformPlaceCode()));

		String start = pdto.getPerformStartDate();
		String end = pdto.getPerformEndDate();

		int year1 = Integer.parseInt(start.substring(0,4));
		int year2 = Integer.parseInt(end.substring(0,4));
		int mon1 = Integer.parseInt(start.substring(5,7));
		int mon2 = Integer.parseInt(end.substring(5,7));
		int day1 = Integer.parseInt(start.substring(8));
		int day2 = Integer.parseInt(end.substring(8));

		Calendar cal1 = Calendar.getInstance(); 
		Calendar cal2 = Calendar.getInstance();

		cal1.set(Calendar.YEAR,year1); 
		cal1.set(Calendar.MONTH,mon1);
		cal1.set(Calendar.DATE,day1);

		cal2.set(Calendar.YEAR,year1); 
		cal2.set(Calendar.MONTH,mon2);
		cal2.set(Calendar.DATE,day2);

		int duringDate = (int) (((cal2.getTimeInMillis() - cal1.getTimeInMillis()) / 1000 / 60 / 60 / 24 ) + 1);

		List<PerformInfoDTO> timeList = dao.timeList(ticket.getPerformCode());
		List<SeatingDTO> seatPriceList = dao.seatPrice(ticket.getPerformCode());

		request.setAttribute("Read_placedto", Read_placedto);
		request.setAttribute("performReaddto", performReaddto);
		request.setAttribute("timeList", timeList);
		request.setAttribute("seatPriceList", seatPriceList);
		request.setAttribute("performGenreCode", performGenreCode); 
		request.setAttribute("duringDate", duringDate); 
		request.setAttribute("year1",year1); 
		request.setAttribute("mon1", mon1); 
		request.setAttribute("day1",day1);
		request.setAttribute("userId", ticket.getUserId());
		request.setAttribute("performCode", ticket.getPerformCode());
		request.setAttribute("selectedYear", selectedYear);
		request.setAttribute("selectedMonth", selectedMonth);
		request.setAttribute("selectedDay", selectedDay);
		request.setAttribute("time", time);
		request.setAttribute("stdto", ticket);

		return "step1";

	}




	@RequestMapping(value = "changeDate", method = RequestMethod.GET)
	@ResponseBody 
	public ModelAndView changeDate(@RequestParam String selectedDate, HttpServletRequest request) {
		System.out.println("selectedDate: "+selectedDate);
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		ticket = dao.readData(ticket);
		ticket.setSelectedDate(selectedDate);
		//153���� null��
		dao.date_updateData(ticket);
		performReaddto = dao.read_performData(ticket.getPerformCode());
		Read_placedto = dao.read_placeData(Integer.toString(performReaddto.getPerformPlaceCode()));
		ModelAndView m = new ModelAndView();
		m.setViewName("detail");
		m.addObject("stdto",ticket);
		m.addObject("performReaddto",performReaddto);
		m.addObject("Read_placedto",Read_placedto);
		
		return m;
	}

	@RequestMapping(value = "changeTime", method = RequestMethod.GET)
	@ResponseBody 
	public ModelAndView changeTime(@RequestParam String time, HttpServletRequest request) {

		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);

		int realtime = time.indexOf(":");

		String rtime = time.substring(realtime-2, realtime+3);
		System.out.println("rtime: "+rtime);
		ticket = dao.readData(ticket);
		ticket.setTime(rtime);
		dao.time_updateData(ticket);
		dao.date_updateData(ticket);
		performReaddto = dao.read_performData(ticket.getPerformCode());
		Read_placedto = dao.read_placeData(Integer.toString(performReaddto.getPerformPlaceCode()));
		ModelAndView m = new ModelAndView();
		m.setViewName("detail");
		m.addObject("stdto",ticket);
		m.addObject("performReaddto",performReaddto);
		m.addObject("Read_placedto",Read_placedto);
		
		return m;
	}

	@RequestMapping(value = "tttt", method = RequestMethod.GET)
	@ResponseBody 
	public ModelAndView changeInwon(@RequestParam String selectedDate, @RequestParam String inwon, HttpServletRequest request) {
		System.out.println("changeInwon");
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		System.out.println("selectedDate: "+selectedDate);
		ticket.setInwon(Integer.parseInt(inwon));
		ticket.setSelectedDate(selectedDate);
		ModelAndView m = new ModelAndView();
		performReaddto = dao.read_performData(ticket.getPerformCode());
		m.setViewName("detail");
		m.addObject("performReaddto", performReaddto);
		m.addObject("stdto", ticket);
		m.addObject("inwon", inwon);
		
		return m;
	}

	@RequestMapping(value = "/initialTicket", method = RequestMethod.POST)
	@ResponseBody
	public void initialTicket(@RequestParam String selectedDate, @RequestParam String time, @RequestParam int inwon, HttpServletRequest request) {
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		ticket.setSelectedDate(selectedDate);
		ticket.setTime(time);
		ticket.setInwon(inwon);
		ticket.setPerformGenreCode(dao.get_performCode(ticket.getPerformCode()));
		dao.home_insertData(ticket);
		performReaddto = dao.read_performData(ticket.getPerformCode());
	}
	
	@RequestMapping(value = "detailDate", method = RequestMethod.GET)
	@ResponseBody 
	public ModelAndView detailDate(@RequestParam String check, HttpServletRequest request) {

		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		List<SelectedTicketDTO> list = dao.detail_readData(ticket);
		ticket = dao.readData(ticket);
		System.out.println("performCode: "+ticket.getPerformCode());
		performReaddto = dao.read_performData(ticket.getPerformCode());
		//228���� null���� ��.
		Read_placedto = dao.read_placeData(Integer.toString(performReaddto.getPerformPlaceCode()));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("detail");
		mav.addObject("stdto",ticket);
		mav.addObject("performReaddto",performReaddto);
		mav.addObject("Read_placedto",Read_placedto);

		request.setAttribute("list", list);
		request.setAttribute("stdto", ticket); 
		request.setAttribute("performReaddto", performReaddto);
		request.setAttribute("Read_placedto", Read_placedto);
		return mav;

	}

	@RequestMapping(value = "calData", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView calData(HttpServletRequest request) throws ParseException {

		Cookie[] cookie = request.getCookies();

		String performCode = "";

		if (cookie != null) {
			for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("performcode")) {
					performCode = cookie[i].getValue();
				}
			}
		}

		PerformDTO pdto = new PerformDTO();

		pdto = dao.cal_select(performCode);

		String start = pdto.getPerformStartDate();
		String end = pdto.getPerformEndDate();

		System.out.println("start: "+start+", end: "+end );
		int year1 = Integer.parseInt(start.substring(0,4));
		int year2 = Integer.parseInt(end.substring(0,4));
		int mon1 = Integer.parseInt(start.substring(5,7));
		int mon2 = Integer.parseInt(end.substring(5,7));
		int day1 = Integer.parseInt(start.substring(8));
		int day2 = Integer.parseInt(end.substring(8));

		System.out.println("year1: "+year1+", year2: "+year2);
		System.out.println("mon1: "+mon1+", mon1: "+mon1);
		System.out.println("day1: "+day1+", day1: "+day1);

		Calendar cal1 = Calendar.getInstance(); 
		Calendar cal2 = Calendar.getInstance();

		cal1.set(Calendar.YEAR,year1); 
		cal1.set(Calendar.MONTH,mon1);
		cal1.set(Calendar.DATE,day1);

		cal2.set(Calendar.YEAR,year1); 
		cal2.set(Calendar.MONTH,mon2);
		cal2.set(Calendar.DATE,day2);

		long duringDate = ((cal2.getTimeInMillis() - cal1.getTimeInMillis()) / 1000 / 60 / 60 / 24 ) + 1;

		int performGenreCode = dao.get_performCode(performCode);

		List<PerformInfoDTO> timeList = dao.timeList(performCode);
		List<SeatingDTO> seatPriceList = dao.seatPrice(performCode);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("home");

		mav.addObject("duringDate",duringDate);
		mav.addObject("year1",year1);
		mav.addObject("mon1",mon1);
		mav.addObject("day1",day1);
		mav.addObject("performGenreCode",performGenreCode);
		mav.addObject("timeList",timeList);
		mav.addObject("seatPriceList",seatPriceList);

		request.setAttribute("performGenreCode", performGenreCode);
		request.setAttribute("duringDate", duringDate); 
		request.setAttribute("start",start); 
		request.setAttribute("end", end); 
		request.setAttribute("year1",year1); 
		request.setAttribute("mon1", mon1); 
		request.setAttribute("day1",day1);
		request.setAttribute("timeList",timeList);
		request.setAttribute("seatPriceList",seatPriceList);

		return mav;

	}

	/*
	 @RequestMapping(value = "getStepData", method = RequestMethod.GET)
	 @ResponseBody 
	 public ModelAndView timeList(@RequestParam String ch, HttpServletRequest request) {

		  Cookie[] cookie = request.getCookies();

		  String performCode = "";

		  if (cookie != null) {
	    	for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("performcode")) {
					performCode = cookie[i].getValue();
					}
				}
			}


	      PerformDTO pdto = new PerformDTO();

	      pdto = dao.cal_select(performCode);

	      String start = pdto.getPerformStartDate();
	      String end = pdto.getPerformEndDate();

	      System.out.println("start: "+start+", end: "+end );
	      int year1 = Integer.parseInt(start.substring(0,4));
	      int year2 = Integer.parseInt(end.substring(0,4));
	      int mon1 = Integer.parseInt(start.substring(5,7));
	      int mon2 = Integer.parseInt(end.substring(5,7));
	      int day1 = Integer.parseInt(start.substring(8));
	      int day2 = Integer.parseInt(end.substring(8));

	      System.out.println("year1: "+year1+", year2: "+year2);
	      System.out.println("mon1: "+mon1+", mon1: "+mon1);
	      System.out.println("day1: "+day1+", day1: "+day1);

		  Calendar cal1 = Calendar.getInstance(); 
		  Calendar cal2 = Calendar.getInstance();

		  cal1.set(Calendar.YEAR,year1); 
		  cal1.set(Calendar.MONTH,mon1);
		  cal1.set(Calendar.DATE,day1);

		  cal2.set(Calendar.YEAR,year1); 
		  cal2.set(Calendar.MONTH,mon2);
		  cal2.set(Calendar.DATE,day2);

		  long during = ((cal2.getTimeInMillis() - cal1.getTimeInMillis()) / 1000 / 60 / 60 / 24 ) + 1;

		  int duringDate = (int)(long)during;

		  int performGenreCode = dao.get_performCode(performCode);

		  List<PerformInfoDTO> timeList = dao.timeList(performCode);
		  List<SeatingDTO> seatPriceList = dao.seatPrice(performCode);

		  request.get

		  ModelAndView mav = new ModelAndView();

		  mav.setViewName("step1");

		  mav.addObject("duringDate",duringDate);
		  mav.addObject("year1",year1);
		  mav.addObject("mon1",mon1);
		  mav.addObject("day1",day1);
		  mav.addObject("performGenreCode",performGenreCode);
		  mav.addObject("timeList",timeList);
		  mav.addObject("seatPriceList",seatPriceList);

		  request.setAttribute("performGenreCode", performGenreCode);
		  request.setAttribute("duringDate", duringDate); 
		  request.setAttribute("start",start); 
		  request.setAttribute("end", end); 
		  request.setAttribute("year1",year1); 
		  request.setAttribute("mon1", mon1); 
		  request.setAttribute("day1",day1);
		  request.setAttribute("timeList",timeList);
		  request.setAttribute("seatPriceList",seatPriceList);

		  return mav;

	 }
	 */


	/*
	 @RequestMapping(value = "sendPerformCode", method = RequestMethod.GET)
	 @ResponseBody 
	 public ModelAndView sendPerformCode(@RequestParam String check, HttpServletRequest request) {

		 Cookie[] cookie = request.getCookies();

		  String performCode = "";

		  if (cookie != null) {
	    	for (int i = 0; i < cookie.length; i++) {
				if (cookie[i].getName().equals("performcode")) {
					performCode = cookie[i].getValue();
					}
				}
			}

	    int performGenreCode = dao.get_performCode(performCode);

	    ModelAndView mav = new ModelAndView();

		mav.setViewName("home");

		mav.addObject("performGenreCode",performGenreCode);

		request.setAttribute("performGenreCode", performGenreCode);

		return mav;

	 }

	 */

	/*
	 * @RequestMapping(value = "gett", method = RequestMethod.GET)
	 * 
	 * @ResponseBody 
	 * public ModelAndView testdetail(@RequestParam String de,String
	 * step, HttpServletRequest request) {
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * mv.setViewName("detail"); mv.addObject("params",de);
	 * mv.addObject("step",step);
	 * 
	 * request.setAttribute("params", de); request.setAttribute("step", step);
	 * 
	 * return mv;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "selectTime", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public ModelAndView selectTime(@RequestParam String time,
	 * HttpServletRequest request) {
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * mv.setViewName("detail"); mv.addObject("time",time);
	 * 
	 * request.setAttribute("time", time);
	 * 
	 * return mv;
	 * 
	 * }
	 */


}