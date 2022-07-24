<%@page import="RssEasy.MySql.RssListView"%>
<%@page import="RssEasy.MySql.User.UserList"%>
<%@page import="RssEasy.MySql.RssList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.Core.StringExtend"%>
<%@page import="RssEasy.Core.Encrypt"%>
<%@page import="RssEasy.Core.PoPupHelper"%>
<%@page import="RssEasy.Core.DateTimeExtend"%>
<%@page import="RssEasy.Core.HttpRequestHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.*,java.text.*"%>

<%@page import="RssEasy.Core.CookieHelper"%>
<%
    int participate_person = 0 ;
    StaffList.IsLogin(request, response);
    
    CookieHelper cookie = new CookieHelper(request, response);
    HttpRequestHelper req = new HttpRequestHelper(pageContext).request();
  
    RssList entity = new RssList(pageContext, "legislativeprocess");
    entity.request();
    entity.select().where("id=?", req.get("id")).get_first_rows();
       
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
            .cellbor{border:1px}
            .dce{text-indent: 10px}
            .cellbor td{padding: 0 6px}
            .cellbor>tbody>tr>td{border:1;line-height: 34px;position: relative;}
            /*.cellbor>tbody>tr>td>p{border: #eee solid 2px;padding: 0 5px;}*/
            .cellbor .textareadiv{height: 120px;margin-top: 5px;padding: 0 3px;}
            .cellbor{width: 100%}
            .cellbor select,.cellbor input{height: 28px;border: #d0d0d0 solid thin }
            .cellbor select{width: 256px;height: 32px;} 
            .cellbor textarea{height: 205px;margin-top: 5px;width: 89%;font-size: 14px;} 
            .cellbor .textareadiv{height: 100%;margin-top: 5px}
            .cellbor input{height: 24px;border: #d0d0d0 solid thin;}
            .cellbor .institle{text-align: center;}
            .cellbor>tbody>tr>.uetd{padding:8px 0;background: #dce6f5}
            #matter{line-height: 12px;}
            .left>span{position: absolute;top: 10px;left: 6px;}
            .w630{width:630px;}
            #seluserlist em{background:rgb(101, 113, 128);padding: 1px 2px;color: #fff; border-radius: 5px;margin: 0 2px;cursor: pointer;}
        </style>
    </head>
    <body>
        <form method="post" class="popupwrap">           
            <div>
                <table class="wp100 cellbor">

                     <tr>
                        <td class="dce w120" style="font-size:15px;font-family: 微软雅黑">姓名</td>                       
                        <td colspan="3"><% entity.write("title"); %></td>
               
                        <td class="dce w100" style="font-size:15px;font-family: 微软雅黑" >所属单位</td>
             
                        <td colspan="5"><% entity.write("unit"); %></td>

                    </tr>
                    
                    
                     <tr>
                        <td class="dce w120" style="font-size:15px;font-family: 微软雅黑">电话</td>                       
                        <td colspan="3"><% entity.write("telephone"); %></td>

                        <td class="dce w100" style="font-size:15px;font-family: 微软雅黑" >邮件</td>
             
                        <td colspan="5"><% entity.write("email"); %></td>

                    </tr>
                                      
                    
                    <tr>
                        <td colspan="7" style="font-size:20px;font-family: 微软雅黑" colspan="2" id="tabheader">简介</td></tr>

                
                        <td colspan="7" class="marginauto uetd">                           
                            <div class="iframe"><p><iframe src="butview_1.jsp?id=<% out.print(entity.get("id"));%>"></iframe></p></div>                        
                     </tr>
                    
                    
                    
                    
                    

<!--                    <tr class="thismyid">
                        <td class="tr">作者ID</td>
                        <td colspan="3"><input type="hidden" name="action" value="append" /><input type="text" name="myid" class="w50" value="<% out.print(UserList.MyID(request));%>" selectuser=""/> <label></label></td>-->
                </table>
                
                
                
                
            </div>
            <!--            <div class="footer">
                            <input type="hidden" name="action" value="append" />
                            <button type="submit">确定</button>
                        </div>-->
        </form>
        <script src="/data/suggest.js" type="text/javascript"></script>
        <%@include  file="/inc/js.html" %>
        <script>
        </script>
    </body>
</html>
