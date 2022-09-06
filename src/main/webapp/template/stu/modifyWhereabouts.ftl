<#-- @ftlvariable name="whereabouts" type="model.Whereabouts" -->
<#-- @ftlvariable name="student" type="model.Stu" -->
<@override name="title">修改个人毕业去向</@override>
<@override name="content">

	<td class="three wide "></td>
	<td class="ten wide ">
		<form class="ui large form" id="apply-form">
			<table class="ui celled striped  table">
				<thead>
				<tr>
					<th colspan="4">修改毕业去向信息</th>
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
							<input type="text" name="companyName" placeholder="${whereabouts.companyName!''}" value="${whereabouts.companyName!''}">
						</div>
					</td>
					<td class="two wide center aligned "><b>职业</b></td>
					<td class="four wide  center aligned">
						<div class="field">
							<input type="text" name="Occupation" placeholder="${whereabouts.occupation!''}" value="${whereabouts.occupation!''}">
						</div>
					</td>
				</tr>
				<tr>

					<td class="two wide center aligned"><b>详细地址</b></td>
					<td class="four wide center aligned" colspan="3">
						<div class="field">
							<input type="text" name="address" placeholder="${whereabouts.address!''}" value="${whereabouts.address!''}">
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
            url: '${base}/student/DoModifyWhereabouts',
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