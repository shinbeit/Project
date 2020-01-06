package com.ticket.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.ticket.dto.Remain;
import com.ticket.dto.SelectedTicket;

public class RemainDAO {
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	public void insertRemain() {
		for(int i = 1; i <= 20; i++) {
			sessionTemplate.selectOne("mapper.insert", i);
		}
	}
	
	public List<Remain> getRemainData() {
		return sessionTemplate.selectList("mapper.getRemainList");
	}
	
	public int selectCount() {
		return sessionTemplate.selectOne("mapper.getCount");
	}
	
	/*
	 * �������� �����Ϸ����� �� remainData���� �� �¼��� isEmpty�� 0���� �����.
	 * isEmpty = 1 >> ����ִ� �¼�
	 * isEmpty = 0 >> ������� ���� �¼�
	 */
	public boolean updateSeat() {
		try {
			sessionTemplate.selectOne("mapper.updateSeat");
		} catch(Exception e) {
			return false;
		}
		return true;
	}
	
	//����Ʈ�� ���¼��� ������.
	public List<Remain> selectListIsEmpty() {
		return sessionTemplate.selectList("mapper.selectListEmpty");
	}
}
