<#-- @ftlvariable name="recruitList" type="java.util.List<model.Recruit>" -->
<#-- @ftlvariable name="newsList" type="java.util.List<model.News>" -->

<@override name="title">公司首页</@override>
<@override name="content">


	<table class="ui table celled padded  ">
		<tbody>
		<tr>
			<td class="two wide "></td>
			<td class="nine wide ">

				<table class="ui red table equal width">
					<thead>
					<tr>
						<th>标题</th>
						<th class="two wide tablet"><a href="${base}/company/AllNews">查看更多</a></th>
					</tr>
					</thead>

					<tbody>
                    <#if  ! newsList.isEmpty()  >
                        <#list  newsList as new>
							<tr>
								<td>
									<a href="${base}/company/news/${new.id}">${new.title}</a>
								</td>
								<td>
                                    ${new.newsTime}
								</td>
							</tr>
                        </#list>
                    </#if>
					</tbody>

				</table>
			</td>
			<td class="three wide">
				<table class="ui red table">
					<thead>
					<tr>
						<th>招聘信息</th>
					</tr>
					</thead>

					<tbody>
                    <#--                    <#if ! recruitList.isEmpty()>-->
                    <#--                        <#list recruitList as recruit>-->
					<tr>
						<td>
							<button class="ui red button mini ">New!</button>
                            ${recruitList.get(0).name}招聘${recruitList.get(0).position}${recruitList.get(0).number}人

						</td>
					</tr>
					<tr>
						<td>
							<button class="ui red button mini ">New!</button>

                            ${recruitList.get(1).name}招聘${recruitList.get(1).position}${recruitList.get(1).number}人

						</td>
					</tr>
					<tr>
						<td>
							<button class="ui red button mini ">New!</button>

                            ${recruitList.get(2).name}招聘${recruitList.get(2).position}${recruitList.get(2).number}人

						</td>
					</tr>
					<tr>
						<td>

                            ${recruitList.get(3).name}招聘${recruitList.get(3).position}${recruitList.get(3).number}人

						</td>
					</tr>
					<tr>
						<td>

                            ${recruitList.get(4).name}招聘${recruitList.get(4).position}${recruitList.get(4).number}人

						</td>
					</tr>
					</tbody>
				</table>
			</td>
			<td class="two wide"></td>
		</tr>
		</tbody>
	</table>

</@override>
<@extends name="company_layout.ftl"></@extends>