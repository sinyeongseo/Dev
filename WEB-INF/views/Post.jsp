<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조희 시스템</title>
<style type="text/css"> 
	.test {
	width:30em;
	border: 1px solid #333;
	background-color:#FFE1E6;
	box-shadow: 2px 2px 4px 2px #dadce0;
	 border-radius:50px;
	}
	#namebtn {
	background-color: #f199bc;
    color: white;
    border-radius:9px;}
	#name, #name1, #name2{ color:#FF3CBB}
	#age, #age1, #age2{ color:#FF3CBB }

</style>
</head>
<body>
	<center><div class="test">
	<h1>POST 방식 리스트</h1>
	<h1>회원 정보를 출력합니다.</h1>
	<button id="namebtn">출력</button>
	<h2>회원 리스트 -><br>
	 <span id="name"></span> <span id="default"></span> <span id="age"></span><br>
	 <span id="name1"></span> <span id="default1"></span> <span id="age1"></span><br>
	 <span id="name2"></span> <span id="default2"></span> <span id="age2"></span> </h2>
	 </div></center>
<script type="text/javascript">
	document.getElementById("namebtn").addEventListener("click", function() { //namebtn id 값을 가진 버튼이 클릭되면 실행
	async function PostTest(url ='/PostTest.do', data = {name:['tom' ,'bob', 'kim'],age: [20,30,40]}) { //POST 요청을 보냄
		//async를 함수 선언에 붙여주면 함수 내부가 전부 promise가 씌워진다.
		 const response =  await fetch(url, {    //await를 통해서 데이터를 가져오는것이 완료될때까지 기다려준다.
			    method: 'POST',
			    headers: {
			      'Content-Type': 'application/json', //요청 헤더의 형태 지정
			    },
			    body: JSON.stringify(data), //json데이터를 문자열로 변환하여 body에 설정
			  });
			  return response.json();  // response.json() 메서드를 호출하여 응답 데이터를 JSON 형식으로 파싱하고 반환합니다.
			}
	
			PostTest('/PostTest.do') //서버로 받은 응답 처리
			  .then((data) => {   //promise가 정상적으로 이행되면 실행
					    var htmlname = "<b>"+data.name[0]+"</b>";
					    var htmlage= "<b>"+data.age[0]+"입니다"+"</b>";
					    
					    var htmlname1 = "<b>"+data.name[1]+"</b>";
					    var htmlage1= "<b>"+data.age[1]+"입니다"+"</b>";
					    
					    var htmlname2 = "<b>"+data.name[2]+"</b>";
					    var htmlage2= "<b>"+data.age[2]+"입니다"+"</b>";
					    var htmldefault="의 나이는";
					 
					    var resultname = document.getElementById("name");
					    resultname.innerHTML = htmlname;
					    var resultage = document.getElementById("age");
					    resultage.innerHTML = htmlage;
					    var resultdefault = document.getElementById("default");
					    resultdefault.innerHTML = htmldefault;
					    
					    var resultname = document.getElementById("name1");
					    resultname.innerHTML = htmlname1;
					    var resultage = document.getElementById("age1");
					    resultage.innerHTML = htmlage1;
					    var resultdefault = document.getElementById("default1");
					    resultdefault.innerHTML = htmldefault;
					    
					    var resultname = document.getElementById("name2");
					    resultname.innerHTML = htmlname2;
					    var resultage = document.getElementById("age2");
					    resultage.innerHTML = htmlage2;
					    var resultdefault = document.getElementById("default2");
					    resultdefault.innerHTML = htmldefault;
			  }); 
		}); 		
</script>
</body>
</html>