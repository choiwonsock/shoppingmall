package com.sock.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {
	@PostMapping("/member/admin")
	public String go_post(){
	    return "admin/main";
	}



}
