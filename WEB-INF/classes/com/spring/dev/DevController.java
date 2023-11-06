package com.spring.dev;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller	
public class DevController{
	
	//GET 페이지로 이동
	@RequestMapping("/")
	public String main() {
		
		return "Get";
	}
	
	 @RequestMapping(value = "/test.do", method = RequestMethod.GET) //웹 요청을 처리하는 매서드로 맵핑
	    @ResponseBody //컨트롤러 메서드가 직접 데이터를 반환하고 해당 데이터를 HTTP 응답 본문에 쓰도록 한다.
	    public Map<String, Object> test(@RequestParam("data") String name) { //RequestParam을 통해서 data 받아옴
	        Map<String, Integer> ageMap = new HashMap<>(); //ageMap으로 데이터 직접 넣어줌
	        ageMap.put("tom", 10);
	        ageMap.put("bob", 20);
	        ageMap.put("kim", 30);
	        
	        Map<String, Object> returnMap = new HashMap<>(); //return 해줄 Hashmap 생성
	        returnMap.put("name", name); //이름과 나이를 returnMap에 넣어줌
	        returnMap.put("age", ageMap.get(name));
	        
	        return returnMap;
	    }

	 //Post 페이지로 이동
	  @RequestMapping(value="/post") public String move() {
		  return "Post"; }
	  
	  
	 @RequestMapping(value = "/PostTest.do", method = RequestMethod.POST)
	  @ResponseBody 
	  public Map<String,Object> PostTest(@RequestBody HashMap<String,Object>dataMap) { // 받은데이터 처리
		  Map<String, Object> returnMap = new HashMap<>(); //return 해줄 Hashmap 생성
		  
		  returnMap.put("name", dataMap.get("name") ); //이름과 나이를 returnMap에 넣어줌
		  returnMap.put("age", dataMap.get("age"));
	    
		  return returnMap;
		}

}
