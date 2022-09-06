<#-- @ftlvariable name="whereabouts" type="java.util.List<model.Whereabouts>" -->
<#-- @ftlvariable name="student" type="model.Stu" -->
<@override name="title">毕业去向汇总</@override>
<@override name="content">

	<td class="two wide "></td>
	<td class="twelve  wide ">
		<table class="ui red table equal width celled padded ">
			<tbody>
			<tr>
				<td>
					<table class="ui celled table">
						<thead>
						<tr>
							<th class="center aligned">序号</th>
							<th class="center aligned">学号</th>
							<th class="center aligned">姓名</th>
							<th class="center aligned">专业</th>
							<th class="center aligned">公司名字</th>
							<th class="center aligned">职业</th>
							<th class="center aligned">操作</th>
						</tr>
						</thead>
						<tbody>
                        <#if  !  page.getList().isEmpty()  >
                            <#list   page.getList() as whereabouts>
								<tr>
									<td class="center aligned">
                                        ${whereabouts.id}
									</td>
									<td class="center aligned">
                                        ${whereabouts.stuId}
									</td>
									<td class="center aligned">
                                        ${whereabouts.name}
									</td>
									<td class="center aligned">
                                        ${whereabouts.major}
									</td>
									<td class="center aligned">
                                        ${whereabouts.companyName!''}
									</td>
									<td class="center aligned">
                                        ${whereabouts.Occupation}
									</td>
									<td class="center aligned">
										<a href="${base}/admin/findDetailOneWhereabouts/${whereabouts.id}"
										   class="ui button primary">详细信息</a>
										<a href="${base}/admin/modifyDetailOneWhereabouts/${whereabouts.id}"
										   class="ui button green">修改</a>
										<a href="${base}/admin/deleteDetailOneWhereabouts/${whereabouts.id}"
										   class="ui button red">删除</a>
									</td>
								</tr>

                            </#list>
                        <#else >

							<tr>
								<td class="fluid">
									<div class="ui negative massive message">
										<div class="header">
											未查询到信息
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
			<tfoot>
			<tr>
				<th colspan="5">
					<div class="ui right floated pagination menu">
                        <#if page.getPageNumber() !=1 >
							<a class="icon item" href="?page=${page.getPageNumber()-1}">
								<i class="left chevron icon"></i>
							</a>
                        </#if>
                        <#list  1..(page.getTotalPage()) as count >
							<a class="item">
                                <#if page.getPageNumber()==count>
									<b>${count}</b>
                                <#else>
                                    ${count}
                                </#if>
							</a>
                        </#list>
                        <#if page.getPageNumber() != page.getTotalPage() >
							<a class="icon item" href="?page=${page.getPageNumber()+1}">
								<i class="right chevron icon"></i>
							</a>
                        </#if>
					</div>
				</th>
			</tr>
			</tfoot>
		</table>
	</td>
	<td class="two wide"></td>

</@override>
<@extends name="admin_layout.ftl"></@extends>