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
		
		String productName = request.getParameter("productNameA");
		String price = request.getParameter("price");
		String ID = (String) session.getAttribute("ID");
		boolean check = true;
		
		SQLConnect sc = new SQLConnect();
	 	ResultSet rc = sc.ExecuteQuery("select * from product where ID='"+ID+"';");
	 	
	 	while(rc.next()){
	 		if (productName.equals(rc.getString(1))){
	 			if(ID.equals(rc.getString(3))){
	 				%>
	 				<script>
	 					alert("이미 같은 이름의 항목이 있습니다");
	 					window.history.back();
	 				</script>
	 				<%
	 				check=false;
	 				break;
	 			}
	 		}
	 	}
	 	if(check){
			String sql = "insert into product values('"+productName+"',"+price+",'"+ID+"');";
		 	sc.Execute(sql);
		 	sql="select distinct Date from salesrecord temp where ID='"+ID+"';";
		 	ResultSet rs=sc.ExecuteQuery(sql);
		 	
		 	try{
		 		while(rs.next())
		 		{
		 			String date=rs.getString(1);
		 			System.out.println(date);
		 			sql="insert into salesrecord VALUES('"+date+"','"+ID+"','"+productName+"',0);";
		 			System.out.println(sql);
		 			SQLConnect sc2=new SQLConnect();
		 			sc2.Execute(sql);
		 			
		 			
		 		}
		 		
		 		
		 	}catch(Exception e2)
		 	{
		 		e2.printStackTrace();
		 	}
		 	
		 	
		 	
		 	%>
		 	<script>alert("항목추가성공"); location.href="ProductControl.jsp";</script>
		 	<%
	 	}
	 		 	
	 	out.println(productName);
	 	out.println(price);
	 	out.println(ID);
	 	
	%>
</body>
</html>