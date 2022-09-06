<#-- @ftlvariable name="requests" type="java.util.List<model.Request>" -->
<@override name="title">招聘信息</@override>
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
							<th class="center aligned">公司名字</th>
							<th class="center aligned">审核状态</th>
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
                                        <#if  request.status==0 >
											<button class="ui button primary disabled">未审核</button>
                                        <#elseif  request.status==1>
	                                        <button  class="ui button green disabled">通过</button>
                                        <#elseif  request.status==2>
	                                        <button  class="ui button red disabled">被拒绝</button>
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
<@extends name="stu_layout.ftl"></@extends>