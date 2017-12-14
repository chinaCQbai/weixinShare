<%@ Page Language="C#" AutoEventWireup="true" CodeFile="position_detail.aspx.cs" Inherits="Talent_position_detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register src="/Control/reco_position.ascx" tagname="position" tagprefix="uc1" %>
<%@ Register src="/Control/reco_online.ascx"     tagname="online" tagprefix="uc2" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
          <title>人才-职位投放</title>
           <link rel="stylesheet" type="text/css" href="/css/style.css">
           <link rel="stylesheet" type="text/css" href="/css/shulie.css">
           <script type="text/javascript" src="/js/jquery-2.2.1.min.js"></script>
           <script type="text/javascript" src="/js/shulie.js"></script>
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
	<div class="tal_conleft">
    	<!--职位投放-->                 
           <asp:DataList ID="dl_position" runat="server" RepeatDirection="Vertical">
                 <ItemTemplate>
        <div class="jobrecruit">
            <div class="erweima">
	            	 <img src="<%=imageUrl%>" style="width: 106px;height: 106px;" />                     
	        </div>

        	<div class="jobtitle">
            	<p><%#Eval("companyname") %></p>
                <h1><%#Eval("positionname") %></h1>
            </div>
            <div class="jobkey">
            	<p>
                         <span class="pay"><%#Eval("salary") %></span>                         
                         <span><%#Eval("education") %></span>                         
                         <p><%#Eval("location") %></p>
                         <p class="publishdate"><span class="datetime"><%#Eval("createdate") %></span><span class="publish">发布于数猎</span></p>
            </div>
        </div><!--jobrecruit end-->
        <div class="jobdescribe">
        	<h2>职位描述</h2>
            <%#Eval("description") %>            
        </div>
        
        <div class="jobdescribe">
        	<h2>任职要求</h2>
            <%#Eval("qualification") %>            
        </div><!--jobdescribe end-->

        <!--jobdescribe end-->
        <div class="publisher">
        	<h2>职位发布者</h2>
            <div class="publishermsg">
            	<img src="/temp/photo.jpg">
                <p class="name"><%#Eval("companyname") %></p>
                <p class="publisherpos">HR</p>
            </div>
            <div class="handle">
            	<p class="rate">81%</p>
                <p class="ratename">简历及时处理率</p>
            </div>
            <div class="handletime">
            	<p class="days">2天</p>
                <p class="daysname">简历处理用时</p>
            </div>
        </div><!--publisher end-->
                 </ItemTemplate>
            </asp:DataList>      
     
        <div class="toufang">            
             <div style="height:50px"></div>
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="/image/applyjob.jpg" onclick="ImageButton1_Click" style="vertical-align:middle;"/>            
        </div>
    	<!--职位投放 end-->
    </div><!--tal_conleft end-->
    <div class="tal_conright ml20">
    	

            <asp:DataList ID="dl_company" runat="server" RepeatDirection="Vertical">
                 <ItemTemplate>
                       <div class="company">
                            <img src="/images/applogo.png">
                            <h1><%#Eval("companyname") %></h1>
                       </div>

                       <ul class="meglist">
        	                 <li><span class="tit">领域</span><span><%#Eval("industry") %></span></li>
                             <li><span class="tit">规模</span><span><%#Eval("size") %></span></li>
                             <li><span class="tit">主页</span><span class="siteadr"><%#Eval("website") %></span></li>
                       </ul>                        
             
                 </ItemTemplate>
          </asp:DataList>

         <uc1:position ID="reco_position" runat="server" />

         <uc2:online     ID="reco_online" runat="server" />

      
    </div><!--tal_conright end-->

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
