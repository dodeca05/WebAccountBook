<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Smart Account Book</title>
<style>
	html, body { margin: 0; padding: 0; }
	header {
		width:100%; height:80px;
		text-align: center;
		float: left;
		font-size:300%; font-family:'Bauhaus 93';
	}
	nav {
		width: 100%;
		height: 50px;
		vertical-align: middle;
		float: left;
		text-align: center;
		
	}
	section { width: 79%;  float: left; border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 2px solid skyblue;
	}
	aside { width: 20%;  float: left; }
	a {
		text-decoration: none;
		width: 24%; float:left;
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 2px solid skyblue;
		background-color: rgba(0,0,0,0);
		font-weight: bold;
		color: skyblue;
		padding: 5px;
	}
	a:hover{
		color:white; background-color: skyblue;
	}
	button { 
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 1px solid skyblue;
		background-color: rgba(0,0,0,0);
		font-weight: bold;
		color: skyblue;
		padding: 5px;
	}
	button:hover{ color:white; background-color: skyblue; }
	.logindiv {
		text-decoration: none;
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 2px solid skyblue;
		background-color: rgba(0,0,0,0);
		font-weight: bold;
		color: skyblue;
		padding: 5px;
		vertical-align: middle;
	}
	button { 
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 1px solid skyblue;
		background-color: rgba(0,0,0,0);
		font-weight: bold;
		color: skyblue;
		padding: 5px;
	}
	button:hover{ color:white; background-color: skyblue; }
	
	form {
		border: 2px solid skyblue;
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		
		font-family: 'Arial';
	}
	.textinput {
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
	}
	.submitinput{
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 1px solid skyblue;
		background-color: rgba(0,0,0,0);
		font-weight: bold;
		color: skyblue;
		padding: 5px;
	}
	.mainpage{
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	
	}
</style>

</head>
<body>
	<header class="header" onclick="location.href='Lobby.jsp'">
		Smart Account Book
	</header>
	<nav class="nav">
		<a href="Lobby.jsp">로비</a>
		<a href="AccountBook.jsp">장부</a>
		<a href="ProductControl.jsp">항목추가</a>
		<a href="Inference.jsp">예측</a>
	</nav>
	<section class="section">
	<div class="mainpage" style="padding-top: 20px; padding-bottom: 20px;">
		<img src="image/lobbyimage.jpg"><br>
		당신의 매출을 예상해드립니다.<br>
		별도의 프로그램 설치 없이 <b>웹</b>으로 구동 가능합니다.<br>
		with <b>python tensorflow</b>
		<image src="image/tensorflow.png" width="20px" height="20px"/>
		<br></label>
	</div>
	</section>
	
	
	<aside class="aside">
		<div class="logindiv">
		<%
			String Login=(String)session.getAttribute("Login");
			if(Login==null||Login.equals(""))
			{
		%>
		로그인을 해주세요. <br> <button onclick="location.href='Login.html'">로그인</button><br>
		<%	
			}
			else
			{
			String name=(String)session.getAttribute("Name");
		%>
		<%=name%>님 안녕하세요!<br><button onclick="location.href='LogOut.jsp'">로그아웃</button><br><br>
		<%
			}
		%>
		</div>
	</aside>
</body>
</html>

