<%@page import="RssEasy.MySql.BankList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.Core.PoPupHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StaffList.IsLogin(request, response);
    BankList entity = new BankList(pageContext);
    entity.request();
    if (entity.get("action").equals("delete")) {
        entity.delete().where("id in(" + entity.get("id") + ")").submit();
        BankList.CreateJson(pageContext);
        PoPupHelper.adapter(out).iframereload();
        PoPupHelper.adapter(out).showSucceed();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>管理系统</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="/css/reset.css" rel="stylesheet" type="text/css" />
        <link href="/css/layout.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <form method="post" class="popupwrap">
            <div class="infowrap">
                删除后不可恢复，请谨慎操作？
            </div>
            <div class="footer">
                <input type="hidden" name="action" value="delete" />
                <button type="submit">确认</button>
            </div>
        </form>
        <%@include  file="/inc/js.html" %>
    </body>
</html>
