<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 34712
  Date: 2017/12/20
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../member/basic.jsp"%>
</head>
<body>
<%@include file="../member/top.jsp"%>
<script type="text/javascript">
    $(function () {
        $("button[name=deleteProductButton]").click(function () {
            /*alert("hello")*/
            var productCategoryId=$(this).attr("productCategoryId");


            $.post("${pageContext.request.contextPath}/productCategory/deleteProductCategory",{"productCategoryId":productCategoryId},function (data) {
                alert(data.msg);
                location.href=location.href;

            })
        })
        /*添加一级分类*/
        $("#addProductCategoryFirstButton").click(function () {
            /* alert("hello")*/
            $("#addFirstProductCategoryModle").modal("show");
        })
        $("#saveAddFirstProductCategory").click(function () {
            var name=$("#addFirstProductCategoryForm").serialize();
            /* alert(name);*/
            $.post("${pageContext.request.contextPath}/productCategory/addFirstProductCategory",name,function (data) {
                alert(data.msg);
                $("#addFirstProductCategoryModle").modal("hide");
                location.href=location.href;
            })
        })
        /*添加二级分类*/
        $("#addProductCategorySecondButton ").click(function () {
            showFirstProductCategory($("#addFirstProductCategorySele"));
            $("#addSecondProductCategoryModle").modal("show");
        })

        $("#saveAddSecondProductCategory").click(function () {
            var productCategory=$("#addSecondProductCategoryForm").serialize();

            $.post("${pageContext.request.contextPath}/productCategory/addSceondProductCategory",productCategory,function (data) {
                alert(data.msg);
                $("#addSecondProductCategoryModle").modal("hide");
                location.href=location.href;
            })
        })

        /*添加三级分类*/
        $("#addProductCategoryThreeButton").click(function () {
            /* alert("hello");*/
            showSecondProductCategory($("#addSecondProductCategorySele"))
            $("#addThirdProductCategoryModle").modal("show")
        })
        $("#saveAddThirdProductCategory").click(function () {
            alert("hello");
            var productCategory=$("#addThirdProductCategoryForm").serialize();
            $.post("${pageContext.request.contextPath}/productCategory/addThirdProductCategory",productCategory,function (data) {
                alert(data.msg);
                $("#addThirdProductCategoryModle").modal("hide");
                location.href=location.href;

            })

        })
    })

    function showFirstProductCategory(ele) {
        //清空下拉列表之前的内容
        ele.empty();
        //1.获取一类产品
        $.get("${pageContext.request.contextPath}/productCategory/productCateGoryFirst",function (data) {
            for(var i=0;i<data.length;i++){
                var option="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
                ele.append(option);
            }
        })
    }

    function showSecondProductCategory(ele) {
        //清空下拉列表之前的内容
        ele.empty();
        //1.获取二类产品
        $.get("${pageContext.request.contextPath}/productCategory/querySecondProductCategory",function (data) {
            for(var i=0;i<data.length;i++){
                var option="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
                /* alert(option);*/
                ele.append(option);
            }
        })
    }


</script>

<div class="container">
    <div class="row">
        <%@include file="../member/left.jsp"%>
        <div class="col-lg-4 col-lg-offset-4">
            <h3>分类列表</h3>
        </div>
        <div class="col-lg-2 col-lg-offset-2">
            <button class="btn btn-info" id="addProductCategoryFirstButton">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                添加一级分类
            </button>
        </div>
        <div class="col-lg-2 ">
            <button class="btn btn-info" id="addProductCategorySecondButton">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                添加二级分类
            </button>
        </div>
        <div class="col-lg-2 ">
            <button class="btn btn-info" id="addProductCategoryThreeButton">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                添加三级分类
            </button>
        </div>
        <%--</div>
        <div class="row">--%>

        <div class="col-lg-8 col-lg-offset-1 " >
            <table class="table table-striped">
                <tr>
                    <td>选择</td>
                    <td>分类名称</td>
                    <td>分类级别</td>
                    <td>父级分类</td>
                    <td>操作</td>

                </tr>
                <c:forEach items="${pageInfo.list}" var="productCategory">
                    <tr>
                        <td>
                            <input type="checkbox">
                        </td>
                        <td>${productCategory.name}</td>
                            <%-- <td>${productCategory.type}</td>--%>
                        <td>
                            <c:if test="${productCategory.type eq 1}">一级分类</c:if>
                            <c:if test="${productCategory.type eq 2}">二级分类</c:if>
                            <c:if test="${productCategory.type eq 3}">三级分类</c:if>
                        </td>
                            <%-- <td>
                                 <c:forEach items="pageInfo.list" var="productId">
                                     <c:if test="${productCategory.parentId eq productId.id}">${productId.name}</c:if>
                                 </c:forEach>
                             </td>--%>

                            <%--<td>${productCategory.parentName}</td>--%>
                        <td>
                            <c:if test="${productCategory.parentName == null}">无</c:if>
                            <c:if test="${productCategory.parentName != ''}">${productCategory.parentName}</c:if>

                        </td>

                        <td>
                                <%-- <c:if test="${users.type eq 0}">--%>
                            <button type="button" class="btn btn-danger btn" name="deleteProductButton" productCategoryId="${productCategory.id}">删除</button>
                                <%-- </c:if>--%>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%@include file="../page.jsp"%>

    <!--添加一级分类模板模态框-->
    <div class="modal fade" tabindex="-1" role="dialog" id="addFirstProductCategoryModle">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加分类</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addFirstProductCategoryForm">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" placeholder="名称">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="saveAddFirstProductCategory">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <!--添加二级模态框-->
    <div class="modal fade" tabindex="-1" role="dialog" id="addSecondProductCategoryModle">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加分类</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addSecondProductCategoryForm">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" placeholder="名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">父级名称</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="parentId" id="addFirstProductCategorySele">
                                </select>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="saveAddSecondProductCategory">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <!--添加三级分类模态框-->

    <div class="modal fade" tabindex="-1" role="dialog" id="addThirdProductCategoryModle">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加分类</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addThirdProductCategoryForm">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" placeholder="名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">父级Id</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="parentId" id="addSecondProductCategorySele">
                                </select>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="saveAddThirdProductCategory">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


</div>
<!--底部一块-->
<%@include file="../member/foot.jsp"%>
</body>
</html>
