<#include "macro-admin.ftl">
<#include "../macro-pagination.ftl">
<@admin "users">
<div class="list content admin">
    <form method="GET" action="users" class="form">
        <input name="userNameOrEmail" type="text" placeholder="${userNameLabel}/${userEmailLabel}"/>
        <button type="submit" class="green">${searchLabel}</button> &nbsp;
        <button type="button" class="btn red" onclick="window.location='/admin/add-user'">${addUserLabel}</button>
    </form>
    <br/>
    <ul>
        <#list users as item>
        <li>
            <div class="fn-clear first">
                <div class="avatar-small tooltipped tooltipped-se" aria-label="${item.userName}" 
                     style="background-image:url('${item.userAvatarURL}')"></div> &nbsp;
                <a href="${servePath}/member/${item.userName}">${item.userName}</a>
                <a href="${servePath}/admin/user/${item.oId}" class="fn-right tooltipped tooltipped-w ft-a-icon" aria-label="${editLabel}"><span class="icon-edit"></span></a> &nbsp;
                <#if item.userStatus == 0>
                <span class="ft-gray">${validLabel}</span>
                <#elseif item.userStatus == 2>
                <span class="ft-red">${notVerifiedLabel}</span>
                <#else>
                <font class="ft-red">${banLabel}</font>
                </#if>
            </div>
            <div class="fn-clear">
                <span class="tooltipped tooltipped-n" aria-label="${emailLabel}"><span class="icon-email"></span></span>
                ${item.userEmail} &nbsp;
                <span class="tooltipped tooltipped-n" aria-label="${roleLabel}"><span class="icon-userrole"></span></span>
                <#if item.userRole == "adminRole">
                ${administratorLabel}
                <#elseif item.userRole == "defaultCommenterRole">
                ${defaultCommenterLabel}
                <#else>
                ${defaultUserLabel}
                </#if>
                <span class="fn-right ft-gray">
                    <span class="tooltipped tooltipped-n" aria-label="${articleCountLabel}"><span class="icon-articles"></span></span>
                    ${item.userArticleCount} &nbsp;
                    <span class="tooltipped tooltipped-n" aria-label="${commentCountLabel}"><span class="icon-cmts"></span></span>
                    ${item.userCommentCount} &nbsp;
                    <span class="tooltipped tooltipped-n" aria-label="${createTimeLabel}"><span class="icon-date"></span></span>
                    ${item.userCreateTime?string('yyyy-MM-dd HH:mm')}
                </span>
            </div>
        </li>
        </#list>
    </ul>
    <@pagination url="/admin/users"/>
</div>
</@admin>
