$(function () {
    $("a[name=up]").click(function () {
        var productId = $(this).attr("productId");
        $.post("${pageContext.request.contextPath}/cart/updateCart",
            {"id": productId, "quantity": 1}, function (data) {
                $("#sum").html(data.sum);
                if (data == "库存不足") {
                    $("button[name=submitCart]").hide();
                    alert("库存不足请减少购买量后在提交！");
                    return false;
                } else {
                    $("button[name=submitCart]").show();
                }
            })
    })
    $("a[name=low]").click(function () {
        var productId = $(this).attr("productId");
        $.post("${pageContext.request.contextPath}/cart/updateCart",
            {"id": productId, "quantity": -1}, function (data) {
                $("#sum").html(data.sum);
                if (data == "库存不足") {
                    $("button[name=submitCart]").hide();
                    alert("库存不足请减少购买量后在提交！");
                    return false;
                } else {
                    $("button[name=submitCart]").show();
                }
            })
    })

    $("input[name=quantity]").blur(function () {
        var quantity = $(this).val();
        var id = $(this).attr("productId");
        alert(id);
        alert(quantity);
        $.post("${pageContext.request.contextPath}/cart/updateCart",
            {"id": id, "quantity": quantity}, function (data) {
                $("#sum").html(data.sum);
                if (data == "库存不足") {
                    $("button[name=submitCart]").hide();
                    alert("库存不足请减少购买量后在提交！");
                    return false;
                } else {
                    $("button[name=submitCart]").show();
                }
            })
    })
})

