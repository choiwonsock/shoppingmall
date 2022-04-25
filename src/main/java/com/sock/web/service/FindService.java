package com.sock.web.service;

import com.sock.web.memberDto.MemberDto;

public interface FindService {
	public MemberDto loginUser(MemberDto memberDto); //확인
	
	public MemberDto findId(MemberDto memberDto);		//아이디찾을떄
	
	public MemberDto findPw(MemberDto memberDto);		//비번찾을떄
	
	public void updatePw(MemberDto memberDto);			//비번찾고 업데이트
}
