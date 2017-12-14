using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SitrApp.businessClass;

public partial class Talent_position_detail : System.Web.UI.Page
{
    public string imageUrl = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {          
            int positionid;

            positionid = Convert.ToInt32(Request.QueryString["positionid"]);            

            DataSet ds = position.p_detail(positionid);
            dl_position.DataSource = ds.Tables[0];
            dl_position.DataBind();

            ds = company.companyinfo(positionid);
            dl_company.DataSource = ds.Tables[0];
            dl_company.DataBind();

            string positionPath = "http://datahunt.cn/Recruit/positon_weixin_detail.aspx?positionid=" + positionid.ToString(); 
            imageUrl = "/ashx/GetQRCode.ashx?CodeText=" + positionPath;


        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
            Response.Redirect("/talent/register.aspx");
    }
}