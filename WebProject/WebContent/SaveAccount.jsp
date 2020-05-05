<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.*" %>
	<%@page import="SQL.SQLConnect" %>
	<%
		request.setCharacterEncoding("euc-kr");
		SQLConnect sc=new SQLConnect();
		String ID=(String)session.getAttribute("Login");
		String date=request.getParameter("Date");
		
		ResultSet result=sc.ExecuteQuery("select * from product where ID = '"+ID+"';");
		while(result.next()){
			String pr=result.getString("Name");
			int temp=Integer.parseInt(request.getParameter(pr));
			
			SQLConnect sc2=new SQLConnect();
			System.out.println("insert into salesrecord values('"+date+"','"+ID+"','"+pr+"',"+temp+") on duplicate key update Num="+temp+";");
			
			sc2.Execute("insert into salesrecord values('"+date+"','"+ID+"','"+pr+"',"+temp+") on duplicate key update Num='"+temp+"';");
		}

%>
<script>
alert("저장 성공");
location.href="AccountBook.jsp?Date=<%=date%>";
</script>

</body>
</html>