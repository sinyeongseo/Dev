<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	input[type=text] {
	width:15em;
	height:1em ;
	}
	#namebtn {
	background-color: #f199bc;
    color: white;
    border-radius:9px;}
	#posttest {
	background-color: #f199bc;
    color: white;
    border-radius:9px;
    float:right;}
	#name{ color: #FF3CBB }
	#age{ color:#FF3CBB }

</style>
</head>
<body>
<script type="text/javascript">
// GET 요청을 보내고 응답을 처리하는 함수
	function Test() {
	 	var inputData = document.getElementById('nameinput').value; 
	 	//javascript에서 HTML 문서 내의 요소를 선택하는 메서드
	    var url = '/test.do?data=' + encodeURIComponent(inputData); 
 		//request.getContextPath를 통해서 프로젝트 Path만 가져오고, url 과 이름 data를 넣어준다.
	    //encodeURIComponent를 통해서 string을 URI로 데이터를 전달하기 위한 인코딩을 해준다.
	    fetch(url) //get 형식으로 호출, fetch 함수에 url 넘김
	    .then(function(response) { //서버로부터 받은 응답인 response 매개변수를 받는다
	        if (response.ok) {//응답이 성공적인 경우 
	            return response.json();  //data를 json 형식으로 파싱하여 promise 객체를 반환한다.
	        }
	    })
	    .then(function(data) { //응답으로 받은 json (body의 데이터)를 받아냄.
	        // 응답 처리
		    if(data.age == null){ //회원이 아니라서 넘어오는 age값이 null이면
		    	var htmlname = "<b>"+data.name+"</b>";
			    var htmldefault="는 없는 회원입니다.";
			    var htmlage= "";
 
			    var resultname = document.getElementById("name");
			    resultname.innerHTML = htmlname;	//name의 id를 가진 요소 내부에 작성된 내용을 htmnlname으로 픽스 시켜줌
			    var resultdefault = document.getElementById("default");
			    resultdefault.innerHTML = htmldefault;
			    var resultage = document.getElementById("age");
			    resultage.innerHTML = htmlage;
			    
		    }   
		    else{ //회원일 경우(age 값이 null이 아닐 경우)	
			    var htmlname = "<b>"+data.name+"</b>";
			    var htmlage= "<b>"+data.age+"입니다"+"</b>";
			    var htmldefault="의 나이는";
			  
			    
			    var resultname = document.getElementById("name");
			    resultname.innerHTML = htmlname;
			    var resultage = document.getElementById("age");
			    resultage.innerHTML = htmlage;
			    var resultdefault = document.getElementById("default");
			    resultdefault.innerHTML = htmldefault;
			}
	        
	    })
	    //예외가 발생하면 실행되는 함수로 error를 log로 찍어줌
	    .catch(function(error) { 
	        console.log(error);
	    });
	}//Test() 끝
		function move(){
			location.href='/post';
		}
</script>
	<center><div class="test">
	<h1>&nbsp;&nbsp;회원 이름을 적어보세요</h1>
	<h2>&nbsp;&nbsp;&nbsp;회원 리스트 -> tom, bob, kim</h2>
	&nbsp;Name: <input type="text" id="nameinput"></input>
	<button id="namebtn" onclick="Test()">입력</button>
	<h2> <span id="name"></span> <span id="default"></span> <span id="age"></span> </h2>
	<button id="posttest"onclick="move()" position="right">POST 방식으로 해보기</button></div></center>

</body>
</html>