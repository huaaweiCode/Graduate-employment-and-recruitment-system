
<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="${base}/scripts/jquery.min.js"></script>
	<script src="${base}/scripts/semantic.min.js"></script>
	<script src="${base}/template/script.js"></script>
	<script src="${base}/template/demo.js"></script>
	<link rel="stylesheet" href="${base}/styles/semantic.min.css"/>

	<title><@block name="title"></@block></title>

</head>
<body>


<div class="ui grid ">
	<div class="row">
		<img class="ui  image  centered medium" src="${base}/template/image/title.jpg" title="" style="height: 90px">
	</div>
</div>

<div class="ui large  menu center aligned grey inverted ">
	<div class="header item">

	</div>
	<a class=" item" href="${base}/admin">
		主页
	</a>
	<div class=" ui dropdown item">
		资讯管理
		<div class="menu">
			<a class="item" href="${base}/admin/AllNews">查看资讯</a>
			<a class="item" href="${base}/admin/releaseNew">发布资讯</a>
		</div>
	</div>

	<div class=" ui dropdown item">
		学生信息管理
		<div class="menu">
			<a class="item" href="${base}/admin/listStu">查看学生信息</a>
			<a class="item" href="${base}/admin/addStu">添加学生信息</a>
		</div>
	</div>
	<div class=" ui dropdown item">
		公司信息管理
		<div class="menu">
			<a class="item" href="${base}/admin/listCompany">查看公司信息</a>
			<a class="item" href="${base}/admin/addCompany">添加公司信息</a>
		</div>
	</div>
	<div class=" ui dropdown item">
		管理员信息管理
		<div class="menu">
			<a class="item" href="${base}/admin/listAdmin">查看管理员信息</a>
			<a class="item" href="${base}/admin/addAdmin">添加管理员信息</a>
		</div>
	</div>
	<div class=" ui dropdown item">
		毕业生去向信息管理
		<div class="menu">
			<a class="item" href="${base}/admin/findAllWhereabouts">查看毕业生去向信息</a>
			<a class="item" href="${base}/admin/addWhereabouts">添加毕业生去向信息</a>
		</div>
	</div>
	<div class=" ui dropdown item">
		招聘信息管理
		<div class="menu">
			<a class="item" href="${base}/admin/listRecruit">查看招聘信息</a>
		</div>
	</div>
<#--	<div class=" ui dropdown item">-->
<#--		个人信息管理-->
<#--		<div class="menu">-->
<#--			<a class="item" href="${base}/admin/listPersonInfo">查看个人信息</a>-->
<#--			<a class="item" href="${base}/admin/modifyPersonInfo">修改个人信息</a>-->
<#--		</div>-->
<#--	</div>-->

	<div class="right menu">
        <#if (session.user)??>
			<div class="ui dropdown item">
				<i class="user icon"></i>
				<div class="text"> 欢迎  ${session.user.adminName} 管理员  </div>
				<i class="icon dropdown"></i>
				<div class="menu">
					<a href="${base}/student/logout" class="item">退出</a>
				</div>
			</div>
        <#else>
			<div class="item">
				<a class="ui primary button labeled icon" href="${base}/login"><i class="user icon"></i> 登陆</a>
			</div>
			<div class="item">
				<a class="ui primary button  labeled icon" href="${base}/register"><i class="registered icon"></i>注册</a>
			</div>
        </#if>


	</div>
</div>
</div>


<table class="ui table celled padded fluid ">
	<tbody>
	<tr>
        <@block name="content">

        </@block>
	</tr>
</table>


<div class="ui footer menu bottom fixed  ">

	<div class="ui text container" style="font-size:20px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	</div>
</div>
</body>

<script>
    $('.ui.dropdown').dropdown();

</script>

</html>