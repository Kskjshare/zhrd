<%@page import="Model.User.UserNewsList"%>
<%@page import="RssEasy.MySql.User.UserList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.Core.PoPupHelper"%>
<%@page import="RssEasy.Core.HttpRequestHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StaffList.IsLogin(request, response);
    UserNewsList entity = new UserNewsList(pageContext);
    entity.keyvalue("ico", "/img/white.gif");
    entity.request();
    if (!entity.get("action").isEmpty()) {
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
    if (entity.select().where("id=?", entity.get("id")).get_first_rows()) {
        entity.keyvalue("ico", "/upfile/" + entity.get("ico"));
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
        <link href="/css/swfupload.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form method="post" class="popupwrap">           
            <div>
                <table class="cellbor">
                    <tr>
                        <td class="tr w60">标题：</td>
                        <td><input type="text" name="title" class="w300" value="<% out.print(entity.get("title")); %>"/></td>
                    </tr>
<!--                    <tr>
                        <td class="tr">ICO：</td>
                        <td>
                            <ul id="icourlwrap" class="swfuploadwrap">
                                <li><div class="swfuploadimg"><div><img src="<% out.print(entity.get("ico")); %>"></div></div></li>
                            </ul>
                            <div>
                                <span swfupload="icourlswf" config="{multimode:0,fileType:[['图形图像(*.jpg;*.png;*jpeg;*gif)','*.jpg;*.png;*jpeg']]}"></span>
                                <br/>
                                宽度建议在：180PX
                            </div>
                            <input type="hidden" name="ico" id="ico" value="<% out.print(entity.get("ico")); %>">
                        </td>
                    </tr>-->
                    <tr>
                        <td class="tr">摘要：</td>
                        <td><input type="text" name="summary" value="<% out.print(entity.get("summary")); %>" class="w650" placeholder="50字数以内" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td class="tr">内容：</td>
                        <td><script ueditor="toolbars: [['fullscreen','undo','redo','|','bold','italic','underline','fontborder','strikethrough','superscript','subscript','removeformat','formatmatch','autotypeset','pasteplain','|','forecolor','backcolor','insertorderedlist','insertunorderedlist','|','rowspacingtop','rowspacingbottom','lineheight','|','fontfamily','fontsize','|','justifyleft','justifycenter','justifyright','justifyjustify','indent','|','link','unlink','anchor','|','imagenone','imageleft','imageright','imagecenter','|','insertimage','emotion','spechars','insertvideo']],initialFrameHeight:280" id="matter" name="matter" class="w650" type="text/plain"><% entity.write("matter"); %></script></td>
                    </tr>
                </table>
            </div>
            <div class="footer">
                <input type="hidden" name="action" value="<% out.print(entity.get("id").isEmpty() ? "append" : "update"); %>" />
                <button type="submit"><% out.print(entity.get("id").isEmpty() ? "增加" : "修改");%></button>
            </div>
        </form>
        <%@include  file="/inc/js.html" %>
        <script src="upload.js" type="text/javascript"></script>
    </body>
</html>
