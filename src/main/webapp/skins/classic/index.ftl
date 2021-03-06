<#include "macro-head.ftl">
<#include "macro-list.ftl">
<#include "macro-pagination.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${symphonyLabel}">
        <meta name="description" content="${symDescriptionLabel}"/>
        </@head>
        <link type="text/css" rel="stylesheet" href="${staticServePath}/css/index${miniPostfix}.css?${staticResourceVersion}" />
    </head>
    <body>
        <#include "header.ftl">
        <div class="domains fn-clear">
            <div class="wrapper fn-clear">
                <#list domains as domain>
                <a href='/domain/${domain.domainURI}'>${domain.domainTitle}</a>
                </#list>
                <a href="/" class="selected">${latestLabel}</a>
                <a href="/hot">${hotLabel}</a>
                <#if isLoggedIn && "" != currentUser.userCity>
                <a href="/city/my">${currentUser.userCity}</a>
                </#if>
                <a href="/timeline">${timelineLabel}</a>
            </div>
        </div>
        <div class="main">
            <div class="wrapper">
                <div class="content fn-clear">
                    <@list listData=latestArticles/>
                    <@pagination url="/"/>
                    <#if domains?size != 0>
                    <br/> <br/> <br/> <br/>

                    <div class="module">
                        <div class="module-header">
                            <h2>${domainLabel}${navigationLabel}</h2>
                            <a href="/domains" class="ft-gray fn-right">All Domains</a>
                        </div>
                        <div class="module-panel">
                            <ul class="module-list domain">
                                <#list domains as domain>
                                <#if domain.domainTags?size gt 0>
                                <li>
                                    <a rel="nofollow" class="slogan" href="/domain/${domain.domainURI}">${domain.domainTitle}</a>
                                    <div class="title">
                                        <#list domain.domainTags as tag>
                                        <a class="tag" rel="nofollow" href="/tag/${tag.tagTitle?url('utf-8')}">${tag.tagTitle}</a>
                                        </#list>
                                    </div>
                                </li>
                                </#if>
                                </#list>
                            </ul>
                        </div>
                    </div>
                    </#if>
                </div>

                <div class="side">
                    <#include "side.ftl">
                </div>
            </div>
        </div>
        <#include "footer.ftl">
        <script>
            Util.initArticlePreview();
        </script>
    </body>
</html>
