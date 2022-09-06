<#-- @ftlvariable name="whereabouts" type="java.util.List<model.Whereabouts>" -->
<#-- @ftlvariable name="student" type="model.Stu" -->
<@override name="title">登记个人毕业去向</@override>
<@override name="content">

	<td class="three wide "></td>
	<td class="ten wide ">
		<#if whereabouts.isEmpty() >
			<form class="ui large form" id="apply-form">
				<table class="ui celled striped  table">
					<thead>
					<tr>
						<th colspan="4">填写毕业去向信息</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td class="two wide center aligned "><b>学号</b></td>
						<td class="four wide  center aligned">
							<div class="field disabled">
								<input type="text" name="stuID" value="${student.stuID!''}">
							</div>
						</td>
						<td class="two wide center aligned  "><b>姓名</b></td>
						<td class="four wide  center aligned">
							<div class="field disabled">
								<input type="text" name="name" value="${student.name!''}">
							</div>
						</td>
					</tr>

					<tr>
						<td class="two wide center aligned "><b>公司名字</b></td>
						<td class="four wide  center aligned">
							<div class="field">
								<input type="text" name="companyName" placeholder="请输入公司名字">
							</div>
						</td>
						<td class="two wide center aligned "><b>职业</b></td>
						<td class="four wide  center aligned">
							<div class="field">
								<input type="text" name="Occupation" placeholder="请输入职业">
							</div>
						</td>
					</tr>
					<tr>

						<td class="two wide center aligned"><b>详细地址</b></td>
						<td class="four wide center aligned" colspan="3">
							<div class="field">
								<input type="text" name="address" placeholder="请输入地址">
							</div>
						</td>

					</tr>
					<tr>

						<td colspan="2">
							<div class="ui error message"></div>
						</td>
						<td>
							<button class="ui fluid large teal  button " type="reset">重置</button>
						</td>
						<td>
							<div class="ui fluid large teal submit button ">提交</div>
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
				你已经登记去向，请勿重复登记！
			</div>
        </#if>

	</td>
	<td class="three wide"></td>


	<script>


        $('.ui.dropdown').dropdown();

        $('.ui.form').form({
            Occupation: {
                position: {
                    rules: [{
                        type: 'empty',
                        prompt: '职业信息不能为空'
                    }]
                },
                companyName: {
                    rules: [
                        {
                            type: 'empty',
                            prompt: '公司名字不能为空'
                        }]
                },
                address: {
                    rules: [{
                        type: 'empty',
                        prompt: '工作地点不能为空'
                    }]
                }
            }
        }).api({
            method: 'POST',
            url: '${base}/student/saveWhereabouts',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    alert(res.message);
                    window.location.href = '${base}/student/findWhereabouts'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        })

	</script>


</@override>
<@extends name="stu_layout.ftl"></@extends>