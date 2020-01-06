package com.ticket.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.ticket.dto.CompanyMainDTO;
import com.ticket.dto.GenreDTO;
import com.ticket.dto.MainListDTO;
import com.ticket.dto.PlaceDTO;
import com.ticket.dto.PreservedTicketDTO;
import com.ticket.dto.RatingDTO;
import com.ticket.dto.UserMainDTO;

public class MainDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception {
		this.sessionTemplate = sessionTemplate;

	}

	public int getMaxNum() {

		int maxNum = 0;
		maxNum = sessionTemplate.selectOne("mainMapper.maxNum");
		return maxNum;

	}

	public int getMaxCompanyNum() {

		int maxNum = 0;
		maxNum = sessionTemplate.selectOne("mainMapper.maxCompanyNum");
		return maxNum;

	}

	public void insertUserSignUpData(UserMainDTO userMainDTO) { // 일반 사용자 회원가입

		sessionTemplate.insert("mainMapper.insertUserSignUpData", userMainDTO);

	}

	public void insertCompanySignUpData(CompanyMainDTO companyMainDTO) { // 기업 회원 회원가입

		sessionTemplate.insert("mainMapper.insertCompanySignUpData", companyMainDTO);

	}

	public UserMainDTO myPageReadData(String userId) { // 일반회원 데이터 읽어오기

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		UserMainDTO userMainDTO = sessionTemplate.selectOne("mainMapper.myPageReadData", map);

		return userMainDTO;

	}

	public CompanyMainDTO myPageCompanyReadData(String companyId) { // 기업회원 데이터 읽어오기

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyId", companyId);
		CompanyMainDTO companyMainDTO = sessionTemplate.selectOne("mainMapper.myPageCompanyReadData", map);

		return companyMainDTO;

	}

	public String idCheck(String userId) { // 일반회원 아이디 체크(중복)

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		String idCheck = sessionTemplate.selectOne("mainMapper.idCheck", map);

		return idCheck;

	}

	public String companyIdCheck(String companyId) { // 기업회원 아이디 체크(중복)

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyId", companyId);
		String companyIdCheck = sessionTemplate.selectOne("mainMapper.companyIdCheck", map);

		return companyIdCheck;

	}

	public List<MainListDTO> mtgetList(String genreCode, String searchValue) {

		Map<String, Object> params = new HashMap<String, Object>();

		params.put("genreCode", genreCode);
		params.put("searchValue", searchValue);

		List<MainListDTO> mtlists = sessionTemplate.selectList("mainMapper.mtgetLists");

		return mtlists;

	}

	public List<MainListDTO> ccgetList(String genreCode, String searchValue) {

		Map<String, Object> params = new HashMap<String, Object>();

		params.put("genreCode", genreCode);
		params.put("searchValue", searchValue);

		List<MainListDTO> cclists = sessionTemplate.selectList("mainMapper.ccgetLists");

		return cclists;

	}

	public List<MainListDTO> ecgetList(String genreCode, String searchValue) {

		Map<String, Object> params = new HashMap<String, Object>();

		params.put("genreCode", genreCode);
		params.put("searchValue", searchValue);

		List<MainListDTO> eclists = sessionTemplate.selectList("mainMapper.ecgetLists");

		return eclists;

	}

	// 전체 데이터수 구하기
	public int getDataCount(String genreCode, String searchValue) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("genreCode", genreCode);
		params.put("searchValue", searchValue);

		int result = sessionTemplate.selectOne("mainMapper.getDataCount", params);

		return result;

	}

	public UserMainDTO updateUserData(UserMainDTO userMainDTO) {

		sessionTemplate.update("mainMapper.updateUserData", userMainDTO);
		return userMainDTO;

	}

	public CompanyMainDTO updateCompanyData(CompanyMainDTO companyMainDTO) {

		sessionTemplate.update("mainMapper.updateCompanyData", companyMainDTO);
		return companyMainDTO;

	}

	public List<MainListDTO> getMainList(String genreCode, String searchValue) {

		Map<String, Object> params = new HashMap<String, Object>();

		params.put("genreCode", genreCode);
		params.put("searchValue", searchValue);

		List<MainListDTO> mainLists = sessionTemplate.selectList("mainMapper.getMainLists", params);

		return mainLists;

	}

	public List<GenreDTO> selectGenreData() {
		List<GenreDTO> lists = sessionTemplate.selectList("mainMapper.selectGenreData");
		return lists;
	}

	// 김태환 추가
	public List<Map<String, Object>> selectPerformList(String companyId) {
		List<Map<String, Object>> lists = sessionTemplate.selectList("mainMapper.selectPerformList", companyId);
		return lists;
	}

	public void deletePerformData(String performCode) {
		sessionTemplate.delete("mainMapper.deletePerformData", performCode);
		sessionTemplate.delete("mainMapper.deletePerformInfoData", performCode);
		sessionTemplate.delete("mainMapper.deleteDetailData", performCode);
		sessionTemplate.delete("mainMapper.deleteSeatingData", performCode);
	}

	public List<PlaceDTO> selectPlaceData() {
		List<PlaceDTO> lists = sessionTemplate.selectList("performMapper.selectPlaceData");
		return lists;
	}

	public List<RatingDTO> selectRatingData() {
		List<RatingDTO> lists = sessionTemplate.selectList("performMapper.selectRatingData");
		return lists;
	}

	// 김태환 2차 추가
	public void updateUserDate(String userId, Date date) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userUpdateDate", date);

		sessionTemplate.update("mainMapper.updateUserDate", map);
	}

	public void updateUserPwd(String userId, String userPwd) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPwd", userPwd);

		sessionTemplate.update("mainMapper.updateUserPwd", map);
	}

	// 예매내역조회
	public List<PreservedTicketDTO> myTicketList(String userId) {
		List<PreservedTicketDTO> lists = sessionTemplate.selectList("mainMapper.myTicketList",userId);
		
		System.out.println("공연제목:" + lists.get(0).getPerformName());
		return lists;	

	}

}
