<#include "macro-notifications.ftl">
<@notifications "broadcast">
<#if broadcastNotifications?size != 0>
<ul class="notification">
    <#list broadcastNotifications as notification>
    <li class="fn-flex<#if notification.hasRead> read</#if>">
        <#if "someone" != notification.authorName>
        <a target="_blank" rel="nofollow" href="${servePath}/member/${notification.authorName}" 
           title="${notification.authorName}"></#if>
            <div class="avatar" style="background-image:url('${notification.thumbnailURL}?imageView2/1/w/64/h/64/interlace/0/q/80')"></div>
        <#if "someone" != notification.authorName></a></#if>
        <div class="fn-flex-1 has-view">
            <h2>
                <#if 1 == notification.articlePerfect>
                <svg height="20" viewBox="3 0 11 12" width="14">${perfectIcon}</svg>
                </#if>
                <#if notification.articleType == 1>
                <span class="icon-locked" title="${discussionLabel}"></span>
                <#elseif notification.articleType == 2>
                <span class="icon-feed" title="${cityBroadcastLabel}"></span>
                </#if>
                <a rel="bookmark" href="${notification.url}"> ${notification.articleTitle}</a>
            </h2>
            <div class="ft-gray">
                <#list notification.articleTags?split(",") as articleTag>
                <a class="tag" rel="tag" href="${servePath}/tag/${articleTag?url('UTF-8')}">
                    ${articleTag}</a>
                </#list> <br/>
                <span class="icon-date"></span>
                ${notification.createTime?string('yyyy-MM-dd HH:mm')}
            </div> 
        </div>
        <#if notification.articleCommentCount != 0>
        <div class="cmts" title="${cmtLabel}">
            <a class="count ft-gray" href="${notification.url}">${notification.articleCommentCount}</a>
        </div>
        </#if>
    </li>
    </#list>
</ul>
<#else>
<div class="fn-hr10"></div>
<div class="ft-center">${noMessageLabel}</div>
</#if>

<@pagination url="/notifications/broadcast"/>
</@notifications>