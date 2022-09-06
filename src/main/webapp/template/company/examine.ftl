<#-- @ftlvariable name="requests" type="java.util.List<model.Request>" -->
<@override name="title">审核招聘信息</@override>
<@override name="content">
	<td class="two wide "></td>
	<td class="twelve  wide ">
		<table class="ui red table equal width celled padded ">
			<tbody>
			<tr>
				<td>
					<table class="ui celled table">
                        <#if  !  requests.isEmpty()  >
						<thead>
						<tr>
							<th class="center aligned">招聘信息序号</th>
							<th class="center aligned">申请人姓名</th>
							<th class="center aligned">下载简历</th>
							<th class="center aligned">审核状态</th>
                            <th class="center aligned">操作</th>
						</tr>
						</thead>
						<tbody>

                        <#list   requests as request>
							<tr>
								<td class="center aligned">
                                    ${request.recruitId}
								</td>
								<td class="center aligned">
                                    ${request.name}
								</td>
								<td class="center aligned">
									<a href="${request.resume}">点击下载</a>
								</td>
								<td class="center aligned">
                                    <#if  request.status==0 >
										未审核
                                    <#elseif  request.status==1>
										已通过
                                    <#elseif  request.status==2>
										已拒绝
                                    </#if>
								</td>
								<td class="center aligned">

                                    <#if  request.status==0 >
	                                    <a href="${base}/company/pass/${request.id}" class="ui button green">通过</a>
	                                    <a href="${base}/company/refuse/${request.id}" class="ui button red">拒绝</a>
                                    <#elseif  request.status==1>
	                                    <a href="${base}/company/pass/${request.id}" class="ui button green disabled">通过</a>
	                                    <a href="${base}/company/refuse/${request.id}" class="ui button red">拒绝</a>
                                    <#elseif  request.status==2>
	                                    <a href="${base}/company/pass/${request.id}" class="ui button green">通过</a>
	                                    <a href="${base}/company/refuse/${request.id}" class="ui button red disabled">拒绝</a>
                                    </#if>

								</td>
							</tr>

                        </#list>
                        <#else >
							<tr>
								<td class="fluid">
									<div class="ui negative massive message">
										<div class="header">
											未查询到任何招聘投递审核信息
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

</@override>
<@extends name="company_layout.ftl"></@extends>