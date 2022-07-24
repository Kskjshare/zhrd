<%@page import="RssEasy.MySql.RssList"%>
<%@page import="RssEasy.MySql.User.UserList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.MySql.RssListView"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StaffList.IsLogin(request, response);
    RssListView entity = new RssListView(pageContext, "sort");
//    RssList sessionid = new RssList(pageContext, "session");
    entity.request();

    entity.select().where("id=?", entity.get("id")).get_first_rows();

//    sessionid.select().where("id=?", entity.get("sessionid")).get_first_rows();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>管理系统</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="/css/reset.css" rel="stylesheet" type="text/css" />
        <link href="/css/layout.css" rel="stylesheet" type="text/css" />
        <style>
           .popupwrap div:first-child{height: 100%;font-size: 18px}
        </style>
    </head>
    <body>
        <form method="post" class="popupwrap">           
            <div>
                <% entity.write("matter");%>
            </div>
        </form>
        <%@include  file="/inc/js.html" %>
        <script src="/data/session.js"></script>
    </body>
</html>
