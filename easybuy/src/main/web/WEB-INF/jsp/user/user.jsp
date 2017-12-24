<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
  Created by IntelliJ IDEA.
  User: 34712
  Date: 2017/12/18
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%@include file="../member/basic.jsp"%>
    <script type="text/javascript">
        $(function () {
            /*修改用户*/
            $("button[name=updateUserButton]").click(function () {
              /*  alert("hello")*/
              //查看用户详情
                var userId=$(this).attr("userId");
               /* alert(userId)*/
                $.get("${pageContext.request.contextPath}/user/detailUserById",
                    {"userId":userId},function (data) {
                        //查看用户信息
                        $("#updateUserId").val(userId);
                        $("#updateLoginName").val(data.loginName);
                        $("#updateUserName").val(data.userName);
                        $("#updateIdentityCode").val(data.identityCode);
                        $("#updateEmail").val(data.email);
                        $("#updateMobile").val(data.mobile);
                        $("#updateUserType").val(data.type);

                    })

              $("#updateUserModal").modal("show")
                //修改用户信息
                $("#saveUpdateUserButton").click(function () {
                    /*alert("hello");*/
                    var users=$("#updateUserForm").serialize();
                   /* alert(users);*/
                    $.post("${pageContext.request.contextPath}/user/updateUserById",
                        users,function (data) {
                            alert(data.msg);
                            $("#updateUserModal").modal("hide");
                            location.href = location.href;
                        })
                 })
            })
            /*添加用户信息*/
            $("#addUserButton").click(function () {
                $("#addUserModal").modal("show");

                $("#saveAddUserButton").click(function () {
                    var users=$("#addUserForm").serialize();
                    /*alert(users);*/
                    $.post("${pageContext.request.contextPath}/user/addUser",users,function (data) {
                        alert(data.msg);
                        $("#addUserModal").modal("hide");
                        location.href=location.href;

                    })
                })
            })
            /*删除用户*/
            $("button[name=deleteUserButton]").click(function () {
                var userId=$(this).attr("userId");
                $.post("${pageContext.request.contextPath}/user/deleteUserById",{"userId":userId},function (data) {
                    alert(data.msg);
                    location.href=location.href;
                })
            })
        })
    </script>

</head>
<body>
<%@include file="../member/top.jsp"%>

<div class="container">
    <div class="row">
        <%@include file="../member/left.jsp"%>
        <div class="col-lg-4 col-lg-offset-3">
            <h3>用户管理</h3>
        </div>
        <div class="col-lg-2 col-lg-offset-7">
            <button class="btn btn-info" id="addUserButton">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                添加
            </button>
        </div>
    <%--</div>
    <div class="row">--%>

        <div class="col-lg-8 col-lg-offset-1" >
            <table class="table table-striped">
                <tr>
                  <%--  <td></td>--%>
                    <td>用户名称</td>
                    <td>真实姓名</td>
                    <td>性别</td>
                    <td>类型</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${pageInfo.list}" var="users">
                    <tr>

                       <%-- <td>
                            <input type="checkbox" name="gradeIds" value="${grade.id}">
                        </td>--%>
                        <td>${users.loginName}</td>
                        <td>${users.userName}</td>
                       <%-- <td>${users.sex}</td>--%>

                           <td>
                               <c:if test="${users.sex eq 1}">男</c:if>
                               <c:if test="${users.sex eq 0}">女</c:if>
                           </td>
                        <%--<td>${users.type}</td>--%>
                           <td>
                               <c:if test="${users.type eq 1}">管理员</c:if>
                               <c:if test="${users.type eq 0}">用户</c:if>
                           </td>

                        <td>

                            <button type="button" class="btn btn-info btn" name="updateUserButton" userId="${users.id}">修改</button>
                            <c:if test="${users.type eq 0}">
                                <button type="button" class="btn btn-danger btn" name="deleteUserButton" userId="${users.id}">删除</button>
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%@include file="../page.jsp"%>

    <!--详情模态框-->


    <!--添加用户模态框-->
    <div class="modal fade" tabindex="-1" role="dialog" id="addUserModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加用户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="addUserForm">
                        <div class="form-group" >
                            <label  class="col-sm-3 control-label">用户姓名：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="addLoginName" name="loginName" >

                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">真实姓名:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="addUserName" name="userName" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">密码：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="addPassword" name="password" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">性别：</label>
                            <div class="col-sm-9">
                                <select  class="form-control"  name="sex" >
                                    <option type="text" value="1" >男</option>
                                    <option value="0" value="0"  >女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">身份证号：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="addIdentityCode" name="identityCode" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">邮箱：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="addEmail" name="email" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">手机：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="addMobile" name="mobile" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">用户类型：</label>
                            <div class="col-sm-9">
                                <%-- <input type="text" id="updateType" name="type" >--%>
                                <select  class="form-control"  name="type" id="updateUserType">
                                    <option type="text" value="1" >管理员</option>
                                    <option value="0" value="0"  >普通用户</option>
                                </select>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="saveAddUserButton">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!--修改班级模态框-->
    <div class="modal fade" tabindex="-1" role="dialog" id="updateUserModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="updateUserForm">
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">用户姓名：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="updateLoginName" name="loginName" >
                                <input type="hidden" class="form-control" id="updateUserId" name="id"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">真实姓名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="updateUserName" name="userName" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">身份证号：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="updateIdentityCode" name="identityCode" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">邮箱：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="updateEmail" name="email" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">手机：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="updateMobile" name="mobile" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-3 control-label">用户类型：</label>
                            <div class="col-sm-9">
                               <%-- <input type="text" id="updateType" name="type" >--%>
                                <select  class="form-control"  name="type" id="updateUserType">
                                    <option type="text" value="1" selected="selected">管理员</option>
                                    <option value="0" value="0" selected="selected">普通用户</option>
                                </select>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="saveUpdateUserButton">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

</div>

<!--底部一块-->
<%@include file="../member/foot.jsp"%>
</body>
</html>
