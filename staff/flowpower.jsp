<%@page import="RssEasy.MySql.User.UserList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.Core.PowerHelper"%>
<%@page import="RssEasy.Core.StringExtend"%>
<%@page import="RssEasy.Core.PoPupHelper"%>
<%@page import="RssEasy.Core.HttpRequestHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StaffList.IsLogin(request, response);
    HttpRequestHelper req = new HttpRequestHelper(pageContext).request();

    StaffList entity = new StaffList(pageContext);
    if (!req.get("action").isEmpty()) {

        entity.keyvalue("flowpower", PowerHelper.request(req.get("offsetid")));
        entity.update().where("myid=?", req.get("id")).submit();
        PoPupHelper.adapter(out).showSucceed();
    }
    entity.select("flowpower").where("myid=?", req.get("id")).get_first_rows();

    StaffList my = new StaffList(pageContext);
    my.select("flowpower").where("myid=?", UserList.MyID(request)).get_first_rows();
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
            <div>
                <ul class="lanmubankuai" levelhelper="flowpower" idx="2" dict-key="offsetid" input="checkbox" check="1" powerlist="<% out.print(PowerHelper.getpowerlist(entity.get("flowpower")));%>" mypower="<% out.print(PowerHelper.getpowerlist(my.get("flowpower")));%>">
                </ul>
            </div>
            <div class="footer">
                <input type="hidden" name="action" value="update" />
                <button type="submit">设置</button>
            </div>
        </form>
        <script src="/data/flowpower.js"></script>
        <%@include  file="/inc/js.html" %>
    </body>
</html>
