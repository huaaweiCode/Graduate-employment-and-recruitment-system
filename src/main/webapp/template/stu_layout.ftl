<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="${base}/scripts/jquery.min.js"></script>
	<script src="${base}/scripts/semantic.min.js"></script>
	<link rel="stylesheet" href="${base}/styles/semantic.min.css"/>
	<title><@block name="title"></@block></title>

	<script>
        $(document).ready(function() {
            // 鼠标放到 dropdown 时显示下拉菜单，默认只有点击后才显示
            $('.dropdown.item').dropdown({
                on: 'hover'
            });
        });
	</script>

</head>
<body>

<div class="ui container segment padded">
	<div class="ui red massive  inverted menu top fixed borderless stackable ">
		<div class="img"><img src="${base}/template/image/logo.png"></div>
		<div class="item " style="font-size: 24px;color: white;font-family: 微软雅黑">助学金申请系统(学生服务)</div>

		<div class="right menu ">
			<div class="ui dropdown item">
				<i class="user icon"></i>
                <#if (session.user)??>
					<div class="text"> 欢迎${student.name}同学 </div>
                </#if>
				<i class="icon dropdown"></i>
				<div class="menu">
                    <#if (session.user)??>
						<a href="${base}/student/logout" class="item">退出</a>
                    <#else>
						<a href="${base}/register" class="item">注册</a>
						<a href="${base}/login" class="item">登录</a>
                    </#if>

				</div>
			</div>

		</div>

	</div>
</div>



<div class="ui bottom attached segment pushable segment " style="top: 20px">
	<div class="ui visible inverted left vertical sidebar menu">
		<a class="item" href="${base}/student">
			<i class="home icon"></i>
			个人信息
		</a>
		<a class="item" href="${base}/student/applyMoney">
			<i class="block layout icon"></i>
			申请助学金
		</a>
		<a class="item" href="${base}/student/totalApply">
			<i class="smile icon"></i>
			申请信息汇总
		</a>

	</div>

	<div class="pusher">

        <@block name="content">

        </@block>

	</div>
</div>







</div>

</body>

<script>
    $('.ui.accordion')
        .accordion()
    ;
</script>
</html>