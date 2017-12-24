<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
    $(function () {
        $("button[name=delete]").click(function () {
            var id = $(this).attr("productId");
            if (confirm("确认移除该商品吗？"))
                $.post("${pageContext.request.contextPath}/cart/deleteCartById", {"id": id}, function (data) {
                    if (data != 0) {
                        location.href = location.href;
                    }
                })
        })

        $("#deleteList").click(function () {
            var id = "";
            $.each($("input:checkbox"), function () {
                if (this.checked) {
                    id = id + $(this).val() + ",";
                }
            })
            if (id == "") {
                alert("请选择要移除的商品");
            } else {
                if (confirm("确定移除删除这些商品吗？")) {
                    $.post("${pageContext.request.contextPath}/cart/deleteList", {"id": id}, function (data) {
                        alert(data);
                        location.href = location.href;
                    })
                }
            }

        })

        $("button[name=submitCart]").click(function () {
            location.href = "${pageContext.request.contextPath}/cart/queryAddress";
        })


    })
</script>


<div class="content mar_20">
    <img src="${pageContext.request.contextPath}/statics/images/img1.jpg"/>
</div>
<!--Begin 第一步：查看购物车 Begin -->
<div class="content mar_20">


    <form action="" method="post" id="cartForm1">
        <!--内容开始-->
        <div class="cart-content w1200">
            <ul class="cart-tit-nav">
                <li class="current">
                    <a>全部商品 </a>
                </li>

                <div style="clear: both;"></div>
            </ul>
            <div class="cart-con-tit">
                <p class="p1">
                </p>
                <p class="p2">
                    商品信息
                </p>
                <p class="p3">
                    库存
                </p>
                <p class="p4">
                    数量
                </p>
                <p class="p5">
                    单价（元）
                </p>
                <p class="p6">
                    金额（元）
                </p>
                <p class="p7">
                    操作
                </p>
            </div>
            <c:forEach items="${cart.carts}" var="cartList" varStatus="status" end="${fn:length(firstList)}">
                <div class="cart-con-info">
                    <div class="info-top">
                    </div>
                    <div class="info-mid">
                        <input type="checkbox" value="${cartList.product.id}" name="productIds" class="mid-ipt f-l"
                               id=""/>
                        <div class="mid-tu f-l">
                            <a
                                    href="${pageContext.request.contextPath}/product/queryProductDetail?id=${cartList.product.id}">
                                <img width="150px" height="150px"
                                     src="${pageContext.request.contextPath}/statics/files/${cartList.product.fileName}"/>
                            </a>
                        </div>
                        <div class="mid-font f-l" style="width: 90px;">
                            <p style="width: 100px">
                                <a href="">${cartList.product.name}</a>
                            </p>
                        </div>
                        <div class="mid-guige f-l">
                            <p>
                                库存剩余
                            </p>
                            <p>
                                    ${cartList.product.stock}
                            </p>
                        </div>
                        <div class="mid-sl f-l">
                            <a href="JavaScript:;" class="sl-left" name="low" productId="${cartList.product.id}">-</a>
                            <input type="text" value="${cartList.quantity }" name="quantity" productId="${cartList.product.id}" min="1" max="${cartList.product.stock}"/>
                            <a href="JavaScript:;" class="sl-right" name="up" productId="${cartList.product.id}">+</a>
                        </div>
                        <p class="mid-dj f-l" style="margin-left: 30px">
                            ¥
                            <span>${cartList.product.price }</span>
                        </p>
                        <p class="mid-je f-l">
                            ¥
                            <span>${cartList.product.price * cartList.quantity }</span>
                        </p>
                        <div class="mid-chaozuo f-l">
                            <a href="#">移入收藏夹</a>
                            <input type="hidden" name="productId"
                                   value="${cartList.product.id }">
                            <button class="btn btn-danger" type="button" name="delete"
                                    productId="${cartList.product.id}">
                                <span style="float: right" class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                            </button>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </form>


    <div class="cart-con-footer">
        <div class="quanxuan f-l">
            <button class="btn btn-danger" type="button" id="deleteList"
                    style="position: relative;bottom: 2px;left: 2px">
                <span style="color: white" class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                全部删除
            </button>
            <a href="#">加入收藏夹</a>
            <a href="javascript:" onclick="self.location=document.referrer;">继续购物</a>
        </div>
        <div class="jiesuan f-r">
            <div class="jshj f-l">
                <p>
                    合计（不含运费）
                </p>
                <p class="jshj-p2">
                    ￥：
                    <span id="sum"><fmt:formatNumber value="${cart.sum}"
                                                     pattern="#.0"></fmt:formatNumber> </span>
                </p>
            </div>
            <c:if test="${loginUser==null}">
						<span style="font-size: 18px;color: red; font-family: 楷体;">
								请<a href="${pageContext.request.contextPath}/user/toLogin">登录</a>后再提交订单
								</span>
            </c:if>

            <c:if test="${loginUser!=null && cart.sum!=0}">
                <button class="btn btn-danger" type="submit" name="submitCart" style="position: relative;top: 5px">
                    提交订单
                </button>
            </c:if>

            <c:if test="${loginUser!=null && cart.sum==0}">
                <button class="btn btn-danger" type="submit" name="submitCart" style="position: relative;top: 5px" disabled>
                    提交订单
                </button>
            </c:if>

            <div style="clear: both;"></div>
        </div>
        <div style="clear: both;"></div>
    </div>

</div>



