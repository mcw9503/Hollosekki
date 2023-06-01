package kh.finalproj.hollosekki.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {

	@RequestMapping("basket.ma")
	public String pay() {
		
		return "basket";
	}
	
	@RequestMapping("payDetail.ma")
	public String payDetail() {
		
		return "payDetail";
	}
	
	@GetMapping("market_detail.ma")
	public String marketdetail() {
		
		return "market_detail";
	}
	
	@RequestMapping("paySuccess.ma")
	public String paySuccess() {
		
		return "paySuccess";
	}
	

	
	
}