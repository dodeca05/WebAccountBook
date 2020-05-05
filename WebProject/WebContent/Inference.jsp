<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
</style>
<title>Insert title here</title>
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
	<section class="section" >
	<b style="font-size: 40px;">�Ǹŷ� ����</b>
		<%@page import="java.sql.*,java.util.Calendar, java.text.SimpleDateFormat" %>
		<%@page import="SQL.*" %>
		<%
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Calendar c1 = Calendar.getInstance();

	 String strToday = sdf.format(c1.getTime());
	 
	 System.out.println(strToday);




			String ID=(String)session.getAttribute("Login");
			SQLBaseInference inf=new SQLBaseInference(ID);
			String result=inf.Inference(strToday);
			if(result.equals("")){
				%>
				<br><p style="text-align:center;padding-top:20px;padding-bottom:20px;margin-left:10px;margin-right:10px;">
				�߷��� ������ �����Ͱ� ����Ǿ� ���� �ʽ��ϴ�!
				</p>
				<br>
				<% 
				return;}
			System.out.println("��� : "+result);
			String[]temp=result.split("/");
			int data[][]=new int[inf.getRow()][inf.getCol()];
			for(int i=0;i<inf.getRow();i++)
			{
				String[]temp2=temp[i].split(" ");
				for(int j=0;j<temp2.length;j++)
				{
					data[i][j]=Integer.parseInt(temp2[j]);
				}
			}
			%>
			
			<table  BORDER="1" style="margin-left:auto; margin-right:auto; margin-top:40px;margin-bottom:20px">
			<thead style="font-weight:bold; background-color:yellow;">
			<tr><th>��ǰ��</th>
			<%
			for(int i=0;i<inf.getCol();i++)
			{
				%>
				<th><%=(i+1) %>���� </th>
				<%
			}
			%>
			</thead>
			<tbody>
			<%
			for(int x=0;x<inf.getRow();x++)
			{
				%>
				<tr><td><%=inf.getProductName(x)%></td>
				<%
				for(int y=0;y<inf.getCol();y++)
				{
					%>
					<td><%=data[x][y]%>��</td>
					<%
					
				}
				%></tr><%
			}
			
		%>
		</tr></tbody></table>
		<p style="text-align:center">
		�ؿ���, ���, ������ �������� �����մϴ�.<br>
		���ּ� 4�� �̻��� �Ǹŵ����Ͱ� �־�� ��Ȯ�� ������ �����մϴ�.<br>
		</p>
	</section>
	<aside class="aside">
	<div class="logindiv">
		<%
			if(ID==null||ID.equals(""))
			{
		%>
		�α����� ���ּ���. <br> <button onclick="location.href='Login.html'">�α���</button><br>
		<%	
			}
			else
			{
			String name=(String)session.getAttribute("Name");
		%>
		<%=name%>�� �ȳ��ϼ���!<br><button onclick="location.href=LogOut.jsp">�α׾ƿ�</button><br><br>
		<%
			}
		%>
		</div>
	</aside>
</body>
</html>