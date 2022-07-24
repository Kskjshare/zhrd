<%@page import="Model.User.UserHotList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.Core.PoPupHelper"%>
<%@page import="RssEasy.Core.HttpRequestHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StaffList.IsLogin(request, response);
    UserHotList entity = new UserHotList(pageContext);
    entity.request();
    if (entity.get("action").equals("hot")) {
        entity.append().submit();
        PoPupHelper.adapter(out).iframereload();
        PoPupHelper.adapter(out).showSucceed();
    }
    if (entity.select().where("myid=?", entity.get("myid")).get_first_rows()) {
        PoPupHelper.adapter(out).showError("已在热门列表中");
        out.close();
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
                增加到热门？
            </div>
            <div class="footer">
                <input type="hidden" name="action" value="hot" />
                <button type="submit">确认</button>
            </div>
        </form>
        <%@include  file="/inc/js.html" %>
    </body>
</html>
