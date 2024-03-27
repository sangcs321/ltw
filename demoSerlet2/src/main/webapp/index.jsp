
<%@ page import="vn.com.login.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>
<% User auth = (User) session.getAttribute("auth"); %>
<% if(auth==null) { %>
<p>Ban chua dang nhap</p>
<% }else{ %>
<p>Xin chao <%= auth.getName() %></p>
<%}%>
</body>
</html>
