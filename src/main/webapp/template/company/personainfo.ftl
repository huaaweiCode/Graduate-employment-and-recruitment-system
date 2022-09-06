<#-- @ftlvariable name="recruit" type="model.Recruit" -->

<@override name="title">公司信息页</@override>
<@override name="content">


	<td class="three wide "></td>
	<td class="ten wide ">
		<table class="ui celled striped  table">
			<tbody>
			<tr>
				<td class="two wide center aligned "><b>公司名字</b></td>
				<td class="four wide  center aligned">${company.name}</td>
				<td class="two wide center aligned"><b>用户名</b></td>
				<td class="four wide center aligned">${company.cname}</td>
			</tr>
			<tr>
				<td class="two wide center aligned "><b>联系电话</b></td>
				<td class="four wide  center aligned">${company.tel}</td>
				<td class="two wide center aligned"><b>密码</b></td>
				<td class="four wide center aligned">${company.password}</td>
			</tr>
			<tr>
				<td class="two wide center aligned "><b>职员数量</b></td>
				<td class="four wide  center aligned">${company.number}</td>
				<td class="two wide center aligned">公司地址</td>
				<td class="four wide center aligned">${company.address}</td>
			</tr>
			<tr>
				<td class="two wide center aligned"><b>公司介绍</b></td>
				<td class="four wide center aligned" colspan="3">${company.detail}</td>

			</tr>

			</tbody>
		</table>

	</td>
	<td class="three wide"></td>


</@override>
<@extends name="company_layout.ftl"></@extends>