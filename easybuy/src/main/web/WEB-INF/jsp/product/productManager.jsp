<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 34712
  Date: 2017/12/20
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../member/basic.jsp" %>

</head>
<body>

<%@include file="../member/top.jsp" %>
<script type="text/javascript">
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
                cateGorySelect1($("#categoryLevel2Id"), null, data[0].id);
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
                cateGorySelect2($("#categoryLevel3Id"), null, data[0].id);
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

        $("#categoryLevel1Id").click(function () {
            var id = $(this).val();
            cateGorySelect1($("#categoryLevel2Id"), null, id);
        })

        $("#categoryLevel2Id").click(function () {
            var id = $(this).val();
            cateGorySelect2($("#categoryLevel3Id"), null, id);
        })


        function cateSelect(ele, cateId) {
            ele.empty();
            $.get("${pageContext.request.contextPath}/productCategory/queryAllCateGory", function (data) {
                for (var i = 0; i < data.length; i++) {
                    ele.append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
                }
                if (null != cateId) {
                    ele.val(cateId);
                }
            })
        }

        function cateSelect1(ele, cateId, id) {
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
                cateSelect($("#categoryLevel1Id"), data.categoryLevel1Id, null);
                cateSelect1($("#categoryLevel2Id"), data.categoryLevel2Id, data.categoryLevel1Id);
                cateSelect1($("#categoryLevel3Id"), data.categoryLevel3Id, data.categoryLevel2Id);
                $("#updateName").val(data.name);
                $("#updateId").val(data.id);
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
                    $("#updateModal").modal("hide");
                    location.href = location.href;
                }
            })
        })


    })
    //图片上传预览    IE是用了滤镜。
    function previewImage(file) {
        var MAXWIDTH = 100;
        var MAXHEIGHT = 100;
        var div = document.getElementById('preview');
        if (file.files && file.files[0]) {
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.onload = function () {
                img.width = 100;
                img.height = 100;
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                img.src = evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
            var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            div.innerHTML = "<div id=divhead style='width:" + 100 + "px;height:" + 100 + "px;" + sFilter + src + "\"'></div>";
        }
    }
</script>

<div class="container">
    <div class="row">
        <%@include file="../member/left.jsp" %>
        <div class="col-lg-4 col-lg-offset-3 ">
            <h3>商品管理</h3>
        </div>
        <%-- </div>
         <div class="row">--%>
        <div class="col-lg-8 col-lg-offset-1">
            <table class="table table-striped">
                <tr>
                    <td></td>
                    <td>商品名称</td>
                    <td>商品图片</td>
                    <td>库存</td>
                    <td>价格</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${pageInfo.list}" var="product">
                    <tr>
                        <td>
                            <input type="checkbox" name="productIds" value="${product.id}">
                        </td>
                        <td>${product.name}</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/statics/files/${product.fileName}" height="50"
                                 width="50"/>
                        </td>
                        <td>${product.stock}</td>
                        <td>${product.price}</td>
                        <td>
                            <button type="button" class="btn btn-info btn" name="updateProductButton"
                                    productId="${product.id}">修改
                            </button>
                                <%-- <c:if test="${users.type eq 0}">--%>
                            <button type="button" class="btn btn-danger btn" name="deleteProductButton"
                                    productId="${product.id}">删除
                            </button>
                                <%-- </c:if>--%>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5">
                        <button type="button" class="btn btn-danger" id="deleteIds">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除
                        </button>
                        <button type="button" class="btn btn-info" id="save">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            添加
                        </button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <%@include file="../page.jsp" %>
</div>


<%--insert--%>
<div class="modal fade" tabindex="-1" role="dialog" id="saveModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">商品上架</h4>
            </div>
            <div class="modal-body">
                <form id="saveForm" method="post" enctype="multipart/form-data"
                      action="${pageContext.request.contextPath}/product/saveProduct">
                    <div class="form-group">
                        <label>一级分类</label>
                        <select class="form-control" id="addCategoryLevel1Id" name="categoryLevel1Id"
                                placeholder="一级分类"></select>
                    </div>

                    <div class="form-group">
                        <label>二级分类</label>
                        <select class="form-control" id="addCategoryLevel2Id" name="categoryLevel2Id"
                                placeholder="二级分类"></select>
                    </div>

                    <div class="form-group">
                        <label>三级分类</label>
                        <select class="form-control" id="addCategoryLevel3Id" name="categoryLevel3Id"
                                placeholder="三级分类"></select>
                    </div>

                    <div class="form-group">
                        <label>商品名称</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="商品名称"></input>
                    </div>

                    <div class="form-group">
                        <label>图片</label>

                        <input type="file" class="form-control" name="fileName" id="fileName"
                               placeholder="图片类型*.jpg、*.jpeg、*.png、*.pneg"></input>
                    </div>

                    <div class="form-group">
                        <label>单价</label>
                        <input type="text" class="form-control" name="price" id="price" placeholder="单价"></input>
                    </div>

                    <div class="form-group">
                        <label>库存</label>
                        <input type="text" class="form-control" name="stock" id="stock" placeholder="库存"></input>
                    </div>

                    <div class="form-group">
                        <label>描述</label>
                        <textarea type="text" class="form-control" name="description" id="description"
                                  placeholder="描述"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary" id="saveProduct">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%--update--%>
<div class="modal fade" tabindex="-1" role="dialog" id="updateModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">商品更新</h4>
            </div>
            <div class="modal-body">
                <form id="updateForm" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>一级分类</label>
                        <input type="hidden" name="id" id="updateId">
                        <select class="form-control" id="categoryLevel1Id" name="categoryLevel1Id"
                                placeholder="一级分类"></select>
                    </div>

                    <div class="form-group">
                        <label>二级分类</label>
                        <select class="form-control" id="categoryLevel2Id" name="categoryLevel2Id"
                                placeholder="二级分类"></select>
                    </div>

                    <div class="form-group">
                        <label>三级分类</label>
                        <select class="form-control" id="categoryLevel3Id" name="categoryLevel3Id"
                                placeholder="三级分类"></select>
                    </div>

                    <div class="form-group">
                        <label>商品名称</label>
                        <input type="text" class="form-control" name="name" id="updateName" placeholder="商品名称"></input>
                    </div>

                    <div class="form-group">
                        <label>图片</label>
                        <div class="row">
                            <div style="margin-right: 250px;float: left;position: relative;left: 100px;">
                                <img src="" id="picture" width="100px" height="100px">
                            </div>
                            <div style="float: left;position: relative;left: -50px;" align="right;">
                                <div id="preview">
                                    <img src="${pageContext.request.contextPath}/statics/files/shangchaun.jpg"
                                         id="imghead" width="100px" height="100px">
                                </div>
                            </div>
                        </div>
                        <input style="margin-top: 10px" type="file" class="form-control" name="fileName"
                               id="updateFileName"
                               placeholder="图片类型*.jpg、*.jpeg、*.png、*.pneg" onchange="previewImage(this)"/>
                    </div>

                    <div class="form-group">
                        <label>单价</label>
                        <input type="text" class="form-control" name="price" id="updatePrice" placeholder="单价"></input>
                    </div>

                    <div class="form-group">
                        <label>库存</label>
                        <input type="text" class="form-control" name="stock" id="updateStock" placeholder="库存"></input>
                    </div>

                    <div class="form-group">
                        <label>描述</label>
                        <textarea type="text" class="form-control" name="description" id="updateDescription"
                                  placeholder="描述"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary" id="updateProduct">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--底部一块-->
<%@include file="../member/foot.jsp" %>
</body>
</html>
