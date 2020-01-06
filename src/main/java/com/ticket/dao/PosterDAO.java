package com.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ticket.dto.MainListDTO;
import com.ticket.dto.PayDTO;
import com.ticket.dto.PerformDetailDTO;
import com.ticket.dto.PosterDTO;
import com.ticket.dto.ReviewBoardDTO;
import com.ticket.dto.SelectedTicketDTO;
import com.ticket.dto.UserMainDTO;

public class PosterDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception {

		this.sessionTemplate = sessionTemplate;

	}

	public PosterDTO getReadData(String performCode) {
		try {
			PosterDTO p_dto = sessionTemplate.selectOne("ticketMapper.posterReadData", performCode);
			System.out.println("p_dto: " + p_dto.getGenreCode());
			System.out.println("read success");
			return p_dto;
		} catch (Exception e) {
			System.out.println("error");
			return null;
		}
	}

	// 가격정보
	public PayDTO getPayData(String performCode) {
		try {
			PayDTO pay_dto = sessionTemplate.selectOne("ticketMapper.payReadData", performCode);
			System.out.println("pay_dto: " + pay_dto.getRclass());
			return pay_dto;
		} catch (Exception e) {
			return null;
		}

	}

	// 상세정보 이미지
	public List<PerformDetailDTO> getDetailImageData(String performCode) {
		try {
			List<PerformDetailDTO> detailImage_dto = sessionTemplate.selectList("ticketMapper.detailImageRead",
					performCode);
			return detailImage_dto;
		} catch (Exception e) {
			return null;
		}

	}

	// Map 좌표값
	public List<Map<String, Object>> infoMap(String performCode) {
		List<Map<String, Object>> lists = sessionTemplate.selectList("ticketMapper.infoMap", performCode);
		return lists;
	}

	// 관람후기 게시판

	// 1.boardNum 최대값
	public int reviewMaxNum() {
		return sessionTemplate.selectOne("ticketMapper.reviewMaxNum");
	}

	// 2.insert
	public void insertData(ReviewBoardDTO reviewBoardDTO) {

		sessionTemplate.insert("ticketMapper.insertData", reviewBoardDTO);
	}

	public List<ReviewBoardDTO> listData(String performCode) {
		List<ReviewBoardDTO> review_list = sessionTemplate.selectList("ticketMapper.listData", performCode);

		// System.out.println("msg:" + review_list.get(0).getMessage());
		return review_list;
	}

	/*
	 * public List<ReviewBoardDTO> listData(int start,int end, String performCode) {
	 * 
	 * HashMap<String, Object> params = new HashMap<String, Object>();
	 * params.put("start", start); params.put("end", end); params.put("performCode",
	 * performCode);
	 * 
	 * List<ReviewBoardDTO> review_list =
	 * sessionTemplate.selectList("ticketMapper.listData", params); //
	 * System.out.println("msg:" + review_list.get(0).getMessage()); return
	 * review_list; }
	 */

//	// 3.select
//	public List<ReviewBoardDTO> listData(int start, int end) {
//
//		HashMap<String, Object> params = new HashMap<String, Object>();
//
//		params.put("start", start);
//		params.put("end", end);
//	
//		List<ReviewBoardDTO> lists = sessionTemplate.selectList("ticketMapper.listData", params);
//
//		return lists;
//
//	}

	// 4.delete
	public void deleteData(ReviewBoardDTO review ) {
		System.out.println("ㅎㅇ");
		sessionTemplate.delete("ticketMapper.deleteData",review);

	}

	// 5.datacount
	public int dataCount(String performcode) {

		return sessionTemplate.selectOne("ticketMapper.dataCount", performcode);

	}

}
