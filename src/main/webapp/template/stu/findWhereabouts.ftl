<#-- @ftlvariable name="whereabouts" type="model.Whereabouts" -->
<#-- @ftlvariable name="student" type="model.Stu" -->
<@override name="title">个人毕业去向</@override>
<@override name="content">

	<td class="three wide "></td>
	<td class="ten wide ">

        <#if flag==0 >
	        <form class="ui large form" id="apply-form">
		        <table class="ui celled striped  table">
			        <thead>
			        <tr>
				        <th colspan="4">去向信息</th>
			        </tr>
			        </thead>
			        <tbody>
			        <tr>
				        <td class="two wide center aligned "><b>学号</b></td>
				        <td class="four wide  center aligned">

                            ${whereabouts.stuId!''}

				        </td>
				        <td class="two wide center aligned  "><b>姓名</b></td>
				        <td class="four wide  center aligned">

                            ${whereabouts.name!''}

				        </td>
			        </tr>

			        <tr>
				        <td class="two wide center aligned "><b>专业</b></td>
				        <td class="four wide  center aligned">

                            ${whereabouts.major!''}

				        </td>
				        <td class="two wide center aligned "><b>学位</b></td>
				        <td class="four wide  center aligned">
                            ${whereabouts.degree!''}
				        </td>
			        </tr>
			        <tr>
				        <td class="two wide center aligned "><b>公司名字</b></td>
				        <td class="four wide  center aligned">
                            ${whereabouts.companyName!''}
				        </td>
				        <td class="two wide center aligned "><b>职业</b></td>
				        <td class="four wide  center aligned">

                            ${whereabouts.occupation!''}

				        </td>
			        </tr>
			        <tr>

				        <td class="two wide center aligned"><b>详细地址</b></td>
				        <td class="four wide center aligned" colspan="3">

                            ${whereabouts.address!''}

				        </td>

			        </tr>
			        <tr>

				        <td class="two wide center aligned"><b></b></td>
				        <td class="four wide center aligned" colspan="3">
					        <a href="${base}/student/modifyWhereabouts/${whereabouts.stuId}-${whereabouts.id}" class="ui button primary fluid">修改</a>
				        </td>

			        </tr>

			        </tbody>
		        </table>
	        </form>
        <#else >
			<div class="ui warning message">
				<div class="header">
					提示信息：
				</div>
				你还没登记呢！
			</div>
        </#if>



	</td>
	<td class="three wide"></td>




</@override>
<@extends name="stu_layout.ftl"></@extends>