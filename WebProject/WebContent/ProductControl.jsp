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
		<a href="Lobby.jsp">�κ�</a>
		<a href="AccountBook.jsp">���</a>
		<a href="ProductControl.jsp">�׸��߰�</a>
		<a href="Inference.jsp">����</a>
	</nav>
	<section class="section" style="margin-bottom:30px; padding-bottom:30px">
		<b style="font-size: 40px;">�׸����</b>
		<form action="AddProduct.jsp" name="AddProduct" method="post" class="products">
			<b style="font-size: 20px;">�׸� �߰�</b><br>
			Product name : <input type="text" class="textinput" name="productNameA" placeholder="��ǰ�̸�"><br>
			Price : <input type="number" class="textinput" name="price" placeholder="����"><br>
			<input type="submit" class="submitinput" value="����">
		</form>
		<br><hr><br>
		<form action="RemoveProduct.jsp" name="RemoveProduct" method="post" class="products">
			<b style="font-size: 20px;">�׸� ����</b><br>
			Product name : <input type="text" class="textinput" name="productNameD" placeholder="��ǰ�̸�"><br>
			<input type="submit" class="submitinput" value="����">
		</form>
		<br><hr><br>
		<form action="ReplaceProduct.jsp" name="AddProduct" method="post" class="products">
			<b style="font-size: 20px;">���� ����</b><br>
			Product name : <input type="text" class="textinput" name="productNameP" placeholder="��ǰ�̸�"><br>
			Price : <input type="number" class="textinput" name="price" placeholder="����"><br>
			<input type="submit" class="submitinput" value="����">
		</form>
		<hr>
		<b style="font-size: 40px;">�׸� ���</b>
		<table border="1" style="margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<td>�׸�</td><td>����</td>
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
					alert("�α��� �� �̿����ּ���!");
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
		�α����� ���ּ���. <button onclick="location.href='Login.html'">�α���</button><br>
		<%	
			}
			else
			{
			String name=(String)session.getAttribute("Name");
		%>
		<%=name%>�� �ȳ��ϼ���!<br><button onclick="location.href='LogOut.jsp'">�α׾ƿ�</button><br><br>
		<%
			}
		%>
	</div>
	</aside>
	
</body>
</html>