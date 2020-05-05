<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.util.Enumeration, SQL.SQLConnect" %>
	<%@page import="java.sql.*" %>
	<%
		request.setCharacterEncoding("euc-kr");
		Enumeration<String> e = session.getAttributeNames();
		
		String productName = request.getParameter("productNameD");
		String ID = (String) session.getAttribute("ID");
		
		SQLConnect sc = new SQLConnect();
		String sql = "delete from product where name='"+productName+"' and ID='"+ID+"';";
	 	sc.Execute(sql);
	 	sql = "delete from salesrecord where Product='"+productName+"' and ID='"+ID+"';";
	 	sc.Execute(sql);
	 	out.println(productName);
	 	out.println(ID);
	 	%> <script> alert("삭제완료"); location.href="ProductControl.jsp";</script><%
	%>
</body>
</html>