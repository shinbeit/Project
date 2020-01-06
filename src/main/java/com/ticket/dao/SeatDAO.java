package com.ticket.dao;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

import com.ticket.dto.Remain;
import com.ticket.dto.SelectedTicketDTO;


public class SeatDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	//�����¼��� update�ϴ� �ڵ�
	public void setFinalSelectedTicket(SelectedTicketDTO ticket) {
		sessionTemplate.selectOne("ticketMapper.insertFinalSelectedTicket", ticket);
		
	}
	
	//�����¼��� update�ϴ� �ڵ�
	public void updateFinalSelectedTicket(SelectedTicketDTO ticket) {
		sessionTemplate.selectOne("ticketMapper.updateFinalSelectedTicket", ticket);
	}

	//�帣�ڵ带 �������� �ڵ�
	public int get_performCode(String performCode){
		int performGenreCode = sessionTemplate.selectOne("ticketMapper.get_performCode",performCode);
		return performGenreCode;
	}
	
	//�¼��� �������� �� �¼��� ���õǾ��ٰ� insert�ϴ� �ڵ�
	public void setSelectedTicket(SelectedTicketDTO ticket) {
		sessionTemplate.selectOne("ticketMapper.insertSelectedTicket", ticket);
	}
	
	//���õ� �¼��� �ٽ� �������� �� delete�ϴ� �ڵ�
	public void deleteSelectedTicket(SelectedTicketDTO ticket) {
		sessionTemplate.selectOne("ticketMapper.deleteSelectedTicket", ticket);
	}
	
	//���õ� �¼��� SelectedTicketDTO ��ȯ�ϴ� �ڵ�
	public List<SelectedTicketDTO> getSelectedTicket(SelectedTicketDTO ticket) {
		return sessionTemplate.selectList("ticketMapper.selectSelectedTicket", ticket);
	}

	public String getSelectedDate() {
		return "";
	}
	/*
	 * remainDAO�� ��������. seat���� �������ε� ��ġ�� ��𿡼� ���� �����.
	 * �������� �����Ϸ����� �� remainData���� �� �¼��� isEmpty�� 0���� �����.
	 * isEmpty = 1 >> ����ִ� �¼�
	 * isEmpty = 0 >> ������� ���� �¼�
	 */
	public boolean updateSeat(SelectedTicketDTO ticket) {
		try {
			//�¼������� �����ͼ� ������� ������ update�� �� �ְ� �ٲ�ߵ�.
			System.out.println("update start");
			sessionTemplate.selectOne("mapper.updateSeat", ticket);
			System.out.println("update end");
		} catch(Exception e) {
			System.out.println("update fail");
			return false;
		}
		return true;
	}
	
	public boolean checkIsEmpty(Remain remain) throws InterruptedException {
		System.out.print("result: "+remain.getSeatRow()+", "+remain.getSeatNum()+"\t");
		int check = sessionTemplate.selectOne("mapper.selectIsEmpty", remain);
		if(check == 1)
			return true;
		return false;
	}
}
