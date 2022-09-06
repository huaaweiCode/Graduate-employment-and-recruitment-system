<@override name="title">首页</@override>
<@override name="content">


<div class="ui grid container">
    <div class="row">
        <div class="column">

            <div class="column ">
                <table class="ui table celled  ">
                    <thead>
                    <tr>

                        <th class="twelve wide column ">热帖</th>
                        <th class="three wide column">板块</th>
                    </tr>
                    </thead>
                    <tbody>
                       <#list page.getList() as topic>
                        <tr>
                            <td><a href="${base}/topic/${topic.id}">${topic.title}</a><span class="ui label right floated red">${(topic.reply_count)!''}</span></td>
                            <td><a href="${base}/category/${topic.category_id}">${topic.category_name}</a></td>
                        </tr>
                        </#list>

                    </tbody>




                </table>
            </div>
             <#if page.getPageNumber() !=1 >
                <a href="?page=${page.getPageNumber()-1}">上一页</a>
             </#if>
            ${page.getPageNumber()}/${page.getTotalPage()}
                <#if page.getPageNumber() != page.getTotalPage() >
                    <a href="?page=${page.getPageNumber()+1}">下一页</a>
                </#if>
        </div>

    </div>
</div>

>


<#--<table border="1" cellspacing="0"  >-->
    <#--<thead>-->
    <#--<tr>-->
        <#--<th>序号</th>-->
        <#--<th>热帖</th>-->
        <#--<th>板块</th>-->
    <#--</tr>-->
    <#--</thead>-->
    <#--<tbody>-->
    <#--<#list page.getList() as topic>-->
    <#--<tr>-->
        <#--<td>${topic.id}</td>-->
        <#--<td><a href="${base}/topic/${topic.id}">${topic.title}</a></td>-->
        <#--<td><a href="${base}/category/${topic.category_id}">${topic.category_name}</a></td>-->
    <#--</tr>-->
    <#--</#list>-->
    <#--</tbody>-->
<#--</table>-->
<#--<div>-->
<#--<#if page.getPageNumber() !=1 >-->
    <#--<a href="${base}?page=${page.getPageNumber()-1}">上一页</a>-->
<#--</#if>-->

<#--${page.getPageNumber()}/${page.getTotalPage()}-->
<#--<#if page.getPageNumber() != page.getTotalPage() >-->
    <#--<a href="${base}?page=${page.getPageNumber()+1}">下一页</a>-->
<#--</#if>-->
<#--</div>-->

<#--</div>-->
</@override>
<@extends name="layout.ftl"></@extends>