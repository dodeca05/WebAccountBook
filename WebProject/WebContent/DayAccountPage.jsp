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
table{
	text-align: center; float: center; margin-left:auto;margin-right:auto;
	border: 2px solid black;
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
	<section class="section" id="section" style="text-align: center; float:center;margin-bottom:30px; padding-bottom:30px">
		<b style="font-size: 40px;">상세 장부</b>
		<form action="WriteAccount.jsp" method="get">
			<br>
			<h2><%=request.getParameter("date")%> 매출정보</h2>
			<table border="1">
			<thead><td>항목이름</td><td>판매수</td><td>판매가</td><td>판매금액</td></thead>
			<tbody >
				<%@page import="java.sql.*, java.util.Enumeration" %>
				<%@page import="SQL.SQLConnect" %>
				<%
				SQLConnect sc=new SQLConnect();
				String ID=(String)session.getAttribute("Login");
				ResultSet result =sc.ExecuteQuery("select Date,sr.ID,p.Name,Num,Price from SalesRecord as sr inner join product as p where sr.date='"+request.getParameter("date")+"' and sr.ID = '"+ID+"' and sr.Product=p.Name and sr.ID=p.ID;");
				int sum=0;
				while (result.next())
				{
					sum+=Integer.parseInt(result.getString("Num"))*Integer.parseInt(result.getString("Price"));
					%>
					
					<td><%=result.getString("Name")%></td>
					<td><%=result.getString("Num")%></td>
					<td><%=result.getString("Price")%></td>
					<td><%=Integer.parseInt(result.getString("Num"))*Integer.parseInt(result.getString("Price"))%></td>
					</tr><%
				}%>
			</tbody>
			</table>
			<br>
			<input type="hidden" name="Date" value="<%=request.getParameter("date")%>">
			<b>총 판매 금액 : <%=sum %>원</b><br>
			<br>
			<input type="submit" value="수정" class="submitinput"><br>
		</form>
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
		<%=name%>님 안녕하세요!<button onclick="location.href='LogOut.jsp'">로그아웃</button><br><br>
		<%
			}
		%>
		</div>
	</aside>

</body>
</html>