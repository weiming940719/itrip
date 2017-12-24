<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@include file="basic.jsp" %>
    <script type="text/javascript">
        $(function () {
            //添加新闻
            $("#addNewsButton").click(function () {
                $("#addNewsModal").modal("show");
            })
            $("button[name=saveAddNewsButton]").click(function () {
                var news = $("#addNewsForm").serialize();
                var url = "${pageContext.request.contextPath}/news/addNews";
                $.post(url,news,function (data) {
                    alert(data.msg)
                    $("#addNewsModal").modal("hide");
                    location.href=location.href
                })
            })
            //删除单个新闻
            $("button[name=deleteNewsButton]").click(function () {
                var ids = $(this).attr("newsId");
                if(confirm("确认删除该条新闻吗?")) {
                    var url = "${pageContext.request.contextPath}/news/deleteMoreNews";
                    $.post(url,{"ids":ids},function (data) {
                        alert(data.msg);
                        location.href=location.href
                    })
                }
            })
            //删除多条新闻
            $("#deleteMoreNewsButton").click(function () {
                var ids="";
                $.each($("input:checkbox"),function () {
                    if(this.checked) {
                        ids = ids+ $(this).val() + ",";
                    }
                })
                if(ids=="") {
                    alert("请选择要删除的新闻!");
                }else {
                    if(confirm("确认要删除吗?")) {
                        var url = "${pageContext.request.contextPath}/news/deleteMoreNews";
                        $.post(url,{"ids":ids},function (data) {
                            alert(data.msg)
                            location.href=location.href
                        })
                    }
                }
            })
            //修改新闻
            $("button[name=updateNewsButton]").click(function () {
                var id = $(this).attr("newsId");
                var url ="${pageContext.request.contextPath}/news/queryNewsById";
               $.post(url,{"id":id},function (data) {
                    $("#newsId").val(data.id)
                    $("#newsTitle").val(data.title)
                    $("#newsContext").val(data.content)
                })
                $("#updateNewsModal").modal("show");
            })
            $("#saveUpdateNewsButton").click(function () {
                var news = $("#updateNewsForm").serialize();
                var url ="${pageContext.request.contextPath}/news/updateNews";
                $.post(url,news,function (data) {
                    alert(data.msg)
                    $("#updateNewsModal").modal("hide");
                    location.href=location.href
                })
            })
        })
    </script>
</head>

<body>
<!--header-->
<%@include file="top.jsp" %>
<!--nav-->
<%@include file="left.jsp" %>
<div class="personal-r f-r"  style="position: relative;left: -120px">
    <div class="mem_t"><h3 style="position: relative;right: -50px"><b>资讯列表</b></h3></div>
    <table border="0" class="table-bordered" style="width:870px; font-size: 16px;"
           align="center">
        <c:if test="${loginUser!=null && sessionScope.loginUser.type==1}">
        <tr>
            <td colspan="4" align="right">
                <button class="btn btn-danger  glyphicon glyphicon-trash" id="deleteMoreNewsButton">批量删除</button>
                <button class="btn btn-success glyphicon glyphicon-plus" id="addNewsButton">添加</button>
            </td>
        </tr>
        </c:if>
        <tr style="line-height: 40px" align="center">
            <c:if test="${loginUser!=null && sessionScope.loginUser.type==1}">
                <td></td>
            </c:if>
                <td><b>文章标题</b></td>
                <td><b>创建时间</b></td>
            <c:if test="${loginUser!=null && sessionScope.loginUser.type==1}">
                <td><b>操作</b></td>
            </c:if>
        </tr>
        <c:forEach items="${pageInfo.list}" var="news">
            <tr style="line-height: 40px"align="center">
                <c:if test="${loginUser!=null && sessionScope.loginUser.type==1}">
                <td>
                    <input type="checkbox" value="${news.id}" name="idS">
                </td>
                </c:if>
                <td><a style="text-decoration: none" href="${pageContext.request.contextPath}/news/queryNewsByTitle?id=${news.id}">${news.title}</a></td>
                <td style="text-decoration: underline">
                        ${news.createTime}
                </td>
                <c:if test="${loginUser!=null && sessionScope.loginUser.type==1}">
                <td width="20%">
                    <button class="btn btn-success glyphicon glyphicon-pencil"  name="updateNewsButton" newsId="${news.id}">修改</button>
                    <button class="btn btn-danger glyphicon glyphicon-trash" name="deleteNewsButton" newsId="${news.id}">删除</button>
                </td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
    <div>
        <%@include file="../page/page1.jsp" %>
    </div>
</div>

<div style="clear:both;"></div>

<%@include file="foot.jsp" %>
<!--添加新闻模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="addNewsModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加新闻</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" id="addNewsForm">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" name="content"></textarea>
                        </div>
                    </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" name="saveAddNewsButton">保存</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</div>
<!--修改新闻模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="updateNewsModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" id="updateNewsForm">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="title" id="newsTitle">
                            <input type="hidden" id="newsId" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" name="content" id="newsContext"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="saveUpdateNewsButton">修改</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>
</body>
</html>
