<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'sayHello.jsp' starting page</title>
  </head>
  
  <%
  	String str = (String)request.getAttribute("message");
   %>
  
  <body>
   		 您输入的欢迎语是<%=str %><br>
  </body>
</html>
