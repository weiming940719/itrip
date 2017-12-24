<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/19
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="../componse/head.jsp" %>
    <%@ include file="../componse/sou.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common/n_nav.js"></script>
    <title>易买网</title>

    <script type="text/javascript">
        $(function () {
            $("img[name=saveCart]").click(function () {
                var quantity = $("#quantity").val();
                var productId = $("#productId").val();
                $.post("${pageContext.request.contextPath}/cart/saveCart", {
                    "id": productId,
                    "quantity": quantity
                }, function (data) {
                    alert(data);
                    location.href = document.referrer;
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
<!--Begin Header Begin-->
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
    <div class="postion">
    </div>
    <div class="content">
        <div id="tsShopContainer">
            <div id="tsImgS" class="row">
                <div style="float: left">
                    <a href="${pageContext.request.contextPath}/statics/files/${product.fileName}" title="Images"
                       class="MagicZoom" id="MagicZoom">
                        <img src="${pageContext.request.contextPath}/statics/files/${product.fileName}" width="390"
                             height="390"/>
                    </a>
                </div>

                <div class="pro_des" style="float: right">
                    <div class="des_name">
                        <input type="hidden" value="${product.id}" name="entityId" id="productId" class="n_ipt"/>
                        <p>${product.name}</p>
                        “开业巨惠，北京专柜直供”，不光低价，“真”才靠谱！
                    </div>
                    <div class="des_price">
                        本店价格：<b>￥${product.price}</b><br/>
                    </div>
                    <div class="des_price">
                        库存：<b>${product.stock}</b><br/>
                    </div>
                    <div class="des_choice">
                        <span class="fl">型号选择：</span>
                        <ul>
                            <li class="checked">30ml
                                <div class="ch_img"></div>
                            </li>
                            <li>50ml
                                <div class="ch_img"></div>
                            </li>
                            <li>100ml
                                <div class="ch_img"></div>
                            </li>
                        </ul>
                    </div>
                    <div class="des_choice">
                        <span class="fl">颜色选择：</span>
                        <ul>
                            <li>红色
                                <div class="ch_img"></div>
                            </li>
                            <li class="checked">白色
                                <div class="ch_img"></div>
                            </li>
                            <li>黑色
                                <div class="ch_img"></div>
                            </li>
                        </ul>
                    </div>
                    <br>
                    <br>
                    <div class="des_join">
                        <div class="j_nums">
                            <input type="number" value="1" name="quantity" min="1" id="quantity" class="n_ipt"/>
                            <input type="hidden" name="productStock" value="${product.stock}">
                        </div>
                        <span class="fl">
                     <img src="${pageContext.request.contextPath}/statics/images/j_car.png" name="saveCart"/>
                </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content mar_20">
        <div id="favoriteList">
        </div>
        <div class="l_list">
            <div class="des_border">
                <div class="des_tit">
                    <ul>
                        <li class="current"><a href="#p_attribute">商品属性</a></li>
                        <li><a href="#p_details">商品详情</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">
                    <table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;"
                           cellspacing="0" cellpadding="0">
                        <tr>
                            <td>商品名称：${product.name}</td>
                            <td>商品价格：${product.price}</td>
                            <td>品牌： 迪奥（Dior）</td>
                            <td>上架时间：2015-09-06 09:19:09</td>
                        </tr>
                        <tr>
                            <td>商品毛重：160.00g</td>
                            <td>商品产地：法国</td>
                            <td>香调：果香调香型：淡香水/香露EDT</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>容量：1ml-15ml</td>
                            <td>类型：女士香水，Q版香水，组合套装</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="des_border" id="p_details">
                <div class="des_t">商品详情</div>
                <div class="des_con">
                    <table border="0" align="center" style="width:745px; font-size:14px; font-family:'宋体';"
                           cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                ${product.description}
                            </td>
                        </tr>
                    </table>
                    <p align="center">
                        <img src="${pageContext.request.contextPath}/statics/files/${product.fileName}" width="185"
                             height="155">
                    </p>
                </div>
            </div>
        </div>
    </div>
    <script>
        favoriteList();
    </script>
    <!--End 弹出层-收藏成功 End-->
    <%@ include file="../componse/foot.jsp" %>
    <!--Begin 弹出层-加入购物车 Begin-->
</div>
</body>
</html>