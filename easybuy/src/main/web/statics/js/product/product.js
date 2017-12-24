$(function () {
    /*删除产品*/
    $("button[name=deleteProductButton]").click(function () {
        /* alert("hello")*/
        var productId = $(this).attr("productId")
        if (confirm("确认删除吗？")) {
            $.post("${pageContext.request.contextPath}/product/deleteProduct", {"productId": productId}, function (data) {
                alert(data.msg);
                location.href = location.href;
            })
        }
    })

    $("#deleteIds").click(function () {
        alert("ss");
        var productId = "";
        $.each($("input:checkbox"), function () {
            if (this.checked) {
                productId = productId + $(this).val() + ",";
            }
        })
        if (productId == "") {
            alert("请选择要删除的商品!");
            return false;
        } else {
            if (confirm("确定删除选中商品吗？")) {
                $.post("${pageContext.request.contextPath}/product/deleteProductByList", {"productIds": productId}, function (data) {
                    alert(data.msg);
                    location.href = location.href;
                })
            }
        }
    })

    function cateGorySelect(ele, cateId, id) {
        var id = "";
        ele.empty();
        $.get("${pageContext.request.contextPath}/productCategory/queryAllCateGory", function (data) {
            for (var i = 0; i < data.length; i++) {
                ele.append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
            }
            cateGorySelect1($("#addCategoryLevel2Id"), null, data[0].id);
            if (null != cateId) {
                ele.val(cateId);
            }
        })

    }

    function cateGorySelect1(ele, cateId, id) {
        ele.empty();
        $.get("${pageContext.request.contextPath}/productCategory/querySecond", {"id": id}, function (data) {
            for (var i = 0; i < data.length; i++) {
                ele.append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
            }
            cateGorySelect2($("#addCategoryLevel3Id"), null, data[0].id);
            if (null != cateId) {
                ele.val(cateId);
            }
        })
    }

    function cateGorySelect2(ele, cateId, id) {
        ele.empty();
        $.get("${pageContext.request.contextPath}/productCategory/queryThree", {"id": id}, function (data) {
            for (var i = 0; i < data.length; i++) {
                ele.append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
            }
            if (null != cateId) {
                ele.val(cateId);
            }
        })

    }

    $("#save").click(function () {
        cateGorySelect($("#addCategoryLevel1Id"), null, null);
        $("#saveModal").modal("show");
    })

    $("#addCategoryLevel1Id").click(function () {
        var id = $(this).val();
        cateGorySelect1($("#addCategoryLevel2Id"), null, id);
    })

    $("#addCategoryLevel2Id").click(function () {
        var id = $(this).val();
        cateGorySelect2($("#addCategoryLevel3Id"), null, id);
    })


    $("#saveProduct").click(function () {
        var student = $("#saveForm");
        var formData = new FormData(student[0]);
        $.ajax({
            url: "${pageContext.request.contextPath}/product/saveProduct",
            type: "post",
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                alert(data.msg);
                $("#saveModal").modal("hide");
                location.href = location.href;
            }
        });
    });

    $("button[name=updateProductButton]").click(function () {

        var productId = $(this).attr("productId");
        $.get("${pageContext.request.contextPath}/product/queryByDetail", {"id": productId}, function (data) {
            cateGorySelect($("#categoryLevel1Id"), data.categoryLevel1Id, null);
            cateGorySelect1($("#categoryLevel2Id"), data.categoryLevel2Id, data.categoryLevel1Id);
            cateGorySelect2($("#categoryLevel3Id"), data.categoryLevel3Id, data.categoryLevel2Id);
            $("#updateName").val(data.name);

            $("#updatePrice").val(data.price);
            $("#updateStock").val(data.stock);
            $("#updateDescription").val(data.description);
            $("#picture").attr("src", "${pageContext.request.contextPath}/statics/files/" + data.fileName);


        })
        $("#updateModal").modal("show");
    })

    $("#updateProduct").click(function () {
        var student = $("#updateForm");
        var formData = new FormData(student[0]);
        $.ajax({
            url: "${pageContext.request.contextPath}/product/updateProduct",
            type: "post",
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                alert(data.msg);
                $("#saveModal").modal("hide");
                location.href = location.href;
            }
        });
    });

})