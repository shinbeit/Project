package com.ticket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ticket.dao.PosterDAO;
import com.ticket.dto.CompanyMainDTO;
import com.ticket.dto.PayDTO;
import com.ticket.dto.PerformDetailDTO;
import com.ticket.dto.PosterDTO;
import com.ticket.dto.ReviewBoardDTO;
import com.ticket.util.HttpUtils;
import com.ticket.util.MyUtil;

@Controller
public class PosterController {

	@Autowired
	@Qualifier("posterDAO")
	PosterDAO PosterDAO;

	@Resource
	MyUtil myUtil;

	@RequestMapping(value = "/poster.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView poster(HttpServletRequest request, HttpServletResponse response, ReviewBoardDTO reviewBoardDTO)
			throws IOException {

		String cp = request.getContextPath();

		// 쿠키 가져오기
		// id 쿠키
		Cookie[] userId = request.getCookies();
		String id = "";

		if (userId != null) {
			for (int i = 0; i < userId.length; i++) {
				if (userId[i].getName().equals("userId")) {
					id = userId[i].getValue();
				}
			}
		}

		ModelAndView mav = new ModelAndView();

		String performCode = request.getParameter("performCode");

		PosterDTO p_dto = PosterDAO.getReadData(performCode);
		PayDTO pay_dto = PosterDAO.getPayData(performCode);
		List<PerformDetailDTO> lists = PosterDAO.getDetailImageData(performCode);
		List<Map<String, Object>> infoMap = PosterDAO.infoMap(performCode);
		List<ReviewBoardDTO> review_lists = PosterDAO.listData(performCode);

		// System.out.println("mapx : " + infoMap.get(0).get("PLACEMAPX"));

		// performcode 쿠키 생성
		Cookie p_performCode = new Cookie("performcode", performCode);
		p_performCode.setMaxAge(600);
		p_performCode.setPath("/ticketing");
		response.addCookie(p_performCode);

		int dataCount = PosterDAO.dataCount(performCode);

		mav.setViewName("poster");

		mav.addObject("p_dto", p_dto);
		mav.addObject("pay_dto", pay_dto);
		mav.addObject("lists", lists);
		mav.addObject("MapX", infoMap.get(0).get("PLACEMAPX"));
		mav.addObject("MapY", infoMap.get(0).get("PLACEMAPY"));
		mav.addObject("review_lists", review_lists);
		mav.addObject("dataCount", dataCount);
		mav.addObject("cookieid", id);

		return mav;

	}

	@RequestMapping(value = "/insert/review", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView setReview(HttpServletRequest request, @RequestParam String subject, @RequestParam String score, 
			@RequestParam String message) throws IOException {
		ModelAndView mav = new ModelAndView();
		ReviewBoardDTO reviewBoardDTO = new ReviewBoardDTO();
		String performCode = request.getParameter("performCode");

		Cookie[] userId = request.getCookies();
		String id = "";

		if (userId != null) {
			for (int i = 0; i < userId.length; i++) {
				if (userId[i].getName().equals("userId")) {
					id = userId[i].getValue();
				}
			}
		}

		// performcode쿠키
		Cookie[] cookies = request.getCookies();
		String performcode = "";

		if (cookies != null) {
			for (Cookie cookie : cookies) {

				if (cookie.getName().equals("performcode")) {
					performcode = cookie.getValue();
				}
			}
		}

		System.out.println("퍼코:" + performcode);
		int maxNum = PosterDAO.reviewMaxNum();
		reviewBoardDTO.setBoardNum(maxNum + 1);
		reviewBoardDTO.setMessage(message);
		reviewBoardDTO.setSubject(subject);
		reviewBoardDTO.setScore(score);
		reviewBoardDTO.setPerformCode(performcode);
		reviewBoardDTO.setUserId(id);

		PosterDAO.insertData(reviewBoardDTO);
		// 후기 등록

		// 전체데이터갯수
		int dataCount = PosterDAO.dataCount(performcode);

		List<ReviewBoardDTO> review_lists = PosterDAO.listData(performcode);

		mav.setViewName("reviewBoard");
		mav.addObject("review_lists", review_lists);

		mav.addObject("dataCount", dataCount);
		request.setAttribute("review_lists", review_lists);

		return mav;

	}
	
	@RequestMapping(value = "/delete/review", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteReview(HttpServletRequest request, HttpServletResponse response, @RequestParam int boardNum) throws IOException {
		String userId = HttpUtils.getUserId(request);
		int dataCount =0;
		String performcode = HttpUtils.getPerformCode(request);
		if(userId.equals("") || userId == null) { //로그인이 되어있지 않을 때
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.');</script>");
			return new ModelAndView("login");
		}
		
		ModelAndView mav = new ModelAndView();
		if(userId.equals("어떤값")) { //쿠키와 userId가 같지않을때
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다.');</script>");
			
		}
		else { //같을 때
			//삭제하는 dao메서드 호출
			ReviewBoardDTO review = new ReviewBoardDTO();		
			review.setBoardNum(boardNum);
			review.setPerformCode(performcode);
			
			System.out.println(boardNum + " " + performcode);
			PosterDAO.deleteData(review);
			List<ReviewBoardDTO> review_lists = PosterDAO.listData(performcode);
			dataCount = review_lists.size();
			mav.addObject("dataCount",dataCount);
			//mav.setViewName("reviewBoard");
			mav.setViewName("reviewReply");
			mav.addObject("review_lists",review_lists);
		}
		
		return mav;

	}
	
	@RequestMapping(value = "/start/review", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView startReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		int dataCount =0;
		String performcode = HttpUtils.getPerformCode(request);
	
		ModelAndView mav = new ModelAndView();
		
		
		ReviewBoardDTO review = new ReviewBoardDTO();
		//review.setBoardNum(boardNum);
		review.setPerformCode(performcode);
		List<ReviewBoardDTO> review_lists = PosterDAO.listData(performcode);
		dataCount = review_lists.size();
		mav.addObject("dataCount",dataCount);
		//mav.setViewName("reviewBoard");
		mav.setViewName("reviewReply");
		mav.addObject("review_lists",review_lists);
		
		mav.setViewName("reviewReply");
		return mav;
	}
	
}
