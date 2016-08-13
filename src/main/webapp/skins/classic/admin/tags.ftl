<#include "macro-admin.ftl">
<#include "../macro-pagination.ftl">
<@admin "tags">
<div class="list content admin">
    <form method="GET" action="tags" class="form">
        <input name="title" type="text" placeholder="${tagLabel}"/>
        <button type="submit" class="green">${searchLabel}</button>
        <button type="button" class="btn red" onclick="window.location = '/admin/add-tag'">${addTagLabel}</button>
    </form>
    <br/>
    <ul>
        <#list tags as item>
        <li>
            <div class="fn-clear first">
                <a href="${servePath}/tag/${item.tagTitle?url('utf-8')}">${item.tagTitle}</a> &nbsp;
                <#if item.tagStatus == 0>
                <span class="ft-gray">${validLabel}</span>
                <#else>
                <font class="ft-red">${banLabel}</font>
                </#if>
                <a href="${servePath}/admin/tag/${item.oId}" class="fn-right tooltipped tooltipped-w ft-a-icon" aria-label="${editLabel}"><span class="icon-edit"></span></a>
            </div>
            <div class="fn-clear">
                <#if item.tagIconPath != ''>
                <div class="avatar" style="background-image:url('${staticServePath}/images/tags/${item.tagIconPath}')"></div>
                </#if>
                <span class="tags">${item.tagDescription}</span>
                <span class="fn-right ft-gray">
                    <span class="tooltipped tooltipped-n" aria-label="${refCountLabel}"><span class="icon-view"></span></span>
                    ${item.tagReferenceCount} &nbsp;
                    <span class="tooltipped tooltipped-n" aria-label="${commentCountLabel}"><span class="icon-cmts"></span></span>
                    ${item.tagCommentCount} &nbsp;
                    <span class="tooltipped tooltipped-n" aria-label="${createTimeLabel}"><span class="icon-date"></span></span>
                    ${item.tagCreateTime?string('yyyy-MM-dd HH:mm')}
                </span>
            </div>
        </li>
        </#list>
    </ul>
    <@pagination url="/admin/tags"/>
</div>
</@admin>
