using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.Text;
using System.Web.Util;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Recruit_positon_weixin_detail : System.Web.UI.Page
{
    public string appId = "wxf7c5cf287f5b93c9";
    public string appsecret = "180d1fa2784f9014af215cadcb8b67f6";
    public string timestamp;
    public string nonceStr = "";
    public string signature = "";
    public string test = "";
    public string positionname = "";
    public string createdate = "";
    public string salary = "";
    public string location = "";
    public string education = "";
    public string companyname = "";
    public string industry = "";
    public string size = "";
    public string description = "";
    public string qualification = "";
    public string positionid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        positionid = Request.QueryString["positionid"].ToString();
        string access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appId + "&secret=" + appsecret;
        string access_token = getaccess_token(access_token_url);
        if (!string.IsNullOrEmpty(access_token))
        {
            string ticket_url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + access_token + "&type=jsapi";
            string ticket=getticket(ticket_url);
            timestamp = gettimestamp();
            nonceStr = getnonceStr();
            signature = "jsapi_ticket=" + ticket + "&noncestr=" + nonceStr + "&timestamp=" + timestamp + "&url=http://www.datahunt.cn/Recruit/positon_weixin_detail.aspx?positionid=" + positionid;
        }
        getposition(positionid);

    }
    /// <summary>
    /// 通过appId和appsecret去获取access_token，每次获取之后有2小时的时限
    /// </summary>
    /// <param name="url">access_token的微信请求地址</param>
    /// <returns></returns>
    public string getaccess_token(string url)
    {
        string access_token = "";
        try
        {
            Uri uri = new Uri(url);
            System.Net.HttpWebRequest request = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(uri);
            request.Method = "GET";
            request.ContentType = "application/x-www-form-urlencoded";
            request.AllowAutoRedirect = false;
            request.Timeout = 5000;
            System.Net.HttpWebResponse response = (System.Net.HttpWebResponse)request.GetResponse();
            Stream responseStream = response.GetResponseStream();
            StreamReader readStream = new StreamReader(responseStream, System.Text.Encoding.UTF8);
            string accessjson = readStream.ReadToEnd().ToString();
            readStream.Close();
            access_token = accessjson.Substring(accessjson.IndexOf("access_token") + 15, accessjson.IndexOf("expires_in") - access_token.IndexOf("access_token") - 21);
            return access_token;
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
    }
    /// <summary>
    /// 通过请求得到的access_token去获取ticket，是生成微信签名的重要参数
    /// </summary>
    /// <param name="url">ticket的微信请求地址</param>
    /// <returns></returns>
    public string getticket(string url)
    {
        string ticket = "";
        try
        {
            Uri uri = new Uri(url);
            System.Net.HttpWebRequest request = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(uri);
            request.Method = "GET";
            request.ContentType = "application/x-www-form-urlencoded";
            request.AllowAutoRedirect = false;
            request.Timeout = 5000;
            System.Net.HttpWebResponse response = (System.Net.HttpWebResponse)request.GetResponse();
            Stream responseStream = response.GetResponseStream();
            StreamReader readStream = new StreamReader(responseStream, System.Text.Encoding.UTF8);
            string ticketjson = readStream.ReadToEnd().ToString();
            readStream.Close();
            ticket = ticketjson.Substring(ticketjson.IndexOf("ticket") + 9, ticketjson.IndexOf("expires_in") - ticketjson.IndexOf("ticket")-12);
            return ticket;
        }
        catch (Exception ex)
        {
            return ex.ToString();
        }
    }
    /// <summary>
    /// 产生随机字符 用于生产签名
    /// </summary>
    /// <returns></returns>
    public string getnonceStr()
    {
        string[] strs = new string[]
                                 {
                                  "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
                                  "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
                                 };
        Random r = new Random();
        var sb = new StringBuilder();
        var length = strs.Length;
        for (int i = 0; i < 15; i++)
        {
            sb.Append(strs[r.Next(length - 1)]);
        }
        return sb.ToString();
    }
    /// <summary>
    /// 产生随机时间戳 用于生产签名
    /// </summary>
    /// <returns></returns>
    public string gettimestamp()
    {
        long nowtime=(DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000;
        return nowtime.ToString();
    }
    /// <summary>
    /// 通过传入的positionid进行查询获得相应职位的详细信息
    /// </summary>
    /// <param name="posistionid">职位id</param>
    public void getposition(string posistionid)
    {
        string sql = "select a.positionname,a.createdate,a.salary,a.location,a.education,b.companyname,b.industry,b.size,a.description,a.qualification from positions_list as a inner join company as b on a.companyid=b.companyid and a.positionid="+posistionid;
        string strconn = ConfigurationSettings.AppSettings["connectionString"];
        SqlConnection conn = new SqlConnection(strconn);
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                positionname = dr["positionname"].ToString();
                createdate = dr["createdate"].ToString().Substring(0,10);
                salary = dr["salary"].ToString();
                location = dr["location"].ToString();
                education = dr["education"].ToString();
                companyname = dr["companyname"].ToString();
                industry = dr["industry"].ToString();
                size = dr["size"].ToString();
                description = dr["description"].ToString();
                qualification = dr["qualification"].ToString();
            }
            dr.Close();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            conn.Close();
        }
    } 
}