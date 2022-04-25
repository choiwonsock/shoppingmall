package com.sock.web.service;

import org.springframework.stereotype.Service;

import com.sock.web.memberDto.MemberDto;
@Service
public interface RegisterService {
	public void register(MemberDto memberDto) throws Exception;

}
