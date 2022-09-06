<#-- @ftlvariable name="recruit" type="model.Recruit" -->

<@override name="title">个人信息页</@override>
<@override name="content">


	<td class="three wide "></td>
	<td class="ten wide ">
		<table class="ui celled striped  table">
			<tbody>
			<tr>
				<td class="two wide center aligned "><b>姓名</b></td>
				<td class="four wide  center aligned">${stu.name}</td>
				<td class="two wide center aligned"><b>登录名</b></td>
				<td class="four wide center aligned">${stu.sname}</td>
			</tr>
			<tr>
				<td class="two wide center aligned "><b>性别</b></td>
				<td class="four wide  center aligned">${stu.gender}</td>
				<td class="two wide center aligned"><b>密码</b></td>
				<td class="four wide center aligned">${stu.password}</td>
			</tr>
			<tr>
				<td class="two wide center aligned "><b>电话</b></td>
				<td class="four wide  center aligned">${stu.tel}</td>
				<td class="two wide center aligned"><b>邮件</b></td>
				<td class="four wide center aligned">${stu.email}</td>
			</tr>
			<tr>
				<td class="two wide center aligned "><b>毕业学校</b></td>
				<td class="four wide  center aligned">${stu.university}</td>
				<td class="two wide center aligned"><b>所修专业</b></td>
				<td class="four wide center aligned">${stu.major}</td>
			</tr>
			<tr>
				<td class="two wide center aligned "><b>学位</b></td>
				<td class="four wide  center aligned">${stu.name}</td>
				<td class="two wide center aligned"><b>签名</b></td>
				<td class="four wide center aligned">${stu.tel}</td>
			</tr>

			</tbody>
		</table>

	</td>
	<td class="three wide"></td>


</@override>
<@extends name="stu_layout.ftl"></@extends>