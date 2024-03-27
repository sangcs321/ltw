<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.example.demosendmail.SendMailServlet" %>
<%@page import="com.example.demosendmail.HelloServlet" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<form  method="post" action="./DemoSendMail">
    <div>
        <label>To:</label>
        <input type="text" name="to">
    </div>
    <div>
        <label>Subject:</label>
        <input type="text" name="subject">
    </div>
    <div>
        <%--@declare id="content"--%><label for="content">Content:</label>
        <textarea  name="content" ></textarea>
        <button type="submit">Send</button>
        <button type="reset">Cancel</button>
    </div>
</form>
</body>
</html>