package com.sock.web.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sock.web.memberDao.MemberDao;
import com.sock.web.memberDto.MemberDto;

@Service
public class RegisterServiceImpl implements RegisterService  {
	@Inject
	private MemberDao dao;
	
	@Override
	public void register(MemberDto memberDto) throws Exception{
		dao.register(memberDto);
	}
	
	

	
	

	
}
