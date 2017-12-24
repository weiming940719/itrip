<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@include file="../member/basic.jsp"%>
</head>

<body>
<!--header-->
<%@include file="../member/top.jsp"%>

<!--nav-->
<%@include file="../member/left.jsp"%>


<div class="personal-r f-r" style="position: relative;right: 70px">
    <div class="mem_tit"><b><font color="red" style="font-family: 楷体;font-size: 28px;" >我的订单</font></b></div>
    <table class="table">
        <tbody>
        <c:forEach items="${order}" var="temp">
            <tr>
                <td>用户名:${temp.loginName}</td>
                <td>订单号:${temp.serialNumber}</td>
                <td>地址:${temp.userAddress}</td>
                <td>￥${temp.cost}</td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="4">
                    <table class="table table-striped">
                        <tbody>
                        <tr>
                            <td width="20%">商品名称</td>
                            <td width="20%">商品图片</td>
                            <td width="25%">数量</td>
                            <td width="25%">价格</td>
                        </tr>
                        <c:forEach items="${detailList}" var="detail">
                            <c:if test="${detail.orderId eq temp.id}">
                                <tr>
                                    <td>${detail.product.name}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/product/queryProductDetail?id=${detail.product.id}" target="_blank">
                                            <img src="${pageContext.request.contextPath}/statics/files/${detail.product.fileName}" width="50" height="50">
                                        </a>
                                    </td>
                                    <td>${detail.quantity}</td>
                                    <td>${detail.product.price}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div style="clear:both;"></div>

<!--底部一块-->
<%@include file="../member/foot.jsp"%>

</body>
</html>
