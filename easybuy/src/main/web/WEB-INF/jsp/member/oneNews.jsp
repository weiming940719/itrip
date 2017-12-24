
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@include file="basic.jsp"%>
</head>

<body>
<!--header-->
<%@include file="top.jsp"%>

<!--nav-->
<%@include file="left.jsp"%>

<div class="personal-r f-r">
    <p ><h3 style="position: relative;left: -90px">${news.title}</h3></p>
    <span style="font-size: 15px;position: relative;left: -60px">${news.content}</span>
</div>

<div style="clear:both;"></div>

<!--底部一块-->
<%@include file="foot.jsp"%>

</body>
</html>
