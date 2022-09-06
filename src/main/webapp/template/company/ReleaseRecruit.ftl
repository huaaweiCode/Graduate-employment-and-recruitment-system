<#-- @ftlvariable name="recruit" type="model.Recruit" -->

<@override name="title">发布招聘信息页</@override>
<@override name="content">


	<td class="three wide "></td>
	<td class="ten wide ">
		<form class="ui large form" id="apply-form">
			<table class="ui celled striped  table">
				<thead>
				<tr>
					<th colspan="4">发布招聘信息</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="two wide center aligned "><b>职位</b></td>
					<td class="four wide  center aligned">
						<div class="field">
							<input type="text" name="position">
						</div>
					</td>
					<td class="two wide center aligned "><b>薪水</b></td>
					<td class="four wide  center aligned">
						<div class="field">
							<input type="text" name="salary">
						</div>
					</td>
				</tr>
				<tr>
					<td class="two wide center aligned"><b>招聘人数</b></td>
					<td class="four wide center aligned">
						<div class="field">
							<input type="text" name="number">
						</div>
					</td>
					<td class="two wide center aligned"><b>工作地址</b></td>
					<td class="four wide center aligned">
						<div class="field">
							<select class="ui dropdown" name="address">
								<option value="">工作地</option>
								<option value="null">不限</option>
								<option value="北京">北京</option>
								<option value="上海">上海</option>
								<option value="银川">银川</option>
								<option value="郑州">郑州</option>
								<option value="杭州">杭州</option>
								<option value="广州">广州</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td class="two wide center aligned "><b>学历要求</b></td>
					<td class="four wide  center aligned">
						<div class="field ">
							<select class="ui dropdown  " name="degree">
								<option value="">选择学历</option>
								<option value="本科">本科</option>
								<option value="硕士">硕士</option>
								<option value="博士">博士</option>
							</select>
						</div>
					</td>
					<td class="two wide center aligned "><b>专业要求</b></td>
					<td class="four wide  center aligned">
						<div class="field">
							<input type="text" name="major">
						</div>
					</td>
				</tr>
				<tr>

					<td class="two wide center aligned"><b>其它信息</b></td>
					<td class="four wide center aligned" colspan="3">
						<div class="field">
							<textarea name="inf"></textarea>
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
            fields: {
                position: {
                    rules: [{
                        type: 'empty',
                        prompt: '岗位信息不能为空'
                    }]
                },
                salary: {
                    rules: [
                        {
                            type: 'empty',
                            prompt: '薪水不能为空'
                        }]
                },
                address: {
                    rules: [{
                        type: 'empty',
                        prompt: '工作地点不能为空'
                    }]
                },
                number: {
                    rules: [{
                        type: 'empty',
                        prompt: '职员人数不能为空'
                    }]
                },
                degree: {
                    rules: [{
                        type: 'empty',
                        prompt: '学位不能为空'
                    }]
                },
                major: {
                    rules: [{
                        type: 'empty',
                        prompt: '所修专业不能为空'
                    }]
                },
                inf: {
                    rules: [{
                        type: 'empty',
                        prompt: '其它信息不能为空'
                    }]
                }
            }
        }).api({
            method: 'POST',
            url: '${base}/company/add_ReleaseRecruit/',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    alert(res.message);
                    window.location.href = '${base}/company/ReleaseRecruit'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        })

	</script>

</@override>
<@extends name="company_layout.ftl"></@extends>