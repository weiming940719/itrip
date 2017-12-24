<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../componse/head.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/n_nav.js"></script>
    <title>易买网</title>
    <%@include file="../componse/sou.jsp" %>

    <script type="text/javascript">
        $(function () {
            $("a[name=up]").click(function () {
                var quantity = $("input[name=quantity]").val();
                var productId = $(this).attr("productId");
                alert(productId);
                $.post("${pageContext.request.contextPath}/cart/updateCart",
                    {"id": productId, "quantity": quantity}, function (data) {
                        $("#sum").html(data.sum);
                        if (data.eq("库存不足")) {
                            alert(data);
                        }
                    })
            })

        })
    </script>

</head>
<body>
<!--Begin Header Begin-->
<div id="searchBar">
    <%@include file="../componse/search.jsp" %>
</div>
<!--End Header End-->
<!--Begin Menu Begin-->
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <%@include file="../componse/top.jsp" %>
        <!--End 商品分类详情 End-->
    </div>
</div>
<!--End Menu End-->
<div class="i_bg">
    <div id="settlement">
        <%@include file="cartSecond.jsp" %>
    </div>

    <%@ include file="../componse/foot.jsp" %>
</div>
</body>
</html>
