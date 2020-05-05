<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	html, body { margin: 0; padding: 0; }
	header {
		width:100%; height:80px;
		text-align: center;
		font-size:300%; font-family:'Bauhaus 93';
	}
	nav {
		width: 100%;
		height: 50px;
		vertical-align: middle;
		float: left;
		text-align: center;
	}
	section {
		width: 79%;  float: left;
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 2px solid skyblue;
	}
	aside { width: 19%;  float: left; }
	p {
		text-decoration: none;
		width: 20%; float:left;
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
	.submitinput:hover{
		color:white; background-color: skyblue;
	}
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
	.products{
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
	<section class="section" style="margin-bottom:30px; padding-bottom:30px">
		<b style="font-size: 40px;">항목관리</b>
		<form action="AddProduct.jsp" name="AddProduct" method="post" class="products">
			<b style="font-size: 20px;">항목 추가</b><br>
			Product name : <input type="text" class="textinput" name="productNameA" placeholder="제품이름"><br>
			Price : <input type="number" class="textinput" name="price" placeholder="가격"><br>
			<input type="submit" class="submitinput" value="제출">
		</form>
		<br><hr><br>
		<form action="RemoveProduct.jsp" name="RemoveProduct" method="post" class="products">
			<b style="font-size: 20px;">항목 제거</b><br>
			Product name : <input type="text" class="textinput" name="productNameD" placeholder="제품이름"><br>
			<input type="submit" class="submitinput" value="제출">
		</form>
		<br><hr><br>
		<form action="ReplaceProduct.jsp" name="AddProduct" method="post" class="products">
			<b style="font-size: 20px;">가격 수정</b><br>
			Product name : <input type="text" class="textinput" name="productNameP" placeholder="제품이름"><br>
			Price : <input type="number" class="textinput" name="price" placeholder="가격"><br>
			<input type="submit" class="submitinput" value="제출">
		</form>
		<hr>
		<b style="font-size: 40px;">항목 목록</b>
		<table border="1" style="margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<td>항목</td><td>가격</td>
			</tr>
		</thead>
		<tbody id="tbody">
		
		<%@page import="java.sql.*" %>
		<%@page import="SQL.SQLConnect" %>
		<%@page import="java.util.Enumeration" %>
		<%
			String Login=(String)session.getAttribute("Login");
			if(Login==null||Login.equals(""))
				{
					%>
					<script>
					alert("로그인 후 이용해주세요!");
					window.history.back();
					</script>
					<%	
					out.close();
				}
			Enumeration<String> e = session.getAttributeNames();
			SQLConnect sc=new SQLConnect();
			String ID = (String) session.getAttribute("ID");
			ResultSet result=sc.ExecuteQuery("select * from product where ID='"+ID+"';");
			while (result.next())
			{
				%><tr><td><%=result.getString(1)%></td>
				<td><%=result.getString(2)%></td></tr><%
			}
			sc.ConnectionClose();
			%>
		</tbody></table>
		<br>
	</section>
	<aside class="aside">
	<div class="logindiv">
		<%
			if(Login==null||Login.equals(""))
			{
		%>
		로그인을 해주세요. <button onclick="location.href='Login.html'">로그인</button><br>
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