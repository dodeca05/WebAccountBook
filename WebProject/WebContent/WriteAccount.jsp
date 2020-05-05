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
	border: 2px solid skyblue; }
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
	div {
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
</style>
</head>
<body id="body">
	<header class="header" onclick="location.href='Lobby.jsp'">
		Smart Account Book
	</header>
	<nav class="nav">
		<a href="Lobby.jsp">로비</a>
		<a href="AccountBook.jsp">장부</a>
		<a href="ProductControl.jsp">항목추가</a>
		<a href="inference.jsp">예측</a>
	</nav>
	<section class="section" style="text-align: center;">
		<b style="font-size: 40px;">장부 기록</b>
		<script>
			var temp;
		</script>
			<%@page import="java.sql.*" %>
			<%@page import="SQL.SQLConnect" %>
			<%
				String date=request.getParameter("Date");
			%>
			<script>
				function Reload(){
					var datestr="WriteAccount.jsp?Date="+document.getElementById("dateinput").value;
					location.href=datestr;
				}
			</script>
			<form action="SaveAccount.jsp" method="post" style=" margin-top: 20px; margin-bottom: 20px;">
			<input id="dateinput" type="date" name="Date" value="<%=date%>"><button type="button" onclick="Reload()">불러오기</button><br><br>
			<%
				SQLConnect sc=new SQLConnect();
				String ID=(String)session.getAttribute("Login");
				ResultSet result=sc.ExecuteQuery("select * from product where ID = '"+ID+"';");
				while (result.next())
				{
					%>
					<%=result.getString("Name")%> <%=result.getString("price")%>원 <input type="number" name="<%=result.getString("Name")%>" value="0">개 판매<br><br>
					<% 
				}
				result=sc.ExecuteQuery("select * from salesrecord where ID = '"+ID+"' and date='"+date+"';");
				while (result.next())
				{
					%>
					<script>
					temp=document.getElementsByName("<%=result.getString("Product")%>");
					temp[0].setAttribute("value",<%=result.getString("Num")%>);
					</script>
					<%
				}
			
		%>
		<input type="submit" value="저장" class="submitinput">
	</section>
	<aside class="aside">
	<div class="logindiv">
		<%
			String Login=(String)session.getAttribute("Login");
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