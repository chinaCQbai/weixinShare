<%@ Page Language="C#" AutoEventWireup="true" CodeFile="position.aspx.cs" Inherits="position_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register src="/Control/reco_position.ascx" tagname="position" tagprefix="uc1" %>
<%@ Register src="/Control/reco_online.ascx"     tagname="online" tagprefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8">
<title>大数据招聘-招聘职位列表</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/css/shulie.css">
<script type="text/javascript" src="/js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="/js/shulie.js"></script>
<script src="/Script/jquery-1.4.1.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/jquery-placeholder.js"></script>
</head>


<body>

    <form id="form1" runat="server">

  <div class="top">
	<div class="topleftbg"></div>
    <div class="topcontent">
    	<div class="logo"><a href=""><img src="/images/logo.png"></a></div>
        <div class="nav">
        	<ul>
            	<li><a href="/index.html">首页</a></li>
                <li><a href="/career/development.html">大数据职场发展</a>
                	<ul class="subnav">
                    	<li><a href="/career/development.html">人力资源报告</a></li>
                        <li><a href="/career/interview.html">大数据面试</a></li>
                        <li><a href="/career/conference.html">大数据会议</a></li>
                        <li><a href="/career/competition.html">大数据竞赛</a></li>
                    </ul>
                </li>
                <li  class="on"><a href="/recruit/position.aspx">大数据职场招聘</a>
                	<ul class="subnav">
                    	<li><a href="/recruit/position.aspx">大数据招聘</a></li>
                        <li><a href="/recruit/headhunt.html">大数据猎头</a></li>
                        <li><a href="/recruit/trend.html">招聘趋势</a></li>
                        <li><a href="/recruit/skill.html">技能分解</a></li>
                    </ul>
                </li>
                <li><a href="/university/traininglab.html">高校大数据</a>
                    <ul class="subnav">
                    	<li><a href="/university/traininglab.html">实训基地</a></li>
                        <li><a href="/university/bigdataeducation.html">大数据教育</a></li>                        
                        <li><a href="/university/makerspace.html">众创空间</a></li>                        
                    </ul>
                </li>
                <li><a href="/training/faculty.html">大数据培训</a>
                    <ul class="subnav">
                    	<li><a href="/training/faculty.html">师资力量</a></li>
                        <li><a href="/training/business.html">商业培训</a></li>
                        <li><a href="/training/technology.html">技术培训</a></li>
                        <li><a href="/training/onsite.html">企业内训</a></li>
                        <li><a href="/training/online.html">在线教育</a></li>
                    </ul>
                </li>
                <li><a href="/service/topleveldesign.html">大数据服务</a>
                	<ul class="subnav">
                    	<li><a href="/service/topleveldesign.html">顶层设计</a></li>
                        <li><a href="/service/creditranking.html">信用评级</a></li>
                        <li><a href="/service/visualization.html">可视化</a></li>                        
                        <li><a href="/service/crowdsourcing.html">大数据众包</a></li>                        
                    </ul>
                </li>
                <li><a href="/marketing/aboutus.html">关于我们</a></li>
            </ul>
        </div>
        <div class="login">
<a class="login_in" href="/talent/login.aspx">登录</a>
            <a class="register" href="/talent/register.aspx">注册</a>
        </div>
    </div>
</div>

<div class="content">
	<div class="dataservice">
       <div class="dataservicetit">
        	<a   class="active"  href="position.aspx">大数据招聘</a>
            <a  href="headhunt.html">大数据猎头</a>
            <a href="trend.html">招聘趋势</a>
            <a href="skill.html">技能分解</a>            
        </div>
        </div>
</div>

<div class="talents_content clearfix">
<div class="talents_banner">

	<div class="talents_search">

            <asp:TextBox ID="tb_keyword" cssClass="input" runat="server" style=" width:251px; height:50px; border:none; float:left;  font-size:16px; line-height:50px;">
            </asp:TextBox>

        <span class="btn_search">
             <asp:ImageButton ID="btn_search" ImageUrl="../images/searchbtnbg.png"  runat="server" onclick="btn_search_Click" />      
        </span>
            
    </div>
</div>
	<div class="tal_conleft">
    	<!--search_result-->
    	<div class="search_result">

            <table>               
            <asp:DataList ID="dl_position" runat="server" RepeatDirection="Vertical">
                 <ItemTemplate>
                     <tr>
                         <td>
                        <div class="searchlist">
            	            <div class="sli_left">
                	              <h3>
                                  <a href="position_detail.aspx?positionid=<%#Eval("positionid") %>">
                                        <span class="title"><%#Eval("positionname") %></span>
                                  </a>
                                  <span class="time"><%#Eval("createdate") %></span></h3>
                                  <p>
                                          <span class="pay"><%#Eval("salary") %></span>
                                          <span class="experience">  
                                                   <span><%#Eval("education") %></span>
                                           </span>
                                  </p>
                                  <div class="require"><p><%#Eval("location") %></p></div>
                           </div><!--sli_left end-->
                            <div class="sli_right">
                	              <img src="/images/applogo.png">
                                  <h3><%#Eval("companyname") %></h3>
                                  <p>
                                          <span><%#Eval("industry") %></span>
                                          /
                                          <span><%#Eval("size") %></span></p>
                                  <ul>
                    	                  <li>节日礼物</li>
                                          <li>带薪年假</li>
                                          <li>岗位晋升</li>
                                          <li>年度旅游</li>
                                  </ul>
                             </div><!--sli_right end-->
                        </div>
                        </td>
                    </tr>
                 </ItemTemplate>
            </asp:DataList>      	
            </table>
        </div><!--search_result end-->
        <!--related_search-->
        <div class="related_search">
        	<h4>相关搜索： </h4>
            <p>
                      <a>数据挖掘</a>                      
                      <a>数据分析</a>
                      <a>数据仓库</a>
                      <a>数据库</a>
                      <a>大数据分析</a>
                      <a>大数据开发</a>
              </p>
        </div><!--related_search end-->
    </div><!--tal_conleft end-->
    <div class="tal_conright ml20">
         
         <uc1:position ID="reco_position" runat="server" />

         <uc2:online     ID="reco_online" runat="server" />

    </div><!--tal_conright end-->
    <div class="pages mb75 ml70">

    	<span class="pages_index">
            <asp:ImageButton ID="btn_first" ImageUrl="../images/pages_index.png" 
            runat="server" onclick="btn_first_Click" />
        </span>

        <span class="pages_prev">
             <asp:ImageButton ID="btn_prev" ImageUrl="../images/pages_prev.png" 
            runat="server" onclick="btn_prev_Click" />
        </span>
        
        <span class="txt">
               第
               <span class="num">
                   <asp:Label ID="lb_currentpage" runat="server" Text="50"></asp:Label>
               </span>
               页    /
        </span> 
        <span class="txt">共<span class="num">
                  <asp:Label ID="lb_totalpage" runat="server" Text="56"></asp:Label>
        </span>页</span>
        
        <span class="pages_next">
            <asp:ImageButton ID="btn_next" ImageUrl="../images/pages_next.png" 
            runat="server" onclick="btn_next_Click" />
        </span>
        <span class="pages_last">
            <asp:ImageButton ID="btn_last" ImageUrl="../images/pages_last.png" 
            runat="server" onclick="btn_last_Click" />
        </span>
            
        <span class="txt">转到第
            <asp:TextBox ID="tb_jumppage" runat="server"></asp:TextBox>
        页</span>
        
        <asp:ImageButton ID="btn_jumpto" width="35px" height="30px" 
            imageurl="/image/jumpto.gif" runat="server" onclick="btn_jumpto_Click" />
        
    </div>
</div>

<div class="footer">
	<p class="links">
    	<a href="">网站地图</a>|<a href="/marketing/statement.html">法律声明</a>|<a href="/marketing/serviceterm.html">使用协议</a>|<a href="/marketing/aboutus.html">关于我们</a>
    </p>
    <p class="links">
           版权所有：众意网科技有限公司 &copy;<a href="http://www.miitbeian.gov.cn/" target="_blank" >2007-2016 渝ICP备07501141号-4</a>
           <script type="text/javascript">               var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cspan id='cnzz_stat_icon_1258496044'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1258496044%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
    </p>    
</div>
    </form>
</body>
</html>
