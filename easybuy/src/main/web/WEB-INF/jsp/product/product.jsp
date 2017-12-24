<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/19
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>易买网</title>
    <%@include file="../componse/head.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/n_nav.js"></script>
    <%@ include file="../componse/sou.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("a[name=saveToCart]").click(function () {
                var productId = $(this).attr("productId");
                $.post("${pageContext.request.contextPath}/cart/saveCart", {
                    "id": productId,
                    "quantity": 1
                }, function (data) {
                    alert(data);
                    location.href = location.href;

                })
            })


        })
    </script>
</head>
<body>
<!--Begin Header Begin-->
<div id="searchBar">
    <%@ include file="../componse/search.jsp" %>

</div>
<!--End Header End-->
<!--Begin Menu Begin-->
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <%@ include file="../componse/top.jsp" %>
        <!--End 商品分类详情 End-->
    </div>
</div>
<!--End Menu End-->
<div class="i_bg">
    <!--Begin 筛选条件 Begin-->
    <!--End 筛选条件 End-->
    <div class="content mar_20">
        <div id="favoriteList">
        </div>
        <div class="l_list">
            <div class="list_t">
                <c:if test="${count!=0}">
                    <span class="fr">共发现${count}件</span>
                </c:if>
                <c:if test="${count==0}">
                    <span class="fr">暂无该种商品任何信息</span>
                </c:if>
            </div>
            <div class="list_c">
                <ul class="cate_list">
                    <c:forEach items="${pageInfo.list}" var="product">
                        <li>
                            <div class="img">
                                <a href="${pageContext.request.contextPath}/product/queryProductDetail?id=${product.id}"
                                   target="_blank">
                                    <img src="${pageContext.request.contextPath}/statics/files/${product.fileName}"
                                         width="210" height="185"/>
                                </a>
                            </div>
                            <div class="price">
                                <font>￥<span>${product.price}</span></font>
                            </div>
                            <div class="name"><a
                                    href="${pageContext.request.contextPath}/Product?action=queryProductDeatil&id=${product.id}">${product.name}</a>
                            </div>
                            <div class="carbg">
                                <a class="ss" name="collection"
                                   productId="${product.id}">收藏</a>
                                <a class="j_car" name="saveToCart" productId="${product.id}">加入购物车</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <%@ include file="../page/page.jsp" %>
            </div>
        </div>
    </div>
    <script>
        favoriteList();
    </script>
    <%@ include file="../componse/foot.jsp" %>
</div>
</body>
</html>
