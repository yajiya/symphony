<#include "macro-home.ftl">
<#include "../macro-pagination.ftl">
<@home "${type}">
<div class="tabs-sub fn-clear">
    <a href="${servePath}/member/${user.userName}"<#if type == "home"> class="current"</#if>>${articleLabel}</a>
    <a href="${servePath}/member/${user.userName}/comments"<#if type == "comments"> class="current"</#if>>${cmtLabel}</a>
    <#if currentUser?? && currentUser.userName == user.userName>
    <a<#if type == "articlesAnonymous"> class="current"</#if> href="${servePath}/member/${user.userName}/articles/anonymous">${anonymousArticleLabel}</a>
    <a<#if type == "commentsAnonymous"> class="current"</#if> href="${servePath}/member/${user.userName}/comments/anonymous">${anonymousCommentLabel}</a>
    </#if>
</div>
<#if 0 == user.userArticleStatus || (isLoggedIn && ("adminRole" == currentUser.userRole || currentUser.userName == user.userName))>
<div class="list">
    <ul> 
        <#list userHomeArticles as article>
        <li>
            <div class="has-view">
                <h2>
                    <#if 1 == article.articlePerfect>
                    <span class="tooltipped tooltipped-e" aria-label="${perfectLabel}"><svg height="20" viewBox="3 0 11 12" width="14">${perfectIcon}</svg></span>
                    </#if>
                    <#if 1 == article.articleType>
                    <span class="tooltipped tooltipped-e" aria-label="${discussionLabel}"><span class="icon-locked"></span></span>
                    <#elseif 2 == article.articleType>
                    <span class="tooltipped tooltipped-e" aria-label="${cityBroadcastLabel}"><span class="icon-feed"></span></span>
                    <#elseif 3 == article.articleType>
                    <span class="tooltipped tooltipped-e" aria-label="${thoughtLabel}"><span class="icon-video"></span></span>
                    </#if>
                    <a rel="bookmark" href="${servePath}${article.articlePermalink}">${article.articleTitleEmoj}</a>
                </h2>
                <span class="ft-gray">
                    <#list article.articleTags?split(",") as articleTag>
                    <a class="tag" rel="tag" href="${servePath}/tag/${articleTag?url('UTF-8')}">
                        ${articleTag}</a>
                    </#list> &nbsp; 
                    <span class="icon-date"></span>
                    ${article.articleCreateTime?string('yyyy-MM-dd HH:mm')}
                </span>
            </div>
            <#if isMyArticle && 3 != article.articleType>
            <div class="cmts">
                <a class="ft-a-icon tooltipped tooltipped-w" href="${servePath}/update?id=${article.oId}" aria-label="${editLabel}"><span class="icon-edit"></span></a>
            </div>
            <#else>
            <#if article.articleCommentCount != 0>
            <div class="cmts tooltipped tooltipped-w" aria-label="${cmtLabel}${quantityLabel}">
                <a class="count ft-gray" href="${servePath}${article.articlePermalink}">${article.articleCommentCount}</a>
            </div>
            </#if>
            </#if>
        </li>
        </#list>
    </ul>
</div>
<@pagination url="/member/${user.userName}"/>
<#else>
<p class="ft-center ft-gray home-invisible">${setinvisibleLabel}</p>
</#if>
</@home>