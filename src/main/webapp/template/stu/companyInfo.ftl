<#-- @ftlvariable name="recruit" type="model.Recruit" -->

<@override name="title">公司详情</@override>
<@override name="content">


			<td class="three wide "></td>
			<td class="ten wide ">
				<table class="ui celled striped  table">
					<tbody>
					<tr >
						<td class="two wide center aligned "><b>公司名字</b></td>
						<td class="four wide  center aligned">${recruit.name}</td>
						<td class="two wide center aligned"><b>公司联系方式</b></td>
						<td class="four wide center aligned">${recruit.tel}</td>
					</tr>
					<tr >
						<td class="two wide center aligned"><b>招收岗位</b></td>
						<td class="four wide center aligned">${recruit.position}</td>
						<td class="two wide center aligned"><b>公司地址</b></td>
						<td class="four wide center aligned">${recruit.address}</td>
					</tr>
					<tr >
						<td class="two wide center aligned "><b>要求最低学历</b></td>
						<td class="four wide center aligned">${recruit.degree}</td>
						<td class="two wide center aligned"><b>要求所修专业</b></td>
						<td class="four wide center aligned">${recruit.major}</td>
					</tr>
					<tr >
						<td class="two wide center aligned"><b>薪水</b></td>
						<td class="four wide center aligned">${recruit.salary}</td>
						<td class="two wide center aligned"><b>招收人数</b></td>
						<td class="four wide center aligned">${recruit.number}</td>
					</tr>
					<tr >
						<td colspan="1" class="center aligned">公司详细信息</td>
						<td colspan="3" class="center aligned">
                            ${recruit.detail}
						</td>
					</tr>
					<tr >
						<td colspan="1" class="center aligned">其它招聘要求</td>
						<td colspan="3" class="center aligned">
                            ${recruit.inf}
						</td>
					</tr>
					</tbody>
				</table>

			</td>
			<td class="three wide"></td>


</@override>
<@extends name="stu_layout.ftl"></@extends>