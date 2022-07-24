<%@page import="RssEasy.MySql.User.UserList"%>
<%@page import="RssEasy.MySql.SoftGradeList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.Core.PoPupHelper"%>
<%@page import="RssEasy.Core.HttpRequestHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StaffList.IsLogin(request, response);
    SoftGradeList entity = new SoftGradeList(pageContext);
    entity.request();
    if (!entity.get("action").isEmpty()) {
        entity.remove("id");
        switch (entity.get("action")) {
            case "append":
                entity.keymyid(UserList.MyID(request)).timestamp();
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
    if (entity.get("url").isEmpty()) {
        entity.keyvalue("url", "white.gif");
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
        <style>
            #headimg label>input{display: none}    
            #headimg >div{width: 140px;height: 100px;text-align: center;margin-bottom: 5px;}
            #headimg >div>img{height: 100%}
            #headimg p {display: inline-block;width: 70px;height: 25px; margin: 0 2px;border-radius:5px;background: #00a2d4;text-align: center;color: #fff;line-height:25px; }
            #abc{position: absolute;left: -10000px;}
        </style>
    </head>
    <body>
        <form id="abc" enctype="multipart/form-data" method="post">  
            <input size="20" onchange="PreviewImage(this, 'imgHeadPhoto', 'divPreview')" type="file" id="file" name="file" multiple>
            <!--<input type="file" accept="image/*" />-->
            <input id="submit" accept="image/*"  type="submit"/>  
        </form>  
        <form method="post" class="popupwrap">           
            <div>
                <table class="wp100 cellbor vtop">
                    <tr>
                        <td class="tr w60">上传：</td>
                        <!--                        <td>
                                                    <ul id="icourlwrap" class="swfuploadwrap">
                                                        <li><div class="swfuploadimg"><div><img src="/upfile/<% entity.write("url"); %>"></div></div></li>
                                                    </ul>
                                                    <div>
                                                        <span swfupload="icourlswf" config="{multimode:0,fileType: [['APK(*.apk)','*.APK']]}"></span>
                                                        <br/>
                        
                                                    </div>
                                                    <input type="hidden" name="url" id="url" value="<% entity.write("url");%>">
                                                </td>-->
                        <td colspan="3" id="headimg">
                            <div id="divPreview">
                                <img id="imgHeadPhoto" src="<% out.print(entity.get("avatar").isEmpty() ? "/img/soft/apk.png" : "/upfile/" + entity.get("url")); %>">
                            </div>
                            <p id="selbut">选择文件</p><p id="pbut">文件上传</p><span id="upfiletype"></span>
                            <input type="hidden" name="url"  accept="image/*" id="avatar" value="<% entity.write("url");%>">
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">版本：</td>
                        <td>
                            <input type="text" name="version" value="<% entity.write("version"); %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">摘要：</td>
                        <td>
                            <script ueditor="toolbars:[],initialFrameHeight:200" id="remark" name="remark" class="w610" type="text/plain"><% entity.write("remark"); %></script>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="footer">
                <input type="hidden" name="action" value="<% out.print(entity.get("id").isEmpty() ? "append" : "update"); %>" />
                <button type="submit" class="btnface"><% out.print(entity.get("id").isEmpty() ? "增加" : "修改");%></button>
            </div>
        </form>
        <%@include  file="/inc/js.html" %>
        <script src="ico.js" type="text/javascript"></script>
        <script>
                $("#selbut").click(function () {
                    $("#file").click();
                });
                $('#pbut').click(function () {
                    $("#submit").click();
                });
                $("#submit").click(function () {
                    $("#abc").ajaxSubmit({
                        url: "/widget/upload.jsp?",
                        type: "post",
                        dataType: "json",
                        async: false,
                        success: function (data) {
                            console.log(data);
                            $("#minhead>img").attr("src", "/upfile/" + data.url);
                            $("#avatar").val(data.url);
                            alert("上传成功");
                            $("#upfiletype").text("(成功上传)");
                        }});
                    return false;
                });
        </script>
    </body>
</html>
