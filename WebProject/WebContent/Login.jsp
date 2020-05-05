<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.util.Enumeration, java.sql.*, SQL.SQLConnect" %>
	<%
		SQLConnect sc = new SQLConnect();
		String userID = request.getParameter("ID");
		String userPW = request.getParameter("password");
		String SQL =	"select * from memberInfo where ID = '" + userID + 
						"' and Password = '" + userPW +"'";
		
		ResultSet rs = sc.ExecuteQuery(SQL);
		String name = "";
		
		Boolean isLogin = false;
		while(rs.next()){
			isLogin = true;
			name = rs.getString(3);
			response.sendRedirect("Lobby.jsp");
			
		}
		if(isLogin){
			session.setAttribute("Login", userID);
			session.setAttribute("ID", userID);
			session.setAttribute("Name", name);
			out.println(name);
		} else {
			%> <script> alert("로그인 실패"); history.go(-1);</script><%
		}
		sc.ConnectionClose();
	%>
</body>
</html>