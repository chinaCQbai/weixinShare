using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Web;
using SitrApp.businessClass;

public partial class position_list : System.Web.UI.Page
{

    protected void search(string keyword, int page)
    {
        DataSet ds = position.p_list(keyword, page);
        dl_position.DataSource = ds.Tables[0];
        dl_position.DataBind();

        lb_currentpage.Text = page.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
         
            string keyword = "";
            DataSet ds = position.p_list(keyword,0);
            dl_position.DataSource = ds.Tables[0];
            dl_position.DataBind();
            tb_keyword.Text = keyword;
            lb_currentpage.Text = "0";

            int totalpage = position.p_list_totalpage("");
            lb_totalpage.Text = totalpage.ToString();
        }
    }
    
    protected void btn_search_Click(object sender, ImageClickEventArgs e)
    {
        string keyword = tb_keyword.Text;

        search(tb_keyword.Text, 0);
        lb_currentpage.Text = "0";

        int totalpage = position.p_list_totalpage(keyword);
        lb_totalpage.Text = totalpage.ToString();
        tb_jumppage.Text = "";

    }

    protected void btn_first_Click(object sender, ImageClickEventArgs e)
    {
        search(tb_keyword.Text, 0);        
    }
    
    protected void btn_prev_Click(object sender, ImageClickEventArgs e)
    {
        int page = Convert.ToInt32(lb_currentpage.Text);       
        if (page>0)
        {    page--;      }
        search(tb_keyword.Text, page);
    }

    protected void btn_next_Click(object sender, ImageClickEventArgs e)
    {
        int page = Convert.ToInt32(lb_currentpage.Text);
        int totalpage = Convert.ToInt32(lb_totalpage.Text);

        if (page+1<=totalpage)
        {    page++;  }

        search(tb_keyword.Text, page);       
    }

    protected void btn_last_Click(object sender, ImageClickEventArgs e)
    {
        int page = Convert.ToInt32(lb_totalpage.Text);
        search(tb_keyword.Text, page);        
    }

    protected void btn_jumpto_Click(object sender, ImageClickEventArgs e)
    {
        int page = Convert.ToInt32(tb_jumppage.Text);
        search(tb_keyword.Text, page);
    }
}