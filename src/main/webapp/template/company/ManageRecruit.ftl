<@override name="title">招聘信息</@override>
<@override name="content">
	<td class="two wide "></td>
	<td class="twelve  wide ">
		<table class="ui red table equal width celled padded ">
			<thead>
			<tr>
				<th class=" " colspan="5">
					招聘信息管理
				</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>
					<table class="ui celled table">
						<thead>
						<tr>
							<th class="center aligned">职位</th>
							<th class="center aligned">薪水</th>
							<th class="center aligned">招聘人数</th>
							<th class="center aligned">工作地址</th>
							<th class="center aligned">学历要求</th>
							<th class="center aligned">专业要求</th>
							<th class="center aligned">操作</th>
						</tr>
						</thead>
						<tbody>
                        <#if  !  recruits.isEmpty()  >
                            <#list   recruits as recruit>
								<tr>
									<td class="center aligned">
                                        ${recruit.position}
									</td>
									<td class="center aligned">
                                        ${recruit.salary}
									</td>
									<td class="center aligned">
                                        ${recruit.number}
									<td class="center aligned">
                                        ${recruit.address}
									</td>
									<td class="center aligned">
                                        ${recruit.degree}
									</td>
									<td class="center aligned">
                                        ${recruit.major}
									</td>
									<td class="center aligned">
										<a href="${base}/company/edit/${recruit.recruitid}"
										   class="ui button primary">编辑</a>
										<a href="${base}/company/delete/${recruit.recruitid}"
										   class="ui button primary">删除</a>
									</td>
								</tr>

                            </#list>
                        <#else >

							<tr>
								<td class="fluid">
									<div class="ui negative massive message">
										<div class="header">
											未查询到相关招聘信息
										</div>
									</div>
								</td>
							</tr>

                        </#if>
						</tbody>
					</table>
				</td>
			</tr>
			</tbody>
		</table>
	</td>
	<td class="two wide"></td>


	<script>
        $('.ui.form').form({
            fields: {}
        }).api({
            method: 'POST',
            url: '${base}/student/query_recruit',
            serializeForm: true,
            success: function (res) {
                if (res.success) {
                    window.location.href = '${base}/student/query_recruit_result'
                } else {
                    $('.ui.form').form('add errors', [res.message]);
                }
            }
        });
	</script>

</@override>
<@extends name="company_layout.ftl"></@extends>