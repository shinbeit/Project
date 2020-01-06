package com.ticket.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Random;

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

import com.ticket.util.MyUtil;
import com.ticket.dao.SeatDAO;
import com.ticket.dao.SelectedTicketDAO;
import com.ticket.dto.MyCouponDTO;
import com.ticket.dto.SelectedTicketDTO;
import com.ticket.dto.UserInfoDTO;
import com.ticket.dto.AccountDTO;
import com.ticket.dto.AutoImageDTO;
import com.ticket.dto.CouponDataDTO;
import com.ticket.dto.DiscountDataDTO;
import com.ticket.dto.MyDiscountDTO;
import com.ticket.dto.PerformDTO;
import com.ticket.dto.PlaceDTO;
import com.ticket.dto.PreservedTicketDTO;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("selectedTicketDAO")
	SelectedTicketDAO selectedTicket;

	@Autowired
	@Qualifier("seatDAO")
	SeatDAO seat;
	
	@Autowired
	MyUtil myUtil;

	String cancelDate;
	
	@RequestMapping(value = "/dis", method = { RequestMethod.GET, RequestMethod.POST })
	public String dis(HttpServletRequest request, HttpServletResponse resp) {

		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		
		List<DiscountDataDTO> discountDataList = selectedTicket.discountDataList();
		
		request.setAttribute("discountDataList", discountDataList);
		
		return "discount";

	}
	
	@RequestMapping(value = "/download_check", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String download_check(HttpServletRequest request, HttpServletResponse resp) {
		
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		
		String discountCode = request.getParameter("discountCode");

		MyDiscountDTO mddto = new MyDiscountDTO();
		try {
			mddto = selectedTicket.selectMyDiscount(discountCode);
			
			
			
		} catch (Exception e) {
			mddto.setDiscountCode("0");
		}

		//���������� �� ���������ϱ� ����������
		if(mddto.getDiscountCode()=="0"||mddto.getDiscountCode().equals("0")) {
			return "thankyou";
		}else {
			return "error";
		}
	
	}
	
	@RequestMapping(value = "/download_discount", method = { RequestMethod.GET, RequestMethod.POST })
	public String download_discount(HttpServletRequest request, HttpServletResponse resp) {
		
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		
		String discountCode = request.getParameter("discountCode");
		
		DiscountDataDTO dddto = selectedTicket.selectDiscountDataDTO(discountCode);
		
		if(dddto.getAmount()!=0) {
			selectedTicket.updateDiscountData(dddto.getDiscountCode());
			selectedTicket.insertMyDiscount(dddto,ticket.getUserId());
		}else
			selectedTicket.deleteDiscountData(dddto.getDiscountCode());
		
		List<DiscountDataDTO> discountDataList = selectedTicket.discountDataList();
		
		request.setAttribute("discountDataList", discountDataList);
		
		return "discount";

	}

	@RequestMapping(value = "/step3", method = { RequestMethod.GET, RequestMethod.POST })
	public String step3(HttpServletRequest request, HttpServletResponse response) {

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
		PerformDTO performReaddto = selectedTicket.read_performData(performCode);
		PlaceDTO Read_placedto = selectedTicket.read_placeData(Integer.toString(performReaddto.getPerformPlaceCode()));
		SelectedTicketDTO ticket = new SelectedTicketDTO();
		ticket.setUserId(userId);
		ticket.setPerformCode(performCode);
		List<SelectedTicketDTO> list = selectedTicket.selectTicket(userId);
		SelectedTicketDTO dto = selectedTicket.readData(ticket);
		System.out.println("��¥�� �ð�"+dto.getSelectedDate()+", "+dto.getTime());
		int step = 3;

		// ����,���� ����Ʈ
		List<MyDiscountDTO> discountList = selectedTicket.MyDiscountList(userId);
		List<MyCouponDTO> couponList = selectedTicket.MyCouponList(userId);

		request.setAttribute("userId", userId);
		request.setAttribute("step", step);
		request.setAttribute("couponList", couponList);
		request.setAttribute("discountList", discountList);
		request.setAttribute("list", list);
		request.setAttribute("stdto", dto);
		request.setAttribute("Read_placedto", Read_placedto);
		request.setAttribute("performReaddto", performReaddto);
		return "step3";

	}

	@RequestMapping(value = "/use_discount", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView use_discount(@RequestParam int discountPrice,@RequestParam int inwon, HttpServletRequest request) {
		
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		System.out.println("use_discount����");
		ModelAndView mv = new ModelAndView();

		selectedTicket.input_discountPrice(ticket, discountPrice*inwon);
		ticket = selectedTicket.readData(ticket);
		System.out.println(ticket.getTicketPrice()+", "+ticket.getDiscountPrice());
		System.out.println("ticketprice: "+ticket.getTicketPrice());
		mv.setViewName("detail3");
		mv.addObject("stdto", ticket);

		request.setAttribute("stdto", ticket);

		return mv;

	}

	@RequestMapping(value = "/use_coupon", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView use_coupon(@RequestParam int couponPrice,@RequestParam int inwon, HttpServletRequest request) {
		
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		
		System.out.println("use_coupon����");
		ModelAndView mv = new ModelAndView();
		selectedTicket.input_couponPrice(ticket, couponPrice*inwon);
		ticket = selectedTicket.readData(ticket);
		System.out.println(ticket.getTicketPrice()+", "+ticket.getDiscountPrice());
		mv.setViewName("detail3");
		mv.addObject("stdto", ticket);

		request.setAttribute("stdto", ticket);

		return mv;

	}

	@RequestMapping(value = "/use_point", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView use_point(@RequestParam String pointPrice, HttpServletRequest request) {
		
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

		System.out.println("use_point����");
		ModelAndView mv = new ModelAndView();

		System.out.println("1.point: " + pointPrice);

		selectedTicket.input_point(userId, Integer.parseInt(pointPrice));
		List<SelectedTicketDTO> dto = selectedTicket.selectTicket(userId);

		System.out.println("2.point: " + ticket.getPointPrice());

		mv.setViewName("detail5");
		mv.addObject("stdto", ticket);

		request.setAttribute("stdto", dto);

		return mv;

	}

	@RequestMapping(value = "/allPointUse", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView allPointUse(@RequestParam String point, HttpServletRequest request) {
		
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		
		System.out.println("allPointUse����");
		ModelAndView mv = new ModelAndView();

		System.out.println("1.point: " + point);

		selectedTicket.input_couponPrice(ticket, Integer.parseInt(point));
		ticket = selectedTicket.readData(ticket);
		System.out.println("2.point: " + point);

		mv.setViewName("step5");
		mv.addObject("stdto", ticket);

		request.setAttribute("stdto", ticket);

		return mv;

	}

	// ���� ���
	@RequestMapping(value = "/coupon", method = { RequestMethod.GET, RequestMethod.POST })
	public String coupon(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);

		String couponCode = request.getParameter("couponCode");

		if (couponCode == null || couponCode.equals("")) {
			couponCode = "0";
		}

		// coupon��ȣ�� �´� ���αݾ� ã��(couponData����)
		CouponDataDTO cddto = new CouponDataDTO();
		try {
			cddto = selectedTicket.CouponSearch(couponCode);

			if (cddto == null || cddto.getcouponCode() == null || cddto.getcouponCode().equals("")) {
				cddto.setcouponCode("error");
			}

		} catch (Exception e) {
			cddto.setcouponCode("error");
			cddto.setCouponPrice(0);
		}

		// ���� ������ȣ�� ���� ��ȣ��� ��ȿ�����ʴٰ� �߱�
		String msg = "";
		if (cddto.getcouponCode().equals("error")) {

			msg = "��ȿ���� ���� ��ȣ�Դϴ�.";

			request.setAttribute("msg", msg);

			return "step3";
		}

		System.out.println("��ȿ�� ��ȣ�Դϴ�");

		// MyCouponDTO�� �ֱ�
		selectedTicket.input_MyCoupon(ticket.getUserId(), cddto);
		// CouponData���� ����
		selectedTicket.deleteCoupon(couponCode);

		return "redirect:/step3.action";

	}

	@RequestMapping(value = "/step4", method = RequestMethod.GET)
	public String step4(HttpServletRequest request, HttpServletResponse resp) {
		
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		PerformDTO performReaddto = selectedTicket.read_performData(ticket.getPerformCode());
		PlaceDTO Read_placedto = selectedTicket.read_placeData(Integer.toString(performReaddto.getPerformPlaceCode()));
		selectedTicket.home_delete(ticket);
		UserInfoDTO uidto = selectedTicket.selectUserInfo(ticket.getUserId());

		int goll = uidto.getuserEmail().indexOf("@");

		request.setAttribute("goll", goll);
		request.setAttribute("uidto", uidto);
		ticket = selectedTicket.readData(ticket);
//		List<SelectedTicketDTO> dto = selectedTicket.selectTicket(ticket.getUserId());
		request.setAttribute("Read_placedto", Read_placedto);
		request.setAttribute("performReaddto", performReaddto);
		request.setAttribute("stdto", ticket);
		request.setAttribute("step", "4");
		
		return "step4";

	}

	@RequestMapping(value = "/step5", method = RequestMethod.GET)
	public String header(HttpServletRequest request, HttpServletResponse resp) {
		
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		
		UserInfoDTO uidto = selectedTicket.selectUserInfo(ticket.getUserId());

		Random rd = new Random();

		int imageNum = rd.nextInt(6) + 1;

		AutoImageDTO aidto = selectedTicket.selectAutoImage(imageNum);
		ticket = selectedTicket.readData(ticket);
//		List<SelectedTicketDTO> dto = selectedTicket.selectTicket(ticket.getUserId());
		
		/*
		 * //��Ҹ������� cancelDate = seat.getSelectedDate(); int year =
		 * Integer.parseInt(cancelDate.substring(0,4)); int month =
		 * Integer.parseInt(cancelDate.substring(5,7)); int day =
		 * Integer.parseInt(cancelDate.substring(8,10));
		 * 
		 * day-=1;
		 * 
		 * if(day==0) {
		 * 
		 * if(month==1||month==5||month==7||month==8||month==10||month==12) day=30; else
		 * if(month==3) day=29; else day=31;
		 * 
		 * month-=1;
		 * 
		 * }
		 * 
		 * cancelDate = year+"�� "+month+"�� "+day+"�� 11:00����";
		 * 
		 * System.out.println("canceldate:" +cancelDate);
		 */
		PerformDTO performReaddto = selectedTicket.read_performData(ticket.getPerformCode());
		PlaceDTO Read_placedto = selectedTicket.read_placeData(Integer.toString(performReaddto.getPerformPlaceCode()));
		int point = uidto.getUserPoint();
		String flag = "";
		request.setAttribute("flag", flag);
		request.setAttribute("point", point);
		request.setAttribute("cancelDate", cancelDate);
		request.setAttribute("aidto", aidto);
		String check = "1";
		request.setAttribute("check", check);
		request.setAttribute("stdto", ticket);
		request.setAttribute("Read_placedto", Read_placedto);
		request.setAttribute("performReaddto", performReaddto);
		return "step5";
	}

	@RequestMapping(value = "/reloadImage", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String reloadImage(HttpServletRequest request) {
		// System.out.println("reloadImage����");
		// autoImage-start

		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		
		Random rd = new Random();

		int imageNum = rd.nextInt(6) + 1;
		System.out.println("imageNum: " + imageNum);

		AutoImageDTO aidto = selectedTicket.selectAutoImage(imageNum);

		// autoImage-end

		request.setAttribute("aidto", aidto);
		return aidto.getImagePath();

	}

	@RequestMapping(value = "autoPayPre", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String autoPayPre(@RequestParam String imageCode, @RequestParam String imagePath,
			HttpServletRequest request) {
		
		System.out.println("autoPayPre ����");
		System.out.println("imagePath: " + imagePath);
		AutoImageDTO aidto = selectedTicket.checkAutoImage(imagePath);

		String flag = "";

		if (imageCode.equals(aidto.getImageCode())) {
			// ������ ���� ����
			flag = "1";
		} else {
			flag = "0";
		}

		return flag;
	}

	@RequestMapping(value = "/laststep", method = { RequestMethod.GET,RequestMethod.POST })
	public String why(HttpServletRequest request, HttpServletResponse response) {
		
		SelectedTicketDTO ticket = MyUtil.setSelectedTicket(request);
		
		//�����Ϸ������ �� �������� �ߴϰ� db���� userid, performcode�� ���ؼ� finalpay=0�� �����͸�
		//remainData�� �����ͼ� isempty=1�� �����
		List<SelectedTicketDTO> list = seat.getSelectedTicket(ticket);
		for(SelectedTicketDTO dto : list) {
			System.out.println(dto.getUserId()+", "+dto.getPerformCode());
			if(dto.getSeatNum() == 0) {
				continue;
			}
			if(dto.getFinalPay() == 1 || dto.getFinalPay() == 2) {
				selectedTicket.deleteSelectedTicket(dto);
				continue;
			}
			System.out.println("�ð�: "+dto.getTime());
			PreservedTicketDTO preserve = new PreservedTicketDTO();
			preserve.setUserId(dto.getUserId());
			preserve.setPerformCode(dto.getPerformCode());
			PerformDTO perform = new PerformDTO();
			perform = selectedTicket.read_performData(dto.getPerformCode());
			System.out.println("�����̸�: "+perform.getPerformName());
			preserve.setPerformName(perform.getPerformName());
			preserve.setSeatRow(dto.getSeatRow());
			preserve.setSeatNum(dto.getSeatNum());
			System.out.println(dto.getSeatRow()+"�� "+dto.getSeatNum()+"��");
			preserve.setSelectedDate(dto.getSelectedDate());
			System.out.println(dto.getSeatNum()+"��¥�� "+dto.getTime());
			preserve.setTime(dto.getTime());
			selectedTicket.deleteSelectedTicket(dto);
			selectedTicket.updateRemainData(dto);
			selectedTicket.preservedTicket(preserve);
		}
		
		String bank = (request.getParameter("bank"));

		System.out.println("bank: " + bank);

		AccountDTO adto = selectedTicket.selectAccount(bank);

		
		ticket = selectedTicket.readData(ticket);
		Calendar today = Calendar.getInstance();
		
		//�Աݸ�������
		String deadline = today.get(Calendar.YEAR)+"�� "+(today.get(Calendar.MONTH)+1)+"�� "+(today.get(Calendar.DAY_OF_MONTH)+3)+"�� "+"23:59:59";
		
		System.out.println("canceldate: "+cancelDate+"/deadline: "+deadline);

		request.setAttribute("adto", adto);
		request.setAttribute("list", list);
		request.setAttribute("stdto", ticket);
		request.setAttribute("cancelDate", cancelDate);
		request.setAttribute("deadline", deadline);

		return "laststep";
	}

	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public ModelAndView test(@RequestParam String inwon) {
		ModelAndView m = new ModelAndView();
		m.setViewName("detail");
		m.addObject("inwon", inwon);
		return m;
	}
	/*
	 * @reqMapping(value = "/laststep", method = reqMethod.GET) public
	 * String final_step(@reqParam String bank, HttpServletRequest req,
	 * HttpServletResponse resp) {
	 * 
	 * System.out.println("final ����"); System.out.println("bank: "+bank);
	 * 
	 * 
	 * AccountDTO adto = dao.selectAccount(bank);
	 * 
	 * List<SelectedTicket> dto = dao.selectTicket(userId);
	 * 
	 * req.setAttribute("adto", adto); req.setAttribute("stdto", stdto);
	 * 
	 * 
	 * 
	 * System.out.println("���������"); return "step5#open_pay";
	 * 
	 * }
	 * 
	 */
	/*
	 * @reqMapping(value = "/final_pay", method = reqMethod.GET)
	 * 
	 * @ResponseBody public ModelAndView final_step(@reqParam String bank,
	 * HttpServletRequest req, HttpServletResponse resp) {
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * System.out.println("final ����");
	 * 
	 * AccountDTO adto = dao.selectAccount(bank);
	 * 
	 * stdto=dao.selectTicket(userId);
	 * 
	 * req.setAttribute("adto", adto); req.setAttribute("stdto", stdto);
	 * 
	 * mv.setViewName("step5#open_pay"); mv.addObject("adto", adto);
	 * mv.addObject("stdto", stdto);
	 * 
	 * return mv;
	 * 
	 * }
	 * 
	 * 
	 * 
	 * 
	 */

}
