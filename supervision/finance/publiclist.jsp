<%@page import="java.net.URLDecoder"%>
<%@page import="RssEasy.MySql.RssListView"%>
<%@page import="RssEasy.MySql.RssList"%>
<%@page import="RssEasy.MySql.User.UserList"%>
<%@page import="RssEasy.MySql.Staff.StaffList"%>
<%@page import="RssEasy.DAL.Pagination"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="RssEasy.Core.CookieHelper"%>

<%
    StaffList.IsLogin(request, response);
    CookieHelper cookie = new CookieHelper(request, response);
    String powerid = cookie.Get("powergroupid");
    
    RssList evaluationEntity = new RssList(pageContext, "finance_public");
    evaluationEntity.request();
    
    RssListView user = new RssListView(pageContext, "user_delegation");
    //RssList entity1 = new RssList(pageContext, "companytypee_classify");
    user.request();
   
    
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
            /*.cellbor tbody>.sel>td{background: #dce6f5}*/
            /*             .cellbor thead,.w30{background:#f0f0f0 }
                       .cellbor tbody tr>td:first-child{display: none}
                       .cellbor td, .cellbor th { border: solid 1px #cbcbcb; padding: 8px 2px; }*/
            tbody tr:hover{background-color: gainsboro;}
        </style>
    </head>
    <body>
        <form method="post" id="mainwrap">
            <div class="toolbar">
                <button type="button" transadapter="publicquicksearch" select="false" class="quicksearch">快速查询</button>
                <button type="button" transadapter="append" select="false" class="butadd">增加</button>
<!--                <button type="button" transadapter="edit" class="butedit">编辑</button>-->
                <button type="button" transadapter="delete_1" class="butdelect">删除</button>
                <!--<button type="button" transadapter="file" class="butdfile">归档</button>-->

                <!--<button type="button" transadapter="butview" class="butview">查看</button>-->
                <input type="hidden" id="transadapter" find="[name='id']:checked" />
            </div>
            <div class="bodywrap">
                <table class="wp100 tc cellbor" id="section">
                    <thead>
                        <tr>
                            <th class="w50">序号</th>
                            <th class="w30"><input name="all"  type="checkbox"></th>
                            <th>标题</th>
                            <th>类别</th>
                            <th>发布时间</th>          
                            <th>是否发布</th>
                            <!--
                            <th>上会时间</th>
                            <th>会次</th>
                            -->
                            
                            <th>操作</th>                         
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            boolean isShowFirstButton = true ;
                            
                            String class_str = "";
                            String cmd_str = "";
                            RssList list = new RssList(pageContext, "releasum");
                            list.request();
                            int a = 1;
                            list.pagesize = 30;
                            //list.select().where("title like '%" + URLDecoder.decode(list.get("title"), "utf-8") + "%'and state like '%" + URLDecoder.decode(list.get("state"), "utf-8") + "%' and state<>2 and myid="+UserList.MyID(request)).get_page_desc("id");
                            list.select().where("title like '%" + URLDecoder.decode(list.get("title"), "utf-8") + "%' and classifyid=14").get_page_desc("id");
                            while (list.for_in_rows()) {
                                
//                            user.select().where("myid=" + list.get("myid")).get_first_rows();
                            //为了处理所有人都可以投票测评，这里需要做特殊处理。
                            
                        %>
                                <tr ondblclick="ck_ClIck();" idd="<% out.print(list.get("id")); %>" style="cursor:pointer;">
                            <td class="w30"><% out.print(a); %></td>
                            <td><input type="checkbox" name="id" value="<% out.print(list.get("id")); %>" /></td>
                            <td ><% out.print(list.get("title")); %></td>
                            <td><%
                                //out.print( list.get("publiclassifyid") );
                                if ( list.get("publiclassifyid").equals("1") ) {
                                    out.print( "报告" );
                                }
                                else if ( list.get("publiclassifyid").equals("2") ) {
                                    out.print( "预算公开" );
                                }
                                 else if ( list.get("publiclassifyid").equals("3") ) {
                                    out.print( "预算调整" );
                                }
                                else  {
                                    out.print( "视察调研" );
                                }
                                
                            %></td>
                            <td rssdate="<% out.print(list.get("shijian")); %>,yyyy-MM-dd" ></td> 
                            
                            <!--zyx 增加是否发布为是的时候字体为红色，为否的时候字体为绿色-->
                            <%
                            if ( list.get("state").equals("1")) {
                            %>
                            <td style="color:red;" releasumstate="<% out.print(list.get("state")); %>">
                            <%
                            }else if ( list.get("state").equals("2")){
                            %>
                            <td style="color:green;" releasumstate="<% out.print(list.get("state")); %>">
                             <%
                            }else{
                            %>
                            <td  releasumstate="<% out.print(list.get("state")); %>">
                            <%
                            };
                            %>
                            </td>     
                          <!--zyx end-->
                            <td>
                            
                          
                      
                           
                            <span class="ys view" id="<% out.print(list.get("id")); %>" style="color:blue;font-weight: bold" >查看内容</span> |  
                            <span class="ys edit" id="<% out.print(list.get("id")); %>" style="color:blue;font-weight: bold" >编辑</span> | 
                            <span class="ys delete" id="<% out.print(list.get("id")); %>" style="color:blue;font-weight: bold" >删除</span>
                           
                            
                                  
                            
                            <!--a href="duty/list.jsp?id=<% out.print(list.get("id")); %>&status=1">议题管理页面</a-->
                            </td>
                            
<!--                            <td>
                           
                            <a href="duty/list.jsp?id=<% out.print(list.get("id")); %>&status=1">议题管理页面</a>
                            </td>-->
                            
                            
                            
                        </tr>
                        <%
                                a++;
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
        <!--<script src="/data/suggest.js" type="text/javascript"></script>-->
        <%@include  file="/inc/js.html" %>
        <script>
            var typeid =<%list.write("typeid");%>
        </script>
        <script src="controller.js"></script>
        <script>
            $(function(){
                ﻿$(".view").click(function(){
                    let id = $(this).attr("id");
                popuplayer.display("/supervision/finance/publicbutview.jsp?id=" + id, '查看内容', {width: 830, height: 460});
                })
            });
             $(function(){
            ﻿$(".delete").click(function(){
                let id = $(this).attr("id");
             popuplayer.display("/supervision/finance/publicdelete_1.jsp?id=" + id, '删除', {width: 300, height: 80});
             
            })
            });
             $(function(){
                ﻿$(".edit").click(function(){
                    let id = $(this).attr("id");
                popuplayer.display("/supervision/finance/public.jsp?id=" + id + "&TB_iframe=true", '编辑', {width: 830, height: 470});
                })
            });           
        </script>
    </body>
</html>