<%@ page import="bean.User" %>
<html>
<body>
<% User auth= (User) session.getAttribute("auth");%>
<% if (auth==null){%>
<p>Ban chua dang nhap</p>
<% }else {%>
Bonjour <%= auth.getName()%>
<% } %>
</body>
</html>
