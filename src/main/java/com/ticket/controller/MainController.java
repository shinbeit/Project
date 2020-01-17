package com.ticket.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ticket.util.HttpUtils;
import com.ticket.util.MyUtil;
import com.ticket.dao.MainDAO;
import com.ticket.dto.CompanyMainDTO;
import com.ticket.dto.GenreDTO;
import com.ticket.dto.MainListDTO;
import com.ticket.dto.PlaceDTO;
import com.ticket.dto.PreservedTicketDTO;
import com.ticket.dto.RatingDTO;
import com.ticket.dto.UserMainDTO;

@Controller
public class MainController {

	@Autowired
	@Qualifier("mainDAO")
	MainDAO dao;
	@Resource
	MyUtil myUtil;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String main(Locale locale, Model model) {

		// return "newMyPage";
		return "redirect:/main.action";

	}

	/*
	 * //ù ���� ȭ��
	 * 
	 * @RequestMapping(value = "/main.action", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String mainPage(Locale locale, Model model,
	 * HttpServletRequest request, MainListDTO mainListDTO, HttpSession session)
	 * throws Exception {
	 * 
	 * Cookie[] userId = request.getCookies(); String id = "";
	 * 
	 * if (userId != null) { for (int i = 0; i < userId.length; i++) { if
	 * (userId[i].getName().equals("userId")) { id = userId[i].getValue(); } } }
	 * 
	 * //���⼭ ����
	 * 
	 * String cp = request.getContextPath(); String pageNum =
	 * request.getParameter("pageNum"); int currentPage = 1;
	 * 
	 * if(pageNum!=null) currentPage = Integer.parseInt(pageNum); String genreCode =
	 * request.getParameter("genreCode"); String searchValue =
	 * request.getParameter("searchValue");
	 * 
	 * if(genreCode==null) {
	 * 
	 * genreCode = ""; searchValue = "";
	 * 
	 * }else {
	 * 
	 * if(request.getMethod().equalsIgnoreCase("GET")) searchValue =
	 * URLDecoder.decode(searchValue, "UTF-8");
	 * 
	 * }
	 * 
	 * int dataCount = dao.getDataCount(genreCode,searchValue); int numPerPage = 6;
	 * int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	 * 
	 * if(currentPage>totalPage) currentPage = totalPage;
	 * 
	 * int start = (currentPage-1)*numPerPage+1; int end = currentPage*numPerPage;
	 * 
	 * List<MainListDTO> lists = dao.getList(genreCode, searchValue);
	 * List<MainListDTO> mtlists = dao.mtgetList(genreCode, searchValue);
	 * List<MainListDTO> cclists = dao.ccgetList(genreCode, searchValue);
	 * List<MainListDTO> eclists = dao.ecgetList(genreCode, searchValue);
	 * List<GenreDTO> genreList = dao.selectGenreData();
	 * 
	 * session = request.getSession(); String root =
	 * session.getServletContext().getRealPath("/"); System.out.println(root);
	 * String savePath = "D://image"; System.out.println(savePath); String param =
	 * "";
	 * 
	 * if(!searchValue.equals("")) {
	 * 
	 * param = "genreCode=" + genreCode; param += "&searchValue=" +
	 * URLEncoder.encode(searchValue, "UTF-8");
	 * 
	 * }
	 * 
	 * String listUrl = cp + "/list.action";
	 * 
	 * if(!param.equals("")) {
	 * 
	 * listUrl = listUrl + "?" + param;
	 * 
	 * }
	 * 
	 * String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	 * 
	 * UserMainDTO dto = dao.myPageReadData(HttpUtils.getUserId(request));
	 * CompanyMainDTO c_dto =
	 * dao.myPageCompanyReadData(HttpUtils.getUserId(request));
	 * request.setAttribute("userMainDTO", dto);
	 * request.setAttribute("companyMainDTO", c_dto);
	 * 
	 * /////////////////////////////////////////////////////////////////////////////
	 * ///////////////////////////////// if(dto != null) {
	 * 
	 * request.setAttribute("success", HttpUtils.getUserId(request));
	 * System.out.println(dto.getNum());
	 * 
	 * }if(c_dto != null) {
	 * 
	 * request.setAttribute("c_success", HttpUtils.getUserId(request));
	 * 
	 * }
	 * /////////////////////////////////////////////////////////////////////////////
	 * /////////////////////////////////
	 * 
	 * request.setAttribute("genreList", genreList);
	 * request.setAttribute("savePath", savePath); request.setAttribute("lists",
	 * lists); request.setAttribute("mtlists", mtlists);
	 * request.setAttribute("cclists", cclists); request.setAttribute("eclists",
	 * eclists); request.setAttribute("pageIndexList", pageIndexList);
	 * request.setAttribute("dataCount", dataCount); request.setAttribute("success",
	 * id);
	 * 
	 * return "main";
	 * 
	 * }
	 */
	// ù ���� ȭ��
	@RequestMapping(value = "/main.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainPage(Locale locale, Model model, HttpServletRequest request, MainListDTO mainListDTO,
			HttpSession session) throws Exception {

		Cookie[] userId = request.getCookies();
		String id = "";

		if (userId != null) {
			for (int i = 0; i < userId.length; i++) {
				if (userId[i].getName().equals("userId")) {
					id = userId[i].getValue();
				}
			}
		}
		session = request.getSession();
		System.out.println("ip :" + session.getAttribute("userIP"));
		System.out.println("id :" + session.getAttribute("userID"));

		// ���⼭ ����

		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		String genreCode = request.getParameter("genreCode");
		String searchValue = request.getParameter("searchValue");

		if (genreCode == null) {

			genreCode = "";
			searchValue = "";

		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		int dataCount = dao.getDataCount(genreCode, searchValue);
		int numPerPage = 6;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		/*
		 * List<MainListDTO> lists = dao.getList(genreCode, searchValue);
		 * List<MainListDTO> mtlists = dao.mtgetList(); List<MainListDTO> cclists =
		 * dao.ccgetList(); List<MainListDTO> eclists = dao.ecgetList(); List<GenreDTO>
		 * genreList = dao.selectGenreData();
		 */

		// List<MainListDTO> lists = dao.getList(genreCode, searchValue);
		List<MainListDTO> mtlists = dao.mtgetList(genreCode, searchValue);
		List<MainListDTO> cclists = dao.ccgetList(genreCode, searchValue);
		List<MainListDTO> eclists = dao.ecgetList(genreCode, searchValue);
		List<GenreDTO> genreList = dao.selectGenreData();

		session = request.getSession();
		String root = session.getServletContext().getRealPath("/");
		System.out.println(root);
		String savePath = "D://image";
		System.out.println(savePath);
		String param = "";

		if (!searchValue.equals("")) {

			param = "genreCode=" + genreCode;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

		}

		String listUrl = cp + "/list.action";

		if (!param.equals("")) {

			listUrl = listUrl + "?" + param;

		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		UserMainDTO dto = dao.myPageReadData(HttpUtils.getUserId(request));
		CompanyMainDTO c_dto = dao.myPageCompanyReadData(HttpUtils.getUserId(request));
		request.setAttribute("userMainDTO", dto);
		request.setAttribute("companyMainDTO", c_dto);

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		if (dto != null) {

			request.setAttribute("success", HttpUtils.getUserId(request));
			System.out.println(dto.getNum());

		}
		if (c_dto != null) {

			request.setAttribute("c_success", HttpUtils.getUserId(request));

		}
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////

		request.setAttribute("genreList", genreList);
		request.setAttribute("savePath", savePath);
		/* request.setAttribute("lists", lists); */
		request.setAttribute("mtlists", mtlists);
		request.setAttribute("cclists", cclists);
		request.setAttribute("eclists", eclists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("success", id);

		return "main";

	}

	// �α��� ȭ�� (�Ϲ�ȸ��)
	@RequestMapping(value = "/userLogin.action", method = { RequestMethod.GET, RequestMethod.POST }) // �Ϲݻ���� �α���
	public ModelAndView userLogin(HttpServletRequest request, HttpServletResponse response, UserMainDTO userMainDTO) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("userLogin");

		return mav;

	}

	// �α��� ȭ�� (���ȸ��)
	@RequestMapping(value = "/companyLogin.action", method = { RequestMethod.GET, RequestMethod.POST }) // �Ϲݻ���� �α���
	public ModelAndView companyLogin(HttpServletRequest request, HttpServletResponse response,
			CompanyMainDTO companyMainDTO) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("companyLogin");

		return mav;

	}

	// �α���_OK ȭ�� (�Ϲ�ȸ��)
	@RequestMapping(value = "/userLogin_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String userLogin_ok(HttpServletRequest request, HttpServletResponse response, Model model,
			UserMainDTO userMainDTO) throws ParseException {
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		
		userMainDTO = dao.myPageReadData(userId);
		
		String rawPassword= request.getParameter("userPwd");; //�Էµ� ��й�ȣ
		String encodedPassword = userMainDTO.getUserPwd(); // DB�� ����� ��й�ȣ
		if(bcryptPasswordEncoder.matches(rawPassword, encodedPassword )){
		System.out.println("�������� ��ġ");

		}else{
		request.setAttribute("message", "���̵� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���");	
		System.out.println("�������� ����ġ");
		return "userLogin";
		}


		/*
		 * boolean passMatch = bcryptPasswordEncoder.matches(userPwd,
		 * userMainDTO.getUserPwd());
		 * 
		 * if (userMainDTO == null || !userMainDTO.getUserId().equals(userId) ||
		 * !userMainDTO.getUserPwd().equals(rawPassword)) {
		 * 
		 * request.setAttribute("message", "���̵� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���"); return
		 * "userLogin";
		 * 
		 * }
		 */

		userMainDTO.setUserIPAddr(request.getRemoteAddr());

		session.setAttribute("userID", userId);
		session.setAttribute("userIP", userMainDTO.getUserIPAddr());

		Cookie u_userId = new Cookie("userId", userId);
		u_userId.setMaxAge(3000);
		u_userId.setPath("/ticketing");
		response.addCookie(u_userId);

		// ---------����ȯ �߰�------------//

		Date today = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date userUpdateDate = dateFormat.parse(userMainDTO.getUserUpdateDate());
		long diffDate = (userUpdateDate.getTime() - today.getTime()) / (24 * 60 * 60 * 1000);
		int diffValue = Math.abs((int) diffDate);

		// System.out.println(diffValue);
		if (diffValue >= 30) {
			request.setAttribute("userMainDTO", userMainDTO);
			return "pwdChangePage";
		}

		// ---------����ȯ �߰�------------//
		return "redirect:/main.action";

	}

	// �α���_OK ȭ�� (���ȸ��)
	@RequestMapping(value = "/companyLogin_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String companyLogin_ok(HttpServletRequest request, HttpServletResponse response,
			CompanyMainDTO companyMainDTO, Model model) {

		String companyId = request.getParameter("companyId");
		String companyPwd = request.getParameter("companyPwd");

		companyMainDTO = dao.myPageCompanyReadData(companyId);

		if (companyMainDTO == null || !companyMainDTO.getCompanyId().equals(companyId)
				|| !companyMainDTO.getCompanyPwd().equals(companyPwd)) {
			request.setAttribute("message", "���̵� �Ǵ� �н����带 ��Ȯ�� �Է��ϼ���");
			return "redirect:/companyLogin.action";
		}

		companyMainDTO.setCompanyIPAddr(request.getRemoteAddr());

		HttpSession session = request.getSession();
		session.setAttribute("userID", companyId);
		session.setAttribute("userIP", companyMainDTO.getCompanyIPAddr());

		Cookie u_userId = new Cookie("userId", companyId);
		u_userId.setMaxAge(600);
		u_userId.setPath("/ticketing");
		response.addCookie(u_userId);
		return "redirect:/main.action";

	}

	// �α׾ƿ� ȭ��
	@RequestMapping(value = "/logout.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpServletRequest request, HttpServletResponse response, UserMainDTO userMainDTO) {

		Cookie cookie = new Cookie("userId", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		return "redirect:/main.action";

	}

	// �α׾ƿ� ȭ��
	@RequestMapping(value = "/companyLogout.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String companyLogout(HttpServletRequest request, HttpServletResponse response,
			CompanyMainDTO CompanyMainDTO) {

		Cookie cookie = new Cookie("userId", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		return "main";

	}

	// ȸ������ ȭ�� (�Ϲ�ȸ��)
	@RequestMapping(value = "/userSignUp.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userSignUp(HttpServletRequest request, HttpServletResponse response, UserMainDTO userMainDTO) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("userSignUp");
		return mav;

	}

	// ȸ������_OK ȭ�� (�Ϲ�ȸ��)
	@RequestMapping(value = "/userSignUp_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String userSignUp_ok(HttpServletRequest request, HttpServletResponse response, UserMainDTO userMainDTO) {

		int maxNum = 0;
		userMainDTO.setNum(maxNum + 1);
		userMainDTO.setUserPwd(this.bcryptPasswordEncoder.encode(userMainDTO.getUserPwd()));
		dao.insertUserSignUpData(userMainDTO);
		return "userLogin";

	}

	// ȸ������ ȭ�� (���ȸ��)
	@RequestMapping(value = "/companySignUp.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView companySignUp(HttpServletRequest request, HttpServletResponse response,
			CompanyMainDTO companyMainDTO) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("companySignUp");
		return mav;

	}

	// ȸ������_OK ȭ�� (���ȸ��)
	@RequestMapping(value = "/companySignUp_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String companySignUp_ok(HttpServletRequest request, HttpServletResponse response,
			CompanyMainDTO companyMainDTO) {

		dao.insertCompanySignUpData(companyMainDTO);
		int maxNum = 0;
		companyMainDTO.setNum(maxNum + 1);
		companyMainDTO.setCompanyPwd(this.bcryptPasswordEncoder.encode(companyMainDTO.getCompanyPwd()));
		return "companyLogin";

	}

	// ���������� ȭ��(����)
	@RequestMapping(value = "/myPage.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage(HttpServletRequest request, HttpServletResponse response, Model model) {

		Cookie[] userId = request.getCookies();
		String id = "";

		if (userId != null) {
			for (int i = 0; i < userId.length; i++) {
				if (userId[i].getName().equals("userId")) {
					id = userId[i].getValue();
				}
			}
		}

		String companyId = request.getParameter("companyId");
		System.out.println(companyId + "+++++++++++++++++++++++++++++++++");

		UserMainDTO dto = dao.myPageReadData(HttpUtils.getUserId(request));
		CompanyMainDTO c_dto = dao.myPageCompanyReadData(HttpUtils.getUserId(request));
		List<PreservedTicketDTO> p_dto = dao.myTicketList(id);

		// System.out.println("�¼���ȣ:" + p_dto.get(0).getSeatNum());

		request.setAttribute("userMainDTO", dto);
		request.setAttribute("companyMainDTO", c_dto);

		if (dto != null) {
			request.setAttribute("success", HttpUtils.getUserId(request));
			System.out.println(dto.getNum());
		}

		if (c_dto != null) {
			request.setAttribute("c_success", HttpUtils.getUserId(request));
			List<Map<String, Object>> lists = dao.selectPerformList(c_dto.getCompanyId());
			request.setAttribute("performLists", lists);

			List<GenreDTO> genreList = dao.selectGenreData();
			List<PlaceDTO> placeList = dao.selectPlaceData();
			List<RatingDTO> ratingList = dao.selectRatingData();

			request.setAttribute("genreList", genreList);
			request.setAttribute("placeList", placeList);
			request.setAttribute("ratingList", ratingList);

		}
		// System.out.println("p_dto.size:" + p_dto.size());
		request.setAttribute("preserved_list", p_dto);
		return "myPage";

	}

	// ����������_OK ȭ�� (����)
	@RequestMapping(value = "/myPage_ok.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage_pk(HttpServletRequest request, HttpServletResponse response, Model model,
			UserMainDTO userMainDTO, CompanyMainDTO companyMainDTO) throws Exception {

		UserMainDTO dto = dao.myPageReadData(HttpUtils.getUserId(request));
		CompanyMainDTO c_dto = dao.myPageCompanyReadData(HttpUtils.getUserId(request));
		request.setAttribute("userMainDTO", dto);
		request.setAttribute("companyMainDTO", c_dto);

		if (dto != null) {
			dao.updateUserData(userMainDTO);
		}

		if (c_dto != null) {
			dao.updateCompanyData(companyMainDTO);
		}

		return "redirect:/main.action";

	}

	// ȸ������_OK ȭ�� (�Ϲ�ȸ��)
	@RequestMapping(value = "/idCheck.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView idCheck(HttpServletRequest request, HttpServletResponse response, UserMainDTO userMainDTO,
			Model model) {

		ModelAndView mav = new ModelAndView();

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");

		mav.setViewName("userSignUp");
		if (dao.idCheck(userId) == null) {

			mav.addObject("message", "     " + userId + "�� ��� ������ ���̵��Դϴ�.");
			return mav;

		}

		userId = dao.idCheck(userId);
		mav.addObject("message", "     " + userId + "�� ��� ���� ���̵��Դϴ�.");
		model.addAttribute("userMainDTO", userMainDTO);
		request.setAttribute("userMainDTO", userMainDTO);

		return mav;

	}

	// ȸ������_OK ȭ�� (���ȸ��)
	@RequestMapping(value = "/companyIdCheck.action", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView companyIdCheck(HttpServletRequest request, HttpServletResponse response,
			CompanyMainDTO companyMainDTO, Model model) {

		ModelAndView mav = new ModelAndView();

		String companyId = request.getParameter("companyId");
		String companyPwd = request.getParameter("companyPwd");

		mav.setViewName("companySignUp");
		if (dao.companyIdCheck(companyId) == null) {

			mav.addObject("message", "     " + companyId + "�� ��� ������ ���̵��Դϴ�.");
			return mav;

		}

		companyId = dao.companyIdCheck(companyId);
		mav.addObject("message", "     " + companyId + "�� ��� ���� ���̵��Դϴ�.");
		model.addAttribute("companyMainDTO", companyMainDTO);
		request.setAttribute("companyMainDTO", companyMainDTO);

		return mav;

	}

	@RequestMapping(value = "/mainList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		Cookie[] userId = request.getCookies();
		String id = "";

		if (userId != null) {
			for (int i = 0; i < userId.length; i++) {
				if (userId[i].getName().equals("userId")) {
					id = userId[i].getValue();
				}
			}
		}

		UserMainDTO dto = dao.myPageReadData(HttpUtils.getUserId(request));
		CompanyMainDTO c_dto = dao.myPageCompanyReadData(HttpUtils.getUserId(request));
		request.setAttribute("userMainDTO", dto);
		request.setAttribute("companyMainDTO", c_dto);
		if (dto != null) {
			request.setAttribute("success", HttpUtils.getUserId(request));
		}
		if (c_dto != null) {
			request.setAttribute("c_success", HttpUtils.getUserId(request));
		}

		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");

		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		String genreCode = request.getParameter("genreCode");
		String searchValue = request.getParameter("searchValue");

		if (genreCode == null) {

			genreCode = "";
			searchValue = "";

		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		// ��ü�����Ͱ���
		int dataCount = dao.getDataCount(genreCode, searchValue);

		// ��ü��������
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<MainListDTO> mainLists = dao.getMainList(genreCode, searchValue);
		List<GenreDTO> genreList = dao.selectGenreData();

		/* List<MainListDTO> lists = dao.getList(genreCode, searchValue); */

		// ����¡ ó��
		String param = "";
		if (!searchValue.equals("")) {
			param = "genreCode=" + genreCode;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/mainList.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		// �ۺ��� �ּ� ����
		String articleUrl = cp + "/poster.action";

		if (!param.equals(""))
			articleUrl = articleUrl + "&" + param;

		// ������ �� �������� �����͸� �ѱ��
		request.setAttribute("genreList", genreList);
		request.setAttribute("mainLists", mainLists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);
		request.setAttribute("success", id);

		return "mainList";

	}

	@RequestMapping(value = "/mainccList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainccList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		Cookie[] userId = request.getCookies();
		String id = "";

		if (userId != null) {
			for (int i = 0; i < userId.length; i++) {
				if (userId[i].getName().equals("userId")) {
					id = userId[i].getValue();
				}
			}
		}

		UserMainDTO dto = dao.myPageReadData(HttpUtils.getUserId(request));
		CompanyMainDTO c_dto = dao.myPageCompanyReadData(HttpUtils.getUserId(request));
		request.setAttribute("userMainDTO", dto);
		request.setAttribute("companyMainDTO", c_dto);
		if (dto != null) {
			request.setAttribute("success", HttpUtils.getUserId(request));
		}
		if (c_dto != null) {
			request.setAttribute("c_success", HttpUtils.getUserId(request));
		}

		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");

		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		String genreCode = request.getParameter("genreCode");
		String searchValue = request.getParameter("searchValue");

		if (genreCode == null) {

			genreCode = "";
			searchValue = "";

		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		// ��ü�����Ͱ���
		int dataCount = dao.getDataCount(genreCode, searchValue);

		// ��ü��������
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<MainListDTO> mainLists = dao.getMainList(genreCode, searchValue);
		List<MainListDTO> ccLists = dao.ccgetList(genreCode, searchValue);
		List<GenreDTO> genreList = dao.selectGenreData();

		// ����¡ ó��
		String param = "";
		if (!searchValue.equals("")) {
			param = "genreCode=" + genreCode;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/mainList.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		// �ۺ��� �ּ� ����
		String articleUrl = cp + "/poster.action";

		if (!param.equals(""))
			articleUrl = articleUrl + "&" + param;

		// ������ �� �������� �����͸� �ѱ��
		request.setAttribute("mainLists", mainLists);
		request.setAttribute("genreList", genreList);
		request.setAttribute("ccLists", ccLists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);
		request.setAttribute("success", id);

		return "mainccList";

	}

	@RequestMapping(value = "/mainmtList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainmtList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		Cookie[] userId = request.getCookies();
		String id = "";

		if (userId != null) {
			for (int i = 0; i < userId.length; i++) {
				if (userId[i].getName().equals("userId")) {
					id = userId[i].getValue();
				}
			}
		}

		UserMainDTO dto = dao.myPageReadData(HttpUtils.getUserId(request));
		CompanyMainDTO c_dto = dao.myPageCompanyReadData(HttpUtils.getUserId(request));
		request.setAttribute("userMainDTO", dto);
		request.setAttribute("companyMainDTO", c_dto);
		if (dto != null) {
			request.setAttribute("success", HttpUtils.getUserId(request));
		}
		if (c_dto != null) {
			request.setAttribute("c_success", HttpUtils.getUserId(request));
		}

		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");

		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		String genreCode = request.getParameter("genreCode");
		String searchValue = request.getParameter("searchValue");

		if (genreCode == null) {

			genreCode = "";
			searchValue = "";

		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		// ��ü�����Ͱ���
		int dataCount = dao.getDataCount(genreCode, searchValue);

		// ��ü��������
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<MainListDTO> mainLists = dao.getMainList(genreCode, searchValue);
		List<MainListDTO> mtLists = dao.mtgetList(genreCode, searchValue);
		List<GenreDTO> genreList = dao.selectGenreData();

		// ����¡ ó��
		String param = "";
		if (!searchValue.equals("")) {
			param = "genreCode=" + genreCode;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/mainList.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		// �ۺ��� �ּ� ����
		String articleUrl = cp + "/poster.action";

		if (!param.equals(""))
			articleUrl = articleUrl + "&" + param;

		// ������ �� �������� �����͸� �ѱ��
		request.setAttribute("mainLists", mainLists);
		request.setAttribute("genreList", genreList);
		request.setAttribute("mtLists", mtLists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);
		request.setAttribute("success", id);

		return "mainmtList";

	}

	@RequestMapping(value = "/mainecList.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String mainecList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		Cookie[] userId = request.getCookies();
		String id = "";

		if (userId != null) {
			for (int i = 0; i < userId.length; i++) {
				if (userId[i].getName().equals("userId")) {
					id = userId[i].getValue();
				}
			}
		}

		UserMainDTO dto = dao.myPageReadData(HttpUtils.getUserId(request));
		CompanyMainDTO c_dto = dao.myPageCompanyReadData(HttpUtils.getUserId(request));
		request.setAttribute("userMainDTO", dto);
		request.setAttribute("companyMainDTO", c_dto);
		if (dto != null) {
			request.setAttribute("success", HttpUtils.getUserId(request));
		}
		if (c_dto != null) {
			request.setAttribute("c_success", HttpUtils.getUserId(request));
		}

		String cp = request.getContextPath();
		String pageNum = request.getParameter("pageNum");

		int currentPage = 1;

		if (pageNum != null)
			currentPage = Integer.parseInt(pageNum);

		String genreCode = request.getParameter("genreCode");
		String searchValue = request.getParameter("searchValue");

		if (genreCode == null) {

			genreCode = "";
			searchValue = "";

		} else {

			if (request.getMethod().equalsIgnoreCase("GET"))
				searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		// ��ü�����Ͱ���
		int dataCount = dao.getDataCount(genreCode, searchValue);

		// ��ü��������
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);

		if (currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		List<MainListDTO> mainLists = dao.getMainList(genreCode, searchValue);
		List<MainListDTO> ecLists = dao.ecgetList(genreCode, searchValue);
		List<GenreDTO> genreList = dao.selectGenreData();

		// ����¡ ó��
		String param = "";
		if (!searchValue.equals("")) {
			param = "genreCode=" + genreCode;
			param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		String listUrl = cp + "/mainList.action";
		if (!param.equals("")) {
			listUrl = listUrl + "?" + param;
		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		// �ۺ��� �ּ� ����
		String articleUrl = cp + "/poster.action";

		if (!param.equals(""))
			articleUrl = articleUrl + "&" + param;

		// ������ �� �������� �����͸� �ѱ��
		request.setAttribute("mainLists", mainLists);
		request.setAttribute("genreList", genreList);
		request.setAttribute("ecLists", ecLists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);
		request.setAttribute("success", id);

		return "mainecList";

	}

	// ������ ���� ���� (���ȸ��)
	@RequestMapping(value = "/companyPerformDelete.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String companyPerformDelete(HttpServletRequest request, HttpServletResponse response, Model model) {

		dao.deletePerformData(request.getParameter("performCode"));

		return "redirect:/myPage.action";

	}

	// ����� ��й�ȣ ����
	@RequestMapping(value = "/userPwdChange.action", method = { RequestMethod.POST })
	public String userPwdChange(HttpServletRequest request, HttpServletResponse response, Model model) {

		dao.updateUserPwd(request.getParameter("userId"), request.getParameter("userPwd"));

		return "redirect:/main.action";

	}

	// ����� ������� ����
	@RequestMapping(value = "/userDateUpdate.action", method = { RequestMethod.POST })
	public String userDateUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = df.parse(request.getParameter("userUpdateDate"));
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 30);

		dao.updateUserDate(request.getParameter("userId"), cal.getTime());

		return "redirect:/main.action";

	}

}
