<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/19 0019
  Time: 下午 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<!--nav-->
<div class="nav-box">
    <div class="nav-kuai w1200">

            <div style="clear:both;"></div>
        <div style="clear:both;"></div>
    </div>
</div>--%>

<!--内容开始-->
<div class="personal w1200">
    <div class="personal-left f-l">
        <div class="personal-l-tit" style="background-color: red">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="per-li2"><a href="#">个人资料<span>></span></a></li>
            <li class="per-li3"><a
                    href="${pageContext.request.contextPath}/detail/queryAllUserIds">我的订单<span>></span></a></li>
            <c:if test="${loginUser!=null && sessionScope.loginUser.type==1}">
                <li class="per-li5"><a href="${pageContext.request.contextPath}/detail/getAll">全部订单<span>></span></a>
                </li>
                <li class="per-li2"><a
                        href="${pageContext.request.contextPath}/user/touser?pageNum=1&pageSize=8">用户信息<span>></span></a>
                </li>
                <li class="per-li2"><a href="${pageContext.request.contextPath}/user/touser">用户列表<span>></span></a></li>
                <li class="per-li7"><a
                        href="${pageContext.request.contextPath}/productCategory/toProductCategory?pageNum=1&pageSize=8">分类管理<span>></span></a>
                </li>
                <li class="per-li9"><a href="${pageContext.request.contextPath}/product/toProduct?pageNum=1&pageSize=8">商品管理<span>></span></a></li>
                <li class="per-li9"><a href="${pageContext.request.contextPath}/product/toAddProduct">商品上架<span>></span></a></li>
            </c:if>
            <li class="<%--current-li --%>per-li1"><a
                    href="${pageContext.request.contextPath}/news/queryAll?pageNum=1&pageSize=12">新闻资讯<span>></span></a>
            </li>
            <li class="per-li10"><a
                    href="${pageContext.request.contextPath}/address/queryAddress">会员积分<span>></span></a></li>
        </ul>
    </div>
</div>