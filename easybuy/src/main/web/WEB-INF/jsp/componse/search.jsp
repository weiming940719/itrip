<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/18
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    $(function () {
        $("span[name=delete]").click(function () {
            var id = $(this).attr("productId");
            $.post("${pageContext.request.contextPath}/cart/deleteCartById", {"id": id}, function (data) {
                if (data != 0) {
                    location.href = location.href;
                }
            })
        })
        $("input[name=queryProductByName]").click(function () {
            var name=$("input[name=keyWord]").val();
            location.href="${pageContext.request.contextPath}/product/queryProductByName?name="+name+"&pageNum=1&pageSize=8";
        })
    })
</script>

<div class="top">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/index/index"><img
                src="${pageContext.request.contextPath}/statics/images/logo.png"></a>
    </div>
    <div class="search">
            <input type="text" name="keyWord" class="s_ipt">
            <input type="submit" value="搜索" class="s_btn" name="queryProductByName">
        <!--推荐最热商品-->
    </div>
    <div class="i_car">
        <div class="car_t">
            购物车 [
            <span>
                <c:if test="${cart!=null && cart.carts.size()>0}">
                    ${cart.carts.size()}
                </c:if>
                <c:if test="${cart==null || cart.carts.size()<=0}">
                    空
                </c:if>
            </span>]
        </div>
        <div class="car_bg">
            <!--Begin 购物车未登录 Begin-->
            <c:if test="${loginUser==null}">
                <div class="un_login">还未登录！<a href="${pageContext.request.contextPath}/user/toLogin"
                                              style="color:#ff4e00;">马上登录</a></div>
            </c:if>
            <c:if test="${loginUser!=null}">
                <div class="un_login">我的购物车</div>
            </c:if>
            <!--End 购物车未登录 End-->
            <!--Begin 购物车已登录 Begin-->
            <ul class="cars">
                <c:forEach items="${cart.carts}" var="cartList">
                    <li>

                        <div class="img"><a
                                href="${pageContext.request.contextPath}/product/queryProductDetail?id=${cartList.product.id}"><img
                                src="${pageContext.request.contextPath}/statics/files/${cartList.product.fileName}"
                                width="58" height="58"/></a></div>
                        <div class="name"><a
                                href="${pageContext.request.contextPath}/product/queryProductDetail?id=${cartList.product.id}">${cartList.product.name}</a>
                            <span style="float: right" class="glyphicon glyphicon-trash" aria-hidden="true"
                                  name="delete" productId="${cartList.product.id}"></span>
                        </div>

                        <div class="price"><font color="#ff4e00">￥${cartList.product.price}</font>
                            X${cartList.quantity}
                            <span style="float: right"><font
                                    color="#ff4e00">计：${cartList.product.price*cartList.quantity}</font></span>
                        </div>

                    </li>
                </c:forEach>
            </ul>
            <div class="price_sum">共计&nbsp;<font color="#ff4e00">￥</font><span>${sessionScope.cart.sum}</span></div>
            <c:if test="${sessionScope.loginUser==null}">
                <div class="price_a"><a href="${pageContext.request.contextPath}/user/toLogin">去登录</a></div>
            </c:if>
            <c:if test="${sessionScope.loginUser!=null}">
                <div class="price_a"><a href="${pageContext.request.contextPath}/cart/detail">去结算</a></div>
            </c:if>
            <!--End 购物车已登录 End-->
        </div>
    </div>
</div>

