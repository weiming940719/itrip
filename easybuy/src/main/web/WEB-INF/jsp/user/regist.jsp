<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/12/19
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/statics/js/common/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/statics/js/jquery.bxslider_e88acd1b.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/menu.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/select.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/lrscroll.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/iban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/fban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/f_ban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/mban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/bban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/hban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/tban.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/common/js/lrscroll_1.js"></script>
    <script type="text/javascript">
       function change() {
            img = document.getElementById("image");
            img.src = "${pageContext.request.contextPath}/user/doCode?random=" + Math.random();
        }
        $(function () {
            $("#aCode").click(function () {
                $("#img").attr("src", "${pageContext.request.contextPath}/user/doCode");
            })
        })
    </script>
    <script type="text/javascript">
       $(function () {
           $("#registForm").submit(function () {
               var uname=$("#uname").val();
               var lname=$("#lname").val();
               var p1=$("#p1").val();
               var p2=$("#p2").val();
               var icode=$("#icode").val();
               var ema=$("#ema").val();
               var mob=$("#mob").val();
               var regex = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
               if(uname==""){
                   alert("用户名不能为空");
                   return false;
               }

               if(lname==""){
                   alert("登录名不能为空");
                   return false;
               }

               if(p1==""){
                   alert("密码不能为空");
                   return false;
               }

               if(p2==""){
                   alert("确认密码不能为空");
                   return false;
               }

               if(icode==""){
                   alert("身份证号不能为空");
                   return false;
               }

               if(ema==""){
                   alert("邮箱不能为空");
                   return false;
               }
               if(!regex.test(ema)){
                   alert("邮箱格式不正确!");
                   return false;
               }

               if(mob==""){
                   alert("电话号码不能为空");
                   return false;
               }
           })
       })
    </script>

    <script type="text/javascript">
        $(function () {
            $("#p2").blur(function () {
                var password = $("#p1").val();
                var password1 = $("#p2").val();
                if (password1 != password) {
                    alert("两次填写不一致！");
                }
            })
        })
    </script>
    <script type="text/javascript">
        $(function () {
            $("#lname").blur(function () {
                var loginName = $(this).val();
                $.post("${pageContext.request.contextPath}/user/checkUserName",
                    {"loginName": loginName},
                    function (data) {
                        alert(data.message);
                        return false;
                    },
                    "json");
            })
        })
    </script>

    <script type="text/javascript">
        $(function () {
            var msg='${message}';
            if(msg.length>0){
                alert(msg);
            }
        })
    </script>

    <title>易买网</title>
</head>
<body>

<!--End Header End-->
<!--Begin Login Begin-->
<div class="log_bg">
    <div class="top">
        <div class="logo"><a href="${pageContext.request.contextPath}/user/toindex"><img
                src="${pageContext.request.contextPath}/statics/images/logo.png"/></a></div>
    </div>
    <div class="regist">
        <div class="log_img"><img src="${pageContext.request.contextPath}/statics/images/l_img.png" width="611"
                                  height="425"/></div>
        <div class="reg_c">
            <form action="${pageContext.request.contextPath}/user/doregist" method="post" id="registForm">
                <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
                    <tr height="50" valign="top">
                        <td width="95">&nbsp;</td>
                        <td>
                            <span class="fl" style="font-size:24px;">注册</span>
                            <span class="fr">已有商城账号，<a href="${pageContext.request.contextPath}/user/toLogin"
                                                       style="color:#ff4e00;">我要登录</a></span>
                        </td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;</td>
                        <td><input type="text" class="l_user" name="userName" id="uname"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;登录名 &nbsp;</td>
                        <td><input type="text" class="l_user" name="loginName" id="lname"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                        <td><input type="password" class="l_pwd" name="password" id="p1"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                        <td><input type="password" class="l_pwd" name="password1" id="p2"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;性别 &nbsp;</td>
                        <td>男<input type="radio" name="sex" value="1"/> &nbsp; &nbsp;女<input type="radio" name="sex"
                                                                                             value="0"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;身份证号 &nbsp;</td>
                        <td><input type="text" class="l_user" name="identityCode" id="icode"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;</td>
                        <td><input type="text" value="" class="l_email" name="email" id="ema"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                        <td><input type="text" value="" class="l_tel" name="mobile" id="mob"/></td>
                    </tr>
                    <%--<tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>
                        <td>
                          <input type="text"  class="l_ipt" id="vcode"/>
                            <a href="javascript:change()">
                                <img src="${pageContext.request.contextPath}/user/doCode" id="img" style="position: relative;bottom: -3px"/>
                            </a>
                            <a href="" style="font-size:12px; font-family:'宋体';" id="aCode">换一张</a>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="60">
                        <td>&nbsp;</td>
                        <td><input type="submit" value="立即注册" class="log_btn"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End-->
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical
        Support: Dgg Group <br/>
        <img src="${pageContext.request.contextPath}/statics/images/b_1.gif" width="98" height="33"/>
        <img src="${pageContext.request.contextPath}/statics/images/b_2.gif" width="98" height="33"/>
        <img src="${pageContext.request.contextPath}/statics/images/b_3.gif" width="98" height="33"/>
        <img src="${pageContext.request.contextPath}/statics/images/b_4.gif" width="98" height="33"/>
        <img src="${pageContext.request.contextPath}/statics/images/b_5.gif" width="98" height="33"/>
        <img src="${pageContext.request.contextPath}/statics/images/b_6.gif" width="98" height="33"/>
    </div>
</div>
<!--End Footer End -->
</body>
</html>

