<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 34712
  Date: 2017/12/20
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../member/basic.jsp" %>
    <script type="text/javascript">
        $(function () {
            function cateGorySelect(ele, gradeId) {
                ele.empty();
                $.get("${pageContext.request.contextPath}/")
            }
        })

    </script>
</head>
<body>
<%@include file="../member/top.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="../member/left.jsp" %>
        <div class="col-lg-4 col-lg-offset-2 ">
            <h3>商品上架</h3>
        </div>
        <%-- </div>
         <div class="row">--%>
        <div class="col-lg-8 ">
            <form class="form-horizontal" id="productForm" method="get"
                  action="${pageContext.request.contextPath}/product/doAddProduct"
                  enctype="multipart/form-data">
                <c:forEach items="${list}" var="first">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">一级分类</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="addCategoryLevel1Id" id="addCategoryLevel1Id">
                            <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">二级分类</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="addCategoryLevel2Id" id="addCategoryLevel2Id">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">三级分类</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="addCategoryLevel3Id" id="addCategoryLevel3Id">

                            </select>
                        </div>
                    </div>
                </c:forEach>
                <div class="form-group">
                    <label class="col-sm-2 control-label">商品名称</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" placeholder="商品名称">

                    </div>
                </div>
                <div class="form-group">
                    <%-- <input type="hidden" id="errorinfo" value="${uploadFileError}">--%>
                    <label class="col-sm-2 control-label">图片</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="fileName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">单价</label>
                    <div class="col-sm-10">
                        <input type="number" name="price" class="form-control" placeholder="单价" min="0">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">库存</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="stock" placeholder="库存" min="0">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">描述</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="description" rows="3" placeholder="描述"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-6 col-sm-6">
                        <button type="submit" class="btn btn-default">保存</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!--底部一块-->
<%@include file="../member/foot.jsp" %>
</body>
</html>
