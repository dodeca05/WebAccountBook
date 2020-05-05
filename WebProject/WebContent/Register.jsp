<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*,  SQL.SQLConnect" %> 
	<%
	request.setCharacterEncoding("euc-kr");
	String ID=request.getParameter("ID").replaceAll(" ","");
	String pwd=request.getParameter("Pwd").replaceAll(" ","");
	String name=request.getParameter("Name").replaceAll(" ","");
	boolean reg=true;
	if(ID.equals("") || pwd.equals("") || name.equals(""))
	{
		reg=false;
	%>
		<script>
		alert("모두 입력하세요")
		window.history.back();
		</script>
	<%	
	}
	try{
		SQLConnect sc = new SQLConnect();
		
		ResultSet result = sc.ExecuteQuery("select ID from memberInfo where ID='"+ID+"';");
		while (result.next()) {
			if(ID.equals(result.getString(1))){
				 %>
			<script>
				alert("ID 중복입니다!");
				window.history.back();
			</script>
				 <%
				 reg=false;
				 break;
			 }
		 }
		 if(reg){
		 	String sql="insert into memberInfo values('"+ID+"','"+pwd+"','"+name+"')";
		 	sc.Execute(sql);
			%>
			<script>
				alert("회원가입 성공!");
				location.href='Login.html'
			</script>
		<%
		//response.sendRedirect("Login.html");
		
		 }
		sc.ConnectionClose();
	}
	catch(Exception e){
		out.println("DB에러");
		e.printStackTrace();
	}

%>

</body>
</html>