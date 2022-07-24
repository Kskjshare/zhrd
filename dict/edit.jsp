<%@page import="RssEasy.MySql.DictList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.Core.PoPupHelper"%>
<%@page import="RssEasy.Core.HttpRequestHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StaffList.IsLogin(request, response);
    DictList entity = new DictList(pageContext);
    entity.request();
    if (!entity.get("action").isEmpty()) {
        entity.remove("id");
        switch (entity.get("action")) {
            case "append":
                entity.timestamp();
                entity.append().submit();
                break;
            case "update":
                entity.update().where("id=?", entity.get("id")).submit();
                break;
        }
        PoPupHelper.adapter(out).iframereload();
        PoPupHelper.adapter(out).showSucceed();
    }
    entity.select().where("id=?", entity.get("id")).get_first_rows();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>管理系统</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="/css/reset.css" rel="stylesheet" type="text/css" />
        <link href="/css/layout.css" rel="stylesheet" type="text/css" />
        <link href="/css/swfupload.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form method="post" class="popupwrap">           
            <div>
                <table class="wp100 cellbor vtop">
                    <tr>
                        <td class="tr w50">分类：</td>
                        <td>
                            <ul levelhelper="dictclassify" key="classifyid" def="<% entity.write("classifyid");%>" offset="1" class="lanmubankuai"></ul>
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">标题：</td>
                        <td><input type="text" name="title" maxlength="50" class="w300" value="<% entity.write("title"); %>" /></td>
                    </tr>
                    <tr>
                        <td class="tr">摘要：</td>
                        <td>
                            <textarea name="summary" class="w650"><% entity.write("summary"); %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">内容：</td>
                        <td><script ueditor="toolbars: [['fullscreen','undo','redo','|','bold','italic','underline','fontborder','strikethrough','superscript','subscript','removeformat','formatmatch','autotypeset','pasteplain','|','forecolor','backcolor','insertorderedlist','insertunorderedlist','|','rowspacingtop','rowspacingbottom','lineheight','|','fontfamily','fontsize','|','justifyleft','justifycenter','justifyright','justifyjustify','indent','|','link','unlink','anchor','|','imagenone','imageleft','imageright','imagecenter','|','insertimage','emotion','spechars','insertvideo']],initialFrameHeight:200" id="matter" name="matter" class="w650" type="text/plain"><% entity.write("matter"); %></script></td>
                    </tr>
                </table>
            </div>
            <div class="footer">
                <input type="hidden" name="action" value="<% out.print(entity.get("id").isEmpty() ? "append" : "update"); %>" />
                <button type="submit" class="btnface"><% out.print(entity.get("id").isEmpty() ? "增加" : "修改");%></button>
            </div>
        </form>
        <script src="/data/dict.js" type="text/javascript"></script>
        <%@include  file="/inc/js.html" %>
        <script src="upload.js" type="text/javascript"></script>
    </body>
</html>
