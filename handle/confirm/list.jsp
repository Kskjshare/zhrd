<%@page import="RssEasy.Core.CookieHelper"%>
<%@page import="RssEasy.Core.HttpRequestHelper"%>
<%@page import="RssEasy.MySql.User.UserList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="RssEasy.MySql.RssListView"%>
<%@page import="RssEasy.MySql.RssList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.DAL.Pagination"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.util.Properties"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="RssEasy.Core.DateTimeExtend"%>
<%@page import="RssEasy.Core.HttpRequestHelper"%>
<%@page import="java.util.Date"%>

<%
    StaffList.IsLogin(request, response);
    RssListView list = new RssListView(pageContext, "sort");
    list.request();
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
            .toolbar>ul{position: absolute;right: -180px ;top:33px; z-index: 2;width: 170px;line-height: 26px;font-size: 14px;background: #FFF;border: #cbcbcb solid thin;border-radius: 5px}
            .toolbar>ul input{margin: 0 5px}
            tbody tr:hover{background-color: gainsboro;}
            .res{float: right;}
        </style>
    </head>
    <body>
        <form method="post" id="mainwrap">
            <div class="toolbar">
                <button type="button" transadapter="quicksearch" select="false" class="quicksearch">快速查询</button>

<!--
                <%
                    HttpRequestHelper req = new HttpRequestHelper(pageContext).request();
                    if (!(req.get("handlestate").equals("3"))) {
                %>
                <button type="button" transadapter="edit" class="butedit">确定单位</button>
                <%
                    }
                %>
                <button type="button" transadapter="see" class="butview">查看</button>
-->
                <button type="button" class="res">返回上一级</button>
                <!--<button type="button" transadapter="append" select="false" class="butreports">报表</button>-->
                <input type="hidden" id="transadapter" find="[name='id']:checked" />
            </div>
            <div class="bodywrap">
                <table class="wp100 tc cellbor" id="section">
                    <thead>
                        <tr>
                            <th class="w30">序号</th>
	            <!-- removed by ding
                            <th class="w30"><input name="all" type="checkbox"></th>
	           
                            <th class="w60"><%
                                String a;
                                if (list.get("type").equals("1")) {
                                    a = "编号";
                                } else {
                                    a = "编号";
                                }
                                out.print(a); %></th>
                        -->
	            <th class="w60">类型</th>
                            <th class="w80">标题</th>
                            <th class="w60">领衔代表</th>
                            <!--<th class="w60">立案形式</th>-->
                            <th class="w80">审查分类</th>
                            <!--<th class="w60">办理方式</th>-->
                            <th class="w60">主办单位</th>
	            <th class="w60">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            list.request();
                            int b = 1;
                            list.pagesize = 30;
                            CookieHelper cookie = new CookieHelper(request, response);
                            String sql = "";
                            
                            //增加此条件查询结果为0
                            //if (cookie.Get("powergroupid").equals("23")) {//督察局（市镇流程）
                                //sql += " and level=1"; //汝州项目督察局审查的是市人大代表
                            //} else if (cookie.Get("powergroupid").equals("25")) {//乡镇主席团
                                //sql += " and level=0"; //汝州项目乡镇主席团审查的是乡镇人大代表
                           // }
                       
                           
                                    //增加闭会 开会 条件过滤 
                        String meetingTime="0";
                        try {
                            String propertiesFileName = this.getClass().getResource("/flowtype.properties").getPath();
                            Properties properties = new Properties();
                            InputStream is = new FileInputStream(propertiesFileName);
                            properties.load(is);
                            is.close();
                            meetingTime = properties.get("meetingtime").toString();
                        } catch (Exception e) {
                         e.printStackTrace();
                         }
                        if ( meetingTime.equals("1")){
                            sql += " and ismeet=1";
                         }
                        else {
                            sql += " and ismeet=0";
                         }
                         
                        //removded by ding 20220510
                        //list.select().where("title like '%" + URLDecoder.decode(list.get("title"), "utf-8") + "%' and lwstate like '%" + URLDecoder.decode(list.get("lwstate"), "utf-8") + "%' and organizer like '%" + URLDecoder.decode(list.get("organizer"), "utf-8") + "%' and realid like '%" + URLDecoder.decode(list.get("realid"), "utf-8") + "%' and draft like '%" + URLDecoder.decode(list.get("draft"), "utf-8") + "%' and type like '%" + URLDecoder.decode(list.get("type"), "utf-8") + "%' and handlestate like '%" + URLDecoder.decode(list.get("handlestate"), "utf-8") + "%' and registertype like '%" + URLDecoder.decode(list.get("registertype"), "utf-8") + "%' and handle like '%" + URLDecoder.decode(list.get("handle"), "utf-8") + "%' and allname like '%" + URLDecoder.decode(list.get("allname"), "utf-8") + "%' and sessionid like '%" + URLDecoder.decode(list.get("sessionid"), "utf-8") + "%' and telphone like '%" + URLDecoder.decode(list.get("telphone"), "utf-8") + "%' and year like '%" + URLDecoder.decode(list.get("year"), "utf-8") + "%' and meetingnum like '%" + URLDecoder.decode(list.get("meetingnum"), "utf-8") + "%' and draft=2 and examination=2").get_page_desc("realid");

                        list.select().where("lwstate like '%" + URLDecoder.decode(list.get("lwstate"), "utf-8") + "%' and draft like '%" + URLDecoder.decode(list.get("draft"), "utf-8") + "%' and type like '%" + URLDecoder.decode(list.get("type"), "utf-8") + "%' and handlestate like '%" + URLDecoder.decode(list.get("handlestate"), "utf-8") +  "%' and handle like '%" + URLDecoder.decode(list.get("handle"), "utf-8")  + "%' and draft=2 and examination=2").get_page_desc("realid");

                        while (list.for_in_rows()) {
                        %>
                        <tr ondblclick="ck_dbAbelclick();" idd="<% out.print(list.get("id")); %>" style="cursor:pointer;">
                            <td><% out.print(b); %></td>
                        <!--
                            <td><input type="checkbox" name="id" value="<% out.print(list.get("id")); %>" /></td>
		
                            <td><% out.print(list.get("realid")); %></td>
                        -->

                            <td>
		<% 
		 if (list.get("type").equals("1")) {
                    out.print("建议"); 
                 } 
                 else if (list.get("type").equals("2")){
 		   out.print("议案"); 
                 }
                  else if (list.get("type").equals("3")){
 		   out.print("批评"); 
                 }
                  else if (list.get("type").equals("4")){
 		   out.print("意见"); 
                 }
                  else if (list.get("type").equals("5")){
 		   out.print("质询"); 
                 }
		%>
	            </td>

                            <td class="tl"><% out.print(list.get("title")); %></td>
                            <td><% out.print(list.get("realname")); %></td>
                            <!--<td registertype="<% out.print(list.get("registertype")); %>"></td>-->
                            <td companytypeeclassify="<% out.print(list.get("reviewclass")); %>"></td>
                            <!--<td handle="<% out.print(list.get("handle")); %>"></td>-->
                            <td><%
                                RssListView usercomplist = new RssListView(pageContext, "suggest_company");
                                usercomplist.select().where("suggestid=" + list.get("id") + " and type=2").query();
                                while (usercomplist.for_in_rows()) {
                                %>
                                <p><% out.print(usercomplist.get("allname"));%></p>
                                <%
                                    }
                                %>
                            </td>

 	          


                    <input type="hidden" value="<% out.print(list.get("type")); %>">


                <td>
                    <%              
                    if ( list.get("handlestate").equals("3"))  {
                    %>
                    <span class="ys view" id="<% out.print(list.get("id")); %>" style="color:blue;font-weight:bold;">查看内容</span>
                    <%
                    }
                    
                    else{
                     %>
                       <span class="ys view" id="<% out.print(list.get("id")); %>" style="color:blue;font-weight:bold;">查看内容</span> | 
                       <span class="ys confirm" id="<% out.print(list.get("id")); %>" style="color:blue;font-weight:bold;" >确定单位</span> 
                    <%  
                    }
                    %>
                </td>


                    </tr>
                    <%
                            b++;
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <div class="footer">
                每页条数<select id="footerpagesize" dict-select="pagesize" def="<% out.print(list.get("pagesize"));%>"></select>
                <%
                    Pagination pagination = new Pagination(list, request);
                    pagination.pageinfo().firstpage().looppage().lastpage().display(out);
                %>
            </div>
        </form>
        <script src="/data/companytypee.js" type="text/javascript"></script>
        <script src="/data/bill.js" type="text/javascript"></script>
        <%@include  file="/inc/js.html" %>
        <script src="controller.js"></script>
        <script>
                            $(".res").click(function () {
                                history.go(-1);
                            });

  	$(function(){
                ﻿$(".view").click(function(){
                    let id = $(this).attr("id");
                popuplayer.display("/suggest/butview.jsp?id=" + id + "&TB_iframe=true", '查看内容', {width: 830, height: 560});
                })
            });
            $(function(){
                ﻿$(".confirm").click(function(){
                    let id = $(this).attr("id");
                popuplayer.display("/handle/butreview.jsp?id=" + id + "&TB_iframe=true", '确定单位', {width: 830, height: 560});
                })
            });




        </script>
    </body>
</html>
