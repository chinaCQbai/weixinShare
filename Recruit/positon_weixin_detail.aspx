<%@ Page Language="C#" AutoEventWireup="true" CodeFile="positon_weixin_detail.aspx.cs" Inherits="Recruit_positon_weixin_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimum-scale=1.0,maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="email=no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title><%=salary%>|<%=positionname%></title>
    <link rel="stylesheet" type="text/css" href="../CSS/cqkozo.css">
    <script type="text/javascript" src="/js/sha1.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="/js/jquery-2.2.1.min.js"></script>
    <script type="text/javascript">               var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cspan id='cnzz_stat_icon_1258496044'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1258496044%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
    <script>
        var signature = hex_sha1('<%=signature%>');
        //微信分享时候的设置
        wx.config({
            debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
            appId: '<%=appId%>', // 必填，企业号的唯一标识，此处填写企业号corpid
            timestamp: '<%=timestamp%>', // 必填，生成签名的时间戳
            nonceStr: '<%=nonceStr%>', // 必填，生成签名的随机串
            signature: signature,// 必填，签名
            jsApiList: ['checkJsApi', 'onMenuShareTimeline', 'onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
        });
        wx.ready(function () {
            var shareData = {
                title: '<%=salary%>|<%=positionname%>|<%=companyname%>',
                desc: '<%=description.Substring(0,36).Replace("\r\n", "")%>...',
                link: 'http://datahunt.cn/Recruit/positon_weixin_detail.aspx?positionid='+'<%=positionid%>',//本页的网址
                imgUrl: 'http://datahunt.cn/image/logo1.png'
            };
            wx.onMenuShareAppMessage(shareData);
            wx.onMenuShareTimeline(shareData);
        });
    </script>
</head>
<body>
    <header class="kz-header">
        <div>
            <a href="http://www.datahunt.cn" class="back"></a>
            <div class="logo"><img src="../image/logo.png" alt=""></div>
        </div>
    </header>
        <section class="kz-section">
        <div>
            <div class="kz-title">
                <div class="title"><%=positionname %></div>
                <div class="date"><%=createdate %></div>
            </div>
            <ul class="kz-list">
                <li class="item1"><%=salary %></li>
                <li class="item2"><%=location %></li>
                <li class="item3">全职</li>
                <!--<li class="item4">3-5年</li>-->
                <li class="item5"><%=education %></li>
            </ul>
            <dl class="kz-list-1">
                <dt><%=companyname %></dt>
                <dd>
                    <p><%=industry %>/<%=size %></p>
                                   </dd>
            </dl>
            <div class="kz-title-1">职位描述</div>
            <div class="kz-list-2">
                <p>
                    <%=description.Replace("\r\n", "</p><p>") %>
                </p>
            </div>
            <div class="kz-title-1">岗位需求</div>
            <div class="kz-list-2">
                <p>
                    <%=qualification.Replace("\r\n", "</p><p>") %>
                </p>             </div>
            <div class="kz-img"><img src="../image/icon6.png" alt=""></div>
        </div>
    </section>
    <div class="kz-fixed">
        <div>
            <a href="http://www.datahunt.cn" class="kz-btn">投个简历</a>
        </div>
    </div>
</body>
</html>
