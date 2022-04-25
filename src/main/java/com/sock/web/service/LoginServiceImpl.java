package com.sock.web.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.sock.web.memberDao.MemberDao;
import com.sock.web.memberDto.MemberDto;
@Service
public class LoginServiceImpl implements LoginService {
	@Inject
	private MemberDao memberDao;
	
	//로그인
	@Override
	public MemberDto viewlogin(MemberDto memberDto) {
		
		return memberDao.viewlogin(memberDto);
	}
	
	//로그아웃
	@Override
	public void logout(HttpSession session){
		session.invalidate();
	}
}
//로그인

//public MemberDto login(MemberDto memberDto) throws Exception{
//	return dao.login(memberDto.getId());
//}