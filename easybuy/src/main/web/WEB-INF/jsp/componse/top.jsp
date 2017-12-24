<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="nav"  style="margin-top: -4px">
    <div class="nav_t">全部商品分类</div>
    <div class="leftNav none" style="display: none;">
        <ul id="leftMenu">
            <c:forEach items="${sessionScope.firstList}" var="first">
                <li>
                    <div class="fj">
                        <span class="n_img"><span></span></span>
                       <span class="fl">${first.name}</span>
                    </div>
                    <div class="zj">
                        <div class="zj_l">
                            <c:forEach items="${first.productCategories}" var="second">
                                <div class="zj_l_c">
                                    <h2>
                                        <a href="${pageContext.request.contextPath}/product/queryProductList?name=${second.name}&type=${second.type}&pageNum=1&pageSize=8">${second.name}</a>
                                    </h2>
                                    <c:forEach items="${second.productCategories}" var="three">
                                        <a href="${pageContext.request.contextPath}/product/queryProductList?name=${three.name}&type=${three.type}&pageNum=1&pageSize=8">${three.name}</a> |
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<ul class="menu_r">
    <li><a href="${pageContext.request.contextPath}/index/index">首页</a></li>
    <c:forEach items="${sessionScope.firstList}" var="first">
        <li>
            <a href="${pageContext.request.contextPath}/product/queryProductList?name=${first.name}&type=${first.type}&pageNum=1&pageSize=8">${first.name}</a>
        </li>
    </c:forEach>
</ul>
<div class="m_ad">中秋送好礼！</div>