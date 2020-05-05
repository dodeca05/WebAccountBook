<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
   div {
      border-top-left-radius: 5px;
      border-bottom-left-radius: 5px;
      border-top-right-radius: 5px;
      border-bottom-right-radius: 5px;
      border: 3px solid skyblue;
   }
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
		<a href="Inference.jsp">예측</a>
	</nav>
	<section class="section" style="margin-bottom:30px; padding-bottom:30px">
		<b style="font-size: 40px;">전체 장부</b><br><br>
		
		<div style="padding-left: 30px; padding-right: 30px;"><br>
		<script>
            function PostSend(arg,url){
               var form=document.createElement("form");
               form.setAttribute("action",url);
               form.setAttribute("method","post");
               var date=document.createElement("input");
               date.setAttribute("type","hidden");
               date.setAttribute("name","date");
               date.setAttribute("value",arg);
               form.appendChild(date);
               var m=document.getElementById("body");
               m.appendChild(form);
               form.submit();
            }
		</script>

      <%@page import="java.sql.*" %>
      <%@page import="SQL.SQLConnect" %>
      <%
      String Login=(String)session.getAttribute("Login");
      if(Login==null||Login.equals(""))
         {
            %>
            <script>
            alert("로그인 후 이용해주세요!");
            window.history.back();
            </script>
            <%   
            out.close();
         }
      
      
         SQLConnect sc=new SQLConnect();
         int row=0;
         ResultSet result=sc.ExecuteQuery("select salesrecord.date,product.name,product.price,salesrecord.num "+ 
               "from salesrecord inner join product on salesrecord.Product=product.name and salesrecord.ID=product.ID "+
               "where salesrecord.ID='"+Login+"' "+
               "order by salesrecord.date desc");
         
         int sum=0;
         String date="";
         while (result.next())
         {
            
            int price=result.getInt("price");
            int num=result.getInt("num");
            if(!date.equals(result.getString("date"))){
               
               if(sum!=0){
                  %>
                  <div style="text-align: center;padding-top: 20px; padding-bottom: 20px;">
            <%=date%> : <%=sum%> <label>원</label> <button onclick="PostSend('<%=date%>','DayAccountPage.jsp')">자세히 보기</button>
            <button onclick="PostSend('<%=date%>','DeleteDayAccount.jsp')">삭제</button></div><br>
                  <%
               }
               date=result.getString("date");
               sum=0;
            }
            sum+=price*num;
            System.out.println(price+"*"+num+"="+sum);
         }
         if(sum!=0){
            %>
            <div style="text-align: center;padding-top: 20px; padding-bottom: 20px;">
            <%=date%> : <%=sum%> <label>원</label> <button onclick="PostSend('<%=date%>','DayAccountPage.jsp')">자세히 보기</button>
            <button onclick="PostSend('<%=date%>','DeleteDayAccount.jsp')">삭제</button></div><br>
            <%
         }
         
      %>
      <script>
      function NewAccount(){
          var date = new Date();
             var year = date.getFullYear();
             var month = date.getMonth()+1
             var day = date.getDate();
             if(month < 10){
                 month = "0"+month;
             }
             if(day < 10){
                 day = "0"+day;
             }
          
             var today = year+"-"+month+"-"+day;
      
      
      
             location.href="WriteAccount.jsp?Date="+today;
      }
      </script>
      </div>
      <br>
      <button onclick="location.href='ProductControl.jsp'">항목수정</button><button onclick="NewAccount()">새로 추가</button>
   </section>
   <aside class="aside">
   <form class="logindiv">
      <%
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
      </form>
   </aside>

</body>
</html>