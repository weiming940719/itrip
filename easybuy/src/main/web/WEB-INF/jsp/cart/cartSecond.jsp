<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/21
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        var addressId = "";
        $("input[name=selectAddress]").click(function () {
            addressId = $(this).val();
        })
        $("button[name=saveOrder]").click(function () {
            var name = $("#name").val();
            var phone = $("#phone").val();
            var address = $("#address").val();
            var remark = $("#remark").val();
            if (addressId == "") {
                alert("请选择配送地址！");
            } else {
                if (addressId == -1) {
                    if (address == "" || address == null) {
                        alert("请正确填写配送地址！");
                        return false;
                    } else {
                        $.post("${pageContext.request.contextPath}/address/addAddress",
                            {
                                "name": name,
                                "phone": phone,
                                "address": address,
                                "remark": remark
                            }, function (data) {
                                addressId = data;
                                saveOrder(addressId);
                            })
                        return false;

                    }
                }
                saveOrder(addressId);
            }
        })

        function saveOrder(addressId) {
            if (parseInt(addressId) == -1) {
                return false;
            }
            if (confirm("确认提交订单信息？")) {
                location.href = "${pageContext.request.contextPath}/order/saveOrder?id=" + addressId;
            }

        }

        $("button[name=update]").click(function () {
            location.href = "${pageContext.request.contextPath}/cart/detail";
        })
    })
</script>

<div class="content mar_20">
    <img src="${pageContext.request.contextPath}/statics/images/img2.jpg"/>
</div>
<div class="content mar_20">
    <div class="two_bg">
        <div class="two_t">
            <span class="fr"></span>商品列表
        </div>
        <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
            <tr>
                <td class="car_th" width="20%"></td>
                <td class="car_th" width="30%">商品名称</td>
                <td class="car_th" width="20%">购买数量</td>
                <td class="car_th" width="10%">小计</td>
                <td class="car_th" width="20%">操作</td>

            </tr>
            <c:forEach items="${cart.carts}" var="cartList">
                <tr>
                    <td align="center">
                        <div class="mid-tu f-l" style="margin-left: 30px">
                            <img src="${pageContext.request.contextPath}/statics/files/${cartList.product.fileName}"
                                 width="100" height="100"/>
                        </div>
                    </td>
                    <td align="center">${cartList.product.name}</td>
                    <td align="center">${cartList.quantity}</td>
                    <td align="center" style="color:#ff4e00;">￥${cartList.product.price*cartList.quantity}</td>
                    <td align="center">
                        <button type="button" class="btn btn-info" name="update" productId="${cartList.product.id}">修改
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <div class="two_t">
            <span class="fr"></span>收货人信息
        </div>
        <table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
            <tr>
                <td class="p_td" width="160">昵称</td>
                <td width="395">
                    ${loginUser.loginName}

                </td>
                <td class="p_td">收货人姓名</td>
                <td>
                    <input type="text" id="name" value="${loginUser.userName}">
                </td>
            </tr>
            <tr>
                <td class="p_td">手机</td>
                <td>
                    <input type="text" id="phone" value="${loginUser.mobile}">
                </td>
                <td class="p_td" width="160">电子邮件</td>
                <td width="395">${loginUser.email}</td>
            </tr>
        </table>
        <div class="two_t">
            <span class="fr"></span>选择地址
        </div>
        <table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
            <c:forEach items="${addressList}" var="address" varStatus="status">
                <tr>
                    <td class="p_td" width="160">
                        <c:choose>
                            <c:when test="${empty address.remark}">
                                地址${status.index+1}
                            </c:when>
                            <c:otherwise>
                                ${address.remark}
                            </c:otherwise>
                        </c:choose>
                        <input type="radio" name="selectAddress" value="${address.id}">
                    </td>
                    <td>
                            ${address.address}
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td class="p_td" width="160">
                    新地址<input type="radio" name="selectAddress" value="-1">
                </td>
                <td>
                    地址&nbsp;<input type="text" name="newAddress" id="address" class="add_ipt">&nbsp;
                    备注&nbsp;<input type="text" name="newRemark" id="remark" class="add_ipt">
                </td>
            </tr>
        </table>
        <table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
            <tr height="70">
                <td align="right">
                    <b style="font-size:14px;">应付款金额：<span
                            style="font-size:22px; color:#ff4e00;">￥${cart.sum}</span></b>
                </td>
            </tr>
            <tr height="70">
                <td align="right">
                    <button type="button" class="btn btn-danger" name="saveOrder">确认订单</button>
                </td>
            </tr>
        </table>
    </div>
</div>