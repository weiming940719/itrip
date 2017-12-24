<%--
  Created by IntelliJ IDEA. liyan
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
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/statics/common/js/jquery-1.8.2.min.js"></script>
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
        $(function () {
            $("#ema").blur(function () {
                var checkemail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
                var emal = $("#ema").val()
                if(!checkemail.test(emal)){
                    $("#emailDiv").html("邮箱格式不正确！");
                    $("#emailDiv").css("color","red");
                }
            })

            $("#mob").blur(function () {
                var checkmobil = /^1[3|4|5|7|8][0-9]{9}$/;
                var mobi = $("#mob").val()
                if(!checkmobil.test(mobi)){
                    $("#mobileDiv").html("电话号码格式不正确！");
                    $("#mobileDiv").css("color","red");
                }
            })

            $("#icode").blur(function () {
                var checkid = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
                var ide = $("#icode").val()
                if(!checkid.test(ide)){
                    $("#idDiv").html("身份证号格式不正确！");
                    $("#idDiv").css("color","red");
                }
            })
        })

    </script>
    <script type="text/javascript">
        $(function () {
            $("#registForm").submit(function () {
                var uname = $("#uname").val();
                var lname = $("#lname").val();
                var p1 = $("#p1").val();
                var p2 = $("#p2").val();
                var icode = $("#icode").val();
                var ema = $("#ema").val();
                var mob = $("#mob").val();


                var userNameDiv = $("#userNameDiv");
                if (uname == "") {
                    userNameDiv.css("color", "red");
                    userNameDiv.html("*用户名不能为空！");
                    return false;
                }

                var loginNameDiv = $("#loginNameDiv");
                if (lname == "") {
                    loginNameDiv.css("color", "red");
                    loginNameDiv.html("*登录名不能为空！");
                    return false;
                }

                var passwordDiv = $("#passwordDiv");
                if (p1 == "") {
                    passwordDiv.css("color", "red");
                    passwordDiv.html("密码不能为空！");
                    return false;
                }

                var rePasswordDiv = $("#rePasswordDiv");
                if (p2 == "") {
                    rePasswordDiv.css("color", "red");
                    rePasswordDiv.html("确认密码不能为空！");
                    return false;
                }

                var idDiv = $("#idDiv");
                if (icode == "") {
                    idDiv.css("color", "red");
                    idDiv.html("身份证号不能为空！");
                    return false;
                }


                var emailDiv = $("#emailDiv")
                if (ema == "") {
                    emailDiv.css("color", "red");
                    emailDiv.html("邮箱号不能为空！");
                    return false;
                }

                var mobileDiv = $("#mobileDiv");
                if (mob == "") {
                    mobileDiv.css("color", "red");
                    mobileDiv.html("电话号码不能为空！");
                    return false;
                }
            })
        })
    </script>

    <script type="text/javascript">
        $(function () {
            $("#uname").focus(function () {
                $("#uname").val("");
                $("#userNameDiv").html("");
                return false;
            })

            $("#lname").focus(function () {
                $("#lname").val("");
                $("#loginNameDiv").html("");
                return false;
            })

            $("#p1").focus(function () {
                $("#p1").val("");
                $("#passwordDiv").html("");
                $("#loginNameDiv").html("");
                return false;
            })

            $("#p2").focus(function () {
                $("#p2").val("");
                $("#rePasswordDiv").html("");
                return false;
            })

            $("#icode").focus(function () {
                $("#icode").val("");
                $("#idDiv").html("");
                return false;
            })

            $("#ema").focus(function () {
                $("#ema").val("");
                $("#emailDiv").html("");
                return false;
            })

            $("#mob").focus(function () {
                $("#mob").val("");
                $("#mobileDiv").html("");
                return false;
            })
        })
    </script>

    <script type="text/javascript">
        $(function () {
            $("#p2").blur(function () {
                var password = $("#p1").val();
                var password1 = $("#p2").val();
                if (password1 != password) {
                    $("#rePasswordDiv").html("两次密码输入不一致！");
                    $("#rePasswordDiv").css("color","red");
                }
            })
        })
    </script>

    <script type="text/javascript">
        $(function () {
            $("#lname").blur(function () {
                var loginName = $(this).val();
                if (loginName != "") {
                    $.post("${pageContext.request.contextPath}/user/checkUserName",
                        {"loginName": loginName},
                        function (data) {
                            $("#loginNameDiv").css("color", "red");
                            $("#loginNameDiv").html(data.message);
                            return false;
                        },
                        "json");
                }

            })
        })
    </script>

    <script type="text/javascript">
        $(function () {
            var msg = '${message}';
            if (msg.length > 0) {
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
                        <td><input type="text" class="l_user" name="userName" id="uname"/>
                            <div id="userNameDiv"></div>
                        </td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;登录名 &nbsp;</td>
                        <td><input type="text" class="l_user" name="loginName" id="lname"/>
                            <div id="loginNameDiv"></div>
                        </td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                        <td><input type="password" class="l_pwd" name="password" id="p1"/>
                            <div id="passwordDiv"></div>
                        </td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                        <td><input type="password" class="l_pwd" name="password1" id="p2"/>
                            <div id="rePasswordDiv"></div>
                        </td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;性别 &nbsp;</td>
                        <td>男<input type="radio" name="sex" value="1" checked/> &nbsp; &nbsp;女<input type="radio" name="sex"
                                                                                                     value="0"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;身份证号 &nbsp;</td>
                        <td><input type="text" class="l_user" name="identityCode" id="icode"/>
                            <div id="idDiv"></div>
                        </td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;</td>
                        <td><input type="text" value="" class="l_email" name="email" id="ema"/>
                            <div id="emailDiv"></div>
                        </td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                        <td><input type="text" value="" class="l_tel" name="mobile" id="mob"/>
                            <div id="mobileDiv"></div>
                        </td>
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
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright ? 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical
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
