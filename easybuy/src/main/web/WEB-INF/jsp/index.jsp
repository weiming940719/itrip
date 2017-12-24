<%--
  Created by IntelliJ IDEA.weiming
  User: Administrator
  Date: 2017/12/18 0018
  Time: 下午 5:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
    <%@include file="componse/head.jsp" %>
    <title>易买网</title>
    <script type="text/javascript">
        var flg = true;
        if (flg) {
            var s = '${firstList}';
            if (s != null) {

                window.location.href = "${pageContext.request.contextPath}/index/index";
            }
        }
    </script>
    <%@ include file="componse/sou.jsp" %>
</head>
<body>
<!--Begin Header Begin-->
<%@ include file="componse/search.jsp" %>
<!--End Header End-->
<!--Begin Menu Begin-->
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <div class="nav">
            <div class="nav_t">全部商品分类</div>
            <div class="leftNav">
                <ul>
                    <c:forEach items="${firstList}" var="first" varStatus="status" end="${fn:length(firstList)}">
                        <li>
                            <div class="fj">
                        <span class="n_img"><span></span>
                            </span>
                                <span class="fl">${first.name}</span>
                            </div>
                            <div class="zj" style="top:-${status.index*40}px;">
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
        <!--End 商品分类详情 End-->
        <div class="m_ad">中秋送好礼！</div>
        <ul class="menu_r">
            <li><a href="${pageContext.request.contextPath}/index/index">首页</a></li>
            <c:forEach items="${firstList}" var="first">
                <li>
                    <a href="${pageContext.request.contextPath}/product/queryProductList?name=${first.name}&type=${first.type}&pageNum=1&pageSize=8">${first.name}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<!--End Menu End-->
<div class="i_bg bg_color">
    <div class="i_ban_bg">
        <!--Begin Banner Begin-->
        <div class="banner">
            <div class="top_slide_wrap">
                <ul class="slide_box bxslider">
                    <li><img src="${pageContext.request.contextPath}/statics/images/ban1.jpg" width="740" height="401"/>
                    </li>
                    <li><img src="${pageContext.request.contextPath}/statics/images/ban1.jpg" width="740" height="401"/>
                    </li>
                    <li><img src="${pageContext.request.contextPath}/statics/images/ban1.jpg" width="740" height="401"/>
                    </li>
                </ul>
                <div class="op_btns clearfix">
                    <a href="#" class="op_btn op_prev"><span></span></a>
                    <a href="#" class="op_btn op_next"><span></span></a>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            //var jq = jQuery.noConflict();
            (function () {
                $(".bxslider").bxSlider({
                    auto: true,
                    prevSelector: jq(".top_slide_wrap .op_prev")[0], nextSelector: jq(".top_slide_wrap .op_next")[0]
                });
            })();
        </script>
        <!--End Banner End-->
        <div class="inews">
            <div class="news_t">
                <span class="fr"><a href="#">更多 ></a></span>新闻资讯
            </div>
            <ul>
                <c:forEach items="${newsList}" var="news">
                    <li><span>[ 公告 ]</span><a href="#">${news.title}</a></li>
                </c:forEach>
            </ul>
            <div class="charge_t">
                话费充值
                <div class="ch_t_icon"></div>
            </div>
            <form>
                <table border="0" style="width:205px; margin-top:10px;" cellspacing="0" cellpadding="0">
                    <tr height="35">
                        <td width="33">号码</td>
                        <td><input type="text" value="" class="c_ipt"/></td>
                    </tr>
                    <tr height="35">
                        <td>面值</td>
                        <td>
                            <select class="jj" name="city">
                                <option value="0" selected="selected">100元</option>
                                <option value="1">50元</option>
                                <option value="2">30元</option>
                                <option value="3">20元</option>
                                <option value="4">10元</option>
                            </select>
                            <span style="color:#ff4e00; font-size:14px;">￥99.5</span>
                        </td>
                    </tr>
                    <tr height="35">
                        <td colspan="2"><input type="submit" value="立即充值" class="c_btn"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <!--Begin 进口 生鲜 Begin-->
    <c:forEach items="${firstList}" var="first" varStatus="status" end="${fn:length(firstList)}">
        <div class="i_t mar_10">
            <span class="floor_num">${status.index+1}F</span>
            <span class="fl">${first.name}</span>
        </div>
        <div class="content">
            <div class="fresh_left">
                <div class="fre_ban">
                    <div id="imgPlay1">
                        <ul class="imgs" id="actor1">
                            <li><a href="#"><img src="${pageContext.request.contextPath}/statics/images/fre_r.jpg"
                                                 width="211" height="286"/></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/statics/images/fre_r.jpg"
                                                 width="211" height="286"/></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/statics/images/fre_r.jpg"
                                                 width="211" height="286"/></a></li>
                        </ul>
                        <div class="prevf">上一张</div>
                        <div class="nextf">下一张</div>
                    </div>
                </div>
                <div class="fresh_txt">
                    <div class="fresh_txt_c">
                        <c:forEach items="${first.productCategories}" var="second">
                            <a href="${pageContext.request.contextPath}/product/queryProductList?type=${second.type}&name=${second.name}&pageNum=1&pageSize=6">${second.name}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="fresh_mid">
                <ul>
                    <c:forEach items="${first.product}" var="product">
                        <li>
                            <div class="name"><a href="#">${product.name}</a></div>
                            <div class="price">
                                <font>￥<span>${product.price}</span></font> &nbsp;
                            </div>
                            <div class="img">
                                <a href="${pageContext.request.contextPath}/product/queryProductDetail?id=${product.id}">
                                    <img src="${pageContext.request.contextPath}/statics/files/${product.fileName}"
                                         width="185" height="155"/>
                                </a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="fresh_right">
                <ul>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/statics/images/fre_b1.jpg" width="260"
                                         height="220"/></a></li>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/statics/images/fre_b2.jpg" width="260"
                                         height="220"/></a></li>
                </ul>
            </div>
        </div>
    </c:forEach>

    <%@include file="componse/foot.jsp" %>

</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>


<div class="top">
    <div class="logo"><a href="${ctx}/Home?action=index"><img src="${ctx}/statics/images/logo.png"></a></div>
    <div class="search">
        <form>
            <input txype="text" value="" class="s_ipt">
            <input type="submit" value="搜索" class="s_btn">
        </form>
        <span class="fl">
            <a href="javascript:void(0)">咖啡</a>
            <a href="javascript:void(0)">iphone 6S</a>
            <a href="javascript:void(0)">新鲜美食</a>
            <a href="javascript:void(0)">蛋糕</a>
            <a href="javascript:void(0)">日用品</a>
            <a href="javascript:void(0)">连衣裙</a>
        </span>
    </div>
    <div class="i_car">
        <div class="car_t">购物车 [ <span>3</span> ]</div>
        <div class="car_bg">
            <!--Begin 购物车未登录 Begin-->
            <c:if test="${sessionScope.loginUser==null}">
                <div class="un_login">还未登录！<a href="${ctx}/Login?action=toLogin" style="color:#ff4e00;">马上登录</a> 查看购物车！
                </div>
            </c:if>
            <!--End 购物车未登录 End-->
            <!--Begin 购物车已登录 Begin-->
            <ul class="cars">
                <c:if test="${sessionScope.cart2==null || sessionScope.cart2.items.size()<1}"> 您尚未购买任何物品，是否进入<a href="${ctx}/Home?action=index">商品页</a>进行购买！</c:if>
                <c:if test="${sessionScope.cart2.items.size()>=1}">
                    <li>
                        <div class="img">
                            <a href="javascript:void(0)">
                                <img src="${ctx}/statics/images/car1.jpg" width="58" height="58">
                            </a>
                        </div>
                        <div class="name">
                            <a href="javascript:void(0)">法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只</a>
                        </div>
                        <div class="price">
                            <font color="#ff4e00">￥399</font>X1
                        </div>
                    </li>
                </c:if>
            </ul>
            <div class="price_sum">共计&nbsp; <font color="#ff4e00">￥</font><span>1058</span></div>
            <div class="price_a"><a href="javascript:void(0)">去购物车结算</a></div>
            <!--End 购物车已登录 End-->
        </div>
    </div>
</div>
</body>