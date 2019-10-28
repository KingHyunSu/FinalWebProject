package com.postoffice.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.postoffice.web.dao.ClientDAO;
import com.postoffice.web.dto.MailDTO;

@Service
public class ClientRequestService {
	@Autowired
	private ClientDAO clientdao;
	
	
	//총 토탈 게시물 row행만큼 가지고 오기
	public int getTotalRowNo() {
		int totalRowNum = clientdao.selectTotalRowNo();
		return totalRowNum;
	}

	
	public List<MailDTO> getBoardList(int startRowNo, int endRowNo) {
		List<MailDTO> ClientboardList = clientdao.selectList(startRowNo,endRowNo);
		return ClientboardList;
	}
	
	
	/*
	 * public void mailSend(ClientMailDTO clientMailDTO) {
	 * clientdao.mailSend(clientMailDTO); }
	 */
	
}