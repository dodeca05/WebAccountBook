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
      SQLConnect sc=new SQLConnect();
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
      
      String date=request.getParameter("date");
      String sql="Delete from salesrecord where ID='"+Login+"' and Date='"+date+"';";
      sc.Execute(sql);
      
      
      
      
      
      %>
      <script>
      alert("��������");
      location.href='AccountBook.jsp';
      </script>
</body>
</html>