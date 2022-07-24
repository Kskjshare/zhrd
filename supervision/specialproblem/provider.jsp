<%@page import="RssEasy.Core.CookieHelper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="cn.jpush.api.push.model.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.jiguang.common.ServiceHelper"%>
<%@page import="cn.jpush.api.push.model.Options"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Collection"%>
<%@page import="cn.jpush.api.push.model.notification.Notification"%>
<%@page import="cn.jpush.api.push.model.audience.Audience"%>
<%@page import="cn.jpush.api.push.model.PushPayload"%>
<%@page import="cn.jpush.api.push.model.Platform"%>
<%@page import="cn.jpush.api.JPushClient"%>
<%@page import="RssEasy.MySql.RssListView"%>
<%@page import="RssEasy.MySql.User.UserList"%>
<%@page import="RssEasy.MySql.RssList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.Core.StringExtend"%>
<%@page import="RssEasy.Core.Encrypt"%>
<%@page import="RssEasy.Core.PoPupHelper"%>
<%@page import="RssEasy.Core.DateTimeExtend"%>
<%@page import="RssEasy.Core.HttpRequestHelper"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    StaffList.IsLogin(request, response);
    
    HttpRequestHelper req = new HttpRequestHelper(pageContext).request();
    CookieHelper cookie = new CookieHelper(request, response);
    RssList entity = new RssList(pageContext, "supervision_specific_issue");
    entity.request();
    entity.select().where("id=?", req.get("id")).get_first_rows();
    
    RssList entity2 = new RssList(pageContext, "supervision_specific_issue");
    entity2.request();
   
    RssListView list = new RssListView(pageContext, "user_delegation");
    list.request();
    
    String title = "特定问题调查";
    if ( entity.get("state").equals("1") ){
        title = "审议成立特定问题调查委员会";
    }
    else if ( entity.get("state").equals("2") && entity.get("initiator").equals("3") ) {
         title = "审议成立特定问题调查委员会";
    }
    
    int state = 0 ;
    int isSongjiaoSuccess = 0 ;
    
    if ( !entity.get("state").isEmpty() ) {
        state = Integer.valueOf( entity.get("state") ).intValue(); 
    }
   
     if (!entity.get("action").isEmpty()) {
        switch (entity.get("action")) {
        
            case "submit":                
                entity.keyvalue("state",6 );   
//                entity.keyvalue("committeeagree",2);
                entity.keyvalue("providerenclosure",entity2.get("providerenclosure"));
                entity.keyvalue("providerenclosurename",entity2.get("providerenclosurename"));  
                entity.keyvalue("providername",entity2.get("providername")); 
//                entity.keyvalue("provider",entity2.get("provider"));     
                entity.update().where("id=?", req.get("id")).submit();               
                break;   
  

        }        
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
        <style>
            #tabheader{background: #82bee9;text-align: center; color: #fff;}
            .dce{background: #dce6f5;text-indent: 0px}
            .cellbor td{padding: 0 6px}
            .cellbor td>span{cursor: pointer;}
            .cellbor>tbody>tr>td{border: #6caddc solid thin;line-height: 34px;}
            .cellbor{width: 100%}
            .cellbor select,.cellbor input{height: 28px;border: #d0d0d0 solid thin }
            .cellbor input{height: 24px;border: #d0d0d0 solid thin;}
            .cellbor .institle{text-align: center;}
            .cellbor>tbody>tr>.uetd{padding:8px 0;background: #dce6f5}
            /*.popupwrap>div:first-child{height: 100%;}*/
            /*#matter{line-height: 12px;}*/
            .b95{width:95%;}
            #fileeform{position: absolute;left: -10000px;}
            #fileicoform{position: absolute;left: -10000px;}
            #selsend em{background:rgb(101, 113, 128);padding: 1px 2px;color: #fff; border-radius: 5px;margin: 0 2px;cursor: pointer;}
        </style>
    </head>
    <body>
        <form id="fileeform" enctype="multipart/form-data" method="post">
            <input type="file" id="filee" accept="." name="file" multiple>
        </form>
        <form id="fileicoform" enctype="multipart/form-data" method="post">
            <!--<input type="file" id="filee" name="file" multiple>-->
            <input type="file" id="fileico" name="file2" multiple>
        </form>
        <form method="post" class="popupwrap">           
            <div>     
                <table class="wp100 cellbor">
                <tr><td style="font-size:20px;font-family: 微软雅黑" colspan="7" id="tabheader"><%out.print(title);%></td></tr>
 
               
                <td  class="dce">材料提供者</td>
                <td colspan="5" >
                <label><input type="radio" value="1" name="provider" checked="cheched" >社会团体</label>
                <label style="margin-left:13%;"><input type="radio" value="2" name="provider">单位</label>   
                <label style="margin-left:13%;"><input type="radio" value="3" name="provider">公民</label> 
                <label style="float:right;"><input type="radio" value="4" name="provider">企业事业组织</label>                              
                </td>
                </tr>               
                <tr>
                    <td class="dce w100" style="font-size:15px;font-family: 微软雅黑">材料提供者名称
<!--                        <em class="red">*</em>-->
                    </td>
                    <td colspan="5"><input style="font-size:15px;font-family: 微软雅黑;width:99.5%;" type="text" class="w98" name="providername" value="<% entity2.write("providername"); %>" /><label class="labtitle"></label></td>
                </tr>
            
                

            <tr> 
            <td class="dce w120" style="font-size:15px;font-family: 微软雅黑">材料文件</td>
            <td colspan="5">
                <div>
                <span id="fjfile" rid="1" style="color:blue ;font-size:16px;font-family: 微软雅黑;cursor:pointer;font-weight: bold;">点击选择文件</span>
                <input type="hidden" name="providerenclosure" id="providerenclosure" value="<% entity2.write("providerenclosure"); %>" >
                <input type="hidden" name="providerenclosurename" id="providerenclosurename" value="<% entity2.write("providerenclosurename"); %>" >
                <input type="hidden" id="state" value="<% entity.write("state"); %>">

                </div>
            </td>
            </tr>         

          
    
       
                
                </table>
            </div>
            <div class="footer">
                
                 <input type="hidden" name="action" value="<% 
                    out.print("submit");                
                %>" />
                <button id= "adutibtn" type="submit"><%                     
                    out.print( "提交");
                %></button>
                <input name="state" type="hidden" value="<% entity.write("state"); %>">
            </div>
        </form>
        <script src="/data/suggest.js" type="text/javascript"></script>
        <%@include  file="/inc/js.html" %>
        <script>          
     
            $('input[name="provider"]').click(function () {
                
                if ( $(this).val() == 1 || $(this).val() == 0 ){
                    //$("#adutibtn").text("同意");                               
                   // $("input[name='action']").val("committeAuditagree");     
                    $("input[name='provider']").val("1");      
//                    $("#provider").value("1");
                } else{                   
                  //$("#adutibtn").text("不同意");                                                 
                  //$("input[name='action']").val("committeAuditdisagree");
                  $("input[name='provider']").value("2");   
//                  $("#provider").value("2");
                }
                $("input[name='provider']").value($(this).val());   
                
            });
        
        $("#fjfile").click(function () {
            $("#filee").click();
        })
        $("#icofile").click(function () {
            $("#fileico").click();
        })
        $("#filee").change(function () {
            var str = $(this).val(); //开始获取文件名
            var filename = str.substring(str.lastIndexOf("\\") + 1);
            $("#fileeform").ajaxSubmit({
                url: "/widget/upload.jsp?",
                type: "post",
                dataType: "json",
                async: false,
                success: function (data) {
            if(data.url !== null && "" !== data.url){
               
                    $("#fjfile").text(filename)
                    $("input[name='providerenclosure']").val(data.url);
                    $("input[name='providerenclosurename']").val(filename);
                    //alert("上传成功");
                    }
                    else{
                    $("#fjfile").text("点击选择文件")
                    $("input[name='providerenclosure']").val(data.url);
                    $("input[name='providerenclosurename']").val(filename);
                    alert("未上传")
                }
                }});
            return false;
        })
        $("#fileico").change(function () {
            $("#fileicoform").ajaxSubmit({
                url: "/widget/upload.jsp?",
                type: "post",
                dataType: "json",
                async: false,
                success: function (data) {
                    $("#icofile").text(data.url)
                    $("input[name='ico']").val(data.url);
                    alert("上传成功");
                }});
            return false;
        })
        
        
//         $(".footer>button").click(function () {   
//               // var $tt = $("#state").val();
//                //console.log($tt);
//            if ($("[name='providername']").val() == undefined || $("[name='providername']").val() == "") {
//                alert("请填写提供材料者名称");
//                $("[name='providername']").focus();
//                return false;
//            }
//            if ($("[name='providerenclosure']").val() == undefined || $("[name='providerenclosure']").val() == "") {
//                alert("请添加材料文件");
//                $("[name='providerenclosure']").focus();
//                return false;
//            }
//             
//            })
 
        </script>
    </body>
</html>
