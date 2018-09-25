<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>

<head>
    <title>xss攻击演示</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <script src="${ctxStatic}/main/js/jquery.min.js"></script>
    <script src="${ctxStatic}/main/js/jquery.poptrox.min.js"></script>
    <script src="${ctxStatic}/main/js/skel.min.js"></script>
    <script src="${ctxStatic}/main/js/init.js"></script>
    <link rel="stylesheet" href="${ctxStatic}/main/css/skel.css"/>
    <link rel="stylesheet" href="${ctxStatic}/main/css/style.css"/>
    <link rel="stylesheet" href="${ctxStatic}/main/css/style-xlarge.css"/>

</head>

<body id="top">

<!-- Header -->
<header id="header">
    <a href="#" class="image avatar"><img src="${ctxStatic}/main/images/avatar.jpg" alt=""/></a>
    <h1><strong id="username">您好 ${user.username}</strong><a id="uid" hidden="true">${user.id}</a></h1>
    <h1>xss攻击演示 模拟微博和留言板</h1><br/>
</header>

<!-- Main -->
<div id="main">

    <section>
        <div class="row uniform 50%">
            <div class="12u$">
                <textarea name="message" id="message" placeholder="Enter your message" rows="6"></textarea>
            </div>
            <div class="12u$">
                <input type="submit" value="提交" class="special" id="button"/>
            </div>
        </div>
    </section>

    <section>
        <h4>留言板</h4>
        <div class="row">
            <div class="6u 12u$(3)">
                <ul id="mlist" name="mlist">
                    <li>
                        2018年9月23日23:31:11 by twinking<br/> Dolor pulvinar etiam magna etiam.
                    </li>
                    <li>
                        2018年9月23日23:31:11 by twinking<br/> Dolor pulvinar etiam magna etiam.
                    </li>
                    <li>
                        2018年9月23日23:31:11 by twinking<br/> Dolor pulvinar etiam magna etiam.
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <ul class="icons">
            <li>
                <a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a>
            </li>
            <li>
                <a href="#" class="icon fa-github"><span class="label">Github</span></a>
            </li>
            <li>
                <a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a>
            </li>
            <li>
                <a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a>
            </li>
        </ul>
    </footer>
</div>
</body>

<script type="text/javascript">

    function clear() {
        $("#mlist").find("li").remove();
    }

    function getAllList() {
        $.ajax({
            type: "post",
            url: "${ctx}/msg/list.do",
            error: function () {
                alert("服务器没有返回数据，可能服务器忙，请重试");
                return;
            },
            success: function (data) {
                //data = $.parseJSON(data);
                var list = data.res;
                for (var i = 0; i < list.length; i++) {
                    $("#mlist").append("<li>" + list[i].date + " By : " + list[i].username + " <br /> " + list[i].message + "  </li>");
                }
            }
        });
    }

    $(document).ready(function () {
        clear();
        getAllList();

        $("#button").click(function () {
            var uid = $("#uid").text();
            var message = $("#message").val();
            if (!message) {
                alert("内容不能为空！");
                return;
            }
            $.ajax({
                type: "post",
                url: "${ctx}/msg/add.do",
                data: {
                    userId: uid,
                    message: message
                },
                error: function (data) {
                    alert("提交失败" + data.res.toString());
                    return;
                },
                success: function (data) {
                    clear();
                    getAllList();
                }
            });
        });

    });
</script>

</html>
